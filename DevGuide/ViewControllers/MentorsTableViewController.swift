//
//  MentorsTableViewController.swift
//  DevGuide
//
//  Created by Yurii Luka on 28.07.2025.
//

import UIKit

class MentorsTableViewController: UITableViewController {
    
    let mentors = Mentor.getMentorIngo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mentors"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mentors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MentorCell", for: indexPath)
        let mentor = mentors[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = mentor.surname
        content.secondaryText = mentor.name
        content.image = UIImage(named: mentor.photo)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
}
