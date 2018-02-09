//
//  Trilateration3D.swift
//  Nimble
//
//  Created by Ludovic Marchand on 09/02/2018.
//

import Foundation

struct Vector3 {
    var x: Float = Float()
    var y: Float = Float()
    var z: Float = Float()
    
    func substract(_ v: Vector3) -> Vector3 {
        return Vector3(
            x: self.x - v.x,
            y: self.y - v.y,
            z: self.z - v.z
        )
    }
    
    func add(_ v: Vector3) -> Vector3 {
        return Vector3(
            x: self.x + v.x,
            y: self.y + v.y,
            z: self.z + v.z
        )
    }
    
    func devide(_ devider: Int) -> Vector3 {
        let deviderF = Float(devider)
        return self.devide(deviderF)
    }
    
    func devide(_ devider: Float) -> Vector3 {
        return Vector3(
            x: self.x / devider,
            y: self.y / devider,
            z: self.z / devider
        )
    }
    
    func multiply(_ multiplier: Int) -> Vector3 {
        let multiplierF = Float(multiplier)
        return self.multiply(multiplierF)
    }
    
    func multiply(_ multiplier: Float) -> Vector3 {
        return Vector3(
            x: self.x * multiplier,
            y: self.y * multiplier,
            z: self.z * multiplier
        )
    }
    
    func cross(_ v: Vector3) -> Vector3 {
        return Vector3(
            x: self.y * v.z - self.z * v.y,
            y: self.z * v.x - self.x * v.z,
            z: self.x * v.y - self.y * v.x
        )
    }
}

struct Position {
    var loc: Vector3 = Vector3()
    var range: Float = Float()
    var name: String = String()
}



func trilaterate(p1: Position, p2: Position, p3: Position, returnMiddle: Bool = false) -> [Vector3]? {
    
    // Helping functions
    //  - Trilateeration
    func sqr(_ base: Float) -> Float {
        return base * base
    }
    
    func norm(_ vector: Vector3) -> Float {
        return sqrtf(sqr(vector.x) + sqr(vector.y) + sqr(vector.z))
    }
    
    func dot(a: Vector3, b: Vector3) -> Float {
        return a.x * b.x + a.y * b.y + a.z * b.z
    }
    
    let p1_loc = p1.loc
    let p2_loc = p2.loc
    let p3_loc = p3.loc
    
    let ex = p2_loc.substract(p1_loc).devide(norm(p2_loc.substract(p1_loc)))
    
    let i = dot(a: ex, b: p3_loc.substract(p1_loc))
    var a = p3_loc.substract(p1_loc).substract(ex.multiply(i))
    let ey = a.devide(norm(a))
    let ez = ex.cross(ey)
    let d = norm(p2_loc.substract(p1_loc))
    let j = dot(a: ey, b: p3_loc.substract(p1_loc))
    
    let x = (sqr(p1.range) - sqr(p2.range) + sqr(d)) / (2 * d)
    let y = (sqr(p1.range) - sqr(p3.range) + sqr(i) + sqr(j)) / (2 * j) - (i / j) * x
    
    var b = sqr(p1.range) - sqr(x) - sqr(y)
    
    // floating point math flaw in IEEE 754 standard
    // see https://github.com/gheja/trilateration.js/issues/2
    if abs(b) < 0.0000000001 {
        b = 0;
    }
    
    let z = sqr(b)
    // if no solution found
    if z.isNaN {
        return nil
    }
    
    if z == 0 || returnMiddle {
        a = p1_loc.add(ex.multiply(x).add(ey.multiply(y)))
        return [a]
    }
    else {
        
        let p4a = a.add(ez.multiply(z))
        let p4b = a.substract(ez.multiply(z))
        return [p4a, p4b]
    }
}
