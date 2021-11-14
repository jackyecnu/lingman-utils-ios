
import UIKit
import Foundation

public class DemonUIHelper
{
 
        /// 适配比例 iphoneX为基准
        static let screenWAdaptation: CGFloat = UIScreen.main.bounds.width / 375.0
        
        static let screenHAdaptation: CGFloat = (isFullScreen ? 812 : UIScreen.main.bounds.height) / 812.0
        
        /// 状态栏 的高度
        static let statusHeight: CGFloat = isFullScreen ? 44 : 20
        
        /// Navi 的高度
        static let naviHeight: CGFloat = statusHeight + naviBarHeight
        
        /// Navi 的高度
        static let naviBarHeight: CGFloat = UINavigationController().navigationBar.bounds.size.height
        
        /// 底部安全区域高度
        static var bottomSafeHeight: CGFloat {
            if #available(iOS 11, *) {
                      guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
                          return 0
                      }
                        return unwrapedWindow.safeAreaInsets.bottom
                }
                return 0
        }
        
        /// 头部安全区域高度
        static var topSafeHeight: CGFloat {
            if #available(iOS 11, *) {
                      guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
                          return 0
                      }
                        return unwrapedWindow.safeAreaInsets.top
                }
                return 0
        }
        
        /// Tabbar 的高度
        static let tabbarHeight: CGFloat = UITabBarController().tabBar.bounds.size.height
        // 是否iPhoneX
        public static var isFullScreen: Bool {
            if #available(iOS 11, *) {
                  guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
                      return false
                  }
                  
                  if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
                      print(unwrapedWindow.safeAreaInsets)
                      return true
                  }
            }
            return false
        }
        public static let SCREENW = UIScreen.main.bounds.size.width
        public static let SCREENH = UIScreen.main.bounds.size.height
        public static let baseViewHeight = SCREENH - naviHeight - tabbarHeight - bottomSafeHeight
        public static let baseViewNoTabbarHeight = SCREENH - naviHeight
        public static let PixOne = 1.0 / UIScreen.main.scale
        //系统主色调
        static let mainColor:UIColor = UIColor.red
        //系统主字体
        static let mainFont:UIFont! =  UIFont(name: "NotoSansHans-Light", size: 10.0)
        
        //UIFont(name: "NotoSansHans-Light", size: 15)
        
        static let defaultPhoto = UIImage()
        
        //navigation字体
        static let mainFont10:UIFont! = UIFont(name: "NotoSansHans-Light", size: 10)
        static let mainFont11:UIFont! = UIFont(name: "NotoSansHans-Light", size: 11)
        static let mainFont12:UIFont! = UIFont(name: "NotoSansHans-Light", size: 12)
        static let mainFont13:UIFont! = UIFont(name: "NotoSansHans-Light", size: 13)
        static let mainFont14:UIFont! = UIFont(name: "NotoSansHans-Light", size: 14)
        static let mainFont17:UIFont! = UIFont(name: "NotoSansHans-Light", size: 17)
        static let mainNaviFont22:UIFont! = UIFont(name: "NotoSansHans-Light", size: 22)
        
        //列表边框，下划线的颜色
        static var layBordeColor:CGColor! = UIColor.gray.cgColor.copy(alpha: 0.3)
        
        //选择VC
   public  static func GetVCWithIDFromStoryBoard(sc:String, viewControllerIdentity:String) -> UIViewController {
            let storyboard = UIStoryboard(name: sc, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentity)
            return vc
        }

}
