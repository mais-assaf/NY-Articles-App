//
//  ArticalDetailsViewController.swift
//  NYTimes
//
//  Created by Mais Assaf on 5/10/23.
//

import UIKit

class ArticalDetailsViewController: UIViewController {

    @IBOutlet weak var detailsText: UITextView!
    var details:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailsText.text = details

        
        // Do any additional setup after loading the view.
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
