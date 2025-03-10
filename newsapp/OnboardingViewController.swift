//
//  OnboardingViewController.swift
//  newsapp
//
//  Created by Jishnu Biju [Litmus7] on 07/03/25.
//

import UIKit

class OnboardingViewController: UIPageViewController, UIPageViewControllerDataSource{
    
    //    let pages = ["onboardingOne, onboardingTwo"]
    //
    
    let vcArray: [UIViewController] = [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingOne"),
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingTwo"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let firstVC = vcArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index =  vcArray.lastIndex(of: viewController) else { return nil }
        print(index)
        let previousIndex = index - 1
        guard previousIndex >= 0 else { return nil }
        guard vcArray.count > previousIndex else { return nil }
        return vcArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcArray.lastIndex(of: viewController) else { return nil }
        print(index)
        let nextIndex = index + 1
        guard nextIndex < vcArray.count else { return nil }
        return vcArray[nextIndex]
    }
}
