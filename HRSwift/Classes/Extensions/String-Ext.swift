//
//  String-Ext.swift
//  Pods
//
//  Created by Ryoh Hashimoto on 2017/08/08.
//
//

public extension String {
    
    /// 文字列をDate型に変換する。
    ///
    /// 例:
    /// ```
    /// let strDate1 = "1970-01-01"
    /// let strDate2 = "1970-01-01"
    /// print(strDate1.toDate("yyyy-MM-dd"))
    /// print(strDate2.toDate("yyyyMMdd"))
    /// ```
    /// デバッグコンソール
    /// ```
    /// 1970-01-01 00:00:00 +0000
    /// nil
    /// ```
    ///
    /// - Parameter format: Date型へ変換時のフォーマット
    /// - Returns: フォーマットに準じて変換されたDate型オブジェクト
    func toDate(_ format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
    
    /// 絵文字など(2文字分)も含めた文字数を返す。
    var count: Int {
        let string_NS = self as NSString
        return string_NS.length
    }
    
    /// 正規表現の検索をする。
    ///
    /// - Parameter pattern: 検索する正規表現パターン
    /// - Parameter options: NSRegularExpression options
    /// - Returns: 検索パターンにマッチしたか
    func pregMatch(pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, self.count))
        return matches.count > 0
    }
    
    /// 正規表現の検索結果を利用できる。
    ///
    /// - Parameter pattern: 検索する正規表現パターン
    /// - Parameter options: NSRegularExpression options
    /// - Parameter matches: ヒットした文字列の格納先
    /// - Returns: 検索パターンにマッチしたか
    func pregMatch(pattern: String, options: NSRegularExpression.Options = [], matches: inout [String]) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            return false
        }
        let targetStringRange = NSRange(location: 0, length: self.count)
        let results = regex.matches(in: self, options: [], range: targetStringRange)
        for i in 0 ..< results.count {
            for j in 0 ..< results[i].numberOfRanges {
                let range = results[i].rangeAt(j)
                matches.append((self as NSString).substring(with: range))
            }
        }
        return results.count > 0
    }
    
    /// 正規表現の置換する。
    ///
    /// - Parameter pattern: 検索する正規表現パターン
    /// - Parameter options: NSRegularExpression options
    /// - Returns: 置換結果
    func pregReplac(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        return regex.stringByReplacingMatches(in: self, options: [], range: NSMakeRange(0, self.count), withTemplate: with)
    }

}
