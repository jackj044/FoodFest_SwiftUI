import Alamofire
import Foundation


enum ViewState:Equatable {
    case loading
    case error(message: String)
    case dataLoaded
}

struct APIServices {
    public static let shared = APIServices()
    
    func callCategory(queryItems: [URLQueryItem]? = nil, parameters: Parameters? = nil, success: @escaping (_ result: CategoryModel?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        
        APIManager.shared.callAPI(strURL: APIConstants.apiCategory, queryItems: queryItems, method: .get, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let categoryResponse = try JSONDecoder().decode(CategoryModel.self, from: data)
                    success(categoryResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }
            
        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    
    func callCategoryMenu(queryItems: [URLQueryItem]? = nil, inlineQuery:String? = "", parameters: Parameters? = nil, success: @escaping (_ result: MenuItemModel?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        
        APIManager.shared.callAPI(strURL: APIConstants.apiCategoryMenu + inlineQuery!, queryItems: queryItems, method: .get, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let menuItemResponse = try JSONDecoder().decode(MenuItemModel.self, from: data)
                    success(menuItemResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }
            
        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    
    func callMenuItemDetail(queryItems: [URLQueryItem]? = nil, inlineQuery:String? = "", parameters: Parameters? = nil, success: @escaping (_ result: MenuItemDetailModel?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        var headers = HTTPHeaders()
        headers["content-type"] = "application/json"
        
        APIManager.shared.callAPI(strURL: APIConstants.apiMenuItemDetail + inlineQuery!, queryItems: queryItems, method: .get, headers: headers, parameters: parameters, success: { response in
            do {
                if let data = response.data {
                    let menuItemDetailResponse = try JSONDecoder().decode(MenuItemDetailModel.self, from: data)
                    success(menuItemDetailResponse)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }
            
        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
}
