import Flutter
import UIKit
import BusinessMessagingSDK

public class BusinessMessagingSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "business_messaging_sdk", binaryMessenger: registrar.messenger())
    let instance = BusinessMessagingSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }


  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
     let arguments: [String: Any]? = call.arguments as? Dictionary<String, Any>
        switch ZDBMAPI(rawValue:call.method) {
        case .show:
          show(arguments:arguments)
         case .setSessionVariable:
            setSessionVariable(arguments:arguments)
         case .updateSessionVariable:
            updateSessionVariable(arguments: arguments)
         case .enableLog:
               enableLog(arguments: arguments)
         case .clearData:
                clearData(arguments: arguments)
         case .setTheme:
                setTheme(arguments:arguments)
         case .setAgentTransferOptionVisibility:
                setAgentTransferOptionVisibility(arguments:arguments)
         case .setContactInfo:
                setContactInfo(arguments: arguments)
        default:
          result(FlutterMethodNotImplemented)
        }
  }

    public func setContactInfo(arguments: [String: Any]?) {
        let appId = arguments?["appId"] as? String ?? ""
        let name = arguments?["name"] as? String ?? ""
        let phone = arguments?["phone"] as? String ?? ""
        let email = arguments?["email"] as? String ?? ""
        let additionalInfo = arguments?["additionalInfo"] as? [String: String] ?? [:]
        if additionalInfo.isEmpty {
            BusinessMessaging.setContactInfo(appId: appId, name: name, phone: phone, email: email)
        } else {
            BusinessMessaging.setContactInfo(appId: appId, name: name, phone: phone, email: email, additionalInfo: additionalInfo)
        }
    }
  public func setAgentTransferOptionVisibility(arguments: [String: Any]?) {
         guard let isVisible = arguments?["isVisible"] as? Bool else {return}
         BusinessMessaging.setAgentTransferOptionVisibility(isVisible: isVisible)
  }

    public func show(arguments: [String: Any]?){
          guard let orgId = arguments?["orgId"] as? String,
                  let appId = arguments?["appId"] as? String,
                  let domain = arguments?["domain"] as? String
            else { return }
            BusinessMessaging.show(orgId: orgId, appId: appId, domain: domain)
    }



     public func setSessionVariable(arguments: [String: Any]?){
          guard let appId = arguments?["appId"] as? String, let arguments = arguments?["sessionVariables"] as? [[String:Any]] else { return }
          BusinessMessaging.setSessionVariables(appId: appId, sessionVariables: arguments)
     }

      public func updateSessionVariable(arguments: [String: Any]?){
          guard let appId = arguments?["appId"] as? String, let arguments = arguments?["sessionVariables"] as? [[String:Any]] else { return }
          BusinessMessaging.updateSessionVariables(appId: appId, sessionVariables: arguments)
       }

       public func enableLog(arguments: [String: Any]?){
              guard let isLogEnabled = arguments?["isLogEnabled"] as? Bool
                   else { return }

              BusinessMessaging.enableLog(isLogEnabled: isLogEnabled)
       }

        public func clearData(arguments: [String: Any]?){
             guard let appId = arguments?["appId"] as? String
                  else { return }

             BusinessMessaging.clearData(appId: appId)
        }

     public func setTheme(arguments: [String: Any]?){
           guard let themeType = arguments?["type"] as? Int,
                  let type = ZDThemeType(rawValue: themeType)
                else { return }
           ZDThemeManager.setTheme(type:type)
        }

    private enum ZDBMAPI: String {
            case show
            case setSessionVariable
            case updateSessionVariable
            case enableLog
            case clearData
            case setTheme
            case setAgentTransferOptionVisibility
        case setContactInfo
      }

}
