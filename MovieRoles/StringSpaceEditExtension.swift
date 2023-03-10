//
//  StringSpaceEditExtension.swift
//  MovieRoles
//
//  Created by Derefaa Cline on 3/9/23.
//

import Foundation
extension String{
    func trimmed() -> String{
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
