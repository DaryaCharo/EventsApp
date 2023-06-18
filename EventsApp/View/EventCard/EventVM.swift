//
//  EventVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 15.06.23.
//

import SwiftUI

final class EventVM: ObservableObject {
    @Published var image = UIImage()
    
    func getImage(link: String)  {
        DispatchQueue.main.async {
            Task {
                guard let url = URL(string: link) else { return }
                do {
                    
                    //фиолетовые ошибки при запуске. Ставила async func
                    let data = try Data(contentsOf: url)
                    self.image = UIImage(data: data) ?? UIImage()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
