//
//  CLLocationCoordinate2D+Extension.swift
//  Weather
//
//  Created by Cameron Slash on 22/3/22.
//

import CoreLocation
import Foundation

extension CLLocationCoordinate2D: Codable {
    public enum CodingKeys: String, CodingKey {
        case longitude, latitude
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let lat = try container.decode(Double.self, forKey: .latitude)
        let lon = try container.decode(Double.self, forKey: .longitude)
        
        self.init(latitude: lat, longitude: lon)
    }
}
