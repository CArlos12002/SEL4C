//
//  SplashScreen.swift
//  SEL4C FInalBeta
//
//  Created by Carlos Anaya on 02/10/23.
//

import SwiftUI
import AVFoundation // Importa AVFoundation

struct SplashScreen: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 1.2
    @State private var opacity: Double = 0.0
    private var audioPlayer: AVAudioPlayer? // Declara una instancia de AVAudioPlayer
    
    init() {
        if let soundURL = Bundle.main.url(forResource: "splash_sound", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            } catch {
                print("Error al cargar el archivo de sonido: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                // Fondo
                Color.white.edgesIgnoringSafeArea(.all)

                // Logo
                Image("logo-blue")
                    .resizable()
                    .frame(width: 200, height: 160)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .offset(y: -100)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.0).delay(0.2)) {
                            self.scale = 1.0
                            self.opacity = 1.0
                        }
                    }

                // Logo TEC
                Image("tec_logo2")
                    .resizable()
                    .frame(width: 150, height: 50)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .offset(y: 100)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2.0).delay(0.6)) {
                            self.scale = 1.0
                            self.opacity = 1.0
                        }
                    }

                // Animación del logo TEC
                Image("tec_logo2")
                    .resizable()
                    .frame(width: 150, height: 50)
                    .scaleEffect(scale)
                    .opacity(opacity)
                    .offset(y: 100)
                    .rotationEffect(.degrees(360))
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2.0).delay(0.6)) {
                            self.scale = 1.0
                            self.opacity = 1.0
                            self.playSound() // Reproduce el sonido
                        }
                    }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.isActive = true
                }
            }
        }
    }
    
    private func playSound() {
        audioPlayer?.play()
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
