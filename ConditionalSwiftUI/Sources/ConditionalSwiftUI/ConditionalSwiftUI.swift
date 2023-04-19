//
//  ConditionalSwiftUI.swift
//  ConditionalViewModifiers
//
//  Created by GrandSir on 19.04.2023.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    /// Applies the given transform `transform` or `else`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    ///   - else: The transform that applies if `condition` is false
    /// - Returns: Either the original `View` or the modified `View` based on the condition`.
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content, @ViewBuilder else: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            `else`(self)
        }
    }
    
    /// Unwraps the given `value` and applies the given `transform`.
    /// - Parameters:
    ///   - value: The value to unwrap.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` with unwrapped `value` if the `value` is not nil`.
    @ViewBuilder
    func ifLet<Value, Content: View>(_ value: Value?, @ViewBuilder transform: (Value, Self) -> Content) -> some View {
        if let value = value {
            transform(value, self)
        } else {
            self
        }
    }
    
    /// Unwraps the given `value` and applies the given `transform`.
    /// - Parameters:
    ///   - value: The value to unwrap.
    ///   - transform: The transform to apply to the source `View`.
    ///   - else:The transform that applies if `value` is nil
    /// - Returns: Either the `else` transform or the modified `View` with unwrapped `value` if the `value` is not nil`.
    @ViewBuilder
    func ifLet<Value, Content: View>(_ value: Value?, @ViewBuilder transform: (Value, Self) -> Content, @ViewBuilder else: (Self) -> Content) -> some View {
        if let value = value {
            transform(value, self)
        } else {
            `else`(self)
        }
    }
    
    /// Applies given transform to the view.
    /// - Parameters:
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Original `View`.
    @ViewBuilder
    func extractView<Content: View>(transform: (Self) -> Content) -> some View {
        transform(self)
    }
}
