//
//  ViewController.m
//  postTests
//
//  Created by Giridhar on 28/01/16.
//  Copyright © 2016 Giridhar. All rights reserved.
//

#import "ViewController.h"
#import "VCGrowingTextView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textHeightConstraint;
@property (weak, nonatomic) IBOutlet VCGrowingTextView *postTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_postTextView becomeFirstResponder];
    _postTextView.placeHolder = @"What's in your mind?";
    _postTextView.minHeight = 30.f;
    _postTextView.delegate = self;
    _mainScrollView.delegate = self;
}


-(void) textViewDidChange:(UITextView *)textView
{
//    NSLog(@"%f",textView.intrinsicContentSize.height + _postImageView.bounds.size.height);
    _contentHeight.constant = textView.intrinsicContentSize.height + _postImageView.bounds.size.height + 200;
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_postTextView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
