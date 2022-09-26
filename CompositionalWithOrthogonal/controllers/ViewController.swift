//
//  ViewController.swift
//  CompositionalWithOrthogonal
//
//  Created by Esraa Khaled   on 03/09/2022.
//

import UIKit

final class ViewController: UIViewController {
    
    enum Section: Hashable {
        case main
        
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var model = [PizzaModel(pizzaName: "Margarita", pizzaPrice: 35, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Cvatro Farmago", pizzaPrice: 14, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 26, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 50, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 100, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 40, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 50, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 60, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 80, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the"),
                 PizzaModel(pizzaName: "Margarita", pizzaPrice: 70, pizzaImage: UIImage(named: "pizza"), pizzaDesc: "Lorem lpsum is simply dummy text of the")
]
   
    private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = createLayout()
        collectionView.delegate = self
        ConfigureDataSource()
        configureSnapshot()
    }


}
//MARK: Extensions
extension ViewController {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                                                  heightDimension: .fractionalHeight(1.0)))
         // let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                                            //     heightDimension: .fractionalHeight(1.0)))

            item1.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
         // item2.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                             heightDimension: .absolute(400.0)),
                                                          subitems: [item1])
           // let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                          //     heightDimension: .absolute(400.0)),subitems: [group2])
           
            let section = NSCollectionLayoutSection(group: group2)
            section.orthogonalScrollingBehavior = .none
            return section

        }
        return layout
    }
}
extension ViewController {
    func ConfigureDataSource () {
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, item: AnyHashable) -> UICollectionViewCell? in
            if let myCell = item as? PizzaModel{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PizzaCell.reuseIdentifier, for: indexPath) as? PizzaCell else {
                    return nil
                }
                cell.contentView.layer.cornerRadius = 10
                cell.pizzaDesc.text = myCell.pizzaDesc
                cell.pizzaImage.image = myCell.pizzaImage
                cell.pizzaImage.layer.cornerRadius = cell.pizzaImage.frame.height / 2
                cell.pizzaName.text = myCell.pizzaName
                cell.pizzaPrice.text = String("$ \(myCell.pizzaPrice)")
                
                
                return cell
            }
            
            
            return UICollectionViewCell()
        }
    }
    
    // 1
    func configureSnapshot() {
      var currentSnapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
      
      // 3
        currentSnapshot.appendSections([Section.main])
      // 4
     
        currentSnapshot.appendItems(model, toSection: Section.main)
       
     
      // 5
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
}



public enum UICollectionLayoutSectionOrthogonalScrollingBehavior : Int {

    
    // default behavior. Section will layout along main layout axis (i.e. configuration.scrollDirection)
    case none = 0

    
    // NOTE: For each of the remaining cases, the section content will layout orthogonal to the main layout axis (e.g. main layout axis == .vertical, section will scroll in .horizontal axis)
    
    // Standard scroll view behavior: UIScrollViewDecelerationRateNormal
    case continuous = 1

    
    // Scrolling will come to rest on the leading edge of a group boundary
    case continuousGroupLeadingBoundary = 2

    
    // Standard scroll view paging behavior (UIScrollViewDecelerationRateFast) with page size == extent of the collection view's bounds
    case paging = 3

    
    // Fractional size paging behavior determined by the sections layout group's dimension
    case groupPaging = 4

    
    // Same of group paging with additional leading and trailing content insets to center each group's contents along the orthogonal axis
    case groupPagingCentered = 5
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
