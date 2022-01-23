//  OrdersBothOfUs
//
//  Created by Tariq Maged on 22/01/2022.
//


import UIKit

class OrderDetailCell: UITableViewCell {

    //outlets
    @IBOutlet weak var lblQuantity: UITextField!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProdcutName: UILabel!
    @IBOutlet weak var imhProduct: UIImageView!
    

    func configCell(product:Product){
        lblProdcutName.text = product.productName
        lblPrice.text = (product.price ?? "0") + "$"
        lblQuantity.text = "\(product.qty ?? 0)"
        imhProduct.image = UIImage(named: product.productImage ?? "pen")
    }

    
}
