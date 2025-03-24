//
//  SearchViewController.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 17/03/25.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Enter the category you want to search..."
        searchController.searchBar.delegate = self
    }

}
//Not adding searchresultingdgte, nothing is needed when the text is being typed as of now.
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("clicked search button on kybrd")
    }
    
}

