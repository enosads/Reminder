//
//  String+Ext.swift
//  Reminder
//
//  Created by Enos Andrade on 12/10/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
