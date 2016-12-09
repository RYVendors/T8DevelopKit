//
//  T8MenuTitleItem.m
//  T8DevelopKitDemo
//
//  Created by 琦张 on 15/6/19.
//  Copyright (c) 2015年 琦张. All rights reserved.
//

#import "T8MenuTitleItem.h"
#import "T8MenuTitleCell.h"

@implementation T8MenuTitleItem

- (id)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title indicator:NO];
}

- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator
{
    return [self initWithTitle:title indicator:indicator subTitle:nil];
}

- (id)initWithTitle:(NSString *)title indicator:(BOOL)indicator subTitle:(NSString *)subTitle
{
    self = [super init];
    if (self) {
        self.cell = [[T8MenuTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        self.cell.selectedBackgroundView = [[UIView alloc] initWithFrame:self.cell.frame];
        self.cell.selectedBackgroundView.backgroundColor = CellHighlightedBgColor;
        ((T8MenuTitleCell *)self.cell).titleLabel.text = title;
        if (indicator) {
            UIView *accesoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
            UIImageView *accesoryImageView = [[UIImageView alloc]init];
            [accesoryImageView setImage:[UIImage imageNamed:@"public_ic_details"]];
            [accesoryView addSubview:accesoryImageView];
            [accesoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(accesoryView);
                make.left.equalTo(accesoryView).offset(6);
                make.width.equalTo(@18);
                make.height.equalTo(@18);
            }];
            self.cell.accessoryView = accesoryView;
            
            [((T8MenuTitleCell *)self.cell).subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.cell.contentView);
                make.centerY.equalTo(self.cell.contentView);
            }];
        }
        ((T8MenuTitleCell *)self.cell).subTitleLabel.text = subTitle;
    }
    return self;
}

- (void)cellTapped:(UITapGestureRecognizer *)gesture
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(recieveMenuItemEvent:item:)]) {
        [self.delegate recieveMenuItemEvent:T8MenuTitleItemTap item:self];
    }
}

- (CGFloat)itemHeight
{
    return 45;
}

#pragma mark - getter
- (NSString *)title
{
    return ((T8MenuTitleCell *)self.cell).titleLabel.text;
}

- (NSString *)subTitle
{
    return ((T8MenuTitleCell *)self.cell).subTitleLabel.text;
}

- (BOOL)indicator
{
    return self.cell.accessoryType == UITableViewCellAccessoryDisclosureIndicator;
}

#pragma mark - setter
- (void)setTitle:(NSString *)title
{
    ((T8MenuTitleCell *)self.cell).titleLabel.text = title;
}

- (void)setSubTitle:(NSString *)subTitle
{
    ((T8MenuTitleCell *)self.cell).subTitleLabel.text = subTitle;
}

- (void)setIndicator:(BOOL)indicator
{
    if (indicator) {
        UIView *accesoryView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
        UIImageView *accesoryImageView = [[UIImageView alloc]init];
        [accesoryImageView setImage:[UIImage imageNamed:@"public_ic_details"]];
        [accesoryView addSubview:accesoryImageView];
        [accesoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(accesoryView);
            make.left.equalTo(accesoryView).offset(6);
            make.width.equalTo(@18);
            make.height.equalTo(@18);
        }];
        self.cell.accessoryView = accesoryView;
        
        [((T8MenuTitleCell *)self.cell).subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cell.contentView);
            make.centerY.equalTo(self.cell.contentView);
        }];
    }else{
        self.cell.accessoryView = nil;
        [((T8MenuTitleCell *)self.cell).subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cell.contentView).offset(-20);
            make.centerY.equalTo(self.cell.contentView);
        }];
    }
}

@end
