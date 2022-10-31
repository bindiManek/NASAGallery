//
//  ViewController.swift
//  NASA Gallery
//
//  Created by Bindi Manek on 29/10/22.
//

import UIKit
import Alamofire
import AlamofireImage
class ViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

//    private var nasaImageViewModel = NASAImagesViewModel!
    
    @IBOutlet weak var collectionViewNASA: UICollectionView!
    var nasaImages = [NASAImages]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nasaImagesTemp = loadJson(fileName: "data") {
            nasaImages = nasaImagesTemp
        }
        print(nasaImages.count)
//        self.collectionViewNASA!.register(ImageCollectionCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionViewNASA.reloadData()
//        self.callViewModelForUIUpdate()
//         Do any additional setup after loading the view.
    }
    func loadJson(fileName: String) -> [NASAImages]? {
//       let decoder = JSONDecoder()
        do {

             let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
             let data = try Data(contentsOf: url)
             let nasaImages = try JSONDecoder().decode([NASAImages].self, from: data)
            return nasaImages
        }
        catch {
            print(error)
        }

       return nil
    }
    // MARK: -
    // MARK: CollectionView Delegate and Datasource Methods
    // MARK: -
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nasaImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionCell
        
        
        let image = nasaImages[indexPath.row]
        let url = URL(string: image.url)!
        let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
            size: (cell.ivNASAImages?.frame.size)!,
            radius: 0.0
        )

        cell.ivNASAImages?.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder-image"), filter: filter, imageTransition: .crossDissolve(0.2))
        
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = self.collectionViewNASA.indexPathsForSelectedItems{
                let destinationController = segue.destination as! DetailViewController
                destinationController.nasaImageIndex = indexPaths[0].row
                destinationController.nasaImages = nasaImages
                self.collectionViewNASA.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    func callViewModelForUIUpdate() {
//        self.nasaImageViewModel = NASAImagesViewModel()
    }

}

