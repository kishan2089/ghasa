//
//	FamilyDetailModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class FamilyDetailModel : NSObject, NSCoding{

	var detail : [Detail]!
	var totalMember : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		detail = [Detail]()
		if let detailArray = dictionary["detail"] as? [[String:Any]]{
			for dic in detailArray{
				let value = Detail(fromDictionary: dic)
				detail.append(value)
			}
		}
		totalMember = dictionary["total_member"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if detail != nil{
			var dictionaryElements = [[String:Any]]()
			for detailElement in detail {
				dictionaryElements.append(detailElement.toDictionary())
			}
			dictionary["detail"] = dictionaryElements
		}
		if totalMember != nil{
			dictionary["total_member"] = totalMember
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         detail = aDecoder.decodeObject(forKey :"detail") as? [Detail]
         totalMember = aDecoder.decodeObject(forKey: "total_member") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if detail != nil{
			aCoder.encode(detail, forKey: "detail")
		}
		if totalMember != nil{
			aCoder.encode(totalMember, forKey: "total_member")
		}

	}

}
