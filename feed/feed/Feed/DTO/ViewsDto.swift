//
//  ViewsDto.swift
//  feed
//
//  Created by admin on 15.01.2021.
//

import Foundation

class ViewsDto: Codable {
    let count: Int?

    init(count: Int?) {
        self.count = count
    }
}
