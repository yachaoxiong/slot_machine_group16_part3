import SwiftUI
import Firebase
import FirebaseDatabase

class DataManager: ObservableObject {

    let database = Database.database().reference()

    // Store a value in the Firebase Realtime Database with a given key
    func setHighScore(_ value: String) {
        database.child("high score").setValue(value)
    }
    
    func setJackpot(_ value: String) {
        database.child("Jackpot").setValue(value)
    }
    // Fetch a value from the Firebase Realtime Database with a given key
    func fetchValue(forKey key: String, completion: @escaping (String?) -> Void) {
        database.child(key).observeSingleEvent(of: .value) { snapshot in
            if let value = snapshot.value as? String {
                completion(value)
            } else {
                completion(nil)
            }
        }
    }

}


