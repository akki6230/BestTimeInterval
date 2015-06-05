//
//The MIT License (MIT)
//
//Copyright (c) 2015 akki6230
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//  commonObject.h
//
//  Created by Ankit Neo GHz on 6/2/15.
//  Copyright (c) 2015 BestTimeInterval. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface commonObject : NSObject

  extern const NSInteger HOUR_MIN;
  extern NSInteger const ONE_MIN ;
  extern NSInteger const ONE_HOUR;
  extern NSInteger const A_DAY;
 extern NSInteger const WEEK_DAYS;
extern NSInteger const MONTH_DAYS;
extern NSInteger const YEAR_DAYS;

@property (retain,nonatomic) NSMutableDictionary *dicOfIntervals;
@property(retain, nonatomic)NSDictionary *dicInterval;

-(NSDictionary *)postTime:(NSString *)dateOfPost;
-(NSString *)intervalInHours:(NSInteger)timeInSec;
-(NSString *)bestIntervalTime:(NSDictionary *)dicOfInteravlsGot;
@end
