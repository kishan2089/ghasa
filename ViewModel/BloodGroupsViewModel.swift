//
//  BloodGroupsViewModel.swift
//  Ghasa Gam
//
//  Created by Kishan Kachhadiya on 09/12/22.
//

import Foundation

enum BloodGroupsTitle {
    
      case A_pluse
      case A_Minus
      case B_pluse
      case B_Minus
      case AB_pluse
      case AB_Minus
      case O_pluse
      case O_Minus
    
    
    
    func bloodTitle() -> String {
        switch self {
        case .A_pluse:
            return("A+")
        case .A_Minus:
            return("A-")
        case .B_pluse:
            return("B+")
        case .B_Minus:
            return("B-")
        case .AB_pluse:
            return("AB+")
        case .AB_Minus:
            return("AB-")
        case .O_pluse:
            return("O+")
        case .O_Minus:
            return("O-")
            
        }
    }
    
    func bloodBottomTitle() -> String {
        switch self {
        case .A_pluse:
            return("A Positive")
        case .A_Minus:
            return("A Negative")
        case .B_pluse:
            return("B Positive")
        case .B_Minus:
            return("B Negative")
        case .AB_pluse:
            return("AB Positive")
        case .AB_Minus:
            return("AB Negative")
        case .O_pluse:
            return("O Positive")
        case .O_Minus:
            return("O Negative")
            
        }
    }

}


class  BloodGroupsViewModel : NSObject {
    
    var arrBloodTitle = [BloodGroupsTitle]()
    
    override init() {
        super.init()
        bloodTitletArray()
    }
    
    
    private func bloodTitletArray() {
        arrBloodTitle.removeAll()
        arrBloodTitle.append(.A_pluse)
        arrBloodTitle.append(.A_Minus)
        arrBloodTitle.append(.B_pluse)
        arrBloodTitle.append(.B_Minus)
        arrBloodTitle.append(.AB_pluse)
        arrBloodTitle.append(.AB_Minus)
        arrBloodTitle.append(.O_pluse)
        arrBloodTitle.append(.O_Minus)
    }
}
