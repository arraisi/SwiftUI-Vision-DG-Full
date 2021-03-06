//
//  ListBankAccount.swift
//  Mestika Dashboard
//
//  Created by Prima Jatnika on 23/10/20.
//

import SwiftUI
import PopupView

struct ListBankAccountView: View {
    
    @State private var selectedAccount = 0
    @State private var showDialog = false
    
    var _listBankAccount = [
        BankAccount(id: 1, namaRekening: "Rekening 01", noRekening: "9090123133", saldo: "430.000"),
        BankAccount(id: 2, namaRekening: "Rekening 02", noRekening: "009012033", saldo: "200.000"),
        BankAccount(id: 3, namaRekening: "Rekening 03", noRekening: "900912303", saldo: "0.0")
    ]
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Pilih Rekening")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#232175"))
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("Saldo Aktif :")
                            .font(.caption)
                            .fontWeight(.ultraLight)
                        Text("Rp. 0")
                            .font(.caption)
                            .foregroundColor(Color(hex: "#232175"))
                            .fontWeight(.semibold)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.down")
            }
            .padding()
            .onTapGesture {
//                self.showDialog.toggle()
            }

        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
    
    var modalFloatter: some View {
        VStack {
            
            HStack {
                Text("Pilih Akun")
                    .font(.title3)
                    .fontWeight(.ultraLight)
                
                Spacer()
            }
            
            List {
                ForEach(_listBankAccount) { data in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(data.namaRekening)
                                .font(.subheadline)
                                .foregroundColor(Color(hex: "#232175"))
                                .fontWeight(.bold)
                            
                            HStack {
                                Text("Saldo Aktif :")
                                    .font(.caption)
                                    .fontWeight(.ultraLight)
                                Text("Rp. \(data.saldo)")
                                    .font(. caption)
                                    .foregroundColor(Color(hex: "#232175"))
                                    .fontWeight(.semibold)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
            }
            .background(Color.white)
            .padding(.vertical)
            .frame(height: 150)

        }
        .frame(width: UIScreen.main.bounds.width - 60)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct ListBankAccountView_Previews: PreviewProvider {
    static var previews: some View {
        ListBankAccountView()
    }
}
