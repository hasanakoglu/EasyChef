//
//  Data.swift
//  EasyChef
//
//  Created by Hasan Akoglu on 06/01/2021.
//

import Foundation

struct Meals: Hashable {
    var name: String
    var duration: String
    var image: String { return name }
}

let data: [Meals] = [
    Meals(name: "Chilli Sauce", duration: "20 Mins"),
    Meals(name: "Adana", duration: "40 Mins"),
    Meals(name: "Breakfast", duration: "30 Mins"),
    Meals(name: "Jacket Potato", duration: "2 Hours"),
    Meals(name: "Cheese Rolls", duration: "25 Mins"),
    Meals(name: "Apple Crumble", duration: "40 Mins"),
    Meals(name: "Sultan's Delight", duration: "35 Mins")
]
