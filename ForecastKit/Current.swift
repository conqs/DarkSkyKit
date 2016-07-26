import Foundation
import Alamofire

public extension ForecastKit {
    public func current(latitude lat: Double, lognitude long: Double, result: Result<Forecast, NSError> -> Void) {
        Alamofire.request(Router.Current(configuration, lat, long)).responseJSON { response in
            switch response.result {
            case .Success(let value):
                if let json = value as? [String:AnyObject] {
                    result(Result.Success(Forecast(data: json)))
                }
            case .Failure(let error):
                result(Result.Failure(error))
            }
        }
    }
}