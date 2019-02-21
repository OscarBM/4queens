import UIKit

var str = "Hello, playground"


//Por Oscar Beltran

var tablero = Array(repeating: Array(repeating: 0 , count: 4), count: 4)
//print(tablero[0][0])

var puntoMarcado:Bool = false
var colum:Int = 0
var posiciones = Array(repeating: 0, count: 4)
//tablero[0][1] = 1
//print(tablero[3][3])




func columnOcupada (_ colum1:Int) -> Bool{
    var lleno:Bool = false
    
    for index1 in 0...3 {
        if tablero[index1][colum1] == 1 { lleno = true }
    }
    return lleno
}


func choca (_ fila2:Int, _ column2:Int) -> Bool{
    var chocanAmbos:Bool = false
    var dif:Int = fila2 - column2
    
    var filasMovidas:Int = 0
    var columnasMovidas:Int = 0
    
    if dif < 0 { columnasMovidas += column2 }
    else if dif > 0 { filasMovidas += fila2 }
    
    
    //superior derecha
    for indexZ1 in 1...3{
        if fila2-indexZ1 > -1 { if column2-indexZ1 > -1{
            if tablero[fila2-indexZ1][column2-indexZ1] == 1 {chocanAmbos = true}
            } }
    }
    
    //superior izquierda
    for indexZ1 in 1...3{
        if fila2-indexZ1 > -1 { if column2+indexZ1 < 4{
            if tablero[fila2-indexZ1][column2+indexZ1] == 1 {chocanAmbos = true}
            } }
    }
    
    //inferior izquierda
    for indexZ1 in 1...3{
        if fila2+indexZ1 < 4 { if column2+indexZ1 < 4{
            if tablero[fila2+indexZ1][column2+indexZ1] == 1 {chocanAmbos = true}
            } }
    }
    
    //inferior derecha
    for indexZ1 in 1...3{
        if fila2+indexZ1 < 4 { if column2-indexZ1 > -1{
            if tablero[fila2+indexZ1][column2-indexZ1] == 1 {chocanAmbos = true}
            } }
    }
    return chocanAmbos
}


func limpiarLineas (_ fila1:Int) -> Int{
    var filaIndex3:Int = fila1
    var columnIndex3:Int = 0
    var lleno:Bool = true
    /*print("filaInedex3  \(filaIndex3)")
    print("columnInedex3  \(columnIndex3)")*/
    while lleno == true{
        
        columnIndex3 = posiciones[filaIndex3]
        tablero[filaIndex3][columnIndex3] = 0
        columnIndex3 += 1
        
        print("filaInedex3  \(filaIndex3)")
        print("columnInedex3  \(columnIndex3)")
        
        if columnIndex3 < 4 {
            lleno = false
            
            print("lleno  \(lleno)")
            
        } else {
            
            filaIndex3 -= 1
            
            print("filaInedex3 no lleno. \(filaIndex3)")
            if filaIndex3 < 0 {
                filaIndex3 = 0
                columnIndex3 = 0
                
                
                
                print("filaInedex3 reiniciado  \(filaIndex3)")
                print("columnInedex3 reiniciado \(columnIndex3)")
                
            }
            
        }
    }
    print("nuevo filaInedex3 \(filaIndex3)")
    return filaIndex3
}



var indexFila:Int = 0



while indexFila < 4 {
    print("Fila  \(indexFila)")
    //print("///////////////////////////////////////////////")
    puntoMarcado = false
    //print("Columna actual  \(colum)")
    while colum < 4 {
        
        print(" ------------------------------------")
        print("Columna  \(colum)")
        if colum < 4 {
            
            if columnOcupada(colum) == false {//te da un error de out of index (el index daba 4)
                
                if choca(indexFila, colum) == false {
                    print("no choca")
                    tablero[indexFila][colum] = 1
                    posiciones[indexFila] = colum
                    puntoMarcado = true
                    colum = 4
                }
            }
            
            if puntoMarcado == false{
                colum += 1
                
                if colum == 4{
                    indexFila -= 1
                    //aqui va funcion limpiar filas
                    indexFila = limpiarLineas(indexFila)
                    print("Index actual despues de borrar  \(indexFila)")
                    //colum = 0
                } //else { indexFila += 1 }
                
            }// else {indexFila += 1}
        }
        
        print(tablero[0])
        print(tablero[1])
        print(tablero[2])
        print(tablero[3])
        
    }
    indexFila += 1//no agarra cuando limpiarFilas disminuye el indexFila. Quizas sea por esto
    colum = 0
    print("Columna ahora vale  \(colum)")
    print("////////////////////////////////////////////////")
    
}


print(tablero[0])
print(tablero[1])
print(tablero[2])
print(tablero[3])
