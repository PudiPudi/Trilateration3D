//
//  Trilateration3DTests.swift
//  Trilateration3D_Tests
//
//  Created by Ludovic Marchand on 13/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Foundation
import Trilateration3D

class Trialteration3DTests: QuickSpec {
    override func spec() {
        context("Vector3") {
            
            it("can create default vector3") {
                let vector = Vector3()
                expect(vector.x) == Float()
            }
            
            it("can create custom vector3") {
                let vector = Vector3(x: 2.1, y: 2.2, z: 2.3)
                expect(vector.x) == 2.1
                expect(vector.y) == 2.2
                expect(vector.z) == 2.3
            }
        }
        context("Position") {
            
            it("can create default Position") {
                let pos = Position()
                expect(pos.loc.x) == Float()
            }
            
            it("can create custom Position") {
                let vector = Vector3(x: 2.1, y: 2.2, z: 2.3)
                let pos = Position(location: vector, range: 23.3, name: "Test")
                expect(pos.loc.x) == vector.x
                expect(pos.range) == 23.3
                expect(pos.name) == "Test"
            }
        }
        context("Trialterate") {
            
            it("can Trilaterate 2D") {
                let v1 = Vector3(x: 1, y: 1, z: 0)
                let v2 = Vector3(x: 3, y: 1, z: 0)
                let v3 = Vector3(x: 3, y: 3, z: 0)
                //-
                let pos1 = Position(location: v1, range: 2.82)
                let pos2 = Position(location: v2, range: 2.82)
                let pos3 = Position(location: v3, range: 2.82)
                //-
                if let results = trilaterate(p1: pos1, p2: pos2, p3: pos3, returnMiddle: true) {
                
                    if results.count > 1 {
                        fail("Only one solution expected")
                    }
                    else {
                        let r = results.first!
                        expect(r.x) == Float(2)
                        expect(r.y) == Float(2)
                        expect(r.z) == Float(0)
                    }
                }
                else {
                    fail("Returned \"nil\"")
                }
            }
            
            it("can Trialterate 3D") {
                let v1 = Vector3(x: 0, y: 0, z: 0)
                let v2 = Vector3(x: 4, y: 0, z: 0)
                let v3 = Vector3(x: 4, y: 4, z: 4)
                //-
                let pos1 = Position(location: v1, range: 3.3)
                let pos2 = Position(location: v2, range: 3.3)
                let pos3 = Position(location: v3, range: 3.3)
                //-
                if let results = trilaterate(p1: pos1, p2: pos2, p3: pos3, returnMiddle: true) {
                    
                    if results.count > 1 {
                        fail("Only one solution expected")
                    }
                    else {
                        let r = results.first!
                        expect(r.x) == Float(2)
                        expect(r.y) == Float(2)
                        expect(r.z) == Float(2)
                    }
                }
                else {
                    fail("Returned \"nil\"")
                }
            }
        }
    }
}
