//
//  FormNewPinAtmView.swift
//  Mestika Dashboard
//
//  Created by Abdul R. Arraisi on 11/11/20.
//

import SwiftUI

struct FormNewPinAtmView: View {
    
    @State private var passwordCtrl = ""
    @State private var confirmPasswordCtrl = ""
    
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    
    /* Boolean for Show Modal */
    @State var showingModal = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("MASUKKAN PIN ATM \nBARU ANDA")
                    .font(.custom("Montserrat-SemiBold", size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: "#2334D0"))
                
                Text("Silahkan masukkan PIN ATM baru Anda")
                    .font(.custom("Montserrat-Regular", size: 12))
                    .foregroundColor(Color(hex: "#002251"))
                    .padding(.top, 5)
                
                VStack {
                    VStack {
                        HStack {
                            if (showPassword) {
                                TextField("PIN baru Anda", text: self.$passwordCtrl)
                                    .font(.custom("Montserrat-Light", size: 14))
                            } else {
                                SecureField("PIN baru Anda", text: self.$passwordCtrl)
                                    .font(.custom("Montserrat-Light", size: 14))
                            }
                            
                            Button(action: {
                                self.showPassword.toggle()
                            }, label: {
                                Text("show")
                                    .foregroundColor(Color(hex: "#3756DF"))
                                    .font(.custom("Montserrat-Light", size: 10))
                            })
                        }
                        .frame(height: 25)
                        .padding(.vertical, 10)
                        
                        Divider()
                        
                        HStack {
                            if (showConfirmPassword) {
                                TextField("Confirm PIN", text: self.$confirmPasswordCtrl)
                                    .font(.custom("Montserrat-Light", size: 14))
                            } else {
                                SecureField("Confirm PIN", text: self.$confirmPasswordCtrl)
                                    .font(.custom("Montserrat-Light", size: 14))
                            }
                            
                            Button(action: {
                                self.showConfirmPassword.toggle()
                            }, label: {
                                Text("show")
                                    .foregroundColor(Color(hex: "#3756DF"))
                                    .font(.custom("Montserrat-Light", size: 10))
                            })
                        }
                        .frame(height: 25)
                        .padding(.vertical, 10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color(hex: "#3756DF").opacity(0.2), radius: 15, x: 0.0, y: 15.0)
                }
                .padding()
                
                Spacer()
                
                VStack {
                    NavigationLink(destination: OtpChangePinAtmView(nextView: AnyView(FormNewPinAtmView(showingModal: true))), label: {
                        Text("Simpan PIN Transaksi Baru")
                            .foregroundColor(.white)
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                        
                    })
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                }
                .padding(.bottom, 20)
                
            }
            .padding(.top, 60)
            .navigationBarTitle("Reset PIN Transaksi", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {}, label: {
                Text("Cancel")
            }))
            
            // Background Color When Modal Showing
            if self.showingModal {
                ModalOverlay(tapAction: { withAnimation { self.showingModal = false } })
                    .edgesIgnoringSafeArea(.all)
            }
            
        }
        .popup(isPresented: $showingModal, type: .floater(verticalPadding: 60), position: .bottom, animation: Animation.spring(), closeOnTap: false, closeOnTapOutside: false) {
            createBottomFloater()
        }
    }
    
    // MARK: - BOTTOM FLOATER FOR MESSAGE
    func createBottomFloater() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image("ic_check")
                    .resizable()
                    .frame(width: 80, height: 80)
                Spacer()
            }
            .padding(.top, 10)
            
            HStack {
                
                Text("PIN Transaksi Baru Telah Berhasil di Simpan.")
                    .font(.custom("Montserrat-Bold", size: 18))
                    .foregroundColor(Color(hex: "#2334D0"))
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .padding(.top, 25)
            
            NavigationLink(destination: BottomNavigationView()) {
                Text("KEMBALI")
                    .font(.custom("Montserrat-SemiBold", size: 12))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                
            }
            .background(Color(hex: "#2334D0"))
            .cornerRadius(12)
            .padding(.top, 15)
        }
        .padding(25)
        .frame(width: UIScreen.main.bounds.width - 60)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct FormNewPinAtmView_Previews: PreviewProvider {
    static var previews: some View {
        FormNewPinAtmView()
    }
}
