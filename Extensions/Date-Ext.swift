//
//  Date-Ext.swift
//  Pods
//
//  Created by Ryoh Hashimoto on 2017/08/08.
//
//

public extension Date {
    
    /// Date型オブジェクトを文字列に変換する。
    ///
    /// 例:
    /// ```
    /// let date = Date(timeIntervalSince1970: 0.0)
    /// print(date.toString("yyyy-MM-dd HH:mm:ss"))
    /// ```
    /// デバッグコンソール
    /// ```
    /// 1970-01-01 00:00:00
    /// ```
    ///
    /// - Parameter format: 文字列へ変換時のフォーマット
    /// - Returns: フォーマットに準じて変換された文字列
    public func toString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
