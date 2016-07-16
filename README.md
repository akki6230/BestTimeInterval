# BestTimeInterval

The MIT License (MIT)

Copyright (c) 2015 Ankit Neo GHz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

**_Your Local TimeZone_**

You have to use these given below method to get dictionary with all possible values and also you'll get best time interval - 
```
+(instancetype)sharedInstance;
```
 **Get all time intervals differences**  *(Year, Months, weeks, days hour, min, sec)*
 ```
-(NSDictionary *)postTime:(NSString *)dateOfPost;
```
**Get best or least time interval among all the entered values which we get with** *(NSDictionary *)postTime:(NSString *)dateOfPost*
 ```
-(NSString *)bestIntervalTime:(NSDictionary *)dicOfInteravlsGot;
```
