//
//  SecondViewController.swift
//  Random User
//
//  Created by SUP'Internet 10 on 09/01/2019.
//  Copyright © 2019 SUP'Internet 10. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var person: Person?
    
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func clearButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goBack", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnameLabel.text = person?.firstanme
        lastnameLabel.text = person?.lastname
        genderLabel.text = person?.gender.rawValue
        birthdateLabel.text = person?.birthdate.toString(format: "MM-dd-yyyy HH:mm")
        let url = URL(string: (person?.url)!)
        let data = try? Data(contentsOf: url!)
        imageView.image = UIImage(data: data!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
