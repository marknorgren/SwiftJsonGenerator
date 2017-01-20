//
//  ClassGenerator.swift
//  JsonModelGenerator
//
//  Created by Charles Oder Dev on 1/20/17.
//
//

import Foundation

class ClassGenerator {
    
    private var fileLocation: String
    
    init(fileLocation: String) {
        self.fileLocation = fileLocation
    }
    
    func createHeaders(className: String) -> String {
        var header = "// \(className).swift\n"
        header += "// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator\n"
        header += "// Generated \(Date().description)\n\n"
        
        header += "import Foundation\n\n"
        return header
    }
    
    func createClassDeclaration(className: String) -> String {
        return "public struct \(className): JsonModel {\n\n"
    }
    
    func createPropertyList(properties:[ObjectProperty]) -> String {
        var propList = ""
        for property in properties {
            propList += "    public let \(property.name): \(property.type)?\n"
        }
        propList += "\n"
        return propList
    }
    
    func createInitWithPropertyArgs(properties:[ObjectProperty]) -> String {
        var initMethod = "    public init(\n"
        for property in properties {
            initMethod += "                \(property.name): \(property.type)?\(property.name != properties.last?.name ? "," : "")\n"
        }
        initMethod += "                ) {\n"
        for property in properties {
            initMethod += "        self.\(property.name) = \(property.name)\n"
        }
        initMethod += "    }\n\n"
        return initMethod
    }
    
    func createInitWithDictionaryMethod(properties:[ObjectProperty]) -> String {
        var initMethod = "    public init?(dictionary:[String: Any?]?) {\n"
        initMethod += "\n"
        for property in properties {
//            if property.isCustomType {
//                if property.isArray {
//                    initMethod += "        if let dictArray = dict?[\"\(property.name)\"] as? [[String: Any?]] {\n"
//                    initMethod += "            var objectArray = [\(property.arrayType)]()\n"
//                    initMethod += "            for dict in dictArray {\n"
//                    initMethod += "                if let obj = \(property.arrayType)(dict:dict){\n"
//                    initMethod += "                    objectArray.append(obj)\n"
//                    initMethod += "                }\n"
//                    initMethod += "            }\n"
//                    initMethod += "            \(property.name) = objectArray\n"
//                    initMethod += "        } else {\n"
//                    initMethod += "            \(property.name) = nil\n"
//                    initMethod += "        }\n"
//                    
//                } else {
//                    initMethod += "        \(property.name) = \(property.type)(dict:(dict?[\"\(property.name)\"] as? [String:Any?]))\n"
//                }
//            } else {
                initMethod += "        self.\(property.name) = dictionary?[\"\(property.name)\"] as? \(property.type)\n"
//            }
        }
        initMethod += "\n"
        initMethod += "    }\n\n"
        return initMethod
    }
    


}
