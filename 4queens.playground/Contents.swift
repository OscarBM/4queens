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





var indexFila:Int = 0



while indexFila < 4 {
    puntoMarcado = false
    while puntoMarcado == false {
        
        if columnOcupada(colum) == false {
            if choca(indexFila, colum) == false {
                tablero[indexFila][colum] = 1
                posiciones[indexFila] = colum
                puntoMarcado = true
            }
        }
        
        if puntoMarcado == false{
            colum += 1
            
            if colum == 4{
                indexFila -= 1
                
            }
            
        }
        
        
    }
    indexFila += 1
    
}



