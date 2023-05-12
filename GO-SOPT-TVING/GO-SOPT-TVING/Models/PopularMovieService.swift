import Foundation

import Alamofire

final class PopularMovieService {
    
    static let shared = PopularMovieService()
    
    private init() {}

    
    func fetchPopularMovieData(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.baseURL + "/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=" + Config.apiKey
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url, method: .get, headers: header)
        print(url)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200...299: return isValidData(data: data)
        case 400...499: return isValidData(data: data)
        case 500...599: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(PopularMovie.self, from: data) else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}

