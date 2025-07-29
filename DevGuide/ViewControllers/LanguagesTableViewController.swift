//
//  ProgrammingLanguagesTableViewController.swift
//  DevGuide
//
//  Created by Yurii Luka on 28.07.2025.
//

import UIKit

class LanguagesTableViewController: UITableViewController {
    
    var languages: [Language] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Programming Languages"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        let language = languages[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.secondaryText = "Click for more details"
        content.image = UIImage(named: language.imageName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
        
    }
    
    
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let language = languages[indexPath.row]
        performSegue(withIdentifier: "DetailsVC", sender: language)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? DetailsViewController
        detailsVC?.language = sender as? Language
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }
}
