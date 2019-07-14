//
//  my-js-module.m
//  main
//
//  Created by sunnyxx on 2019/7/14.
//  Copyright © 2019 sunnyxx. All rights reserved.
//

#import "my-js-module.h"

static JSValue my_nslog(JSContext *ctx, JSValueConst this_val, int argc, JSValueConst *argv) {
    if (argc == 1) {
        NSLog(@"%@", [NSString stringWithUTF8String:JS_ToCString(ctx, argv[0])]);
    }
    return JS_UNDEFINED;
}

static const JSCFunctionListEntry js_funcs[] = {
    JS_CFUNC_DEF("NSLog", 1, my_nslog),
};

int myJSModuleInit(JSContext *ctx, JSModuleDef *m) {
    JS_SetModuleExportList(ctx, m, js_funcs, 1);
    return 0;
}

void loadMyJSModule(JSContext *ctx, const char *name) {
    JSModuleDef *m = JS_NewCModule(ctx, name, myJSModuleInit);
    JS_AddModuleExportList(ctx, m, js_funcs, 1);
}
