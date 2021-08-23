//
//  RestaurantDetailViewModel.swift
//  RestApp
//
//  Created by Tomas Trujillo on 2020-11-04.
//

import UIKit

struct RestaurantImageViewModel: Identifiable {
  let id = UUID()
  let placeholder: String
    
  let loader: (@escaping (UIImage?) -> Void) -> Void
}

final class RestaurantDetailViewModel {
  struct Dependencies {
    var imageCache: ImageCacheService = ImageCacheServiceAdapter.shared
  }
  private let dependencies: Dependencies
  private let restaurant: PostModel
    var restaurantImageName: String { return restaurant.title }
    var restaurantDescription: String { return restaurant.title }
    var title: String { return restaurant.title }
  
  init(dependencies: Dependencies = .init(), restaurant: PostModel) {
    self.dependencies = dependencies
    self.restaurant = restaurant
  }
    
  func getImageItems() -> [RestaurantImageViewModel] {
    return restaurant.imageName.map {
        RestaurantImageViewModel(
            placeholder: "foodPlaceholder",
            loader: getLoader(for: $0)
        )
    }
  }
  
}

private extension RestaurantDetailViewModel {
  func getLoader(for url: String) -> (@escaping (UIImage?) -> Void) -> Void {
    return { [weak self] loader in
      self?.dependencies.imageCache.getImage(from: url, completion: loader)
    }
  }
  
}
