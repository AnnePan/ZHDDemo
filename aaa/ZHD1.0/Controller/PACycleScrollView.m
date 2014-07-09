//
//  CycleScrollView.m
//  PagedScrollView
//
//  Created by baolongxie on 14-6-19.
//  Copyright (c) 2014年 Ping An Health Insurance Company of China, Ltd. All rights reserved.
//

#import "PACycleScrollView.h"
#import "NSTimer+Addition.h"

@interface PACycleScrollView () <UIScrollViewDelegate>
{
    NSMutableArray *_subviewsArray;
    NSMutableDictionary *_viewsArrayNumberDic;
    int _number;
}
@property (nonatomic, assign) NSInteger currentPageIndex;
@property (nonatomic, assign) NSInteger totalPageCount;
@property (nonatomic, strong) NSMutableArray *contentViews;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSTimer *animationTimer;
@property (nonatomic, assign) BOOL isEditing;

@end

@implementation PACycleScrollView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.autoresizingMask = 0xFFFFF;
        _scrollView.contentMode = UIViewContentModeCenter;
        _scrollView.contentSize = CGSizeMake(3 * _scrollView.frame.size.width, _scrollView.frame.size.height);
        _scrollView.delegate = self;
        _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width, 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        _currentPageIndex = 0;
        
        _subviewsArray = [[NSMutableArray alloc] init];
        _viewsArrayNumberDic = [[NSMutableDictionary alloc] init];
        _number = 0;
    }
    return self;
}

- (void)setAnimationDuration:(NSTimeInterval)animationDuration
{
    _animationDuration = animationDuration;
    if (_animationDuration > 0.0) {
        if (_animationTimer) {
            [_animationTimer invalidate];
            _animationTimer = nil;
        }
        _animationTimer = [NSTimer scheduledTimerWithTimeInterval:_animationDuration
                                                           target:self
                                                         selector:@selector(animationTimerDidFired:)
                                                         userInfo:nil
                                                          repeats:YES];
        _isEditing = YES;
        [_animationTimer pauseTimer];
    } else {
        [_animationTimer invalidate];
    }
}


- (void)setIsCycleBool:(BOOL)isCycleBool
{
    _isEditing = isCycleBool;
}


#pragma mark - 这是设置 scrollView 内容
- (void)configContentViews
{
    [_scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setScrollViewContentDataSource];
    
    NSInteger counter = 0;
    for (UIView *contentView in _contentViews) {
        contentView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewTapAction:)];
        [contentView addGestureRecognizer:tapGesture];
        CGRect rightRect = contentView.frame;
        rightRect.origin = CGPointMake(_scrollView.frame.size.width * counter , 0);
        counter++;
        contentView.frame = rightRect;
        [_scrollView addSubview:contentView];

    }
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
}

- (void)setScrollViewContentDataSource
{
    NSInteger previousPageIndex = [self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1];
    NSInteger rearPageIndex = [self getValidNextPageIndexWithPageIndex:_currentPageIndex + 1];
    
    if (_contentViews == nil) {
        _contentViews = [@[] mutableCopy];
    }
    [_contentViews removeAllObjects];
    
    [_contentViews addObject:[self getViewIndex:previousPageIndex]];
    [_contentViews addObject:[self getViewIndex:_currentPageIndex]];
    if(_currentPageIndex == _totalPageCount - 1 && !_isEditing)
    {
        return;
    }
    [_contentViews addObject:[self getViewIndex:rearPageIndex]];
}

- (UIView *)getViewIndex:(NSInteger)pageIndex
{
    if(_isEditing) {
        return [self setSubScorllViewsEditingYes:pageIndex];
    } else {
        return [self setSubScorllViewsEditingNo:pageIndex];
    }
}

- (UIView *)setSubScorllViewsEditingYes:(NSInteger)pageIndex
{
    UIView *view = [_dataSource cycleScrollView:self setDataForView:_subviewsArray[_number % 3] forIndexPath:pageIndex];
    _number = _number + 1;
    return view;
}

- (UIView *)setSubScorllViewsEditingNo:(NSInteger)pageIndex
{
    UIView *view = [_dataSource cycleScrollView:self setDataForView:(UIView *)_subviewsArray[pageIndex % 3] forIndexPath:pageIndex];
    return view;
    
    return nil;
}

/**
 *  计算 下一页 或 上一页的页面 page
 */
- (NSInteger)getValidNextPageIndexWithPageIndex:(NSInteger)currentPageIndex;
{
    if (currentPageIndex == -1) {
        if(_isEditing) {
            return  _totalPageCount - 1;
        }
        return 0;
    } else if (currentPageIndex == _totalPageCount || currentPageIndex == _totalPageCount + 1) {
        if (_isEditing) {
            return 0;
        }
        return _totalPageCount - 1;
    } else {
        return currentPageIndex;
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_animationTimer pauseTimer];
}

/**
 *  当滑动视图结束后，self.animationDuration 秒后开始滚动
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_animationTimer resumeTimerAfterTimeInterval:_animationDuration];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!_totalPageCount) {
        return ;
    }
    int contentOffsetX = scrollView.contentOffset.x;
    
     // 当不支持自动滚动的时侯 当前页面是第一页或最后一页时 就不再加载页面
    _scrollView.scrollEnabled = YES;
    if(((scrollView.contentOffset.x < 240 && _currentPageIndex == 0) || (scrollView.contentOffset.x > 320 && _currentPageIndex == _totalPageCount - 1)) && !_isEditing) {
        _scrollView.canCancelContentTouches = NO;
        return;
    }

    if(contentOffsetX >= 2 * _scrollView.frame.size.width) {
        
         // 下一页
        _currentPageIndex = [self getValidNextPageIndexWithPageIndex:_currentPageIndex + 1];
        [self configContentViews];
        if ([self.dataSource respondsToSelector:@selector(cycleScrollView:viewAtIndex:)]) {
            [self.dataSource cycleScrollView:self viewAtIndex:_currentPageIndex];
        }
    }
    if(contentOffsetX <= 0) {
        
        // 上一页
        _currentPageIndex = [self getValidNextPageIndexWithPageIndex:_currentPageIndex - 1];
        [self configContentViews];
        if ([self.dataSource respondsToSelector:@selector(cycleScrollView:viewAtIndex:)]) {
            [self.dataSource cycleScrollView:self viewAtIndex:_currentPageIndex];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [scrollView setContentOffset:CGPointMake(CGRectGetWidth(scrollView.frame), 0) animated:YES];
}

#pragma mark - 响应事件
- (void)animationTimerDidFired:(NSTimer *)timer
{
    if (!_totalPageCount) {
        return ;
    }
    CGPoint newOffset = CGPointMake(_scrollView.contentOffset.x + _scrollView.frame.size.width, _scrollView.contentOffset.y);
    [_scrollView setContentOffset:newOffset animated:YES];
}

#pragma mark - 点击事件
- (void)contentViewTapAction:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(cycleScrollView:didCycleScrollViewAtIndex:)]) {
        [self.delegate cycleScrollView:self didCycleScrollViewAtIndex:_currentPageIndex];
    }
}


- (void)reloadData
{
    if (!_subviewsArray.count) {
        for(int i = 0;i < 3; i ++) {
            [_subviewsArray addObject:[_dataSource cycleScrollView:self]];
        }
     }
    
    _totalPageCount = [_dataSource numberOfCycleScrollView:self];
    
    if (_totalPageCount > 0) {
        [self configContentViews];
        [_animationTimer resumeTimerAfterTimeInterval:_animationDuration];
    }
}

- (void)autoScrollStop
{
    if (_animationTimer) {
        [_animationTimer resumeTimerAfterTimeInterval:INT_MAX];
    }
}

-(void)autoScrollStart
{
    if (_animationTimer) {
        [_animationTimer resumeTimerAfterTimeInterval:_animationDuration];
    }
}

@end
