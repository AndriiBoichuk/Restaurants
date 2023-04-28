//
//  CustomTextField.swift
//  RestaurantsApp
//
//  Created by Andrii Boichuk on 26.04.2023.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let onSubmit: () -> Void
    
    var body: some View {
        HStack {
            TextField("", text: $text)
                .font(.restHeadline)
                .foregroundColor(.greyPrimary)
                .onSubmit(onSubmit)
                .placeholder(when: text.isEmpty) {
                    Text(Localizable.textFieldPlaceholder())
                        .font(.restSubhead)
                        .foregroundColor(.greySecondary)
                }
            Button {
                onSubmit()
            } label: {
                Image.iconSearch
                    .resizable()
                    .scaledToFit()
                    .frame(height: Const.Height.searchIcon)
            }
        }
        .padding(.horizontal, Const.Padding.mainHorizontal)
        .padding(.vertical, Constants.Padding.small)
        .background(Color.white)
        .cornerRadius(Const.cornerRadius)
        .shadow(color: .black.opacity(Const.Shadow.opacity),
                radius: Const.Shadow.radius,
                x: .zero,
                y: Const.Shadow.yOffset)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("fdv"), onSubmit: {})
    }
}

extension CustomTextField {
    struct Const {
        static let cornerRadius: CGFloat = 16
        
        struct Shadow {
            static let opacity: CGFloat = 0.05
            static let radius: CGFloat = 14
            static let yOffset: CGFloat = 6
        }
        
        struct Height {
            static let searchIcon: CGFloat = 24
        }
        
        struct Padding {
            static let mainHorizontal: CGFloat = 12
        }
    }
}
