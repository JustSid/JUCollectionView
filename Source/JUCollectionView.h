//
//  JUCollectionView.h
//  JUCollectionView
//
//  Copyright (c) 2011 by Sidney Just
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
//  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
//  and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
//  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
//  FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <Cocoa/Cocoa.h>
#import "JUCollectionViewCell.h"
#import "JUCollectionViewDelegate.h"

/**
 * View for displaying items in a grid like order.
 * The collection view is designed to be inside of an NSScrollView instance! The JUCollectionView class behaves much like UITableView on iOS allowing it
 * to have hundreds of thousands cells without great performance impact (unlike NSCollectionView).
 **/
@interface JUCollectionView : NSView
{
@public
    BOOL allowsSelection, allowsMultipleSelection;
    
@private
    id <JUCollectionViewDataSource> dataSource;
    id <JUCollectionViewDelegate> delegate;
    
    NSUInteger desiredNumberOfColumns, desiredNumberOfRows;
    NSUInteger numberOfColumns, numberOfRows;
    NSUInteger numberOfCells;
    NSSize cellSize;
	NSUInteger lastHoverCellIndex;
    
    NSMutableDictionary *reusableCellQueues;
    NSMutableDictionary *visibleCells;
    
    NSMutableIndexSet *selection;
    NSTimeInterval lastSelection, lastDoubleClick;
    
    BOOL unselectOnMouseUp;
    BOOL updatingData, calledReloadData;
}

/**
 * The size of one cell. Each cell shares the very same size.
 **/
@property (nonatomic, assign) NSSize cellSize;
/**
 * The number of columns the collection view should use, or NSUIntegerMax to let the collection view decide what column number fits best.
 **/
@property (nonatomic, assign) NSUInteger desiredNumberOfColumns;
/**
 * The number of rows the collection view should use, or NSUIntegerMax to let the collection view use an dynmaic row number.
 * @remark If you set desiredNumberOfRows to a fixed value, the collection view might not show all cells but only those who fit into the desired rows.
 **/
@property (nonatomic, assign) NSUInteger desiredNumberOfRows;
/**
 * The currently selected cells.
 **/
@property (nonatomic, readonly) NSIndexSet *selection;

/**
 * The data source of the collection view.
 **/
@property (nonatomic, assign) IBOutlet id <JUCollectionViewDataSource> dataSource;
/**
 * The delegate of the collection view.
 **/
@property (nonatomic, assign) IBOutlet id <JUCollectionViewDelegate> delegate;

/**
 * YES if the collection view should allow selection, otherwise NO. The default value is YES.
 **/
@property (nonatomic, assign) BOOL allowsSelection;
/**
 * YES if the collection view should allow the selection of multiple cells at the same time, otherwise NO. The default value is NO.
 **/
@property (nonatomic, assign) BOOL allowsMultipleSelection;
/**
 * YES if the collection view should deselect the currently selected cell when the mouse button is released. The default value is NO.
 **/
@property (nonatomic, assign) BOOL unselectOnMouseUp;

/**
 * Returns a queued cell or nil if no cell is currently in the queue. Use this if possible instead of creating new JUCollectionViewCell instances. 
 **/
- (JUCollectionViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;
/**
 * Returns the cell at the given index.
 * @remark The cell must be visible, otherwise the method will return nil.
 **/
- (JUCollectionViewCell *)cellAtIndex:(NSUInteger)index;

/**
 * Forces the collection view to throw away all cached data including cells and selections and then reloading the data from scratch.
 **/
- (void)reloadData;

/**
 * Selects the cell with the given index.
 **/
- (void)selectCellAtIndex:(NSUInteger)index;
/**
 * Selects all cells of the index set, or, if allowsMultipleSelection is set to NO, selectes the cell at the first index of the set.
 **/
- (void)selectCellsAtIndexes:(NSIndexSet *)indexSet;

/**
 * Deselects the cell at the given index.
 **/
- (void)deselectCellAtIndex:(NSUInteger)index;
/**
 * Deselcts all cells of the index set.
 **/
- (void)deselectCellsAtIndexes:(NSIndexSet *)indexSet;
/**
 * Deselects all previously selected cells.
 **/
- (void)deselectAllCells;

/**
 * The mouse is hovering over the given cell.
 **/
- (void)hoverOverCellAtIndex:(NSUInteger)index;
/**
 * The mouse was hovering over the given cell and is now out of the cell area.
 **/
- (void)hoverOutOfCellAtIndex:(NSUInteger)index;

/**
 * Returns the index of the cell at the given point.
 **/
- (NSUInteger)indexOfCellAtPoint:(NSPoint)point;
/**
 * Returns the index of the cell at the given position.
 **/
- (NSUInteger)indexOfCellAtPosition:(NSPoint)point;
/**
 * Returns the position of the cell at the given index. For example the top left cell has the point 0|0 while the one on the right side of it has 1|0 etc.
 **/
- (NSPoint)positionOfCellAtIndex:(NSUInteger)index;
/**
 * Returns the frame of the cell at the given index.
 **/
- (NSRect)rectForCellAtIndex:(NSInteger)index;
/**
 * Returns a set of indexes that are inside the rect.
 **/
- (NSIndexSet *)indexesOfCellsInRect:(NSRect)rect;

/**
 * Returns the currently visible index range.
 **/
- (NSRange)visibleRange;

/**
 * Begins a block of changes. The collection view will only update its data and appereance when you call commitChanges.
 * @remark A call to reloadData will also be delayed until a commitChanges call.
 **/
- (void)beginChanges;
/**
 * Updates the collection views data and appereance according to the previously made changes.
 * @remark Use this and beginChanges if you want to update multiple properties of the collection view in one batch call to save performance.
 **/
- (void)commitChanges;

@end
