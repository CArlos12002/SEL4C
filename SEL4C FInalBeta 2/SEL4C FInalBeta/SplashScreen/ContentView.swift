//
//  ContentView.swift
//  SEL4C FInalBeta
//
//  Created by Carlos Anaya on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            // Vista principal de la aplicación una vez que el usuario ha iniciado sesión
            Text("¡Bienvenido a la aplicación!")
                .font(.largeTitle)
        } else {
            // Vista de inicio de sesión
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
