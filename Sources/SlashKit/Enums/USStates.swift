//
//  USStates.swift
//  Weather
//
//  Created by Cameron Slash on 22/3/22.
//

import Foundation

public enum USStates: String, CaseIterable, Codable {
    case al = "AL"
    case ak = "AK"
    case az = "AZ"
    case ar = "AR"
    case ca = "CA"
    case co = "CO"
    case ct = "CT"
    case de = "DE"
    case fl = "FL"
    case ga = "GA"
    case hi = "HI"
    case id = "ID"
    case il = "IL"
    case `in` = "IN"
    case ia = "IA"
    case ks = "KS"
    case ky = "KY"
    case la = "LA"
    case me = "ME"
    case md = "MD"
    case ma = "MA"
    case mi = "MI"
    case mn = "MN"
    case ms = "MS"
    case mo = "MR"
    case mt = "MT"
    case ne = "NE"
    case nv = "NV"
    case nh = "NH"
    case nj = "NJ"
    case nm = "NM"
    case ny = "NY"
    case nc = "NC"
    case nd = "ND"
    case oh = "OH"
    case ok = "OK"
    case or = "OR"
    case pa = "PA"
    case ri = "RI"
    case sc = "SC"
    case sd = "SD"
    case tn = "TN"
    case tx = "TX"
    case ut = "UT"
    case vt = "VT"
    case va = "VA"
    case wa = "WA"
    case wv = "WV"
    case wi = "WI"
    case wy = "WY"
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let code = try container.decode(String.self)
        
        self = .in
        
        for state in USStates.allCases {
            if code == state.rawValue {
                self = state
            }
        }
    }
}

extension USStates {
    public var state: String {
        switch self {
        case .al: return "Alabama"
        case .ak: return "Alaska"
        case .az: return "Arizona"
        case .ar: return "Arkansas"
        case .ca: return "California"
        case .co: return "Colorado"
        case .ct: return "Connecticut"
        case .de: return "Delaware"
        case .fl: return "Florida"
        case .ga: return "Georgia"
        case .hi: return "Hawaii"
        case .id: return "Idaho"
        case .il: return "Illinois"
        case .in: return "Indiana"
        case .ia: return "Iowa"
        case .ks: return "Kansas"
        case .ky: return "Kentucky"
        case .la: return "Louisiana"
        case .me: return "Maine"
        case .md: return "Maryland"
        case .ma: return "Massachusetts"
        case .mi: return "Michigan"
        case .mn: return "Minnesota"
        case .ms: return "Mississippi"
        case .mo: return "Missouri"
        case .mt: return "Montana"
        case .ne: return "Nebraska"
        case .nv: return "Nevada"
        case .nh: return "New Hampshire"
        case .nj: return "New Jersey"
        case .nm: return "New Mexico"
        case .ny: return "New York"
        case .nc: return "North Carolina"
        case .nd: return "North Dakota"
        case .oh: return "Ohio"
        case .ok: return "Oklahoma"
        case .or: return "Oregon"
        case .pa: return "Pennsylvania"
        case .ri: return "Rhode Island"
        case .sc: return "South Carolina"
        case .sd: return "South Dakota"
        case .tn: return "Tennessee"
        case .tx: return "Texas"
        case .ut: return "Utah"
        case .vt: return "Vermont"
        case .va: return "Virginia"
        case .wa: return "Washington"
        case .wv: return "West Virginia"
        case .wi: return "Wisconsin"
        case .wy: return "Wyoming"
        }
    }
}
