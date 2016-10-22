//
//  Localisator.swift
//  Localisator_Demo-swift
//
//  Created by Michaël Azevedo on 10/02/2015.
//  Copyright (c) 2015 Michaël Azevedo. All rights reserved.
//

import UIKit


enum Lang: String{
    case DeviceLanguage = "DeviceLanguage"
    case fr = "fr"
    case en = "en"
    case es = "es"
    case ru = "ru"
    
    static let allValues = [DeviceLanguage, fr, en, es, ru]
}

let kNotificationLanguageChanged: String = "kNotificationLanguageChanged";

func Localization(_ string:String) -> String{
    return Localisator.sharedInstance.localizedStringForKey(string)
}

func SetLanguage(_ language: Lang) -> Bool {
    return Localisator.sharedInstance.setLanguage(language)
}

func GetLanguage() -> Lang {
    return Localisator.sharedInstance.currentLanguage
}

class Localisator {
    
    // MARK: - Private properties
    fileprivate let defaultLang = Lang.fr
    
    fileprivate let userDefaults = UserDefaults.standard
    fileprivate var availableLanguagesArray = Lang.allValues
    fileprivate var dicoLocalisation:NSDictionary!
    
    
    fileprivate let kSaveLanguageDefaultKey = "kSaveLanguageDefaultKey"
    
    // MARK: - Public properties
    
    var currentLanguage: Lang  = Lang.DeviceLanguage
    
    // MARK: - Public computed properties
    
    let saveInUserDefaults = true
    //    var saveInUserDefaults:Bool {
    //        get {
    //            return (userDefaults.object(forKey: kSaveLanguageDefaultKey) != nil)
    //        }
    //        set {
    //            if newValue {
    //                userDefaults.set(currentLanguage, forKey: kSaveLanguageDefaultKey)
    //            } else {
    //                userDefaults.removeObject(forKey: kSaveLanguageDefaultKey)
    //            }
    //            userDefaults.synchronize()
    //        }
    //    }
    
    
    // MARK: - Singleton method
    
    class var sharedInstance :Localisator {
        struct Singleton {
            static let instance = Localisator()
        }
        return Singleton.instance
    }
    
    // MARK: - Init method
    init() {
        if let languageSaved = userDefaults.object(forKey: kSaveLanguageDefaultKey) as? String {
            if languageSaved != "DeviceLanguage" {
                let l = Lang(rawValue: languageSaved)!
                self.loadDictionaryForLanguage(l)
                currentLanguage = l
            }
        }
        else if let defaultLang = Lang(rawValue: NSLocale.current.languageCode!){
           currentLanguage = defaultLang
        }
        else{
            currentLanguage = defaultLang
        }
    }
    
    // MARK: - Public custom getter
    
    func getArrayAvailableLanguages() -> [Lang] {
        return availableLanguagesArray
    }
    
    
    // MARK: - Private instance methods
    
    fileprivate func loadDictionaryForLanguage(_ newLanguage: Lang) -> Bool {
        let path = Bundle(for:object_getClass(self)).url(forResource: "Localizable", withExtension: "strings", subdirectory: nil, localization: newLanguage.rawValue)?.path
        
        if ((path != nil) && FileManager.default.fileExists(atPath: path!)) {
            currentLanguage = newLanguage
            dicoLocalisation = NSDictionary(contentsOfFile: path!)
            return true
        }
        else{
            return false
        }
    }
    
    
    
    
    fileprivate func localizedStringForKey(_ key:String) -> String {
        if let dico = dicoLocalisation {
            if let localizedString = dico[key] as? String {
                return localizedString
            }  else {
                return key
            }
        } else {
            return NSLocalizedString(key, comment: key)
        }
    }
    
    fileprivate func setLanguage(_ newLanguage: Lang) -> Bool {
        if (newLanguage == currentLanguage) || !availableLanguagesArray.contains(newLanguage) {
            return false
        }
        
        if (newLanguage == Lang.DeviceLanguage) {
            currentLanguage = newLanguage
            dicoLocalisation = nil
            NotificationCenter.default.post(name: Notification.Name(rawValue: kNotificationLanguageChanged), object: nil)
            return true
        }
        else if loadDictionaryForLanguage(newLanguage) {
            NotificationCenter.default.post(name: Notification.Name(rawValue: kNotificationLanguageChanged), object: nil)
            if saveInUserDefaults {
                userDefaults.setValue(newLanguage.rawValue, forKey: kSaveLanguageDefaultKey)
                userDefaults.synchronize()
            }
            return true
        }
        else {
            return false
        }
    }
}

