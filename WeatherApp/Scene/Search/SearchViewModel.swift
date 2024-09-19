//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Data on 12.06.24.
//

import Foundation
import SimpleNetworking

final class SearchViewModel: ObservableObject {
    // MARK: - Properties
    @Published var searchResults: [CoordinateModel] = []
    @Published var weatherData: [String: SearchWeatherModel.Model] = [:]
    
    // MARK: Key
    let apiKey = "Snrvbf7eQcIgHoVnWULvEA==GlJctm9vzTBuCtAJ"
    
    // MARK: - Fetch function
    func fetchCityData(cityName: String, apiKey: String) {
        let baseURL = "https://api.api-ninjas.com/v1/city?name=" + "\(cityName)" + "&limit=30"
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("HTTP Status Code: \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let cityDetails = try decoder.decode([CoordinateModel].self, from: data)
                
                DispatchQueue.main.async {
                    self.searchResults.append(contentsOf: cityDetails)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    
    func fetchWeatherData(for cities: [CoordinateModel]) {
        for city in cities {
            let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(city.latitude)&lon=\(city.longitude)&appid=690f88717c984072f681182b5be6acb1&units=metric"
            
            WebService().fetchData(from: urlString, resultType: SearchWeatherModel.Model.self) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.weatherData[city.name] = data
                    case .failure(let error):
                        print("Fetch failed: \(error)")
                    }
                }
            }
        }
    }
}
