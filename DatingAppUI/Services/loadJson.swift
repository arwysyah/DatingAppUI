//
//  loadJson.swift
//  DatingAppUI
//
//  Created by Arwy Syahputra Siregar on 25/09/25.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("❌ Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("❌ Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch let DecodingError.keyNotFound(key, context) {
            fatalError("❌ Missing key '\(key.stringValue)' in \(file): \(context.debugDescription)")
        } catch let DecodingError.typeMismatch(type, context) {
            fatalError("❌ Type mismatch for type \(type) in \(file): \(context.debugDescription)")
        } catch let DecodingError.valueNotFound(value, context) {
            fatalError("❌ Value '\(value)' not found in \(file): \(context.debugDescription)")
        } catch let DecodingError.dataCorrupted(context) {
            fatalError("❌ Data corrupted in \(file): \(context.debugDescription)")
        } catch {
            fatalError("❌ Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}

