//
//  CSDocumentoscopyBridgetDelegate.swift
//  iOSReact
//
//  Created by Lucas de Castro Carvalho on 19/01/24.
//

import Foundation

@objc public protocol CSDocumentoscopyBridgetDelegate {
    @objc func didOpen()
    @objc func didTapClose()
    @objc func didReceiveError(error: NSString, text: NSString, codeError: NSInteger)
    @objc func didFinishCapture(sessionId: NSString, documentType: NSString)
}
