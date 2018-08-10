// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {
  /// Swipe the card to reveal more slang words!
  internal static let helpInstructionLabel = L10n.tr("Localizable", "help_instruction_label")
  /// I've been playing with this kiwi slang app, did you know %@ means %@ !
  internal static func shareText(_ p1: String, _ p2: String) -> String {
    return L10n.tr("Localizable", "share_text", p1, p2)
  }
  /// Slang of the day
  internal static let slangOfTheDay = L10n.tr("Localizable", "slang_of_the_day")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
