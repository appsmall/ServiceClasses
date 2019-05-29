//
//  Extension.swift
//  InterOfficeApp
//
//  Created by Rahul Chopra on 24/10/18.
//  Copyright © 2018 Rahul Chopra. All rights reserved.
//

import UIKit


// MARK:- UICOLOR
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}


// MARK:- UIVIEW
extension UIView {
    // Line Shadow on UIView
    func dropLineShadow(scale: Bool = true, radius: CGFloat, offset: CGSize) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // Circular Shadow on UIView
    func dropCircularShadow(color: UIColor, offset: CGSize, radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = 0.5
        layer.shadowPath = CGPath(roundedRect: self.bounds, cornerWidth: self.frame.width / 2, cornerHeight: self.frame.height / 2, transform: nil)
    }
    
    // MARK:- GRADIENT COLOR
    func gradientColor(firstColor: UIColor, secondColor: UIColor, thirdColor: UIColor, startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor] //Use diffrent colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        //view.layer.addSublayer(gradientLayer)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func gradientColorOnSideMenu() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        let color1 = UIColor.rgb(red: 125, green: 103, blue: 125)
        let color2 = UIColor.rgb(red: 145, green: 121, blue: 127)
        let color3 = UIColor.rgb(red: 124, green: 98, blue: 108)
        let startPoint = CGPoint(x: 1.0, y: 1.0)
        let endPoint = CGPoint(x: 0.7, y: 0.4)
        //gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor] //Use diffrent colors
        gradientLayer.colors = [color1.cgColor, color2.cgColor, color3.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        //view.layer.addSublayer(gradientLayer)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func gradientColorOnAddPost() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        //let color3 = UIColor.rgb(red: 185, green: 174, blue: 189)
        let color3 = UIColor.rgb(red: 196, green: 185, blue: 190)
        let color2 = UIColor.rgb(red: 203, green: 191, blue: 191)
        //let color1 = UIColor.rgb(red: 156, green: 144, blue: 159)
        let color1 = UIColor.rgb(red: 169, green: 156, blue: 168)
        let startPoint = CGPoint(x: 0.8, y: 0.8)
        let endPoint = CGPoint(x: 0.7, y: 0.4)
        //gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor, thirdColor.cgColor] //Use diffrent colors
        gradientLayer.colors = [color1.cgColor, color2.cgColor, color3.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        //view.layer.addSublayer(gradientLayer)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}


// MARK:- Date
extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString)!
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()

// MARK:- UIImageView
extension UIImageView{
    func loadImageUsingCacheWithUrlString(urlString: String, defaultImage: String){
        if urlString != emptyString{
            self.image = UIImage(named: defaultImage)
            //Check Cache for image first
            if let cachedImage = imageCache.object(forKey: (urlString as AnyObject)) as? UIImage{
                self.image = cachedImage
                return
            }
            //otherwise fire off a new download
            if let url = NSURL(string: urlString){
                //print("URL: \(url)")
                URLSession.shared.dataTask(with: url as URL) { (data, URLRequest, error) in
                    if let err = error{
                        print("error: \(err)")
                        return
                    }
                    DispatchQueue.main.async {
                        if let downloadedImage = UIImage(data: data!){
                            imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                            self.image = downloadedImage                    }
                        
                        }
                    }.resume()
            }
        }else{
            self.image = UIImage(named: defaultImage)
        }
    }
    
}


// MARK:- UITableView
extension UITableView {
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.numberOfRows(inSection:  self.numberOfSections - 1) - 1, section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
}


// MARK:- STRING
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
