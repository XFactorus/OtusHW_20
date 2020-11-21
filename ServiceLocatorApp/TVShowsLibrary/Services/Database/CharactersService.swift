import Foundation
import RealmSwift

public final class CharactersService {
    private var readRealm: Realm?
    
    let databaseService: DatabaseService?
    
    public init(){
        self.databaseService = TVShowsLibraryServiceLocator.service()
        readRealm = databaseService?.readRealm

    }
    
    func writeRMCharacters(_ rmCharacters: [RMCharacter], completion: @escaping (_ errorText: String?)->()) {
//        DispatchQueue.global().async { // crashes in this thread
        DispatchQueue.main.async {
            autoreleasepool{
                [weak self] in
                
                guard let self = self else {return}
                
                let writeRealm = self.databaseService!.newRealm
                
                do
                {
                    try writeRealm.write
                    {
                        writeRealm.add(rmCharacters, update: .all)
                        print("Data has been written to DB")
                        completion(nil)
                    }
                }
                catch
                {
                    completion(error.localizedDescription)
                }
            }
        }
    }
    
}

