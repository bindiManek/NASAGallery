//
//  DetailViewController.swift
//  NASA Gallery
//
//  Created by Bindi Manek on 30/10/22.
//

import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    var nasaImageIndex: Int = 0
    @IBOutlet weak var tblDetail: UITableView!
    var nasaImages = [NASAImages]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSwipe()
        // Do any additional setup after loading the view.
    }
    
    func addSwipe() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gesture.direction = direction
            self.tblDetail.addGestureRecognizer(gesture)// self.view
            self.view.addGestureRecognizer(gesture)
        }
    }

    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
      
        let direction = sender.direction
        switch direction {
            case .right:
            if nasaImageIndex == 0 { nasaImageIndex = nasaImages.count-1 } else { nasaImageIndex-=1 }
            case .left:
            if nasaImageIndex == nasaImages.count-1 { nasaImageIndex = 0} else { nasaImageIndex+=1 }

            default:
                print("Unrecognized Gesture Direction")
        }
        self.tblDetail.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.5) {
            cell.alpha = 1.0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailTableViewCell
        
        
        let image = nasaImages[nasaImageIndex]
        let url = URL(string: image.url)!
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: (cell.ivNASAIMage?.frame.size)!,
            radius: 0.0
        )

        cell.ivNASAIMage?.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder-image"), filter: filter, imageTransition: .crossDissolve(0.4))
        cell.lblTitle.text = "Title: \(image.title)"
        cell.lblCopyright.text = "Copyright: \(image.copyright ?? "")"
        cell.lblDated.text = "Dated: \(image.date)"
        cell.txtDescription.text = image.explanation
        cell.txtDescription.adjustUITextViewHeight()
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextView {
    func adjustUITextViewHeight() {
        self.translatesAutoresizingMaskIntoConstraints = true
//        self.sizeToFit()
        self.isScrollEnabled = false
    }
}

