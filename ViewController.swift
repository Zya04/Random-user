//
//  ViewController.swift
//  Random User
//
//  Created by SUP'Internet 10 on 09/01/2019.
//  Copyright © 2019 SUP'Internet 10. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearButton(_ sender: Any) {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func goButton(_ sender: Any) {
        let api = ApiManager()
        let store = UserDefaults.standard
        if (store.string(forKey: "firstname") != nil) {
            let person = Person(
                firstname: store.string(forKey: "firstname")!,
                lastname: store.string(forKey: "lastname")!,
                gender: Person.Gender(rawValue: store.string(forKey: "gender")!)!,
                email: store.string(forKey: "email")!,
                birthdate: (date: store.string(forKey: "birthdate")!, format: "MM-dd-yyyy HH:mm"),
                url: store.string(forKey: "url")!
            )
            self.performSegue(withIdentifier: "ShowPerson", sender: person)
        } else {
            api.getRandomUserHydratedWithPerson(completion: {person in
                DispatchQueue.main.async {
                    store.set(person.firstanme, forKey: "firstname")
                    store.set(person.lastname, forKey: "lastname")
                    store.set(person.email.email, forKey: "email")
                    store.set(person.gender.rawValue, forKey: "gender")
                    store.set(person.birthdate.toString(format: "MM-dd-yyyy HH:mm"), forKey: "birthdate")
                    store.set(person.url, forKey: "url")
                    self.performSegue(withIdentifier: "ShowPerson", sender: person)
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SecondViewController
        {
            let vc = segue.destination as? SecondViewController
            vc?.person = sender as? Person
        }
    }
}

