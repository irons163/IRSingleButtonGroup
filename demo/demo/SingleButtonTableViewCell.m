//
//  SingleButtonTableViewCell.m
//  demo
//
//  Created by Phil on 2019/7/24.
//  Copyright © 2019 Phil. All rights reserved.
//

#import "SingleButtonTableViewCell.h"
#import <IRSingleButtonGroup/IRSingleButtonGroup.h>

@interface SingleButtonTableViewCell()<IRSingleButtonGroupDelegate>

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
- (IBAction)button1Click:(id)sender;
- (IBAction)button2Click:(id)sender;
- (IBAction)button3Click:(id)sender;
@end

@implementation SingleButtonTableViewCell {
    IRSingleButtonGroup* singleButtonGroup;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupEnableBandsButtons];
    
    singleButtonGroup = [[IRSingleButtonGroup alloc] init];
    singleButtonGroup.buttons = @[self.button1, self.button2, self.button3];
    singleButtonGroup.canSelectWhenSelected = YES;
    singleButtonGroup.delegate = self;
}

- (void)setDefaultIndex:(NSInteger)defaultIndex {
    [singleButtonGroup setInitSelected:singleButtonGroup.buttons[defaultIndex]];
}

- (void)setCanMultiSelected:(BOOL)canMultiSelected {
    singleButtonGroup.canMultiSelected = canMultiSelected;
}

- (BOOL)canMultiSelected {
    return singleButtonGroup.canMultiSelected;
}

- (void)setDisableDeselection:(BOOL)disableDeselection {
    _disableDeselection = disableDeselection;
    singleButtonGroup.canSelectWhenSelected = !_disableDeselection;
}

- (void)setupEnableBandsButtons {
    self.button1.tag = 1;
    self.button2.tag = 2;
    self.button3.tag = 3;
    [self setupBandButtonsDisabledState];
    [self resetEnableBandsButtonsStatus];
}

- (void)setupDisabledStateInBandButton:(UIButton*)bandButton {
    [bandButton setImage:[self translucentImageFromImage:[bandButton imageForState:UIControlStateNormal]withAlpha:1] forState:UIControlStateNormal|UIControlStateDisabled];
    [bandButton setImage:[self translucentImageFromImage:[bandButton imageForState:UIControlStateSelected]withAlpha:1] forState:UIControlStateSelected|UIControlStateDisabled];
}

- (void)setupBandButtonsDisabledState {
    [self setupDisabledStateInBandButton:self.button1];
    [self setupDisabledStateInBandButton:self.button2];
    [self setupDisabledStateInBandButton:self.button3];
}

- (void)resetEnableBandsButtonsStatus {
    [self.button1 setTitle:@"button1" forState:UIControlStateNormal];
    [self.button2 setTitle:@"button2" forState:UIControlStateNormal];
    [self.button3 setTitle:@"button3" forState:UIControlStateNormal];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    [self resetEnableBandsButtonsStatus];
}

- (UIImage *)translucentImageFromImage:(UIImage *)image withAlpha:(CGFloat)alpha {
    CGRect rect = CGRectZero;
    rect.size = image.size;
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    [image drawInRect:rect blendMode:kCGBlendModeScreen alpha:alpha];
    UIImage * translucentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return translucentImage;
}

+ (NSString*)identifier {
    return NSStringFromClass([self class]);
}

#pragma mark - IBAction
- (void)clickBandButton:(UIButton *)sender {
    if (sender.selected) {
        [singleButtonGroup deselected:sender];
    } else {
        [singleButtonGroup selected:sender];
    }
}

- (IBAction)button1Click:(id)sender {
    [self clickBandButton:sender];
}

- (IBAction)button2Click:(id)sender {
    [self clickBandButton:sender];
}

- (IBAction)button3Click:(id)sender {
    [self clickBandButton:sender];
}

#pragma mark - SingleButtonGroupDelegate
- (void)didSelectedButton:(UIButton *)button {
    NSLog(@"Button%ld", button.tag);
}

- (void)didDeselectedButton:(UIButton *)button {
    NSLog(@"Button%ld", button.tag);
}

@end
