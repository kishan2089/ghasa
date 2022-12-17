//
//	Detail.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Detail : NSObject, NSCoding{

	var address : String!
	var bloodGroup : AnyObject!
	var business : String!
	var dob : AnyObject!
	var education : String!
	var firstName : String!
	var id : Int!
	var image : String!
	var lastName : String!
	var middleName : String!
	var mobileNo : String!
	var phoneNo : AnyObject!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		address = dictionary["address"] as? String
		bloodGroup = dictionary["blood_group"] as? AnyObject
		business = dictionary["business"] as? String
		dob = dictionary["dob"] as? AnyObject
		education = dictionary["education"] as? String
		firstName = dictionary["first_name"] as? String
		id = dictionary["id"] as? Int
		image = dictionary["image"] as? String
		lastName = dictionary["last_name"] as? String
		middleName = dictionary["middle_name"] as? String
		mobileNo = dictionary["mobile_no"] as? String
		phoneNo = dictionary["phone_no"] as? AnyObject
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if address != nil{
			dictionary["address"] = address
		}
		if bloodGroup != nil{
			dictionary["blood_group"] = bloodGroup
		}
		if business != nil{
			dictionary["business"] = business
		}
		if dob != nil{
			dictionary["dob"] = dob
		}
		if education != nil{
			dictionary["education"] = education
		}
		if firstName != nil{
			dictionary["first_name"] = firstName
		}
		if id != nil{
			dictionary["id"] = id
		}
		if image != nil{
			dictionary["image"] = image
		}
		if lastName != nil{
			dictionary["last_name"] = lastName
		}
		if middleName != nil{
			dictionary["middle_name"] = middleName
		}
		if mobileNo != nil{
			dictionary["mobile_no"] = mobileNo
		}
		if phoneNo != nil{
			dictionary["phone_no"] = phoneNo
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address = aDecoder.decodeObject(forKey: "address") as? String
         bloodGroup = aDecoder.decodeObject(forKey: "blood_group") as? AnyObject
         business = aDecoder.decodeObject(forKey: "business") as? String
         dob = aDecoder.decodeObject(forKey: "dob") as? AnyObject
         education = aDecoder.decodeObject(forKey: "education") as? String
         firstName = aDecoder.decodeObject(forKey: "first_name") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? String
         lastName = aDecoder.decodeObject(forKey: "last_name") as? String
         middleName = aDecoder.decodeObject(forKey: "middle_name") as? String
         mobileNo = aDecoder.decodeObject(forKey: "mobile_no") as? String
         phoneNo = aDecoder.decodeObject(forKey: "phone_no") as? AnyObject

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address != nil{
			aCoder.encode(address, forKey: "address")
		}
		if bloodGroup != nil{
			aCoder.encode(bloodGroup, forKey: "blood_group")
		}
		if business != nil{
			aCoder.encode(business, forKey: "business")
		}
		if dob != nil{
			aCoder.encode(dob, forKey: "dob")
		}
		if education != nil{
			aCoder.encode(education, forKey: "education")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "first_name")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "last_name")
		}
		if middleName != nil{
			aCoder.encode(middleName, forKey: "middle_name")
		}
		if mobileNo != nil{
			aCoder.encode(mobileNo, forKey: "mobile_no")
		}
		if phoneNo != nil{
			aCoder.encode(phoneNo, forKey: "phone_no")
		}

	}

}
