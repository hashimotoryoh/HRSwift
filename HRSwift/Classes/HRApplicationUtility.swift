//
//  HRApplicationUtility.swift
//  Pods
//
//  Created by Ryoh Hashimoto on 2017/08/08.
//
//

public class HRApplicationUtility {
    
    /// アプリケーションのBundleIDを返します。
    /// Info.plist で指定されたアプリケーションのBundleIDを返します。何らかの原因で取得できなかった場合は `nil` を返します。
    public static var bundleIdentifier: String? {
        guard let id = Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String else {
            HRDEBUG.ERROR("アプリのBundleIDが取得できません。")
            return nil
        }
        return id
    }
    
    /// アプリケーションのバージョンを返します。
    /// Info.plist で指定されたアプリケーションのバージョンを返します。何らかの原因で取得できなかった場合は `nil` を返します。
    public static var appVersion: String? {
        guard let v = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String else {
            HRDEBUG.ERROR("アプリのバージョンが取得できません。")
            return nil
        }
        return v
    }
    
    /// アプリケーションのビルド番号を返します。
    /// Info.plist で指定されたアプリケーションのビルド番号を返します。何らかの原因で取得できなかった場合は `nil` を返します。
    public static var buildVersion: String? {
        guard let v = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String else {
            HRDEBUG.ERROR("アプリのビルド番号が取得できません。")
            return nil
        }
        return v
    }
    
    /// アプリケーションの表示名を返します。
    /// Info.plist で指定されたアプリケーションの表示名を返します。何らかの原因で取得できなかった場合は `nil` を返します。
    public static var displayName: String? {
        guard let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String else {
            HRDEBUG.ERROR("アプリの表示名が取得できません。")
            return nil
        }
        return name
    }
    
}
