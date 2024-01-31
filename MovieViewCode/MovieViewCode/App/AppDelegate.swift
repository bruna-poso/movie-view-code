import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let envPath = Bundle.main.path(forResource: ".env", ofType: nil) {
            do {
                let envContents = try String(contentsOfFile: envPath, encoding: .utf8)
                print("Conteúdo do arquivo .env:", envContents)
                
                let envLines = envContents.components(separatedBy: .newlines)
                for line in envLines {
                    let components = line.components(separatedBy: "=")
                    if components.count == 2 {
                        let key = components[0].trimmingCharacters(in: .whitespacesAndNewlines)
                        let value = components[1].trimmingCharacters(in: .whitespacesAndNewlines)
                        setenv(key, value, 1)
                    }
                }
            } catch {
                print("Erro ao carregar o arquivo .env:", error.localizedDescription)
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

