//  OrdersBothOfUs
//
//  Created by Tariq Maged on 22/01/2022.
//


import UIKit

class OrdersVC: UIViewController {
    
    var orderArr = [Order]()
    
    //outlets
   
    @IBOutlet weak var orderTableView: TanibleView!
    @IBOutlet weak var segmentedControl: CustomSegmented!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        segmentedControl.selectedSegmentIndex = 0
        loadCurrentData(isCurrentOrder: true)
    }
    
    func setupViews(){
        let taxonNib = UINib(nibName: "OrderCell", bundle: nil)
        orderTableView.tableFooterView = UIView()
        orderTableView.register(taxonNib, forCellReuseIdentifier:"OrderCell")
        orderTableView.direction = .right
        orderTableView.backgroundColor = .white
        orderTableView.delegate = self
        orderTableView.dataSource = self
        segmentedControl.addTarget(self, action: #selector(segemntedTabbed(_:)), for: .valueChanged)
    }
    
    
        
    func loadCurrentData(isCurrentOrder:Bool){

        shouldPresentLoadingView(true)
        if isCurrentOrder{ DataService.instance.getCurrentOrders { (success, orders) in
            if success{
                if orders?.isEmpty ?? true{
                    self.alertUser(message: "There is no current orders to display")
                }else{
                    self.orderArr = orders ?? [Order]()
                    self.orderTableView.reloadData()
                }
            }else{
                self.alertUser(message: "Error Occured")
            }
            self.shouldPresentLoadingView(false)
            }
        }else{
            DataService.instance.getPastOrders { (success, orders) in
                if success{
                    if orders?.isEmpty ?? true{
                        self.alertUser(message: "There is no Past orders to display")
                    }else{
                        self.orderArr = orders ?? [Order]()
                        self.orderTableView.reloadData()
                    }
                }else{
                    self.alertUser(message: "Error Occured")
                }
                self.shouldPresentLoadingView(false)
                
            }
        }
    }
    
    @objc func segemntedTabbed(_ sender:CustomSegmented){
        orderArr.removeAll()
        orderTableView.tableFooterView = UIView()
        orderTableView.reloadData()
        switch sender.selectedSegmentIndex {
        case 1:
            loadCurrentData(isCurrentOrder: false)
        default:
            loadCurrentData(isCurrentOrder: true)
        }
        sender.animateSegmented()
    }


    @IBAction func btnResetPRessed(_ sender: UIButton) {
        DataService.instance.resetArrays()
        segmentedControl.selectedSegmentIndex = 0
        loadCurrentData(isCurrentOrder: true)
        orderTableView.reloadData()
    }
}

extension OrdersVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  orderArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath) as! OrderCell
        cell.configCell(order: orderArr[indexPath.row])
        cell.backgroundColor = (indexPath.row % 2 == 0) ? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0):#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)

            return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetailVc = storyboard?.instantiateViewController(withIdentifier: "OrderDetailVC") as! OrderDetailVC
        orderDetailVc.order = orderArr[indexPath.row]
        presentDetail(orderDetailVc)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  350
    }
}
