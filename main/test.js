"use strip";

import * as std from "std";
import * as os from "os";

// test bubble sort
function bubbleSort(arr) {
    var len = arr.length;
    for (var i = 0; i < len; i++) {
        for (var j = 0; j < len - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                var temp = arr[j + 1];
                arr[j + 1] = arr[j];
                arr[j] = temp;
            }
        }
    }
    return arr;
}
var arr = [3, 44, 38, 5, 47, 15, 36, 26, 27, 2, 46, 4, 19, 50, 48];
console.log("bubble sort before: " + arr);
console.log("bubble sort after: " + bubbleSort(arr));

// test my module
import * as sunnyxx from "sunnyxx";
sunnyxx.NSLog("I'm NSLog from native module");
