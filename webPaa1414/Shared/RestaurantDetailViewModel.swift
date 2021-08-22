//
//  RestaurantDetailViewModel.swift
//  webPaa1414
//
//  Created by MacBook Pro on 8/22/21.
//

import Foundation
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
    
  let imageData: String
  let priceData: String
  let descriptionData: String
  let styleData: String
  let companyData: String
  let categoryData: String
  let priceoptData: String
  let notesData: String
  let companystyleData: String
  let hiddenData: Bool

  let loader: (@escaping (UIImage?) -> Void) -> Void
}

final class RestaurantDetailViewModel {
  struct Dependencies {
    var imageCache: ImageCacheService = ImageCacheServiceAdapter.shared
  }
  private let dependencies: Dependencies
  private let restaurant: Restaurant
  var restaurantImageName: String { return restaurant.imageName }
  var restaurantDescription: String { return restaurant.description }
  var title: String { return restaurant.name }
  
  init(dependencies: Dependencies = .init(), restaurant: Restaurant) {
    self.dependencies = dependencies
    self.restaurant = restaurant
  }
    
  func getImageItems() -> [RestaurantImageViewModel] {
    return restaurant.images.map {
        RestaurantImageViewModel(
            placeholder: "foodPlaceholder",
            imageData: $0.name,
            priceData: $0.price,
            descriptionData: $0.description,
            styleData: $0.style,
            companyData: $0.company,
            categoryData: $0.category,
            priceoptData: $0.priceopt,
            notesData: $0.notes,
            companystyleData: $0.companystyle,
            hiddenData: $0.hidden,
            loader: getLoader(for: $0.name)
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
