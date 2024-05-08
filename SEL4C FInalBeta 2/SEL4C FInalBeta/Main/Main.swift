//
//  Main.swift
//  SEL4C FInalBeta
//
//  Created by Carlos Anaya on 03/10/23.
//

import SwiftUI
import UIKit
import MessageUI

// MARK: - Model

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    @State private var size = 0.8
    @State private var isPasswordSaved = false
    @State private var isCreateAccountActive = false
    @State private var isMainActive = false // Agregamos estado para controlar la navegación a Main
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Image("logo-blue")
                    .resizable()
                    .frame(width: 280, height: 180)
                    .scaleEffect(size)
                    .padding(.bottom, 90)

                VStack(spacing: 25) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.gray)

                        TextField("Correo de usuario", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                    }
                    .padding(.horizontal)

                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)

                        SecureField("Contraseña", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal)

                    Toggle(isOn: $isPasswordSaved) {
                        Text("¿Guardar contraseña?")
                    }
                    .padding(.horizontal)

                    Spacer()

                    // Botón "Iniciar sesión" que navega a Main
                    NavigationLink(
                        destination: Main(),
                        isActive: $isMainActive,
                        label: {
                            Text("Iniciar sesión")
                                .foregroundColor(.white)
                                .frame(maxWidth: 110)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(100)
                                .navigationBarBackButtonHidden(true)
                        }
                    )
                    .navigationBarBackButtonHidden(true) // Oculta la flecha para regresar en esta vista

                    HStack {
                        Text("¿Eres nuevo?")

                        // Botón "Crear cuenta" que navega a CrearCuentaView
                        NavigationLink(
                            destination: CrearCuentaView(),
                            isActive: $isCreateAccountActive,
                            label: {
                                Text("Crear cuenta")
                                    .foregroundColor(.blue)
                            }
                        )
                    }
                }
                .padding()
            }
            .navigationBarTitle("", displayMode: .inline)
        }
        .navigationBarBackButtonHidden(true) // Oculta la flecha para regresar en esta vista
    }
}

// Vistas individuales para cada nivel:

struct IView: View {
    var body: some View {
        Text("Inicio View")
    }
}

struct PView: View {
    var body: some View {
        Text("1 View")
    }
}

struct SView: View {
    var body: some View {
        Text("2 View")
    }
}

struct TView: View {
    var body: some View {
        Text("3 View")
    }
}

struct CView: View {
    var body: some View {
        Text("4 View")
    }
}

struct FView: View {
    var body: some View {
        Text("Final View")
    }
}

// Tu vista principal (Main):

struct Main: View {
    
    @State private var currentView: String = "Main"
    @State private var isActiveArrow = false
    @State private var isActivePerson = false
    @State private var isActiveQuestion = false
    
    let navyBlue = Color(red: 0/255, green: 0/255, blue: 128/255)
    
    var body: some View {
        ZStack {
            
            // Contenido principal
            VStack(spacing: 10) {
                
                Image("menu_top2 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, -65)
                
                Text("Tu Aprendizaje")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .cornerRadius(5)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        ForEach(0..<6) { index in
                            NavigationLink(destination: getViewFor(index: index)) {
                                HStack {
                                    if index % 2 == 0 {
                                        Spacer()
                                    }
                                    Text(getTextFor(index: index))
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 120)
                                        .background(navyBlue)
                                        .clipShape(Circle())
                                        .shadow(color: .gray, radius: 10, x: 0, y: 5)
                                    if index % 2 != 0 {
                                        Spacer()
                                    }
                                }
                            }
                        }
                        Color.clear.frame(height: 50) // Nivel Ocho
                    }
                }
                .padding(.horizontal)

                Spacer()
                
            }

            // Botones en la parte inferior
            VStack {
                Spacer()
                ZStack {
                    Image("bar_bottom")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width, height: 760)
                        .padding(.bottom, 10)

                    HStack(spacing: UIScreen.main.bounds.width / 4.0) {
                        NavigationLink(destination: PersonView(), isActive: $isActivePerson) {
                            Image(systemName: "person.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }

                        NavigationLink(destination: Main(), isActive: $isActiveArrow) {
                            Image(systemName: "house.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }

                        NavigationLink(destination: QuestionsView(), isActive: $isActiveQuestion) {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .offset(y: 365)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func getTextFor(index: Int) -> String {
        switch index {
        case 0: return "Inicio"
        case 1: return "1"
        case 2: return "2"
        case 3: return "3"
        case 4: return "4"
        case 5: return "Final"
        default: return ""
        }
    }
    
    func getViewFor(index: Int) -> some View {
        switch index {
        case 0: return AnyView(IView())
        case 1: return AnyView(PView())
        case 2: return AnyView(SView())
        case 3: return AnyView(TView())
        case 4: return AnyView(CView())
        case 5: return AnyView(FView())
        default: return AnyView(EmptyView())
        }
    }
}


struct PersonView: View {
    // Datos de perfil ficticios, reemplázalos con tus datos reales.
    let userName = "Carlos Anaya"
    let userEmail = "a01662464@tec.mx"
    
    @State private var showChangePassword = false
    @State private var scaleEffect: CGFloat = 1.0
    @State private var showLogoutAnimation: Bool = true
    @State private var isLoginViewActive = false
    @State private var isLoggedIn: Bool = true
    
    var body: some View {
        VStack {
            
            // Imagen superior
            Image("menu_top2 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, -90)
            
            Spacer()
            
            
            // Icono de perfil
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
                .shadow(radius: 10)
                .scaleEffect(scaleEffect)
            
            // Datos de usuario
            VStack(spacing: 15) {
                Text("Nombre: \(userName)")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Correo: \(userEmail)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 20)
            
            Spacer()
            
            // Botón de cambiar contraseña
            Button(action: {
                withAnimation {
                    showChangePassword.toggle()
                    scaleEffect = showChangePassword ? 0.95 : 1.0
                }
            }) {
                Text("Cambiar contraseña")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .padding(.bottom, 20)
            
            // Botón de logout
            NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn)) {
                Text("Logout")
                    .font(.headline)
                    .foregroundColor(showLogoutAnimation ? Color.white.opacity(0.7) : .white)
                    .padding(.horizontal, 60)
                    .padding(.vertical, 12)
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            Spacer()
            
        }
        .padding(.top, 20)
        .navigationBarBackButtonHidden(true)
    }
}
struct QuestionsView: View {
    // Estados para manejar la apertura de las preguntas
    @State private var isExpanded: [Bool] = Array(repeating: false, count: 10)
    
    // Preguntas y respuestas personalizadas
    let faqs: [(question: String, answer: String)] = [
        ("¿Qué es SwiftUI?", "SwiftUI es un framework de UI declarativo moderno para construir interfaces de usuario de manera nativa en todos los dispositivos Apple."),
        ("¿Cómo puedo empezar a aprender Swift?", "Existen muchos recursos en línea, incluido el sitio oficial de Apple y tutoriales interactivos como Swift Playgrounds."),
        ("¿Swift es solo para desarrollo iOS?", "No, Swift es un lenguaje de programación versátil que se puede usar no solo para iOS, sino también para macOS, watchOS, tvOS y desarrollo de servidor."),
        ("¿Qué es un modifier en SwiftUI?", "Un modifier en SwiftUI es una función que se utiliza para cambiar o personalizar un view de una manera específica."),
        ("¿Cómo manejo el estado en SwiftUI?", "Puedes utilizar propiedades `@State`, `@Binding`, `@ObservedObject`, y `@EnvironmentObject` para manejar diferentes tipos de estado en SwiftUI."),
        ("¿SwiftUI reemplaza a UIKit?", "No necesariamente. SwiftUI es una alternativa moderna a UIKit, pero ambos pueden coexistir. Puedes integrar SwiftUI en proyectos UIKit y viceversa."),
        ("¿Qué es Combine en Swift?", "Combine es un framework que proporciona una solución declarativa de Swift para procesar valores con el tiempo, ideal para operaciones asíncronas."),
        ("¿Cómo comparo SwiftUI con otros frameworks?", "SwiftUI es declarativo y altamente integrado con el ecosistema de Apple. Ofrece ventajas como el live preview y un enfoque unificado para todos los dispositivos Apple."),
        ("¿Qué versión de Swift necesito para usar SwiftUI?", "Necesitas Swift 5.1 o posterior para usar SwiftUI."),
        ("¿Puedo usar SwiftUI en versiones anteriores de iOS?", "SwiftUI requiere iOS 13 o posterior, macOS 10.15 o posterior, tvOS 13 o posterior y watchOS 6 o posterior.")
    ]
    
    var body: some View {
        VStack(spacing: 0) { // Espaciado 0 para asegurar que no haya espacios innecesarios
            Image("menu_top2 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, -100)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Preguntas frecuentes")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    ForEach(faqs.indices, id: \.self) { index in
                        DisclosureGroup(
                            isExpanded: $isExpanded[index],
                            content: {
                                Text(faqs[index].answer)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                            },
                            label: {
                                HStack {
                                    Text(faqs[index].question)
                                        .fontWeight(.medium)
                                    Spacer()
                                    Image(systemName: isExpanded[index] ? "chevron.up" : "chevron.down")
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.2)))
                            })
                            .accentColor(Color.black) // Cambiar el color del ícono de despliegue
                    }

                    Text("¿Haz presentado algun problema?")
                        .font(.headline)
                        .padding(.top, 20)

                    NavigationLink(destination: ReportView()) {
                        Text("Reportar problema")
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .padding()
            }
        }
    }
}


struct MailView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = context.coordinator
        mail.setToRecipients(["a01662464@tec.mx"])
        mail.setSubject("Problemas con SEL4C")
        return mail
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailView>) {

    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        let parent: MailView

        init(_ parent: MailView) {
            self.parent = parent
        }

        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
}

struct ReportView: View {
    var body: some View {
        MailView()
    }
}


struct LevelView: View {
    var level: Int
    
    var body: some View {
        VStack {
            Text("Bienvenido al Nivel \(level)")
                .font(.title)
                .padding()
            
            Spacer()
            
            Text("Contenido del Nivel \(level)")
                .padding()
            
            Spacer()
            
            Button("Volver al menú principal") {
                // Aquí puedes gestionar cómo quieres que se vuelva al menú principal
                // Por ejemplo, podrías cambiar el estado de una variable @Binding para controlar la navegación
            }
            .padding()
        }
    }
}


@main
struct LevelApps: App {
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
