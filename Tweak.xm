/**
 * NewGridSwitcher (iOS 11 - iOS 12)
 * Uses adaptations of methods from https://github.com/ioscreatix/LittleX
 */
#include "BSPlatform.h"

static int SWITCHER_STYLE = 2; // 0 = auto, 1 = deck, 2 = grid, 3 = minimum viable
%hook SBFloatingDockController
+(BOOL)isFloatingDockSupported {
	if (kCFCoreFoundationVersionNumber >= 1556.00) {
		return %orig;
	}
	BSPlatform *platform = [NSClassFromString(@"BSPlatform") sharedInstance];
	if (platform.homeButtonType == 2) {
		return YES;
	}
	return NO;
}
-(BOOL)_systemGestureManagerAllowsFloatingDockGesture {
	if (kCFCoreFoundationVersionNumber >= 1556.00) {
		return %orig;
	}
	BSPlatform *platform = [NSClassFromString(@"BSPlatform") sharedInstance];
	if (platform.homeButtonType == 2) {
		return YES;
	}
	return NO;
}
-(BOOL)_canPresentFloatingDock {
	if (kCFCoreFoundationVersionNumber >= 1556.00) {
		return %orig;
	}
	BSPlatform *platform = [NSClassFromString(@"BSPlatform") sharedInstance];
	if (platform.homeButtonType == 2) {
		return YES;
	}
	return NO;
}
%end
%hook SBGridSwitcherPersonality
- (BOOL)shouldShowControlCenter {
	return NO;
}
%end
//#endregion
%hook SBAppSwitcherSettings
-(NSInteger)switcherStyle {
	return SWITCHER_STYLE;
}
-(void)setSwitcherStyle:(NSInteger)style {
	%orig(SWITCHER_STYLE);
}
/*-(BOOL)simplicityOptionNoControlCenter {
	return NO;
}
-(BOOL)simplicityOptionNoSnapshots {
	return NO;
}
-(BOOL)shouldSimplifyForOptions:(long long)arg1 {
	return YES;
}
-(long long)simplicityOptions {
	return 69602851;
}*/
%end
