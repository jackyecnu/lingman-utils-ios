
import UIKit
import Foundation

   open class  BaseViewController : UIViewController
{
    /// 加载小菊花
    lazy var actIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(activityIndicatorStyle: .white)
        view.frame = CGRect(x: DemonUIHelper.SCREENW/2.0 - 50, y: (DemonUIHelper.SCREENH - DemonUIHelper.naviHeight)/2.0 - 100, width: 100, height: 100)
        view.color = .lightGray
        return view
    }()
    
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // 统一背景色
        view.backgroundColor = UIColor.white
        // 禁用自动调整
        automaticallyAdjustsScrollViewInsets = false
         
         
        view.addSubview(actIndicator)
        
        initClick()
        
        initData()
        
        
    }
     
     open func initData(){
         
     }
     
     open func initClick(){
         
     }
}
