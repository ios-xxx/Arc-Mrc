/** 判断是否Arc */
#if __has_feature(objc_arc)
/** 是Arc 环境 */
#define scriptH(name) +(instancetype)share##name;
#define scriptM(name) static id _csytool;\
\
+(instancetype)allocWithZone:(struct _NSZone *)zone {\
\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
\
_csytool = [super allocWithZone:zone];\
\
});\
return _csytool;\
}\
\
+(instancetype)share##name {\
\
return [[self alloc]init];\
}\
\
-(id)copy {\
return _csytool;\
}

#else
/** 不是Arc 环境 */
#define scriptH(name) +(instancetype)share##name;
#define scriptM(name) static id _csytool;\
\
+(instancetype)allocWithZone:(struct _NSZone *)zone {\
\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
\
_csytool = [super allocWithZone:zone];\
\
});\
return _csytool;\
}\
\
+(instancetype)share##name {\
\
return [[self alloc]init];\
}\
\
-(id)copy {\
return _csytool;\
}\
\
-(id)mutableCopy {\
\
return _csytool;\
}\
-(instancetype)retain {\
\
return _csytool;\
}\
\
-(oneway void)release {\
\
}\
-(NSUInteger)retainCount {\
\
return MAXFLOAT;\
}
#endif
