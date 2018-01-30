//
//  HRDEBUG.swift
//  Pods
//
//  Created by Ryoh Hashimoto on 2017/08/08.
//
//

public class HRDEBUG {
    
    /// デバッグビルド時のみ、ログ出力を行います。
    /// Xcodeでプロジェクト作成時に自動で登録される `DEBUG` マクロフラグが存在する場合のみ、ログ出力を行います。
    ///
    /// - Parameters:
    ///   - item: ログ出力対象
    ///   - file: ログ出力を行ったコードのファイル名。通常使用しません。
    ///   - function: ログ出力を行ったコードの関数名。通常使用しません。
    ///   - line: ログ出力を行ったコードの行番号。通常使用しません。
    public class func LOG(_ item: Any, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
            if let filename = file.components(separatedBy: "/").last {
                print("[\(filename).\(function):\(line)] \(item)")
            }
        #endif
    }
    
    /// デバッグビルド時のみ、プログラムを停止します。
    /// Xcodeでプロジェクト作成時に自動で登録される `DEBUG` マクロフラグが存在する場合のみ、プログラムを停止します。
    ///
    /// 別途 `ASSERT` メソッドも用意されています。次のような記述をしてはいけません。
    ///
    /// 悪い例:
    /// ```
    /// if error {
    ///     HRDEBUG.ERROR("ERROR")
    /// }
    /// ```
    ///
    /// 良い例:
    /// ```
    /// HRDEBUG.ASSERT(!error, "ERROR")
    /// ```
    ///
    /// - Parameters:
    ///   - item: ログ出力対象
    ///   - file: ログ出力を行ったコードのファイル名。通常使用しません。
    ///   - function: ログ出力を行ったコードの関数名。通常使用しません。
    ///   - line: ログ出力を行ったコードの行番号。通常使用しません。
    public class func ERROR(_ item: Any, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
            HRDEBUG.LOG(item, file: file, function: function, line: line)
            abort()
        #endif
    }
    
    /// デバッグビルド時のみ、アサーションを行います。
    /// Xcodeでプロジェクト作成時に自動で登録される `DEBUG` マクロフラグが存在する場合のみ、アサーションを行い、条件を満たさなかった場合プログラムを停止します。
    ///
    /// - Parameters:
    ///   - condition: アサーション対象
    ///   - item: ログ出力対象
    ///   - file: ログ出力を行ったコードのファイル名。通常使用しません。
    ///   - function: ログ出力を行ったコードの関数名。通常使用しません。
    ///   - line: ログ出力を行ったコードの行番号。通常使用しません。
    public class func ASSERT(_ condition: Bool, _ item: Any, file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
            if (!condition) {
                HRDEBUG.ERROR(item, file: file, function: function, line: line)
            }
        #endif
    }
    
}
