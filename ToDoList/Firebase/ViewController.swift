import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().reference().setValue(85)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

