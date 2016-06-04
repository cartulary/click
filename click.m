#import <Foundation/Foundation.h>
#import <ApplicationServices/ApplicationServices.h>

int main(int argc, char *argv[]) {
    [[NSAutoreleasePool alloc] init];
    NSUserDefaults *args = [NSUserDefaults standardUserDefaults];

    int x = [args integerForKey:@"x"];
    int y = [args integerForKey:@"y"];
    int c = [args integerForKey:@"c"]; // count
    int d = [args integerForKey:@"d"]; // delay
    int D = [args integerForKey:@"D"]; // inner delay

    printf("%lf seconds\n", (c * ((double)d + (double)D)) / 1000000.0);

    CGPoint pt = CGPointMake(x, y);

    CGEventRef mouseEvent = CGEventCreateMouseEvent(NULL, kCGEventLeftMouseDown, pt, kCGMouseButtonLeft);

    while (c-->0) {
        CGEventSetType(mouseEvent, kCGEventLeftMouseDown);
        CGEventPost(kCGHIDEventTap, mouseEvent);
        if (D) {
          usleep(D);
        }
        CGEventSetType(mouseEvent, kCGEventLeftMouseUp);
        CGEventPost(kCGHIDEventTap, mouseEvent);
        if (d) {
          usleep(d);
        }
    }
    CFRelease(mouseEvent);
    return 0;
}
