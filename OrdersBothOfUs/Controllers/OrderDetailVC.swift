//  OrdersBothOfUs
//
//  Created by Tariq Maged on 22/01/2022.
//


import UIKit

class OrderDetailVC: UIViewController {
    
    //vars
    var order:Order?

    //outlets
    @IBOutlet weak var btnReOrder: ButtonRounded!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblCharge: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var orderDetailTableView: TanibleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        orderDetailTableView.reloadData()
    }
    
    func setupViews(){
        lblCharge.text = (order?.deliveryCharge ?? "") + "$"
        btnReOrder.isHidden = !(order?.isPastOrder ?? true)
        let taxonNib = UINib(nibName: "OrderDetailCell", bundle: nil)
        lblTotal.text = "\(buildTotal()) $"
        orderDetailTableView.register(taxonNib, forCellReuseIdentifier: "OrderDetailCell")
        orderDetailTableView.delegate = self
        orderDetailTableView.backgroundColor = .white
        orderDetailTableView.direction = .right
        orderDetailTableView.dataSource = self
        let viewFooter = UIView()
        orderDetailTableView.tableFooterView = UIView()
       }
    
    func buildTotal ()->Double{
        var totalElements = 0.0
        guard let productArr = order?.productArr else {return 0}
        for product in productArr{
            let orderPrice = Double(product.price ?? "0") ?? 0
            let orderQty = Double(product.qty ?? 0)
             let elemntsPrice = orderPrice * orderQty
            totalElements += elemntsPrice
        }
        let charge = Double(order?.deliveryCharge ?? "0") ?? 0
        return totalElements + charge
    }
        

    @IBAction func btnBackPressed(_ sender: UIButton) {
        dissmissDetail()
    }
    
    @IBAction func btnReOrderPressed(_ sender: ButtonRounded) {
       
        let alert = UIAlertController(title: "Delete Order", message:"Are You Sure that you want to re-order that Order ?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            if let order = self.order{
            DataService.instance.movePastOrderToCurrent(order: order)
                self.dissmissDetail()
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension OrderDetailVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order?.productArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailCell", for: indexPath) as! OrderDetailCell
        if let productArr = order?.productArr{
        cell.configCell(product: productArr[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  200
    }
}
