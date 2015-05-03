#import "RNChatViewManager.h"
#import "RNChatView.h"

@implementation ChatViewManager

RCT_EXPORT_MODULE();

- (RCTView *)view
{
    return [[ChatView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(someParameter, NSString);

@end