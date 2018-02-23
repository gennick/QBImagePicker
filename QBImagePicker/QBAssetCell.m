//
//  QBAssetCell.m
//  QBImagePicker
//
//  Created by Katsuma Tanaka on 2015/04/03.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import "QBAssetCell.h"
#import "QBCheckmarkView.h"

@interface QBAssetCell ()

@property (weak, nonatomic) IBOutlet UIView *overlayView;

@end

@implementation QBAssetCell
    
- (void)setUseCustomCheckmark:(BOOL)useCustomCheckmark {
    _useCustomCheckmark = useCustomCheckmark;
    
    if (self.useCustomCheckmark) {
        self.overlayView.hidden = NO;
        self.overlayView.backgroundColor = [UIColor clearColor];
        
        QBCheckmarkView *checkmarkView = (QBCheckmarkView *)self.overlayView.subviews.firstObject;
        checkmarkView.customCheckmarkImageView.hidden = NO;
        checkmarkView.customCheckmarkImageView.image = self.customCheckmarkUnselected;
        checkmarkView.customCheckmarkImageView.highlightedImage = self.customCheckmarkSelected;
    }
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (self.useCustomCheckmark) {
        self.overlayView.hidden = NO;
        
        QBCheckmarkView *checkmarkView = (QBCheckmarkView *)self.overlayView.subviews.firstObject;
        checkmarkView.customCheckmarkImageView.highlighted = selected;
    } else {
        // Show/hide overlay view
        self.overlayView.hidden = !(selected && self.showsOverlayViewWhenSelected);
    }
}

@end
