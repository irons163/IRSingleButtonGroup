//
//  SingleButtonTableViewCell.h
//  demo
//
//  Created by Phil on 2019/7/24.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleButtonTableViewCell : UITableViewCell
@property (nonatomic) BOOL canMultiSelected;
@property (nonatomic) BOOL disableDeselection;
- (void) setDefaultIndex:(NSInteger)defaultIndex;
+ (NSString*)identifier;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END
