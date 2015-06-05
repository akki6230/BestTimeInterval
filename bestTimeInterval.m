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
// commonObject.h
//
//  Created by Ankit Neo GHz on 6/2/15.
//  Copyright (c) 2015 BestTimeInterval. All rights reserved.
//

#import "commonObject.h"

const NSInteger HOUR_MIN = 60;
const NSInteger ONE_MIN_SEC = 60;
const NSInteger ONE_HOUR_SEC = 3600;
const NSInteger A_DAY = 24;
const NSInteger WEEK_DAYS = 7;
const NSInteger MONTH_DAYS = 30;
const NSInteger YEAR_DAYS = 365;
@implementation commonObject

-(NSDictionary *)postTime:(NSString *)dateOfPost
{
    // getting current date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *strCurrentDate =[dateFormatter stringFromDate:[NSDate date]];
    NSDate *dateCurrent = [dateFormatter dateFromString:strCurrentDate];
    
    //getting date of post
    NSDateFormatter *formatterOfPostDate =[[NSDateFormatter alloc] init];
    formatterOfPostDate.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *datePost = [formatterOfPostDate dateFromString:dateOfPost];

    
    NSTimeInterval timeInterval = [dateCurrent timeIntervalSinceDate:datePost];
   

    _dicOfIntervals = [[NSMutableDictionary alloc] init];
    
    [_dicOfIntervals setObject:[self intervalInHours:timeInterval] forKey:@"hours"];
    [_dicOfIntervals setObject:[self intervalInMins:timeInterval] forKey:@"min"];
    [_dicOfIntervals setObject:[NSString stringWithFormat:@"%f",timeInterval] forKey:@"sec"];
    [_dicOfIntervals setObject:[self intervalInDays:timeInterval] forKey:@"days"];
    [_dicOfIntervals setObject:[self intervalInWeeks:timeInterval] forKey:@"weeks"];
    [_dicOfIntervals setObject:[self intervalInMonths:timeInterval] forKey:@"months"];
    [_dicOfIntervals setObject:[self intervalInYears:timeInterval] forKey:@"year"];
    
    [self bestIntervalTime:_dicOfIntervals];
    NSString *strTime = [NSString stringWithFormat:@"%@",[self bestIntervalTime:_dicOfIntervals]];
    
    [_dicOfIntervals setObject:[self bestIntervalTime:_dicOfIntervals] forKey:@"best_time_interval"];
    NSLog(@"%@",strTime);
    return _dicOfIntervals;
}



-(NSString *)intervalInMins:(NSInteger)timeInSec
{
    NSInteger intervalInMins = (timeInSec / HOUR_MIN);
    NSString *strMins = [NSString stringWithFormat:@"%ld",intervalInMins];
    return strMins;
}


-(NSString *)intervalInHours:(NSInteger)timeInSec
{
    NSInteger intervalInHours = (timeInSec / ONE_HOUR_SEC);
    NSString *strHours = [NSString stringWithFormat:@"%ld",intervalInHours];
    return strHours;
}

-(NSString *)intervalInDays:(NSInteger)timeInSec
{
    NSInteger intervalInDays = (timeInSec / (ONE_HOUR_SEC * A_DAY) );
    NSString *strDays = [NSString stringWithFormat:@"%ld",intervalInDays];
    return strDays;
}


-(NSString *)intervalInWeeks:(NSInteger)timeInSec
{
    NSInteger intervalInWeeks = (timeInSec / (ONE_HOUR_SEC * A_DAY * WEEK_DAYS));
    NSString *strWeeks = [NSString stringWithFormat:@"%ld",intervalInWeeks];
    return strWeeks;
}

-(NSString *)intervalInMonths:(NSInteger)timeInSec
{
    NSInteger intervalInMonths = (timeInSec / (ONE_HOUR_SEC * A_DAY * MONTH_DAYS));
    NSString *strMonths = [NSString stringWithFormat:@"%ld",intervalInMonths];
    return strMonths;
}

-(NSString *)intervalInYears:(NSInteger)timeInSec
{
    NSInteger intervalInYears = (timeInSec / (ONE_HOUR_SEC * A_DAY * YEAR_DAYS));
    NSString *strYears = [NSString stringWithFormat:@"%ld",intervalInYears];
    return strYears;
}



-(NSString *)bestIntervalTime:(NSDictionary *)dicOfInteravlsGot
{
    if ([[dicOfInteravlsGot objectForKey:@"min"] integerValue] < 60 && [[dicOfInteravlsGot objectForKey:@"min"] integerValue] > 1)
    {
        if ([[dicOfInteravlsGot objectForKey:@"min"] integerValue] == 1)
        {
            return  [[dicOfInteravlsGot objectForKey:@"min"] stringByAppendingFormat:@" minute ago"];
        }
        else
        {
            return [[dicOfInteravlsGot objectForKey:@"min"] stringByAppendingFormat:@" minutes ago"];
        }
    }
    else if ([[dicOfInteravlsGot objectForKey:@"hours"] integerValue] < 24 && [[dicOfInteravlsGot objectForKey:@"hours"] integerValue] > 1)
    {
        
        if ([[dicOfInteravlsGot objectForKey:@"min"] integerValue] == 1)
        {
           return [[dicOfInteravlsGot objectForKey:@"hours"] stringByAppendingFormat:@" hour ago"];
        }
        else
        {
            return [[dicOfInteravlsGot objectForKey:@"hours"] stringByAppendingFormat:@" hours ago"];
        }
    }
    else if ([[dicOfInteravlsGot objectForKey:@"weeks"] integerValue]< 4 && [[dicOfInteravlsGot objectForKey:@"weeks"] integerValue] >= 1)
    {
        if ([[dicOfInteravlsGot objectForKey:@"days"] integerValue] > 7 && [[dicOfInteravlsGot objectForKey:@"days"] integerValue] < 14)
        {
            return [[dicOfInteravlsGot objectForKey:@"days"] stringByAppendingFormat:@" days ago"];
        }
        else
        {
            return [[dicOfInteravlsGot objectForKey:@"weeks"] stringByAppendingFormat:@" weeks ago"];
        }
    }
    else if ([[dicOfInteravlsGot objectForKey:@"months"] integerValue] >= 1 && [[dicOfInteravlsGot objectForKey:@"months"] integerValue] < 12)
    {
        if ([[dicOfInteravlsGot objectForKey:@"months"] integerValue] == 1)
        {
            return [[dicOfInteravlsGot objectForKey:@"min"] stringByAppendingFormat:@" month ago"];
        }
        else
        {
           return [[dicOfInteravlsGot objectForKey:@"months"] stringByAppendingFormat:@" months ago"];
        }
    }
    else if ([[dicOfInteravlsGot objectForKey:@"days"] integerValue] >= 1 && [[dicOfInteravlsGot objectForKey:@"days"] integerValue] < 7)
    {
        if ([[dicOfInteravlsGot objectForKey:@"days"] integerValue] == 1)
        {
            return [[dicOfInteravlsGot objectForKey:@"days"] stringByAppendingFormat:@" day ago"];
        }
        else
        {
            return [[dicOfInteravlsGot objectForKey:@"days"] stringByAppendingFormat:@" days ago"];
        }
    }
    else
    {
        if ([[dicOfInteravlsGot objectForKey:@"year"] integerValue] == 1)
        {
            return [[dicOfInteravlsGot objectForKey:@"year"] stringByAppendingFormat:@" year ago"];
        }
        else
        {
            return [[dicOfInteravlsGot objectForKey:@"year"] stringByAppendingFormat:@" years ago"];
        }
    }
}
@end
