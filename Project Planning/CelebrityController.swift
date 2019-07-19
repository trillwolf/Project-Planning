//
//  CelebrityController.swift
//  Project Planning
//
//  Created by GWC on 7/18/19.
//  Copyright © 2019 Shannon Moreno. All rights reserved.
//

import UIKit

class CelebrityController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var celebImage: UIImageView!
    
    let mashCelebImage = ["leonardodicaprio", "giselebundchen", "cateblanchett", "maroon5", "bradpitt", "merylstreep", "benaffleck", "channingtatum", "markruffalo", "alecbaldwin"]
    
    @IBOutlet weak var descriptions: UITextView!
    let chooseCelebImage = ["leonardodicaprio":"Leonardo DiCaprio founded the Leonardo DiCaprio Foundation to build climate resiliency, protect vulnerable wildlife, and restore balance to threatened ecosystems and communities.", "giselebundchen":"Gisele Bundchen launched the Clean Water Project in order to restore vegetation and micro-basins in her hometown of Horizontina, Brazil.", "cateblanchett":"Cate Blanchett was a key proponent of Greening the Wharf, which oversaw the installment of 1,900 solar panels in The Wharf Theatre at Sydney’s Walsh Bay and will eventually allow the theatre to be fully carbon neutral.", "maroon5":"Maroon 5 has committed to green touring by using biodiesel-powered tour buses, promoting recycling at concert venues, and donating a portion of tickets to Global Cool, an environment charity that works with entertainers.", "bradpitt": "Brad Pitt founded the Make It Right Foundation, which is on track to finish 150 homes in New Orleans, where all the new residences will not only sport environmentally sound features, but will also use advanced engineering to withstand strong winds and floods.", "merylstreep":"Meryl Streep strongly advocates for the Natural Resource Defense Council in order to raise awareness for environmental issues like the regulation of chemical pesticides.", "benaffleck":"Ben Affleck founded the Eastern Congo Initiative in order to increase agricultural productivity and improve the lives of small farmers.", "channingtatum":"Channing Tatum strongly advocates the organization, PlantMed, to bring awareness to the medicinal values of plants in the Amazon which will be lost due to the destruction of the rainforest.", "markruffalo":"Mark Ruffalo founded Water Defense in the hopes of using technology and public engagement to keep waterways free from industrial degradation and contamination.", "alecbaldwin":"Alec Baldwin founded the Hillaria and Alec Baldwin Foundation which focuses on presenting grants based on environmental and wellness agencies in New York City and Long Island."]
    
    func getRandomItem() {
        guard let item = mashCelebImage.randomElement()
            else { return}
        
        let description = chooseCelebImage[item]
        celebImage.image = UIImage(named: item)
        
        descriptions.text = description
    }
    
    @IBAction func mashButton(_ sender: Any) {
        getRandomItem()
    }
    
    
    
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


