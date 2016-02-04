//
//  VCGrowingTextView.h
//  postTests
//
//  Created by Giridhar on 02/02/16.
//  Copyright © 2016 Giridhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCGrowingTextView : UITextView

@property CGFloat minHeight,maxHeight;
@property (nonatomic,retain) NSString *placeHolder;
@property (nonatomic,retain) UIColor *placeHolderColor;




@end
