//
//  ExploreVenusModel.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation

struct ExploreVenuesModel : Codable {
    
    let meta : Meta?
    let response : Response?
    
    enum CodingKeys: String, CodingKey {
        case meta = "meta"
        case response = "response"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        response = try values.decodeIfPresent(Response.self, forKey: .response)
    }
    
}
struct Response : Codable {
    
    let groups : [VenuesGroup]?
    let headerFullLocation : String?
    let headerLocation : String?
    let headerLocationGranularity : String?
    let suggestedBounds : SuggestedBound?
    let suggestedRadius : Int?
    let totalResults : Int?
    let warning : Warning?
    
    enum CodingKeys: String, CodingKey {
        case groups = "groups"
        case headerFullLocation = "headerFullLocation"
        case headerLocation = "headerLocation"
        case headerLocationGranularity = "headerLocationGranularity"
        case suggestedBounds = "suggestedBounds"
        case suggestedRadius = "suggestedRadius"
        case totalResults = "totalResults"
        case warning = "warning"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        groups = try values.decodeIfPresent([VenuesGroup].self, forKey: .groups)
        headerFullLocation = try values.decodeIfPresent(String.self, forKey: .headerFullLocation)
        headerLocation = try values.decodeIfPresent(String.self, forKey: .headerLocation)
        headerLocationGranularity = try values.decodeIfPresent(String.self, forKey: .headerLocationGranularity)
        suggestedBounds = try values.decodeIfPresent(SuggestedBound.self, forKey: .suggestedBounds)
        suggestedRadius = try values.decodeIfPresent(Int.self, forKey: .suggestedRadius)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        warning = try values.decodeIfPresent(Warning.self, forKey: .warning)
    }
    
}
struct Warning : Codable {
    
    let text : String?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        text = try values.decodeIfPresent(String.self, forKey: .text)
    }
    
}

struct SuggestedBound : Codable {
    
    let ne : Ne?
    let sw : Sw?
    
    enum CodingKeys: String, CodingKey {
        case ne = "ne"
        case sw = "sw"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ne = try values.decodeIfPresent(Ne.self, forKey: .ne)
        sw = try values.decodeIfPresent(Sw.self, forKey: .sw)
    }
    
}
struct Ne : Codable {
    
    let lat : Float?
    let lng : Float?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lng = try values.decodeIfPresent(Float.self, forKey: .lng)
    }
    
}

struct Sw : Codable {
    
    let lat : Float?
    let lng : Float?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lng = try values.decodeIfPresent(Float.self, forKey: .lng)
    }
    
}

struct VenuesGroup : Codable {
    
    let items : [Item]?
    let name : String?
    let type : String?
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
        case name = "name"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        items = try values.decodeIfPresent([Item].self, forKey: .items)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
    
}
struct Item : Codable {
    
    let reasons : Reason?
    let venue : Venue?
    
    enum CodingKeys: String, CodingKey {
        case reasons = "reasons"
        case venue = "venue"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reasons = try values.decodeIfPresent(Reason.self, forKey: .reasons)
        venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
    }
    
}
struct Venue : Codable {
    
    let categories : [Category]?
    let id : String?
    let location : Location?
    let name : String?
    let popularityByGeo : Float?
    let venuePage : VenuePage?
    
    enum CodingKeys: String, CodingKey {
        case categories = "categories"
        case id = "id"
        case location = "location"
        case name = "name"
        case popularityByGeo = "popularityByGeo"
        case venuePage = "venuePage"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories = try values.decodeIfPresent([Category].self, forKey: .categories)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        popularityByGeo = try values.decodeIfPresent(Float.self, forKey: .popularityByGeo)
        venuePage = try values.decodeIfPresent(VenuePage.self, forKey: .venuePage)
    }
    
}
struct VenuePage : Codable {
    
    let id : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
}
struct Location : Codable {
    
    let address : String?
    let cc : String?
    let city : String?
    let country : String?
    let crossStreet : String?
    let distance : Int?
    let formattedAddress : [String]?
    let labeledLatLngs : [LabeledLatLng]?
    let lat : Float?
    let lng : Float?
    let postalCode : String?
    let state : String?
    
    enum CodingKeys: String, CodingKey {
        case address = "address"
        case cc = "cc"
        case city = "city"
        case country = "country"
        case crossStreet = "crossStreet"
        case distance = "distance"
        case formattedAddress = "formattedAddress"
        case labeledLatLngs = "labeledLatLngs"
        case lat = "lat"
        case lng = "lng"
        case postalCode = "postalCode"
        case state = "state"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        cc = try values.decodeIfPresent(String.self, forKey: .cc)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        crossStreet = try values.decodeIfPresent(String.self, forKey: .crossStreet)
        distance = try values.decodeIfPresent(Int.self, forKey: .distance)
        formattedAddress = try values.decodeIfPresent([String].self, forKey: .formattedAddress)
        labeledLatLngs = try values.decodeIfPresent([LabeledLatLng].self, forKey: .labeledLatLngs)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lng = try values.decodeIfPresent(Float.self, forKey: .lng)
        postalCode = try values.decodeIfPresent(String.self, forKey: .postalCode)
        state = try values.decodeIfPresent(String.self, forKey: .state)
    }
    
}
struct LabeledLatLng : Codable {
    
    let label : String?
    let lat : Float?
    let lng : Float?
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case lat = "lat"
        case lng = "lng"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        lat = try values.decodeIfPresent(Float.self, forKey: .lat)
        lng = try values.decodeIfPresent(Float.self, forKey: .lng)
    }
    
}
struct Category : Codable {
    
    let icon : Icon?
    let id : String?
    let name : String?
    let pluralName : String?
    let primary : Bool?
    let shortName : String?
    
    enum CodingKeys: String, CodingKey {
        case icon = "icon"
        case id = "id"
        case name = "name"
        case pluralName = "pluralName"
        case primary = "primary"
        case shortName = "shortName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        icon = try values.decodeIfPresent(Icon.self, forKey: .icon)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        pluralName = try values.decodeIfPresent(String.self, forKey: .pluralName)
        primary = try values.decodeIfPresent(Bool.self, forKey: .primary)
        shortName = try values.decodeIfPresent(String.self, forKey: .shortName)
    }
    
}

struct Icon : Codable {
    
    let prefix : String?
    let suffix : String?
    enum CodingKeys: String, CodingKey {
        case prefix = "prefix"
        case suffix = "suffix"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
        suffix = try values.decodeIfPresent(String.self, forKey: .suffix)
    }
    
}
struct Reason : Codable {
    
    let count : Int?
    let items : [inerItems]?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
        items = try values.decodeIfPresent([inerItems].self, forKey: .items)
    }
    
}
struct inerItems : Codable {
    
    let reasonName : String?
    let summary : String?
    let type : String?
    
    enum CodingKeys: String, CodingKey {
        case reasonName = "reasonName"
        case summary = "summary"
        case type = "type"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reasonName = try values.decodeIfPresent(String.self, forKey: .reasonName)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
    
}
struct Meta : Codable {
    
    let code : Int?
    let requestId : String?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case requestId = "requestId"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        requestId = try values.decodeIfPresent(String.self, forKey: .requestId)
    }
    
}
