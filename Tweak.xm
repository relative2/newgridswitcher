/**
 * NewGridSwitcher (iOS 11)
 * Uses adaptations of methods from https://github.com/ioscreatix/LittleX
 */
static int SWITCHER_STYLE = 2; // 0 = auto, 1 = deck, 2 = grid, 3 = minimum viable
%hook SBFloatingDockController
+(BOOL)isFloatingDockSupported {
	return YES;
}
-(BOOL)_systemGestureManagerAllowsFloatingDockGesture {
	return YES;
}
-(BOOL)_canPresentFloatingDock {
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
	style = SWITCHER_STYLE;
	%orig;
}
%end