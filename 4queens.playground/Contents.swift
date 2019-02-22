import UIKit

//Por Oscar Beltran

var tablero = Array(repeating: Array(repeating: 0 , count: 4), count: 4)

var puntoMarcado:Bool = false
var colum:Int = 0
var posiciones = Array(repeating: 0, count: 4)

var indexFila:Int = 0
var posicion1raFila:Int = 0

func columnOcupada (_ colum1:Int) -> Bool{
    var lleno:Bool = false
    
    for index1 in 0...3 {
        if tablero[index1][colum1] == 1 { lleno = true }
    }
    return lleno
}


func choca (_ fila2:Int, _ column2:Int) -> Bool{
    var chocanAmbos:Bool = false
    
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


func limpiarLineas () -> Void{
    for indexY in 0...3 { for indexX in 0...3 {
        tablero[indexY][indexX] = 0
        } }
}

//Aqui comienza la funcion
while indexFila < 4 {
    print("Fila  \(indexFila)")
    puntoMarcado = false
    while puntoMarcado == false {
        
        print("------------------------------------")
        print("Columna  \(colum)")
        
            if columnOcupada(colum) == false {//te da un error de out of index (el index daba 4)
                
                if choca(indexFila, colum) == false {
                    print("no choca")
                    tablero[indexFila][colum] = 1
                    posiciones[indexFila] = colum
                    puntoMarcado = true
                }
            }
            
            if puntoMarcado == false{
                colum += 1
                
                if colum == 4{
                    
                    limpiarLineas()
                    colum = posicion1raFila + 1
                    //print("Columna ahora vale  \(colum)")
                    indexFila = 0
                }
                
            } else if indexFila == 0 {
                posicion1raFila = colum
                print("primera fila se ubica en  \(posicion1raFila)")
                
        }
        
        
        print(tablero[0])
        print(tablero[1])
        print(tablero[2])
        print(tablero[3])
        
    }
    indexFila += 1
    colum = 0
    //print("Columna ahora vale  \(colum)")
    print("////////////////////////////////////////////////")
    
}


print(tablero[0])
print(tablero[1])
print(tablero[2])
print(tablero[3])



