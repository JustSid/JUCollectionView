//
//  JUCollectionViewCell.h
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

/**
 * This class implements a single cell used by the JUCollectionView class. By default it will draw a selection ring if selected and a image, if provided.
 * You can subclass this class for custom cell drawing.
 **/
@interface JUCollectionViewCell : NSView
{
@protected
    NSImage *image;
    NSColor *selectionColor;
    BOOL selected;
	BOOL hovering;
    
@private
    NSInteger index;
    NSString *cellIdentifier;
    
    BOOL drawSelection;
}

/**
 * The identifier of the cell. Used for cell reusing.
 **/
@property (nonatomic, readonly) NSString *cellIdentifier;
/**
 * The image that should be drawn at the center of the cell, or nil if you don't want a image to be drawn.
 **/ 
@property (nonatomic, retain) NSImage *image;

/**
 * The color of the selection ring.
 **/
@property (nonatomic, retain) NSColor *selectionColor;
/**
 * YES if the cell should draw an selection ring. You can set this to NO if you don't want to show a selection ring or if you provide your own. 
 * The default value is YES.
 **/
@property (nonatomic, assign) BOOL drawSelection;
/**
 * YES if the cell is selected, otherwise NO.
 **/
@property (nonatomic, assign, getter=isSelected) BOOL selected;

/**
 * YES if the mouse is hovering over cell, otherwise NO.
 **/
@property (nonatomic, assign, getter=isHovering) BOOL hovering;

/**
 * Invoked when the cell is dequeued from a collection view. This will reset all settings to default.
 **/
- (void)prepareForReuse;

/**
 * The designated initializer of the cell. Please don't use any other intializer!
 **/
- (id)initWithReuseIdentifier:(NSString *)identifer;

@end
