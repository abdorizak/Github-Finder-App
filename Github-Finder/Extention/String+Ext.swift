//
//  String+Ext.swift
//  Github-Finder
//
//  Created by Abdirizak Hassan on 10/21/21.
//

import UIKit

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
