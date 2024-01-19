//
//  CSDocumentoscopyBridget.swift
//  iOSReact
//
//  Created by Lucas de Castro Carvalho on 19/01/24.
//

import Foundation
import CSDocumentoscopySDK
import UIKit

@objc
class CSDocumentoscopyBridget: NSObject {
        
    // MARK: - Constants

    private struct Constants {
        static let clientId = "clientId"
        static let clientSecret = "clientSecret"
        static let identifierId = "identifierId"
        static let cpf = "cpf"
    }
        
    // MARK: - Public Attributes

    @objc public var delegate: CSDocumentoscopyBridgetDelegate?
    
    // MARK: - Public Functions

    @objc public func callSDK(navigation: UINavigationController) {
        let sdk = CSDocumentoscopy()
        sdk.delegate = self
        sdk.initialize(
            clientId: Constants.clientId,
            clientSecret: Constants.clientSecret,
            identifierId: Constants.identifierId,
            cpf: Constants.cpf,
            navigationController: navigation)
    }
}

// MARK: - Extensions

extension CSDocumentoscopyBridget: CSDocumentoscopyDelegate {
    func didOpen() {
        print("CSDocumentoscopy - SDK Aberto")
        delegate?.didOpen()
    }
    
    func didTapClose() {
        print("CSDocumentoscopy - SDK Fechado")
        delegate?.didTapClose()
    }
    
    func didReceiveError(error: CSDocumentoscopyError) {
        print("CSDocumentoscopy - SDK Error: " + error.text)
        delegate?.didReceiveError(error: error.rawValue as NSString, text: error.text as NSString, codeError: error.errorCode)
    }
    
    func didFinishCapture(result: CSDocumentoscopyResult) {
        print("CSDocumentoscopy - SDK Fluxo Finalizado")
        delegate?.didFinishCapture(sessionId: result.sessionId as NSString, documentType: result.documentType.rawValue as NSString)
    }
}
