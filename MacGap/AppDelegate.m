//
//  AppDelegate.m
//  MG
//
//  Created by Tim Debo on 5/19/14.
//
//

#import "AppDelegate.h"
#import "WindowController.h"

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(BOOL)applicationShouldHandleReopen:(NSApplication*)application
                   hasVisibleWindows:(BOOL)visibleWindows{
    if(!visibleWindows){
        [self.windowController.window makeKeyAndOrderFront: nil];
    }
    return YES;
}

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.windowController = [[WindowController alloc] initWithURL: kStartPage];
    [self.windowController setWindowParams];
    [self.windowController showWindow:self];
    [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    [Event triggerEvent:@"applicationWillTerminate" forWebView:self.windowController.webView];
}

- (void) applicationDidBecomeActive:(NSNotification *)notification {
    [self.windowController showWindow:self];
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename {
    NSDictionary* details = @{
        @"filename": filename
    };

    [Event triggerEvent:@"openFile" withArgs:details forWebView:self.windowController.webView];
    return YES;
}
@end
