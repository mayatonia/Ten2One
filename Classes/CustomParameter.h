//
//  CustomParameter.h
//  Ten1
//
//  Created by Oswald on 9/22/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomParameter : NSObject {

	id			*sender;
	id			*parameter;
}

@property (nonatomic, retain) id		*sender;
@property (nonatomic, retain) id		*parameter;
@end
