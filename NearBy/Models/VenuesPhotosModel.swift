//
//  VenuesPhotosModel.swift
//  NearBy
//
//  Created by prog_zidane on 10/28/19.
//  Copyright © 2019 prog_zidane. All rights reserved.
//

import Foundation

struct VenuesPhotosModel : Codable {

        let meta : PhotosMeta?
        let response : PhotosResponse?

        enum CodingKeys: String, CodingKey {
                case meta = "meta"
                case response = "response"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                meta = try values.decodeIfPresent(PhotosMeta.self, forKey: .meta)
                response = try values.decodeIfPresent(PhotosResponse.self, forKey: .response)
        }

}

struct PhotosResponse : Codable {

        let photos : Photo?

        enum CodingKeys: String, CodingKey {
                case photos = "photos"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                photos = try values.decodeIfPresent(Photo.self, forKey: .photos)
        }

}
struct Photo : Codable {

        let count : Int?
        let dupesRemoved : Int?
        let items : [PhotoItem]?

    var photoUrl:String?{
        guard let suffix = items?.first?.suffix else { return "" }
        guard let prefix = items?.first?.prefix else { return "" }
        guard let height = items?.first?.height else { return "" }
        guard let width = items?.first?.width else { return "" }
        return  "\(prefix)\(width)x\(height)\(suffix)"
    }
        enum CodingKeys: String, CodingKey {
                case count = "count"
                case dupesRemoved = "dupesRemoved"
                case items = "items"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                count = try values.decodeIfPresent(Int.self, forKey: .count)
                dupesRemoved = try values.decodeIfPresent(Int.self, forKey: .dupesRemoved)
                items = try values.decodeIfPresent([PhotoItem].self, forKey: .items)
        }

}

struct PhotoItem : Codable {

        let checkin : Checkin?
        let createdAt : Int?
        let height : Int?
        let id : String?
        let prefix : String?
        let source : Source?
        let suffix : String?
        let user : User?
        let visibility : String?
        let width : Int?

        enum CodingKeys: String, CodingKey {
                case checkin = "checkin"
                case createdAt = "createdAt"
                case height = "height"
                case id = "id"
                case prefix = "prefix"
                case source = "source"
                case suffix = "suffix"
                case user = "user"
                case visibility = "visibility"
                case width = "width"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                checkin = try values.decodeIfPresent(Checkin.self, forKey: .checkin)
                createdAt = try values.decodeIfPresent(Int.self, forKey: .createdAt)
                height = try values.decodeIfPresent(Int.self, forKey: .height)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                prefix = try values.decodeIfPresent(String.self, forKey: .prefix)
                source = try values.decodeIfPresent(Source.self, forKey: .source)
                suffix = try values.decodeIfPresent(String.self, forKey: .suffix)
                user = try values.decodeIfPresent(User.self, forKey: .user)
                visibility = try values.decodeIfPresent(String.self, forKey: .visibility)
                width = try values.decodeIfPresent(Int.self, forKey: .width)
        }

}

struct User : Codable {

        let firstName : String?
        let gender : String?
        let id : String?
        let lastName : String?
        let photo : userPhoto?

        enum CodingKeys: String, CodingKey {
                case firstName = "firstName"
                case gender = "gender"
                case id = "id"
                case lastName = "lastName"
                case photo = "photo"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
                gender = try values.decodeIfPresent(String.self, forKey: .gender)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
                photo = try values.decodeIfPresent(userPhoto.self, forKey: .photo)
        }

}

struct userPhoto : Codable {

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
struct Source : Codable {

        let name : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case name = "name"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                name = try values.decodeIfPresent(String.self, forKey: .name)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
struct Checkin : Codable {

        let createdAt : Int?
        let id : String?
        let timeZoneOffset : Int?
        let type : String?

        enum CodingKeys: String, CodingKey {
                case createdAt = "createdAt"
                case id = "id"
                case timeZoneOffset = "timeZoneOffset"
                case type = "type"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                createdAt = try values.decodeIfPresent(Int.self, forKey: .createdAt)
                id = try values.decodeIfPresent(String.self, forKey: .id)
                timeZoneOffset = try values.decodeIfPresent(Int.self, forKey: .timeZoneOffset)
                type = try values.decodeIfPresent(String.self, forKey: .type)
        }

}
struct PhotosMeta : Codable {

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
