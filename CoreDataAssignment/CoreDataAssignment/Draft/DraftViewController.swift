//
//  DraftViewController.swift
//  CoreDataAssignment
//
//  Created by Vishal Ranjan on 10/05/18.
//  Copyright © 2018 Vishal Ranjan. All rights reserved.
//

import UIKit

class DraftViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var draftCollectionView: UICollectionView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var noDataFoundLbl: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var draftsArray : [DraftOrder]? = [DraftOrder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.noDataFoundLbl.isHidden = true
//        self.segmentedControl.selectedSegmentIndex = 0
        self.fetchDataFromServer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Collection View Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.draftsArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DraftCollectionViewCell", for: indexPath) as! DraftCollectionViewCell
        let draft : DraftOrder = draftsArray![indexPath.item]
        cell.draftIdLbl.text  = "ID : \(draft.dataId)"
        cell.inventoryAddressLbl.text  = "\(draft.inventoryAddress!)"
        cell.mandisNameLbl.text  = "\(draft.mandisName!)"
        cell.arthiyaNameLbl.text  = "\(draft.arthiyaName!)"
        return cell
    }
    
    func fetchDataFromServer() -> Void {
        self.activityIndicator.startAnimating()
        let draftNetworkManager = DraftNetworkManager.init()
        draftNetworkManager.fetchDataFromServer { (response, isSuccess, error) in
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                
                if isSuccess == true {
                    self.draftsArray = (response != nil) ? response! : [DraftOrder]()
                } else {
                    self.noDataFoundLbl.isHidden = false
                }
                self.draftCollectionView.reloadData()
            }
        }
    }
    
    func fetchDataFromDatabase() -> Void {
        
    }
    
    func deleteDataFromDatabase() -> Void {
        
    }
    
    @IBAction func segmentBtnClicked(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.fetchDataFromServer()
        case 1:
            self.fetchDataFromDatabase()
        case 2:
            self.deleteDataFromDatabase()
        default:
            break
        }
    }
    
    @IBAction func logoutBtnClicked(_ sender: Any) {
        Utility.sharedInstance.clearCredentials()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.routeView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
