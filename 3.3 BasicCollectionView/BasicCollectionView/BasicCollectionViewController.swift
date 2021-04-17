import UIKit

private let reuseIdentifier = "Cell"
private let searchController = UISearchController()

class BasicCollectionViewController: UICollectionViewController, UISearchResultsUpdating {
    
    let items = [
        "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware",
        "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky",
        "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri",
        "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York",
        "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island",
        "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
        "West Virginia", "Wisconsin", "Wyoming"
    ]
    
    lazy var filteredItems: [String] = self.items
    var dataSource: UICollectionViewDiffableDataSource<Character,
       String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self

        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }
    
//    func createDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<Character,
//           String>(collectionView: collectionView, cellProvider:
//           { (collectionView, indexPath, item) ->
//           UICollectionViewCell? in
//
//            let cell =
//               collectionView.dequeueReusableCell(withReuseIdentifier:
//               reuseIdentifier, for: indexPath) as!
//               BasicCollectionViewCell
//
//            cell.label.text = item
//
//            return cell
//        })
//
//        dataSource.supplementaryViewProvider = { (collectionView,
//           kind, indexPath) -> UICollectionReusableView? in
//            let header =
//               collectionView.dequeueReusableSupplementaryView(ofKind:
//               kind, withReuseIdentifier: "Header", for: indexPath)
//               as! BasicHeaderView
//
//            header.label.text =
//               String(self.initialLetters[indexPath.section])
//
//            return header
//        }
//    }


    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text,
           searchString.isEmpty == false {
            filteredItems = items.filter { (item) -> Bool in
                item.localizedCaseInsensitiveContains(searchString)
            }
        } else {
            filteredItems = items
        }
        
//        let itemsByInitialLetter = filteredItems.reduce([:]) {
//            existing, element in
//            return existing.merging([element.first!:[element]]) { old,
//                                                                  new in
//                return old + new
//            }
//        }
//        let initialLetters = itemsByInitialLetter.keys.sorted()
        
        collectionView.reloadData()
        
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let spacing: CGFloat = 10.0

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70.0)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )

        group.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: 0,
            trailing: spacing
        )

        // By Andrey
        group.interItemSpacing = .fixed(10)// group spacing

        let section = NSCollectionLayoutSection(group: group)

        // By Andrey
//        section.interGroupSpacing = 15
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BasicCollectionViewCell
    
        cell.backgroundColor = .orange
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.7
        cell.frame.size.width =  150
        cell.frame.size.height = 75
        cell.label.text = filteredItems[indexPath.item]
    
        return cell
    }

    // MARK: - UICollectionViewDelegate

    // TBD
}
