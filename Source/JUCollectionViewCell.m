//
//  JUCollectionViewCell.m
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

#import "JUCollectionViewCell.h"

@interface JUCollectionViewCell ()
@property (nonatomic, assign) NSInteger index;
@end

@implementation JUCollectionViewCell
@synthesize index, cellIdentifier, image;
@synthesize selectionColor, selected, drawSelection;
@synthesize hovering;

- (void)drawRect:(NSRect)dirtyRect
{
    if(image)
    {
        NSRect inRect = [self bounds];
        NSRect srcRect = NSZeroRect;
		srcRect.size = [image size];
        
		NSRect drawnRect = srcRect;
		if(drawnRect.size.width > inRect.size.width)
		{
			drawnRect.size.height *= inRect.size.width/drawnRect.size.width;
			drawnRect.size.width = inRect.size.width;
		}
        
		if(drawnRect.size.height > inRect.size.height)
		{
			drawnRect.size.width *= inRect.size.height/drawnRect.size.height;
			drawnRect.size.height = inRect.size.height;
		}
        
		drawnRect.origin = inRect.origin;
		drawnRect.origin.x += (inRect.size.width - drawnRect.size.width)/2;
		drawnRect.origin.y += (inRect.size.height - drawnRect.size.height)/2;
        
        [image drawInRect:drawnRect fromRect:srcRect operation:NSCompositeSourceAtop fraction:1.0];
    }
    
    if(selected && drawSelection)
    {
        [selectionColor set];
        
        NSBezierPath *path = [NSBezierPath bezierPathWithRect:[self bounds]];
        [path setLineWidth:4.0];
        [path stroke];
    }
}


- (void)setImage:(NSImage *)newImage
{
    [image autorelease];
    image = [newImage retain];
    
    [self setNeedsDisplay:YES];
}

- (void)setSelected:(BOOL)state
{
    selected = state;
    [self setNeedsDisplay:YES];
}

- (void)setHovering:(BOOL)state
{
	hovering = state;
	[self setNeedsDisplay:YES];
}

- (void)prepareForReuse
{
    selected = NO;
    drawSelection = YES;
	hovering = NO;
    self.image = nil;
}


- (id)initWithReuseIdentifier:(NSString *)identifier
{
    if((self = [super initWithFrame:NSZeroRect]))
    {
        cellIdentifier  = [identifier retain];
        selectionColor  = [[NSColor blackColor] retain];
        drawSelection   = YES;
    }
    
    return self;
}

- (void)dealloc
{
    [image release];
    [cellIdentifier release];
    [selectionColor release];
    
    [super dealloc];
}

@end
