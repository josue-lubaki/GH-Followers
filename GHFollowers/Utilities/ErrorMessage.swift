//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Josue Lubaki on 2024-04-17.
//

import Foundation

enum ErrorMessage : String {
    case INVALID_USERNAME   = "This username created an invalid request. Please try again."
    case UNABLE_TO_COMPLETE = "Unable to complete your request. Please check your internet connection."
    case INVALID_RESPONSE   = "Invalid response from the server. Please try again."
    case INVALID_DATA       = "The data received on the server was invalid. Please try again"
}
