//
//  Gilroy.swift
//  Tripe
//
//  Created by Jonathan Miguel Onrubia Solis on 12/12/24.
//


import SwiftUI

enum OpenSans: String, CaseIterable {
    case regular = "OpenSans-Regular"
    case semiBold = "OpenSans-SemiBold"
    case bold = "OpenSans-Bold"
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 28
        case .title: return 24
        case .title2: return 20
        case .title3: return 16
        case .body: return 16
        case .headline: return 14
        case .subheadline, .callout: return 12
        case .footnote: return 12
        case .caption, .caption2: return 12
        @unknown default:
            return 8
        }
    }
}

extension Font {
    
    private static func customOpenSans(_ font: OpenSans, relativeTo style: Font.TextStyle) -> Font {
        custom(font.rawValue, size: style.size, relativeTo: style)
    }
    
    // MARK: - SemiBold Text
    
    /// OpenSans SemiBold, size: 12pt (XS - Subheadline)
    static var semiBoldTextSizeXSOpenSans = customOpenSans(.semiBold, relativeTo: .subheadline)
    
    /// OpenSans SemiBold, size: 14pt (S - Headline)
    static var semiBoldTextSizeSOpenSans = customOpenSans(.semiBold, relativeTo: .headline)
    
    /// OpenSans SemiBold, size: 16pt (M - Body)
    static var semiBoldTextSizeMOpenSans = customOpenSans(.semiBold, relativeTo: .body)
    
    /// OpenSans SemiBold, size: 24pt (H1 - Title)
    static var semiBoldTextSizeH1OpenSans = customOpenSans(.semiBold, relativeTo: .title)
    
    /// OpenSans SemiBold, size: 20pt (H2 - Title2)
    static var semiBoldTextSizeH2OpenSans = customOpenSans(.semiBold, relativeTo: .title2)
    
    /// OpenSans SemiBold, size: 16pt (H3 - Title3)
    static var semiBoldTextSizeH3OpenSans = customOpenSans(.semiBold, relativeTo: .title3)
    
    /// OpenSans SemiBold, size: 28pt (Large Title)
    static var semiBoldTextLargeTitleOpenSans = customOpenSans(.semiBold, relativeTo: .largeTitle)
    
    
    // MARK: - Bold Text
    
    /// OpenSans Bold, size: 12pt (XS - Subheadline)
    static var boldTextSizeXSOpenSans = customOpenSans(.bold, relativeTo: .subheadline)
    
    /// OpenSans Bold, size: 14pt (S - Headline)
    static var boldTextSizeSOpenSans = customOpenSans(.bold, relativeTo: .headline)
    
    /// OpenSans Bold, size: 16pt (M - Body)
    static var boldTextSizeMOpenSans = customOpenSans(.bold, relativeTo: .body)
    
    /// OpenSans Bold, size: 24pt (H1 - Title)
    static var boldTextSizeH1OpenSans = customOpenSans(.bold, relativeTo: .title)
    
    /// OpenSans Bold, size: 20pt (H2 - Title2)
    static var boldTextSizeH2OpenSans = customOpenSans(.bold, relativeTo: .title2)
    
    /// OpenSans Bold, size: 16pt (H3 - Title3)
    static var boldTextSizeH3OpenSans = customOpenSans(.bold, relativeTo: .title3)
    
    /// OpenSans Bold, size: 28pt (Large Title)
    static var boldTextLargeTitleOpenSans = customOpenSans(.bold, relativeTo: .largeTitle)
    
    
    // MARK: - Regular Text
    
    /// OpenSans Regular, size: 12pt (XS - Subheadline)
    static var regularTextSizeXSOpenSans = customOpenSans(.regular, relativeTo: .subheadline)
    
    /// OpenSans Regular, size: 14pt (S - Headline)
    static var regularTextSizeSOpenSans = customOpenSans(.regular, relativeTo: .headline)
    
    /// OpenSans Regular, size: 16pt (M - Body)
    static var regularTextSizeMOpenSans = customOpenSans(.regular, relativeTo: .body)
    
    /// OpenSans Regular, size: 24pt (H1 - Title)
    static var regularTextSizeH1OpenSans = customOpenSans(.regular, relativeTo: .title)
    
    /// OpenSans Regular, size: 20pt (H2 - Title2)
    static var regularTextSizeH2OpenSans = customOpenSans(.regular, relativeTo: .title2)
    
    /// OpenSans Regular, size: 16pt (H3 - Title3)
    static var regularTextSizeH3OpenSans = customOpenSans(.regular, relativeTo: .title3)
    
    /// OpenSans Regular, size: 28pt (Large Title)
    static var regularTextLargeTitleOpenSans = customOpenSans(.regular, relativeTo: .largeTitle)
}
