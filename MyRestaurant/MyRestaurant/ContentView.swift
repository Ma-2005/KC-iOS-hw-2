//
//  ContentView.swift
//  MyRestaurant
//
//  Created by Mac on 12/08/2022.
//

//1- إضافة textField لمعرفة الكمية المطلوبة و المبلغ الذي لديك.

//2- إضافة onTapGesture لمعرفة الفاتورة .

//3- عمل كود داخل onTapGesture لحساب العمليات الحسابية ، حيث يجب معرفة الحساب مع كمية الطلبات ، ثم مقارنته بالمبلغ الذي لديك باستخدام if statement ، واذا كان المبلغ الذي لديك اقل من المجموع الكلي فيجب اظهار رسالة "اسفل المبلغ الإجمالي" بأن المبلغ غير كافي ، أما إذا كان المجموع مساوي او اكثر من المبلغ الذي لديك فيجب اظهار رسالة "اسفل المبلغ الإجمالي" بأن العملية تمت.

//1. إضافة stepper بدلاً عن textField في خانة الكمية.

//2. إضافة رسالة "اسفل المبلغ الإجمالي" في حال عدم ادخال المبلغ الذي لديك، بأنه يجب ادخال المبلغ أولاً.



import SwiftUI

struct ContentView: View {
    
    @State var p1 = 2.000
    @State var p2 = 2.000
    @State var p3 = 0.750
    @State var p4 = 0.500
    @State var p5 = 1.000
    
    @State var urm = ""
    
    @State var s1 = 0
    @State var s2 = 0
    @State var s3 = 0
    @State var s4 = 0
    @State var s5 = 0
    
    @State var result = 0.0
    @State var myresult = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
            
            VStack{
                VStack{
                    HStack{
                        Image(systemName: "list.dash")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .background(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        
                        Spacer()
                        
                        Text("Phoenix Station")
                            .font(.custom("Amiri-BoldItalic", size: 38))
                            .foregroundColor(.black)
                            .shadow(color: .gray , radius: 3)
                            .frame(width: 255, height: 65)
                            .background(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        
                        Spacer()
                        
                        Image(systemName: "play.fill")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .background(.white.opacity(0.5))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        
                    }
                    .padding()
                    Spacer()
                        
                        Image("phoenix")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160, height: 160)
                            .background(.white.opacity(0.6))
                            .clipShape(RoundedRectangle(cornerRadius: 45, style: .continuous))
                        Spacer()
                    
                    VStack{
                        ScrollView{
                        HStack{
                            Text("Chicken")
                            
                            Spacer()
                            
                            Stepper( "         2.00 kd", value: $s1, in: 0...100)
                            
                            Text("\(s1)")
                            
                            Spacer()
                        }
                        .font(.custom("Amiri-BoldItalic", size: 23))
                        .foregroundColor(.black)
                        
                        HStack{
                            Text("Meat")
                            
                            
                            Stepper( "             2.00 kd", value: $s2, in: 0...100)
                            
                            Text("\(s2)")
                            
                            Spacer()
                        }
                        .font(.custom("Amiri-BoldItalic", size: 23))
                        .foregroundColor(.black)
                        
                        
                        HStack{
                            Text("Fruot")
                            
                            
                            Spacer()
                            Stepper( "            0.75 kd", value: $s3, in: 0...100)
                            
                            Text("\(s3)")

                        }
                        .font(.custom("Amiri-BoldItalic", size: 23))
                        .foregroundColor(.black)
                        
                        HStack{
                            Text("Juice")
                            
                            Spacer()
                            
                            Stepper( "             0.50 kd", value: $s4, in: 0...100)
                            
                            Text("\(s4)")
                            
                            Spacer()
                        }
                        .font(.custom("Amiri-BoldItalic", size: 23))
                        .foregroundColor(.black)
                        
                        HStack{
                            Text("Ice Cream")
                            
                            Stepper( "     1.00 kd", value: $s5, in: 0...100)
                            
                            Text("\(s5)")
                            
                            Spacer()
                        }
                        .font(.custom("Amiri-BoldItalic", size: 23))
                        .foregroundColor(.black)
                        
                        Spacer()
                        }
                    .padding()
                    .background(.white.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 45, style: .continuous))
                Spacer()
                        
                    VStack(spacing: 16){
                        HStack{
                            Text("Your money :")
                                .font(.custom("Amiri-BoldItalic", size: 35))
                                .foregroundColor(.black)
                                .shadow(color: .gray , radius: 3)
                            
                            
                            TextField("   amount", text: $urm )
                                .frame(width: 100, height: 50)
                                .textFieldStyle(.roundedBorder)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .keyboardType(.numberPad)
                        }
                        
                        Button {
                            M1()
                            
                        } label: {
                            Text("Show The Bill")
                                .font(.custom("Amiri-BoldItalic", size: 30))
                                .foregroundColor(.white)
                                .shadow(color: Color(red: 0.995, green: 0.355, blue: 0.122) , radius: 5)
                                .padding()
                                .background(.black)
                                .cornerRadius(15)
                        }
                        
                        Text("\(result)")
                            .font(.custom("Amiri-BoldItalic", size: 35))
                            .foregroundColor(.black)
                            .shadow(color: .gray , radius: 3)
                        
                        Spacer()
                        
                        Text(myresult)
                            .font(.custom("Amiri-BoldItalic", size: 25))
                            .foregroundColor(.black)
                            .shadow(color: .gray , radius: 3)
                        Spacer()
                    }
                    }
                }
            } .padding()
        }
    }
    func M1(){
        result = (p1 * Double(s1) ?? 0.0) + (p2 * Double(s2) ?? 0.0) + (p3 *  Double(s3) ?? 0.0) + (p4 *  Double(s4) ?? 0.0) + (p5 *  Double(s5) ?? 0.0)
        
        if urm.isEmpty
        {
            myresult = "Enter the amount"
        }
        else if result >= Double(urm) ?? 0.0
        {
            myresult = "The amount is not enough"
        }
        else if result <= Double(urm) ?? 0.0
        {
            myresult = "operation accomplished successfully"
        }
        else
        {
            myresult = "Enter the amount"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
