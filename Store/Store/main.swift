//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
   var name: String{get}
   func price() -> Int
}

class Item: SKU {
   let name:String
   let priceEach: Int
   
   init(name: String, priceEach: Int) {
       self.name = name
       self.priceEach = priceEach
   }
   
   func price() -> Int {
       return priceEach
   }
}

class Receipt {
   var ItemEntries: [SKU] = []
   
   func addItem(_ item: SKU) {
       ItemEntries.append(item)
   }
   
   func total() -> Int {
       var total = 0
       for item in ItemEntries {
           total += item.price()
       }
       return total
   }
   
   func output() -> String {
       var print = "Receipt:\n"
       for item in ItemEntries {
           let dollars = Double(item.price()) / 100
           print += "\(item.name): $\(String(format: "%.2f", dollars))\n"
       }
       print += "------------------\n"
       print += "TOTAL: $\(String(format: "%.2f", Double(total()) / 100))"
       return print
   }
   
}

class Register {
   var currentReceipt = Receipt()

   func scan(_ item: SKU) {
       currentReceipt.addItem(item)
   }

   func subtotal() -> Int {
       return currentReceipt.total()
   }

   func total() -> Receipt {
       let finishedReceipt = currentReceipt
       currentReceipt = Receipt() //Ring up total and then resets receipt for next customer.
       return finishedReceipt
   }
}

class Store {
   let version = "0.1"
   func helloWorld() -> String {
       return "Hello world"
   }
}

