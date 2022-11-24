//
//  ViewController.swift
//  PageIn
//
//  Created by Issei Ueda on 2022/11/18.
//

import UIKit

class ViewController: UIViewController {
    
    var memoText = ""
    
    var pageViewController: UIPageViewController?
    // 画面の切り替えを見た目でわかりやすくための背景色設定用カラーパレット
    var pallet = [UIColor.red, UIColor.yellow, UIColor.blue, UIColor.green, UIColor.purple]
    // 表示するViewControllerを判断するための数字
    var cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PageViewControllerを取得
        pageViewController = children.first! as? UIPageViewController
        setViewController()
        pageViewController?.dataSource = self

    }
    
    
    // 次へボタンが押されたら
    @IBAction func tapNextButton(_ sender: UIButton) {
        // 次の画面を表示するため、cntを1増やす
        cnt += 1
        setViewController()
        print("押されました")
//        let child = self.children[0] as! ContentViewController
//        child.memo = ""
//        print(child.memo)
    }
    
    func setViewController() {
        if cnt < pallet.count {
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            // PageViewControllerにViewControllerをセット
            self.pageViewController?.setViewControllers([contentVC], direction: .forward, animated: true,completion: nil)
            memoText = contentVC.textField.text!
            print(memoText)
            
        } else {
            cnt = 0
            let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            // PageViewControllerにViewControllerをセット
            self.pageViewController?.setViewControllers([contentVC], direction: .forward, animated: true,completion: nil)
            memoText = contentVC.textField.text!
            print(memoText)
        }
    }
}

extension ViewController: UIPageViewControllerDataSource {
    // Beforeなので左側のViewController
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        if 0 < cnt {
            cnt -= 1
        }
        return contentVC
    }
    
    // Afterなので右側のViewController
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        cnt += 1
        let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController

        return contentVC
    }
}

