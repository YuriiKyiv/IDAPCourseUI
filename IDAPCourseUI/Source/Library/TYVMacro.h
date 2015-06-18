//
//  TYVMacro.h
//  IDAPCourseUI
//
//  Created by YURII on 17.06.15.
//  Copyright (c) 2015 YURII. All rights reserved.
//

#define TYVViewGetterSynthesize(viewClass, selector) \
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
\
        return nil; \
    }


#define TYVViewProperty(viewClass, propertyName) \
    @property (nonatomic, strong)   viewClass   *propertyName;

#define TYVViewControllerProperty(viewControllerClass, propertyName, viewClass) \
    @interface viewControllerClass (__TYVPrivateView) \
    TYVViewProperty(viewClass, propertyName) \
    \
    @end \
    \
    @implementation viewControllerClass (__TYVPrivateView) \
     \
    @dynamic propertyName; \
    \
    TYVViewGetterSynthesize(viewClass, propertyName) \
    \
    @end

#define TYVWeakify(objectName) \
    __weak __typeof(objectName) week##objectName = objectName;

#define TYVStrongify(objectName) \
    __strong __typeof(objectName) strong##objectName = week##objectName;

#define TYVStrongifyAndReturnIfNil(objectName) \
    TYVStrongify(objectName)    \
    if  (!strong##objectName) {  \
        return; \
    }