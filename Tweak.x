#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Security/Security.h>

#define BACKUP_PATH [NSHomeDirectory() stringByAppendingPathComponent:@"tmp/MyAppBackup"]

// 1. دوال الكي تشين
void backupKeychain(NSString *backupFolderPath) {
    // ... كود حفظ الكي تشين ...
}

void restoreKeychain(NSString *backupFolderPath) {
    // ... كود استعادة الكي تشين ...
}

// 2. دوال النسخ والاستعادة للملفات
void createBackup() {
    // ... كود الباك اب للملفات و userDefaults و backupKeychain ...
}

void restoreBackup() {
    // ... كود الاستعادة للملفات و userDefaults و restoreKeychain ...
}

// 3. كود الـ Hook للواجهة والتفاعل
%hook UIApplication

- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        UIViewController *rootVC = keyWindow.rootViewController;
        
        if (rootVC) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"أداة الباك اب" 
                                                                           message:@"اختر العملية:" 
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"أخذ نسخة (Backup)" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                createBackup();
            }]];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"استعادة (Restore)" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
                restoreBackup();
                exit(0);
            }]];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"إلغاء" style:UIAlertActionStyleCancel handler:nil]];
            
            [rootVC presentViewController:alert animated:YES completion:nil];
        }
    });
}

%end
