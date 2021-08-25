//
//  ProductModel.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/24/21.
//

import UIKit

struct RestaurantImageViewModel: Identifiable {
  let id = UUID()
  let placeholder: String
    
  let imageData: String

  let loader: (@escaping (UIImage?) -> Void) -> Void
}


final class RestaurantDetailViewModel {
  struct Dependencies {
    var imageCache: ImageCacheService = ImageCacheServiceAdapter.shared
  }
  private let dependencies: Dependencies
  private let restaurant: PostModel
//  var restaurantImageName: String { return restaurant.imageName }
//  var restaurantDescription: String { return restaurant.description }
//  var title: String { return restaurant.name }
  
  init(dependencies: Dependencies = .init(), restaurant: PostModel) {
    self.dependencies = dependencies
    self.restaurant = restaurant
  }
  
  
  func getImageItems() -> [RestaurantImageViewModel] {
    return restaurant.images.map {
//        print($0)
        RestaurantImageViewModel(
            placeholder: "foodPlaceholder",
            imageData: $0.image,
            loader: getLoader(for: $0.image)
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

