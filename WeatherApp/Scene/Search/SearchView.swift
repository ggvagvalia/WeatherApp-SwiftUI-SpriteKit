//
//  SearchView.swift
//  WeatherApp
//
//  Created by Data on 12.06.24.
//

import SwiftUI
import SwiftData

#warning("ამ ფაილში 65 სტრუქტურა რა უბედურებაა")
struct SearchView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: WeatherViewModel
    @Environment(\.modelContext) private var modelContext
    @Query var selectedCities: [CityData]
    
    @StateObject var searchViewModel = SearchViewModel()
    @State private var searchText = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack {
                if !searchViewModel.searchResults.isEmpty {
                    SearchResultsView(searchViewModel: searchViewModel, addCity: addCity)
                } else {
                    SelectedCitiesListView(selectedCities: selectedCities, searchViewModel: searchViewModel, deleteCity: deleteCity)
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton())
            .padding()
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchText) {
                searchViewModel.searchResults.removeAll()
            }
            .onSubmit(of: .search) {
                if searchText.isEmpty {
                    searchViewModel.searchResults.removeAll()
                } else {
                    searchViewModel.searchResults.removeAll()
                    searchViewModel.fetchCityData(cityName: searchText, apiKey: searchViewModel.apiKey)
                }
            }
            .navigationBarTitle("Locations", displayMode: .large)
        }
    }
    
    // MARK: - Helper functions
    #warning("ეს ფუნქციები ვიუმოდელში")
    private func addCity(city: CoordinateModel) {
        if selectedCities.contains(where: { $0.name == city.name }) {
            alertMessage = "City is already added"
            showAlert = true
            return
        }
        
        let newCity = CityData(city: city)
        modelContext.insert(newCity)
        try? modelContext.save()
        
        searchViewModel.searchResults.removeAll { $0.id == city.id }
    }
    
    private func deleteCity(city: CityData) {
        modelContext.delete(city)
        try? modelContext.save()
    }
}

// MARK: - Extracted Views
struct SearchResultsView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    var addCity: (CoordinateModel) -> Void
    #warning("ეს იქნებოდა computed property, არც ვიუმოდელის მოწოდება უნდა და მიტუმეტეს ფუნქციის")
    var body: some View {
        ScrollView {
            VStack {
                ForEach(searchViewModel.searchResults) { city in
                    Button {
                        addCity(city)
                        searchViewModel.searchResults.removeAll()
                    } label: {
                        HStack {
                            Text(city.name)
                                .foregroundStyle(Color(UIColor.label))
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct SelectedCitiesListView: View {
    var selectedCities: [CityData]
    @ObservedObject var searchViewModel: SearchViewModel
    var deleteCity: (CityData) -> Void
    #warning("აქაც იგივე კომენტარი, არაა სტრუქტურა საჭირო და არც მოდელი უნდა იცოდეს ვიუმ")
    var body: some View {
        List {
            ForEach(selectedCities) { city in
                let weather = searchViewModel.weatherData[city.name] ?? {
                    searchViewModel.fetchWeatherData(for: [CoordinateModel(name: city.name, latitude: city.latitude, longitude: city.longitude)])
                    return nil
                }()
                
                SearchLocations(
                    cityName: city.name,
                    currentWeather: weather?.weather.first?.main ?? "Fetching...",
                    temperature: weather != nil ? "\(Int(weather!.main.temp))°" : "Fetching..."
                )
                .listRowSeparator(.hidden)
                .padding(.vertical, -10)
                .swipeActions {
                    if city.name != "Tbilisi" {
                        Button(role: .destructive) {
                            deleteCity(city)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
        }
        .listStyle(.inset)
    }
}

// MARK: - Custom Views
struct SearchLocations: View {
    let cityName: String
    let currentWeather: String
    let temperature: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(ColorHelper.gradientForWeather(currentWeather))
                .shadow(radius: 1)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(cityName)
                        .font(.system(size: 25))
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Text(currentWeather)
                        .font(.system(size: 10))
                }
                .bold()
                
                Spacer()
                
                Text(temperature)
                    .font(.system(size: 53))
            }
            .foregroundStyle(.white)
            .padding()
        }
        .frame(width: 355, height: 75)
        .padding(.vertical, 15)
    }
    
    struct ColorHelper {
        static func gradientForWeather(_ weather: String) -> LinearGradient {
            switch weather {
            case "Clouds":
                return LinearGradient(gradient: Gradient(colors: [Color.gray, Color(hex: "#62788d")]), startPoint: .top, endPoint: .bottom)
            case "Clear":
                return LinearGradient(gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .top, endPoint: .bottom)
            case "Snow":
                return LinearGradient(gradient: Gradient(colors: [Color(hex: "#c4cde5"), Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
            case "Rain":
                return LinearGradient(gradient: Gradient(colors: [Color(hex: "#3c5369"), Color(hex: "#6c8094")]), startPoint: .top, endPoint: .bottom)
            case "Drizzle":
                return LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color(hex: "#6c8094")]), startPoint: .top, endPoint: .bottom)
            case "Thunderstorm":
                return LinearGradient(gradient: Gradient(colors: [Color(hex: "#30639c"), Color(hex: "#273440")]), startPoint: .top, endPoint: .bottom)
            default:
                return LinearGradient(gradient: Gradient(colors: [Color.gray, Color.white]), startPoint: .top, endPoint: .bottom)
            }
        }
    }
}

extension View {
    func barTitle(_ title: String,
                  size: NavigationBarItem.TitleDisplayMode = .large) -> some View {
        self.navigationBarTitle(title, displayMode: size)
    }
}


#warning("ეს სტრუქტურა საერთოდ ზედმეტია ღილაკისთვის")
struct BackButton: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    #warning("რაღა დროს ეს კოდია 2024 წელს?!")
    
    // MARK: - ესაა საჭირო
    @Environment(\.dismiss) var dismiss
    
    var body : some View {
        Button {
//            self.presentationMode.wrappedValue.dismiss()
            dismiss()
        } label: {
            #warning("HStack რას აკეთებს?")
//            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(UIColor.label))
//            }
        }
    }
}

struct Benchmark: Identifiable, Hashable {
    let id = UUID()
    var name: String
}
