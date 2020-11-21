import Foundation

public final class LoaderService {
    
    private var rickMortyApiService: RickMortyApiService?
    private var charactersService: CharactersService?
    
    public init() {
        self.rickMortyApiService = TVShowsLibraryServiceLocator.service()
        self.charactersService = TVShowsLibraryServiceLocator.service()
    }
    
    public func loadRMCharacters( _ page: Int, completion: @escaping (_ characters: [RMCharacter]?, _ errorText: String?)->()) {
        
        rickMortyApiService?.loadRMCharacters(page) { (characters, errorText) in
           
            guard let characters = characters,
                  characters.count > 0,
                  errorText == nil else {
                let errorText = errorText ?? "Empty characters list"
                completion(nil, errorText)
                return
            }
            
            self.charactersService?.writeRMCharacters(characters, completion: { (errorText) in
                guard errorText == nil else {
                    completion(nil, errorText)
                    return
                }
                completion(characters, nil)
            })

            
        }
    }
}
