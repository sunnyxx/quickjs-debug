//
//  main.m
//  main
//
//  Created by sunnyxx on 2019/7/14.
//  Copyright © 2019 sunnyxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "quickjs.h"
#import "quickjs-libc.h"
#import "my-js-module.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // create js env
        JSRuntime *rt = JS_NewRuntime();
        JSContext *ctx = JS_NewContext(rt);
        
        // for console.log()
        js_std_add_helpers(ctx, 0, NULL);
        
        // system modules (optional)
        js_init_module_std(ctx, "std");
        js_init_module_os(ctx, "os");
        
        // load my module
        loadMyJSModule(ctx, "sunnyxx");
        
        // eval js script string
        const char *scripts = "console.log('hello quickjs')";
        JS_Eval(ctx, scripts, strlen(scripts), "main", 0);
        
        // eval js file
        NSString *file = [NSString stringWithContentsOfFile:@"test.js" encoding:NSUTF8StringEncoding error:nil];
        int evalFlags = JS_EVAL_TYPE_MODULE; // it's a must to use 'import' in js
        JS_Eval(ctx, file.UTF8String, file.length, "test.js", evalFlags);
        
        // catch exceptions
        JSValue exception = JS_GetException(ctx);
        if (!JS_IsNull(exception)) {
            NSLog(@"expception: %s", JS_ToCString(ctx, exception));
        }
        
        // dealloc
        JS_FreeContext(ctx);
        JS_FreeRuntime(rt);
    }
    return 0;
}
