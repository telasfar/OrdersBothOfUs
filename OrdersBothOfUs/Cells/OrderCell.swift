//  OrdersBothOfUs
//
//  Created by Tariq Maged on 22/01/2022.
//


import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var lblCheckOutDateDone: UILabel!
    @IBOutlet weak var lblCheckOutDone: UILabel!
    @IBOutlet weak var imgCheckOutDone: UIImageView!
    @IBOutlet weak var lblCheckOutDateReady: UILabel!
    @IBOutlet weak var lblCheckOutReady: UILabel!
    @IBOutlet weak var imgCheckoutReady: UIImageView!
    @IBOutlet weak var lblCheckoutDone: UILabel!
    @IBOutlet weak var lblDateCheckoutConfirm: UILabel!
    @IBOutlet weak var imgCheckoutconfirm: UIImageView!
    @IBOutlet weak var lblWaitDateCheck: UILabel!
    @IBOutlet weak var imgWaitCheckout: UIImageView!
    @IBOutlet weak var lblWaitCheckout: UILabel!
    @IBOutlet weak var lblPAymentStatus: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblElemnts: UILabel!
    @IBOutlet weak var lblWait: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblOrderNum: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(order:Order){
       let dateString = order.onDate
        [lblDateCheckoutConfirm,lblCheckOutDateDone,lblWaitDateCheck,lblCheckOutDateReady].forEach{$0.text = dateString}
        let statusIndex = Int(order.status ?? "0") ?? 0
        lblWait.text = order.currentStatus
        switch statusIndex{
        case 1:
            lblWait.textColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        case 2:
            lblWait.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        case 3:
            lblWait.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        case 4:
            lblWait.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        default:
            lblWait.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
        setupImagesPerIndex(index:statusIndex )
        lblDate.text = order.onDate
        lblTotal.text = (order.totalAmount ?? "")+"$"
        lblElemnts.text = "\(order.totalItems ?? 0)"
        lblPAymentStatus.text = order.paymentMethod
        lblOrderNum.text = order.orderId
        
    }
    
    func setupImagesPerIndex(index:Int){
        let imgDict = [0:imgWaitCheckout,1:imgCheckoutconfirm,2:imgCheckoutReady,3:imgCheckOutDone]
        if index == 4 {
            for key in imgDict.keys{
                if let imageView = imgDict[key]{
                    imageView?.image = #imageLiteral(resourceName: "CheckoutSelectionOn")
                    imageView?.tintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
                }
            }
            return
        }
        for key in imgDict.keys{
            if (0...index).contains(key){
                if let imageView = imgDict[key]{
                    imageView?.image = #imageLiteral(resourceName: "CheckoutSelectionOn")
                    imageView?.tintColor = #colorLiteral(red: 0.977365315, green: 0.5576682091, blue: 0.1856185496, alpha: 1) //imageView?.image?.withTintColor(#colorLiteral(red: 0.977365315, green: 0.5576682091, blue: 0.1856185496, alpha: 1))
                }
            }else{
                if let imageView = imgDict[key]{
                    imageView?.image = #imageLiteral(resourceName: "CheckoutSelectionOff")
                }
            }
        }
    }
    
    
     func convertDateString(dateString : String!, fromFormat sourceFormat : String!, toFormat desFormat : String!) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = sourceFormat
        let date = dateFormatter.date(from: dateString) ?? Date()
        dateFormatter.dateFormat = desFormat
        return dateFormatter.string(from: date)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
