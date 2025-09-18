// ------------------------------------------------------------ //
//  constants.dart
//
//  Created by Siva Sankar on 2025-09-17.
// ------------------------------------------------------------ //

import '../mint_ui.dart';

/// Spacing constants used throughout the app for consistent UI design.
class AppSpacing {
  /// Base spacing unit (8.0).
  /// All other spacing values are derived from this.
  static const double base = 8.0;

  // ----------------------------
  // Scale-based spacing
  // ----------------------------

  /// Extra small spacing (4.0).
  static const double xs = base * 0.5;

  /// Small spacing (8.0).
  static const double sm = base;

  /// Medium spacing (16.0).
  static const double md = base * 2;

  /// Large spacing (24.0).
  static const double lg = base * 3;

  /// Extra large spacing (32.0).
  static const double xl = base * 4;

  /// Double extra large spacing (40.0).
  static const double xxl = base * 5;

  /// Triple extra large spacing (48.0).
  static const double xxxl = base * 6;

  // ----------------------------
  // Semantic spacing
  // ----------------------------

  /// Tiny spacing alias (4.0).
  static const double tiny = xs;

  /// Small spacing alias (8.0).
  static const double small = sm;

  /// Medium spacing alias (16.0).
  static const double medium = md;

  /// Large spacing alias (24.0).
  static const double large = lg;

  /// Extra large spacing alias (32.0).
  static const double extraLarge = xl;

  // ----------------------------
  // Component-specific spacing
  // ----------------------------

  /// Default padding for buttons.
  static const double buttonPadding = md;

  /// Default padding for cards.
  static const double cardPadding = md;

  /// Default padding for sections or containers.
  static const double sectionPadding = lg;

  /// Default padding for screens.
  static const double screenPadding = md;

  /// Default padding for list items.
  static const double listItemPadding = md;

  // ----------------------------
  // Vertical spacing
  // ----------------------------

  /// Vertical tiny spacing (4.0).
  static const double verticalTiny = xs;

  /// Vertical small spacing (8.0).
  static const double verticalSmall = sm;

  /// Vertical medium spacing (16.0).
  static const double verticalMedium = md;

  /// Vertical large spacing (24.0).
  static const double verticalLarge = lg;

  /// Vertical extra large spacing (32.0).
  static const double verticalExtraLarge = xl;

  // ----------------------------
  // Horizontal spacing
  // ----------------------------

  /// Horizontal tiny spacing (4.0).
  static const double horizontalTiny = xs;

  /// Horizontal small spacing (8.0).
  static const double horizontalSmall = sm;

  /// Horizontal medium spacing (16.0).
  static const double horizontalMedium = md;

  /// Horizontal large spacing (24.0).
  static const double horizontalLarge = lg;

  /// Horizontal extra large spacing (32.0).
  static const double horizontalExtraLarge = xl;
}

// ------------------------------------------------------------ //
// Border Radius

/// Border radius constants used throughout the app
/// for consistent rounded corner styles.
class AppRadius {
  // ----------------------------
  // Base radius
  // ----------------------------

  /// No radius (0.0).
  static const double none = 0.0;

  /// Extra small radius (4.0).
  static const double xs = 4.0;

  /// Small radius (8.0).
  static const double sm = 8.0;

  /// Medium radius (12.0).
  static const double md = 12.0;

  /// Large radius (16.0).
  static const double lg = 16.0;

  /// Extra large radius (20.0).
  static const double xl = 20.0;

  /// Double extra large radius (24.0).
  static const double xxl = 24.0;

  /// Triple extra large radius (32.0).
  static const double xxxl = 32.0;

  // ----------------------------
  // Semantic radius
  // ----------------------------

  /// Semantic alias for small radius (4.0).
  static const double small = xs;

  /// Semantic alias for medium radius (8.0).
  static const double medium = sm;

  /// Semantic alias for large radius (12.0).
  static const double large = md;

  /// Semantic alias for extra large radius (16.0).
  static const double extraLarge = lg;

  // ----------------------------
  // Component-specific radius
  // ----------------------------

  /// Default button radius (8.0).
  static const double button = sm;

  /// Default card radius (12.0).
  static const double card = md;

  /// Default text field radius (8.0).
  static const double textField = sm;

  /// Default dialog radius (16.0).
  static const double dialog = lg;

  /// Default bottom sheet radius (16.0).
  static const double bottomSheet = lg;

  /// Default chip radius (20.0).
  static const double chip = xl;

  /// Default avatar radius (24.0).
  static const double avatar = xxl;

  // ----------------------------
  // Special radius
  // ----------------------------

  /// Full circular radius (999.0) for pills or circles.
  static const double circular = 999.0;

  // ----------------------------
  // BorderRadius objects
  // ----------------------------

  /// Border radius of 0.0.
  static const BorderRadius noneRadius = BorderRadius.all(
    Radius.circular(none),
  );

  /// Border radius of 4.0.
  static const BorderRadius xsRadius = BorderRadius.all(Radius.circular(xs));

  /// Border radius of 8.0.
  static const BorderRadius smRadius = BorderRadius.all(Radius.circular(sm));

  /// Border radius of 12.0.
  static const BorderRadius mdRadius = BorderRadius.all(Radius.circular(md));

  /// Border radius of 16.0.
  static const BorderRadius lgRadius = BorderRadius.all(Radius.circular(lg));

  /// Border radius of 20.0.
  static const BorderRadius xlRadius = BorderRadius.all(Radius.circular(xl));

  /// Border radius of 24.0.
  static const BorderRadius xxlRadius = BorderRadius.all(Radius.circular(xxl));

  /// Border radius of 32.0.
  static const BorderRadius xxxlRadius = BorderRadius.all(
    Radius.circular(xxxl),
  );

  /// Circular border radius (999.0).
  static const BorderRadius circularRadius = BorderRadius.all(
    Radius.circular(circular),
  );

  // ----------------------------
  // Component BorderRadius
  // ----------------------------

  /// Border radius for buttons.
  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(button),
  );

  /// Border radius for cards.
  static const BorderRadius cardRadius = BorderRadius.all(
    Radius.circular(card),
  );

  /// Border radius for text fields.
  static const BorderRadius textFieldRadius = BorderRadius.all(
    Radius.circular(textField),
  );

  /// Border radius for dialogs.
  static const BorderRadius dialogRadius = BorderRadius.all(
    Radius.circular(dialog),
  );

  /// Border radius for bottom sheets (rounded only at the top).
  static const BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(lg),
    topRight: Radius.circular(lg),
  );

  /// Border radius for chips.
  static const BorderRadius chipRadius = BorderRadius.all(
    Radius.circular(chip),
  );
}

// ------------------------------------------------------------ //
// AppTextSize

/// Typography constants for font sizes used throughout the app.
class AppTextSize {
  // ----------------------------
  // Font sizes
  // ----------------------------

  /// Extra small text size (10.0).
  static const double xs = 10.0;

  /// Small text size (12.0).
  static const double sm = 12.0;

  /// Medium text size (14.0).
  static const double md = 14.0;

  /// Large text size (16.0).
  static const double lg = 16.0;

  /// Extra large text size (18.0).
  static const double xl = 18.0;

  /// Double extra large text size (20.0).
  static const double xxl = 20.0;

  /// Triple extra large text size (24.0).
  static const double xxxl = 24.0;

  /// Quadruple extra large text size (32.0).
  static const double xxxxl = 32.0;

  // ----------------------------
  // Semantic text sizes
  // ----------------------------

  /// Caption text (10.0).
  static const double caption = xs;

  /// Body2 text (12.0).
  static const double body2 = sm;

  /// Body1 text (14.0).
  static const double body1 = md;

  /// Subtitle2 text (16.0).
  static const double subtitle2 = lg;

  /// Subtitle1 text (18.0).
  static const double subtitle1 = xl;

  /// Headline6 text (20.0).
  static const double headline6 = xxl;

  /// Headline5 text (24.0).
  static const double headline5 = xxxl;

  /// Headline4 text (32.0).
  static const double headline4 = xxxxl;

  /// Headline3 text (36.0).
  static const double headline3 = 36.0;

  /// Headline2 text (48.0).
  static const double headline2 = 48.0;

  /// Headline1 text (64.0).
  static const double headline1 = 64.0;

  // ----------------------------
  // Component-specific text sizes
  // ----------------------------

  /// Default button text size (14.0).
  static const double buttonText = md;

  /// App bar title text size (18.0).
  static const double appBarTitle = xl;

  /// Tab label text size (14.0).
  static const double tabText = md;

  /// Chip label text size (12.0).
  static const double chipText = sm;
}

// ------------------------------------------------------------ //
// AppFontWeight

/// Font weight constants used throughout the app.
class AppFontWeight {
  /// Thin (100).
  static const FontWeight thin = FontWeight.w100;

  /// Extra light (200).
  static const FontWeight extraLight = FontWeight.w200;

  /// Light (300).
  static const FontWeight light = FontWeight.w300;

  /// Regular / normal (400).
  static const FontWeight regular = FontWeight.w400;

  /// Medium (500).
  static const FontWeight medium = FontWeight.w500;

  /// Semi-bold (600).
  static const FontWeight semiBold = FontWeight.w600;

  /// Bold (700).
  static const FontWeight bold = FontWeight.w700;

  /// Extra bold (800).
  static const FontWeight extraBold = FontWeight.w800;

  /// Black (900).
  static const FontWeight black = FontWeight.w900;
}

// ------------------------------------------------------------ //
// AppIconSize

/// Icon size constants for consistent scaling across the app.
class AppIconSize {
  // ----------------------------
  // Base sizes
  // ----------------------------

  /// Extra small icon (12.0).
  static const double xs = 12.0;

  /// Small icon (16.0).
  static const double sm = 16.0;

  /// Medium icon (20.0).
  static const double md = 20.0;

  /// Large icon (24.0).
  static const double lg = 24.0;

  /// Extra large icon (28.0).
  static const double xl = 28.0;

  /// Double extra large icon (32.0).
  static const double xxl = 32.0;

  /// Triple extra large icon (48.0).
  static const double xxxl = 48.0;

  /// Quadruple extra large icon (64.0).
  static const double xxxxl = 64.0;

  // ----------------------------
  // Semantic sizes
  // ----------------------------

  /// Small icon (16.0).
  static const double small = sm;

  /// Medium icon (20.0).
  static const double medium = md;

  /// Large icon (24.0).
  static const double large = lg;

  /// Extra large icon (28.0).
  static const double extraLarge = xl;

  // ----------------------------
  // Component-specific icon sizes
  // ----------------------------

  /// App bar icon (24.0).
  static const double appBar = lg;

  /// Tab icon (24.0).
  static const double tab = lg;

  /// Button icon (16.0).
  static const double button = sm;

  /// List tile icon (24.0).
  static const double listTile = lg;

  /// Floating action button icon (24.0).
  static const double fab = lg;

  /// Avatar icon (48.0).
  static const double avatar = xxxl;
}

// ------------------------------------------------------------ //
// AppElevation

/// Elevation constants for shadows and depth effects across the app.
class AppElevation {
  /// No elevation (0.0).
  static const double none = 0.0;

  /// Extra small elevation (1.0).
  static const double xs = 1.0;

  /// Small elevation (2.0).
  static const double sm = 2.0;

  /// Medium elevation (4.0).
  static const double md = 4.0;

  /// Large elevation (8.0).
  static const double lg = 8.0;

  /// Extra large elevation (12.0).
  static const double xl = 12.0;

  /// Double extra large elevation (16.0).
  static const double xxl = 16.0;

  /// Triple extra large elevation (24.0).
  static const double xxxl = 24.0;

  // ----------------------------
  // Component-specific elevations
  // ----------------------------

  /// Card elevation (2.0).
  static const double card = sm;

  /// Button elevation (1.0).
  static const double button = xs;

  /// App bar elevation (4.0).
  static const double appBar = md;

  /// Dialog elevation (24.0).
  static const double dialog = xxxl;

  /// Bottom sheet elevation (8.0).
  static const double bottomSheet = lg;

  /// Floating action button elevation (8.0).
  static const double fab = lg;

  /// Drawer elevation (12.0).
  static const double drawer = xl;
}

// ------------------------------------------------------------ //
// AppBorderWidth

/// Border width constants for outlines and strokes across the app.
class AppBorderWidth {
  /// No border (0.0).
  static const double none = 0.0;

  /// Thin border (0.5).
  static const double thin = 0.5;

  /// Normal border (1.0).
  static const double normal = 1.0;

  /// Thick border (2.0).
  static const double thick = 2.0;

  /// Extra thick border (4.0).
  static const double extraThick = 4.0;

  // ----------------------------
  // Component-specific borders
  // ----------------------------

  /// Text field border width (1.0).
  static const double textField = normal;

  /// Card border width (0.5).
  static const double card = thin;

  /// Divider border width (0.5).
  static const double divider = thin;

  /// Focus indicator border width (2.0).
  static const double focus = thick;
}

// ------------------------------------------------------------ //
// AppDuration

/// Animation duration constants for consistent timing across the app.
class AppDuration {
  // ----------------------------
  // Standard durations
  // ----------------------------

  /// Instant duration (0 ms).
  static const Duration instant = Duration.zero;

  /// Fast duration (150 ms).
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal duration (300 ms).
  static const Duration normal = Duration(milliseconds: 300);

  /// Slow duration (500 ms).
  static const Duration slow = Duration(milliseconds: 500);

  /// Slower duration (1000 ms).
  static const Duration slower = Duration(milliseconds: 1000);

  // ----------------------------
  // Component-specific durations
  // ----------------------------

  /// Button animation duration (150 ms).
  static const Duration buttonAnimation = fast;

  /// Page transition duration (300 ms).
  static const Duration pageTransition = normal;

  /// Dialog animation duration (300 ms).
  static const Duration dialogAnimation = normal;

  /// Bottom sheet animation duration (300 ms).
  static const Duration bottomSheetAnimation = normal;

  /// Snack bar visibility duration (3 seconds).
  static const Duration snackBarDuration = Duration(seconds: 3);

  /// Splash animation duration (500 ms).
  static const Duration splashAnimation = slow;
}

// ------------------------------------------------------------ //
// AppCurve

/// Animation Curve Constants
class AppCurve {
  /// Smooth start (slow → fast)
  static const Curve easeIn = Curves.easeIn;

  /// Smooth end (fast → slow)
  static const Curve easeOut = Curves.easeOut;

  /// Smooth start and end
  static const Curve easeInOut = Curves.easeInOut;

  /// Standard Material curve (fast → slow)
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;

  /// Bouncy effect when entering
  static const Curve bounceIn = Curves.bounceIn;

  /// Bouncy effect when exiting
  static const Curve bounceOut = Curves.bounceOut;

  /// Elastic spring-out effect
  static const Curve elastic = Curves.elasticOut;

  // Component specific
  /// Curve for button press animations
  static const Curve buttonPress = fastOutSlowIn;

  /// Curve for page transitions
  static const Curve pageTransition = fastOutSlowIn;

  /// Curve for dialogs
  static const Curve dialogAnimation = easeInOut;
}

// ------------------------------------------------------------ //
// AppSize

/// Size Constants
class AppSize {
  // Common sizes
  /// Extra small (16.0)
  static const double xs = 16.0;

  /// Small (24.0)
  static const double sm = 24.0;

  /// Medium (32.0)
  static const double md = 32.0;

  /// Large (48.0)
  static const double lg = 48.0;

  /// Extra large (64.0)
  static const double xl = 64.0;

  /// 2x Extra large (96.0)
  static const double xxl = 96.0;

  /// 3x Extra large (128.0)
  static const double xxxl = 128.0;

  // Button sizes
  static const double buttonHeightSmall = 32.0;
  static const double buttonHeightMedium = 40.0;
  static const double buttonHeightLarge = 48.0;
  static const double buttonHeightExtraLarge = 56.0;

  // Input field sizes
  static const double textFieldHeight = 48.0;
  static const double textFieldHeightSmall = 40.0;
  static const double textFieldHeightLarge = 56.0;

  // App bar sizes
  static const double appBarHeight = 56.0;
  static const double appBarHeightLarge = 64.0;

  // Avatar sizes
  static const double avatarSmall = 24.0;
  static const double avatarMedium = 40.0;
  static const double avatarLarge = 56.0;
  static const double avatarExtraLarge = 80.0;

  // Icon button sizes
  static const double iconButtonSmall = 32.0;
  static const double iconButtonMedium = 40.0;
  static const double iconButtonLarge = 48.0;

  // FAB sizes
  static const double fabSmall = 40.0;
  static const double fabRegular = 56.0;
  static const double fabLarge = 64.0;

  // List tile sizes
  static const double listTileHeight = 56.0;
  static const double listTileHeightDense = 48.0;
  static const double listTileHeightLarge = 72.0;

  // Card sizes
  static const double cardMinHeight = 80.0;
  static const double cardMaxWidth = 400.0;
}

// ------------------------------------------------------------ //
// AppLayout

/// Layout Constants
class AppLayout {
  // Breakpoints
  /// Mobile breakpoint (≤ 576px)
  static const double mobileBreakpoint = 576.0;

  /// Tablet breakpoint (≤ 768px)
  static const double tabletBreakpoint = 768.0;

  /// Desktop breakpoint (≤ 992px)
  static const double desktopBreakpoint = 992.0;

  /// Large desktop breakpoint (≥ 1200px)
  static const double largeDesktopBreakpoint = 1200.0;

  // Grid system
  /// Number of grid columns
  static const int gridColumns = 12;

  /// Gutter spacing between grid items
  static const double gridGutter = AppSpacing.md;

  // Container constraints
  /// Maximum width for main content
  static const double maxContentWidth = 1200.0;

  /// Minimum touch target (for accessibility)
  static const double minTouchTarget = 44.0;

  // Safe area
  /// Bottom navigation height
  static const double bottomNavigationHeight = 80.0;

  /// Tab bar height
  static const double tabBarHeight = 48.0;

  /// Toolbar (AppBar) height
  static const double toolbarHeight = 56.0;
}

// ------------------------------------------------------------ //
// AppOpacity

/// Opacity Constants
class AppOpacity {
  /// Fully transparent (0%)
  static const double transparent = 0.0;

  /// Almost invisible (5%)
  static const double barely = 0.05;

  /// Light visibility (10%)
  static const double light = 0.1;

  /// Medium visibility (30%)
  static const double medium = 0.3;

  /// Strong visibility (50%)
  static const double strong = 0.5;

  /// Heavy visibility (70%)
  static const double heavy = 0.7;

  /// Fully visible (100%)
  static const double opaque = 1.0;

  // Component specific
  /// Disabled element opacity
  static const double disabled = medium;

  /// Overlay layers (dialogs, sheets, etc.)
  static const double overlay = strong;

  /// Shimmer effect opacity
  static const double shimmer = light;

  /// Divider opacity
  static const double divider = light;
}

// ------------------------------------------------------------ //
// AppZIndex

/// Z-Index Constants (layering order)
class AppZIndex {
  /// Behind everything
  static const int background = -1;

  /// Default layer
  static const int normal = 0;

  /// Slightly elevated elements
  static const int elevated = 1;

  /// Fixed elements (e.g., headers/footers)
  static const int fixed = 10;

  /// Sticky elements (remain in scroll view)
  static const int sticky = 20;

  /// Overlays (drawers, bottom sheets)
  static const int overlay = 30;

  /// Modal dialogs
  static const int modal = 40;

  /// Popovers / dropdowns
  static const int popover = 50;

  /// Tooltips
  static const int tooltip = 60;

  /// Toasts / snackbars
  static const int toast = 70;

  /// Highest possible layer
  static const int maximum = 100;
}

// ------------------------------------------------------------ //
// AppAspectRatio

/// Aspect Ratio Constants
class AppAspectRatio {
  /// Perfect square (1:1)
  static const double square = 1.0;

  /// Portrait ratio (3:4)
  static const double portrait = 3.0 / 4.0;

  /// Landscape ratio (4:3)
  static const double landscape = 4.0 / 3.0;

  /// Standard widescreen (16:9)
  static const double widescreen = 16.0 / 9.0;

  /// Golden ratio (~1.618)
  static const double golden = 1.618;

  // Social media ratios
  /// Instagram posts (1:1)
  static const double instagram = 1.0;

  /// Facebook link previews (~1.91:1)
  static const double facebook = 1.91;

  /// Twitter/X images (2:1)
  static const double twitter = 2.0;
}

// ------------------------------------------------------------ //
// AppPadding

/// Common EdgeInsets constants used across the app
class AppPadding {
  // === Uniform padding ===
  /// Extra small padding (all sides)
  static const EdgeInsets xs = EdgeInsets.all(AppSpacing.xs);

  /// Small padding (all sides)
  static const EdgeInsets sm = EdgeInsets.all(AppSpacing.sm);

  /// Medium padding (all sides)
  static const EdgeInsets md = EdgeInsets.all(AppSpacing.md);

  /// Large padding (all sides)
  static const EdgeInsets lg = EdgeInsets.all(AppSpacing.lg);

  /// Extra large padding (all sides)
  static const EdgeInsets xl = EdgeInsets.all(AppSpacing.xl);

  /// Double extra large padding (all sides)
  static const EdgeInsets xxl = EdgeInsets.all(AppSpacing.xxl);

  // === Horizontal padding ===
  static const EdgeInsets horizontalXS = EdgeInsets.symmetric(
    horizontal: AppSpacing.xs,
  );
  static const EdgeInsets horizontalSM = EdgeInsets.symmetric(
    horizontal: AppSpacing.sm,
  );
  static const EdgeInsets horizontalMD = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
  );
  static const EdgeInsets horizontalLG = EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
  );
  static const EdgeInsets horizontalXL = EdgeInsets.symmetric(
    horizontal: AppSpacing.xl,
  );

  // === Vertical padding ===
  static const EdgeInsets verticalXS = EdgeInsets.symmetric(
    vertical: AppSpacing.xs,
  );
  static const EdgeInsets verticalSM = EdgeInsets.symmetric(
    vertical: AppSpacing.sm,
  );
  static const EdgeInsets verticalMD = EdgeInsets.symmetric(
    vertical: AppSpacing.md,
  );
  static const EdgeInsets verticalLG = EdgeInsets.symmetric(
    vertical: AppSpacing.lg,
  );
  static const EdgeInsets verticalXL = EdgeInsets.symmetric(
    vertical: AppSpacing.xl,
  );

  // === Component-specific padding ===
  /// Standard button padding
  static const EdgeInsets button = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.sm,
  );

  /// Card inner padding
  static const EdgeInsets card = EdgeInsets.all(AppSpacing.md);

  /// Screen padding (default page margin)
  static const EdgeInsets screen = EdgeInsets.all(AppSpacing.md);

  /// Dialog content padding
  static const EdgeInsets dialog = EdgeInsets.all(AppSpacing.lg);

  /// ListTile content padding
  static const EdgeInsets listTile = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.sm,
  );

  // === Directional padding ===
  /// Top-only padding
  static const EdgeInsets topXS = EdgeInsets.only(top: AppSpacing.xs);
  static const EdgeInsets topSM = EdgeInsets.only(top: AppSpacing.sm);
  static const EdgeInsets topMD = EdgeInsets.only(top: AppSpacing.md);
  static const EdgeInsets topLG = EdgeInsets.only(top: AppSpacing.lg);

  /// Bottom-only padding
  static const EdgeInsets bottomXS = EdgeInsets.only(bottom: AppSpacing.xs);
  static const EdgeInsets bottomSM = EdgeInsets.only(bottom: AppSpacing.sm);
  static const EdgeInsets bottomMD = EdgeInsets.only(bottom: AppSpacing.md);
  static const EdgeInsets bottomLG = EdgeInsets.only(bottom: AppSpacing.lg);

  /// Left-only padding
  static const EdgeInsets leftXS = EdgeInsets.only(left: AppSpacing.xs);
  static const EdgeInsets leftSM = EdgeInsets.only(left: AppSpacing.sm);
  static const EdgeInsets leftMD = EdgeInsets.only(left: AppSpacing.md);
  static const EdgeInsets leftLG = EdgeInsets.only(left: AppSpacing.lg);

  /// Right-only padding
  static const EdgeInsets rightXS = EdgeInsets.only(right: AppSpacing.xs);
  static const EdgeInsets rightSM = EdgeInsets.only(right: AppSpacing.sm);
  static const EdgeInsets rightMD = EdgeInsets.only(right: AppSpacing.md);
  static const EdgeInsets rightLG = EdgeInsets.only(right: AppSpacing.lg);
}
