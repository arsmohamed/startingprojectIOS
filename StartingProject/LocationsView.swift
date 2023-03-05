import SwiftUI

struct LocationsView: View {
    @ObservedObject var myReservationValue = Model()
    @EnvironmentObject var model:Model
  
    var body: some View {
        VStack {
            LittleLemonLogo() // 1
                .padding(.top, 50)
            
            Text(myReservationValue.displayingReservationForm ?
                 "Reservation Details" : "Select a location") // 2
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            
            NavigationView {
                NavigationLink(destination: ReservationForm(Reservation().restaurant)){
                    List {
                        ForEach(myReservationValue.restaurants, id: \.self ) { e in
                            RestaurantView(e)
                        }
                    }
                }
            }// 3
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

