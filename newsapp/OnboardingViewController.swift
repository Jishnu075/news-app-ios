//
//  OnboardingViewController.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 07/03/25.
//

import UIKit

class OnboardingViewController: UIViewController
//: UIPageViewController, UIPageViewControllerDataSource
{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    //    let pages = ["onboardingOne, onboardingTwo"]
    //
    
//    let vcArray: [UIViewController] = [
//        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingOne"),
//        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingTwo"),
//    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
//        self.dataSource = self
//        if let firstVC = vcArray.first {
//            setViewControllers([firstVC], direction: .forward, animated: true)
//        }
    }
    @IBAction func getStartedBtnTapped(_ sender: Any) {
        //TODO add logic for adding hasCompletedOB to userdefaults
        let tabBarController = MainTabBarController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window {
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
        }
    }
    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let index =  vcArray.lastIndex(of: viewController) else { return nil }
//        print(index)
//        let previousIndex = index - 1
//        guard previousIndex >= 0 else { return nil }
//        guard vcArray.count > previousIndex else { return nil }
//        return vcArray[previousIndex]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let index = vcArray.lastIndex(of: viewController) else { return nil }
//        print(index)
//        let nextIndex = index + 1
//        guard nextIndex < vcArray.count else { return nil }
//        return vcArray[nextIndex]
//    }
}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell1", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell2", for: indexPath)
            return cell
        }
    }
    

    
    
}
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
