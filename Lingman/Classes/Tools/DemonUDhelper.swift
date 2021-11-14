
import Foundation

protocol StringRepresentable {
    var stringValue: String {get}
}

public class  DemonUDHelper {
    
    public class func value<T>(key: String) -> T? {
        let obj: Any?
        obj  = UserDefaults.standard.object(forKey: key)
        return obj as? T? ?? nil
    }
    
    
    
    public class func setValue<T:Any>(key: String, value: T) {
       UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
     
    
    
    public class func string(key: String) -> String? {
        return self.value(key: key)
    }
    
    public class func hasKey(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    
  
    
    public class func bool(key: String) -> Bool? {
        return self.value(key: key)
    }
    
    public class func int(key: String) -> Int? {
        return self.value(key: key)
    }
    
    public  class func double(key: String) -> Double? {
        return self.value(key: key)
    }
    
    public class func float(key: String) -> Float? {
        return self.value(key: key)
    }
    
    public class func any(key: String) -> Any? {
        return self.value(key: key)
    }
    
    
    public class func data(key: String) -> Data? {
        return self.value(key: key)
    }
    
    public class func anyobject(key: String) -> AnyObject? {
        return self.value(key: key)
    }

}
