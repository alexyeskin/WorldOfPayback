//
//  OnboardingView.swift
//  WorldOfPAYBACK
//
//  Created by Alexander Yeskin on 3.02.24.
//

import ComposableArchitecture
import SwiftUI

struct OnboardingView: View {
    let store: StoreOf<Onboarding>
    
    var body: some View {
        VStack() {
            Spacer()
            
            Image(systemName: "globe.europe.africa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
            
            Text("Welcome to WorldOfPayback")
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding()
            
            Text("Your transactions, your way.")
                .font(.headline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
            
            Button {
                store.send(.onboardingPassed)
            } label: {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .contentShape(Rectangle())
        }
        .navigationTitle("Onboarding")
    }
}
