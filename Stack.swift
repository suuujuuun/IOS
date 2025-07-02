//
//  Stack.swift
//  DemoProject
//
//  Created by Kyle Lee on 7/2/25.
//

//Alignment guide


import SwiftUI

struct Stack : View {
    
    var body : some View {
        
        VStack(alignment: .trailing){
            Text("this is some text")
            Text("This is some longer text")
            Text("This is short")
        }
        
        HStack(alignment: .lastTextBaseline, spacing: 20){
            Text("This is some text")
                .font(.largeTitle)
            Text("This is some longer text")
                .font(.body)
            Text("This is short")
                .font(.headline)
        }
        
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color.green)
                .frame(width:120,height:50)
            Rectangle()
                .foregroundColor(Color.red)
                .alignmentGuide(.leading, computeValue: {d in d.width/3})
                .frame(width:200,height:50)
            Rectangle()
                .foregroundColor(Color.blue)
                .frame(width:180,height:50)
            
        }
        
        
        HStack(alignment: .center, spacing: 20){
            
            Circle()
                .foregroundColor(Color.purple)
                .frame(width: 100,height: 100)
            
            VStack(alignment: .center){
                Rectangle()
                    .foregroundColor(Color.green)
                    .frame(width:50,height: 200)
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width:50,height: 200)
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width:50,height: 200)
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(width:50,height: 200)
            }
        }
        
        
    }
}

struct Stack_Previews: PreviewProvider {
    static var previews: some View {
        Stack()
    }
}







