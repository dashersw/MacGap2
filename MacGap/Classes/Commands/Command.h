//
//  Command.h
//  MG
//
//  Created by Tim Debo on 5/23/14.
//
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@class WindowController, WebView;

@interface Command : NSObject
+ (JSValue *)makeConstructor:(id)block inContext:(JSContext *)context;
+ (JSValue *)constructor;
- (NSString*) exportName;
- (void) initializePlugin;
- (id) initWithWindowController: (WindowController*)aWindowController;
@property (nonatomic, weak) WebView* webView;
@property (nonatomic, weak) WindowController* windowController;
@end