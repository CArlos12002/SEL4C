//
//  CrearCuentaView.swift
//  SEL4C FInalBeta
//
//  Created by Carlos Anaya on 02/10/23.
//

import SwiftUI

struct CrearCuentaView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var age = ""
    @State private var selectedGenderIndex = 0
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isCreateCuentaDosActive = false
    @State private var mostrarAdvertencia = false // Agregamos estado para la advertencia

    // Opciones de género
    let genders = ["Masculino", "Femenino", "Otro", "Prefiero no contestar"]

    var body: some View {
        VStack {
            Image("logo-blue")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .padding(.top, 20)
            // Título "Registro"
            Text("Registro")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)

            VStack {
                // Formulario de creación de usuario
                VStack(spacing: 5) {
                    HStack {
                        TextField("Nombre de usuario", text: $username)
                            .padding()
                            .autocapitalization(.none) // No autocapitalizar
                    }

                    HStack {
                        TextField("Correo electrónico", text: $email)
                            .padding()
                            .autocapitalization(.none) // No autocapitalizar
                    }

                    HStack {
                        Picker("Género", selection: $selectedGenderIndex) {
                            ForEach(0..<genders.count, id: \.self) { index in
                                Text(self.genders[index])
                            }
                        }
                        .pickerStyle(MenuPickerStyle()) // Lista desplegable
                        .padding()

                        TextField("Edad", text: $age)
                            .padding()
                            .keyboardType(.numberPad) // Teclado numérico para la edad
                    }

                    SecureField("Contraseña", text: $password)
                        .padding()

                    SecureField("Repetir contraseña", text: $confirmPassword)
                        .padding()
                        .onChange(of: confirmPassword) { newValue in
                            mostrarAdvertencia = password != newValue
                        }

                    if mostrarAdvertencia {
                        Text("Las contraseñas no coinciden.")
                            .foregroundColor(.red)
                            .padding(.bottom, 20)
                    }

                    // Botón "Continuar" con NavigationLink
                    NavigationLink(destination: CrearCuentaDos(), isActive: $isCreateCuentaDosActive) {
                        Text("Continuar")
                            .foregroundColor(.white)
                            .frame(maxWidth: 110)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(100)
                    }
                    .disabled(!camposCompletos() || mostrarAdvertencia) // Deshabilitar el botón si los campos no están completos o si hay una advertencia
                }

                Spacer()
            }
            .padding()
        }
    }

    // Función para verificar si los campos obligatorios están completos
    func camposCompletos() -> Bool {
        return !username.isEmpty && !email.isEmpty && !age.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
}

struct CrearCuentaView_Previews: PreviewProvider {
    static var previews: some View {
        CrearCuentaView()
    }
}

struct CrearCuentaDos: View {
    @State private var selectedInstitucion = ""
    @State private var selectedGradoAcademico = ""
    @State private var selectedPais = ""
    @State private var selectedEstudios = ""
    
    // Opciones de instituciones, grados académicos y países
    let instituciones = ["Seleccione...","Tecnológico de Monterrey(ITESM)", "Otra"]
    let gradosAcademicos = ["Seleccione... ","Secundaria", "Preparatoria", "Licenciatura", "Maestría", "Doctorado"]
    let paises = [
            "Seleccione...",
            "Afganistán",
            "Albania",
            "Alemania",
            "Andorra",
            "Angola",
            "Antigua y Barbuda",
            "Arabia Saudita",
            "Argelia",
            "Argentina",
            "Armenia",
            "Australia",
            "Austria",
            "Azerbaiyán",
            "Bahamas",
            "Bahréin",
            "Bangladés",
            "Barbados",
            "Bielorrusia",
            "Bélgica",
            "Belice",
            "Benín",
            "Bhután",
            "Bolivia",
            "Bosnia y Herzegovina",
            "Botsuana",
            "Brasil",
            "Brunéi",
            "Bulgaria",
            "Burkina Faso",
            "Burundi",
            "Cabo Verde",
            "Camboya",
            "Camerún",
            "Canadá",
            "Catar",
            "Chad",
            "Chile",
            "China",
            "Chipre",
            "Colombia",
            "Comoras",
            "Corea del Norte",
            "Corea del Sur",
            "Costa de Marfil",
            "Costa Rica",
            "Croacia",
            "Cuba",
            "Dinamarca",
            "Dominica",
            "Ecuador",
            "Egipto",
            "El Salvador",
            "Emiratos Árabes Unidos",
            "Eritrea",
            "Eslovaquia",
            "Eslovenia",
            "España",
            "Estados Unidos",
            "Estonia",
            "Etiopía",
            "Fiyi",
            "Filipinas",
            "Finlandia",
            "Francia",
            "Gabón",
            "Gambia",
            "Georgia",
            "Ghana",
            "Granada",
            "Grecia",
            "Guatemala",
            "Guinea",
            "Guinea Ecuatorial",
            "Guinea-Bisáu",
            "Guyana",
            "Haití",
            "Honduras",
            "Hungría",
            "India",
            "Indonesia",
            "Irak",
            "Irán",
            "Irlanda",
            "Islandia",
            "Islas Marshall",
            "Islas Salomón",
            "Israel",
            "Italia",
            "Jamaica",
            "Japón",
            "Jordania",
            "Kazajistán",
            "Kenia",
            "Kirguistán",
            "Kiribati",
            "Kuwait",
            "Laos",
            "Lesoto",
            "Letonia",
            "Líbano",
            "Liberia",
            "Libia",
            "Liechtenstein",
            "Lituania",
            "Luxemburgo",
            "Macedonia del Norte",
            "Madagascar",
            "Malasia",
            "Malaui",
            "Maldivas",
            "Malí",
            "Malta",
            "Marruecos",
            "Mauricio",
            "Mauritania",
            "México",
            "Micronesia",
            "Moldavia",
            "Mónaco",
            "Mongolia",
            "Montenegro",
            "Mozambique",
            "Namibia",
            "Nauru",
            "Nepal",
            "Nicaragua",
            "Níger",
            "Nigeria",
            "Noruega",
            "Nueva Zelanda",
            "Omán",
            "Países Bajos",
            "Pakistán",
            "Palaos",
            "Panamá",
            "Papúa Nueva Guinea",
            "Paraguay",
            "Perú",
            "Polonia",
            "Portugal",
            "Reino Unido",
            "República Centroafricana",
            "República Checa",
            "República del Congo",
            "República Democrática del Congo",
            "República Dominicana",
            "Ruanda",
            "Rumania",
            "Rusia",
            "Samoa",
            "San Cristóbal y Nieves",
            "San Marino",
            "San Vicente y las Granadinas",
            "Santa Lucía",
            "Santo Tomé y Príncipe",
            "Senegal",
            "Serbia",
            "Seychelles",
            "Sierra Leona",
            "Singapur",
            "Siria",
            "Somalia",
            "Sri Lanka",
            "Suazilandia",
            "Sudáfrica",
            "Sudán",
            "Sudán del Sur",
            "Suecia",
            "Suiza",
            "Surinam",
            "Tailandia",
            "Tanzania",
            "Tayikistán",
            "Timor Oriental",
            "Togo",
            "Tonga",
            "Trinidad y Tobago",
            "Túnez",
            "Turkmenistán",
            "Turquía",
            "Tuvalu",
            "Ucrania",
            "Uganda",
            "Uruguay",
            "Uzbekistán",
            "Vanuatu",
            "Vaticano",
            "Venezuela",
            "Vietnam",
            "Yemen",
            "Yibuti",
            "Zambia",
            "Zimbabue"
        ]
    let carrerasUniversitarias = [
            "Seleccione...",
            "No aplica",
            "Medicina",
            "Ingeniería Civil",
            "Psicología",
            "Derecho",
            "Biología",
            "Arquitectura",
            "Economía",
            "Matemáticas",
            "Ingeniería de Software",
            "Enfermería",
            "Comunicación",
            "Educación",
            "Ciencias Políticas",
            "Historia",
            "Química",
            "Arte y Diseño",
            "Música",
            "Ingeniería Eléctrica",
            "Ciencias Ambientales",
            "Lengua y Literatura",
            "Astronomía",
            "Física",
            "Sociología",
            "Negocios Internacionales",
            "Filosofía",
            "Geología",
            "Periodismo",
            "Ingeniería Mecánica",
            "Ciencias de la Computación",
            "Turismo",
            "Diseño Gráfico",
            "Arqueología",
            "Antropología",
            "Estudios de Género",
            "Ingeniería Química",
            "Marketing",
            "Diseño de Moda",
            "Ingeniería Aeroespacial",
            "Relaciones Internacionales",
            "Geografía",
            "Arte Dramático",
            "Biomedicina",
            "Fotografía",
            "Diseño Industrial",
            "Nutrición y Dietética",
            "Ingeniería Biomédica",
            "Astronáutica",
            "Otra"
        ]

    @State private var isTerminosCondicionesActive = false
    
    var body: some View {
        VStack {
            // Contenido de la vista CrearCuentaDos
            Image("logo-blue")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 120)
                .padding(.top, 10)
            
            Text("Registro")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 40) // Agrega espacio en la parte inferior
            
            // Guía de alineación horizontal
            VStack(alignment: .leading, spacing: 18) { // Aumenta el espaciado vertical
                // Opciones de institución
                Text("Institución")
                    .foregroundColor(.black) // Asegura que el texto sea negro
                Picker("Institución", selection: $selectedInstitucion) {
                    ForEach(instituciones, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                // Opciones de grado académico
                Text("Grado Académico")
                    .foregroundColor(.black) // Asegura que el texto sea negro
                Picker("Grado Académico", selection: $selectedGradoAcademico) {
                    ForEach(gradosAcademicos, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                // Opciones de disciplina
                Text("Disciplina")
                    .foregroundColor(.black) // Asegura que el texto sea negro
                Picker("Disciplina de estudios", selection: $selectedEstudios) {
                    ForEach(carrerasUniversitarias, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                // Opciones de país
                Text("País")
                    .foregroundColor(.black) // Asegura que el texto sea negro
                Picker("País", selection: $selectedPais) {
                    ForEach(paises, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .alignmentGuide(HorizontalAlignment.leading) { dimension in
                dimension[.leading]
            }
            
            // Espacio adicional debajo de las opciones
            Spacer()
            
            // Botón "Continuar" con NavigationLink que lleva a TerminosCondicionesView
            NavigationLink(destination: TerminosCondicionesView(), isActive: $isTerminosCondicionesActive) {
                Text("Continuar")
                    .foregroundColor(.white)
                    .frame(maxWidth: 110)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(100)
            }
            .disabled(!camposCompletos()) // Deshabilitar el botón si los campos no están completos
        }
        .padding()
    }
    
    // Función para verificar si los campos obligatorios están completos
    func camposCompletos() -> Bool {
        return !selectedInstitucion.isEmpty && !selectedGradoAcademico.isEmpty && !selectedPais.isEmpty && !selectedEstudios.isEmpty
    }
}

struct TerminosCondicionesView: View {
    @State private var aceptaTerminos = false
    @State private var isCrearCuentaActive = false
    @State private var mostrarMensaje = false

    var body: some View {
        ScrollView {
            VStack {
                Text("Términos y Condiciones")
                    .font(.title)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                
                Text("""
                                    **Términos y Condiciones de Uso**
                                                         
                                    Estos Términos y Condiciones de Uso (en adelante, "Términos") rigen el uso de la aplicación de aprendizaje (en adelante, la "Aplicación") proporcionada por [Nombre de tu empresa o entidad] (en adelante, el "Proveedor"). Al utilizar la Aplicación, el usuario (en adelante, el "Usuario") acepta los siguientes términos y condiciones:

                                    **1. Uso de la Aplicación**

                                    1.1 La Aplicación se proporciona exclusivamente con fines educativos y de aprendizaje. El Usuario acepta utilizarla de manera responsable y ética.

                                    1.2 El Proveedor se esfuerza por proporcionar información precisa y actualizada en la Aplicación, sin embargo, no garantiza la exactitud, confiabilidad o completitud del contenido. El Usuario asume la responsabilidad de verificar la precisión de la información y no debe tomar decisiones importantes basadas únicamente en la información proporcionada por la Aplicación.

                                    **2. Exención de Responsabilidad**

                                    2.1 El Usuario reconoce y acepta que el uso de la Aplicación es bajo su propio riesgo. El Proveedor no será responsable de ningún daño directo, indirecto, incidental, especial o consecuente que pueda resultar del uso de la Aplicación, incluyendo, pero sin limitarse a, pérdida de datos, interrupción del servicio, o daños a la propiedad.

                                    **3. Propiedad Intelectual**

                                    3.1 Todos los derechos de propiedad intelectual de la Aplicación, incluyendo derechos de autor, marcas registradas y otros derechos de propiedad, son propiedad exclusiva del Proveedor. El Usuario no tiene derecho a copiar, modificar, distribuir, transmitir o utilizar de otra manera ningún contenido de la Aplicación sin el consentimiento expreso del Proveedor.

                                    **4. Privacidad y Datos Personales**

                                    4.1 El Proveedor recopila, almacena y procesa datos personales del Usuario de acuerdo con su Política de Privacidad [enlace a la política de privacidad]. El Usuario debe revisar y aceptar la Política de Privacidad antes de utilizar la Aplicación.

                                    **5. Modificaciones de los Términos**

                                    5.1 El Proveedor se reserva el derecho de modificar estos Términos en cualquier momento y sin previo aviso. Las modificaciones entrarán en vigencia inmediatamente después de su publicación en la Aplicación. Es responsabilidad del Usuario revisar periódicamente los Términos para estar al tanto de las actualizaciones.

                                    **6. Ley Aplicable y Jurisdicción**

                                    6.1 Estos Términos se rigen por las leyes de México. Cualquier disputa relacionada con estos Términos estará sujeta a la jurisdicción exclusiva de los tribunales de México.

                                    **7. Aceptación Obligatoria de los Términos y Condiciones**

                                    7.1 Para utilizar la Aplicación, el Usuario debe aceptar y cumplir estrictamente con estos Términos y Condiciones de Uso. La no aceptación de estos Términos y Condiciones impedirá el acceso y uso de la Aplicación.

                                    Estos Términos y Condiciones de Uso constituyen el acuerdo completo entre el Usuario y el Proveedor con respecto al uso de la Aplicación.

                                    Fecha de la última actualización: [Por definir].
                                    """)
                    .padding()
                    .lineLimit(nil)
                
                Toggle("¿Acepta los Términos y Condiciones?", isOn: $aceptaTerminos)
                    .padding(.top, 20)
                
                if !aceptaTerminos && mostrarMensaje {
                    Text("Para continuar, debe leer y aceptar los Términos y Condiciones.")
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }
                
                Spacer() // Espacio adicional para empujar el botón hacia abajo
                
                NavigationLink(destination: Main(), isActive: $isCrearCuentaActive) {
                    Button(action: {
                        if aceptaTerminos {
                            // Realizar acciones para crear la cuenta aquí
                            isCrearCuentaActive = true // Activa la navegación a Main
                        } else {
                            mostrarMensaje = true
                        }
                    }) {
                        Text("Crear Cuenta")
                            .foregroundColor(.white)
                            .frame(maxWidth: 110) // Ancho máximo
                            .padding()
                            .background(Color.blue) // Color azul
                            .cornerRadius(100) // Esquinas redondeadas
                    }
                    .disabled(!aceptaTerminos) // Deshabilitar el botón si no se aceptan los términos
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true) // OCultaMuestra la flecha de regreso en esta vista
    }
}
