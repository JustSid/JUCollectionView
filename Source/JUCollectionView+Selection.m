//
//  JUCollectionView+Selection.m
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

#import "JUCollectionView+Selection.h"

@implementation JUCollectionView (JUCollectionView_Selection)

- (void)mouseDown:(NSEvent *)event
{
    [[self window] makeFirstResponder:self];
    
    NSUInteger index;
    NSPoint mousePoint = [self convertPoint:[event locationInWindow] fromView:nil];
    index = [self indexOfCellAtPoint:mousePoint];
    
    [self selectCellAtIndex:index];
}

- (void)mouseDragged:(NSEvent *)event
{
    NSUInteger index;
    NSPoint mousePoint = [self convertPoint:[event locationInWindow] fromView:nil];
    index = [self indexOfCellAtPoint:mousePoint];
    
    [self selectCellAtIndex:index];
    [self autoscroll:event];
}

- (void)mouseMoved:(NSEvent *)event
{
	NSUInteger index;
    NSPoint mousePoint = [self convertPoint:[event locationInWindow] fromView:nil];
    index = [self indexOfCellAtPoint:mousePoint];

	[self hoverOverCellAtIndex:index];
}

- (void)mouseUp:(NSEvent *)event
{
    NSUInteger index;
    NSPoint mousePoint = [self convertPoint:[event locationInWindow] fromView:nil];
    index = [self indexOfCellAtPoint:mousePoint];
    
    [self selectCellAtIndex:index];
    
    if(unselectOnMouseUp)
        [self deselectAllCells];
    
    lastSelection = [NSDate timeIntervalSinceReferenceDate];
}

- (void)keyDown:(NSEvent *)event
{
    if([[self selection] count] == 0)
        return;
    
    NSUInteger index = [[self selection] firstIndex];
    BOOL isSelectionEvent = NO;
    
    switch([event keyCode])
    {
        case 123: // Left
            index --;
            isSelectionEvent = YES;
            break;
            
        case 124: // Right
            index ++;
            isSelectionEvent = YES;
            break;
            
        case 125: // Down
        {
            NSPoint point = [self positionOfCellAtIndex:index];
            point.y += 1;
            
            index = [self indexOfCellAtPosition:point];
            isSelectionEvent = YES;
            break;
        }
            
        case 126: // Up
        {
            NSPoint point = [self positionOfCellAtIndex:index];
            point.y -= 1;
            
            index = [self indexOfCellAtPosition:point];
            isSelectionEvent = YES;
            break;
        }
            
        default:
            break;
    }
    
    if(isSelectionEvent)
    {
        [self deselectAllCells];
        [self selectCellAtIndex:index];
        
        return;
    }
    
    BOOL delegateImplements = [delegate respondsToSelector:@selector(collectionView:keyEvent:forCellAtIndex:)];
    if(!delegateImplements)
        return;
    
    [[self selection] enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop){
        [delegate collectionView:self keyEvent:event forCellAtIndex:index];
    }];
}

@end
