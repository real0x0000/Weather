//
//  APIClient.swift
//  Weather
//
//  Created by Anuwat Sittichak on 19/4/2563 BE.
//

import Alamofire
import SwiftyJSON

final class APIClient {
    
    static let share = APIClient()
    private var response: AFDataResponse<Any>?
    private var onCompletion: ((JSON) -> Void)?
    private var onError: ((UserError) -> Void)?
    
    @discardableResult
    func performRequest(route: APIRouter, onCompletion:@escaping (JSON) -> Void, onError: @escaping (UserError) -> Void ) -> DataRequest {
       return AF.request(route).responseJSON { response in
           self.processResponse(response: response, onCompletion: onCompletion, onError: onError)
       }
    }
    
    private func processResponse(response: AFDataResponse<Any>, onCompletion:@escaping (JSON) -> Void, onError: @escaping (UserError) -> Void) {
        #if DEBUG
        print(unwrapped(response.request?.allHTTPHeaderFields, with: ""))
        #endif
        self.response = response
        self.onCompletion = onCompletion
        self.onError = onError
        self.returnResponse()
    }
    
    private func returnResponse() -> Void {
        guard let response = self.response, let onCompletion = self.onCompletion, let onError = self.onError else {
            return
        }
        switch response.result {
        case .success(let value):
            if response.response == nil {
                let res = UserError(message: Message.GENERAL_ERROR.rawValue)
                onError(res)
            }
            else if ((response.response?.statusCode)! >= 200 && (response.response?.statusCode)! <= 299){
                let json = JSON(value)
                #if DEBUG
                print(">>> \(response.request?.url?.absoluteString ?? "")")
                print(json)
                #endif
                onCompletion(json)
            } else {
                self.HandleException() {
                    let json = JSON(value)
                    let msgTxt = json["message"].stringValue
                    var error = ternary(condition: msgTxt.isEmpty, true: Message.GENERAL_ERROR.rawValue, false: msgTxt)
                    #if DEBUG
                    print(json)
                    error = "\(response.response!.statusCode): \(error)"
                    print("\(response.request?.url?.absoluteString ?? "") \n😢 \(error)")
                    #endif
                    let res = UserError(message: error)
                    onError(res)
                }
            }
        case .failure (let error):
            print("AF error >>>>> \(error.localizedDescription)")
            #if DEBUG
            print(">>> \(response.request?.url?.absoluteString ?? "")")
            #endif
            self.HandleException(){
                if(response.response != nil){
                    let res = UserError(message: Message.GENERAL_ERROR.rawValue)
                    onError(res)
                }
                else{
                    let res = UserError(message: Message.CAN_NOT_LOAD_URL.rawValue)
                    onError(res)
                }
            }
        }
        self.response = nil
        self.onCompletion = nil
        self.onError = nil
    }
    
    func performRefreshToken(){
        
    }
    
    func HandleException(closure: () -> Void){
        closure()
    }
}
