//: Playground - noun: a place where people can play

import UIKit

enum DiaDeSemana: String {
    case domingo = "El mejor día"
    case lunes = "dasd"
    case martes
    case miércoles
    case jueves
    case viernes
    case sábado
}

enum SexualidadPersona {
    case sexualidad(Bool)
}


let dia: DiaDeSemana = .martes
let d = SexualidadPersona.sexualidad(true)

print(dia.rawValue)

switch dia {
case .domingo:
    print("qué bien")
default:
    print("ok")
}

typealias saludo = (mensaje: String, destinatario: String)

let tupla = saludo(mensaje: "hola", destinatario: "Franco")
print(tupla.mensaje)

// Optionals & unwrapping
let algo: Int? = 8

if let algo = algo {
    print(algo)
}

if var algo = algo {
    algo = 2
    print(algo)
}

print(algo)

guard let algo = algo else { return }

print(algo)

guard var algo = algo else { return }
algo = 8

print(algo)

