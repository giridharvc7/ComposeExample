//
//  VCGrowingTextView.m
//  postTests
//
//  Created by Giridhar on 02/02/16.
//  Copyright © 2016 Giridhar. All rights reserved.
//

#import "VCGrowingTextView.h"

@implementation VCGrowingTextView
{
    NSLayoutConstraint *heightConstraint;
    UILabel *placeHolderLabel;
}


#pragma mark -- Inits

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}


-(void)awakeFromNib
{
    [self commonInit];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
}


-(void) commonInit
{
    for(NSLayoutConstraint *constraint in self.constraints)
    {
        if (constraint.firstAttribute == NSLayoutAttributeHeight)
        {
            heightConstraint = constraint;
            break;
        }
    }
    
    if (!self.placeHolder) {
        [self setPlaceHolder:@""];
    }
    
    if (!self.placeHolderColor) {
        [self setPlaceHolderColor:[UIColor lightGrayColor]];
    }
}


-(void) layoutSubviews
{
    [super layoutSubviews];
    if (heightConstraint)
    {
        [self handleAutolayout];
    }
}


- (void) handleAutolayout
{
    CGFloat contentHeight = self.intrinsicContentSize.height;
    
    if (self.minHeight)
    {
        contentHeight = MAX(self.intrinsicContentSize.height, self.minHeight);
    }
    
    if (self.maxHeight)
    {
        contentHeight = MIN(self.intrinsicContentSize.height, self.maxHeight);
    }
    
    heightConstraint.constant = contentHeight;
    
}


#pragma mark -- Notification Based

-(void)textChanged:(id)sender
{

    if (heightConstraint)
    {
        [self handleAutolayout];
        [self layoutIfNeeded];
    }
    
    
    if([[self placeHolder] length] == 0)
    {
        return;
    }
    
    [UIView animateWithDuration:0.15 animations:^
    {
        if([[self text] length] == 0)
        {
            [[self viewWithTag:999] setAlpha:1];
        }
        else
        {
            [[self viewWithTag:999] setAlpha:0];
        }
    }];
}



#pragma mark -- Placeholder related

- (void)drawRect:(CGRect)rect
{
    if( [[self placeHolder] length] > 0 )
    {
        if (placeHolderLabel == nil )
        {
            placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width - 16,0)];
            placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            placeHolderLabel.numberOfLines = 0;
            placeHolderLabel.font = self.font;
            placeHolderLabel.backgroundColor = [UIColor clearColor];
            placeHolderLabel.textColor = self.placeHolderColor;
            placeHolderLabel.alpha = 0;
            placeHolderLabel.tag = 999;
            [self addSubview:placeHolderLabel];
        }
        
        placeHolderLabel.text = self.placeHolder;
        [placeHolderLabel sizeToFit];
        [self sendSubviewToBack:placeHolderLabel];
    }
    
    if( [[self text] length] == 0 && [[self placeHolder] length] > 0 )
    {
        [[self viewWithTag:999] setAlpha:1];
    }
    
    [super drawRect:rect];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}


#pragma mark -- Dealloc

-(void) dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}





@end
