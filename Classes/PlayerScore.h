//
//  PlayerScore.h
//  Ten1
//
//  Created by Oswald on 10/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlayerScore : NSObject <NSCoding>{

	NSString	*S_PLAYERNAME;
	NSString	*S_LOCATION_CITY;
	NSString	*S_LOCATION_STATE;
	NSString	*S_LOCATION_COUNTRY;
	NSInteger	N_AGE;
	NSInteger	N_GENDER; //0=MALE, 1=FEMALE
	NSInteger   N_SCORE;
	NSInteger	N_LIVESREMAINING;
	NSInteger	N_SECONDS_REMAINING;
	NSInteger   N_POINTS;
	NSInteger	N_DIFFICULTY; //0=EASY, 1=HARD, 2=HELL
	
}

@property (nonatomic, retain) NSString		*S_PLAYERNAME;
@property (nonatomic, retain) NSString		*S_LOCATION_STATE;
@property (nonatomic, retain) NSString		*S_LOCATION_CITY;
@property (nonatomic, retain) NSString		*S_LOCATION_COUNTRY;
@property (nonatomic)	NSInteger			N_AGE;
@property (nonatomic)	NSInteger			N_GENDER;
@property (nonatomic)	NSInteger			N_SCORE;
@property (nonatomic)	NSInteger			N_LIVESREMAINING;
@property (nonatomic)	NSInteger			N_SECONDS_REMAINING;
@property (nonatomic)	NSInteger			N_POINTS;
@property (nonatomic)	NSInteger			N_DIFFICULTY;

- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;

@end
