package com.jiea.mustang.common.exercise;

/**
 * 二分查找算法
 */
public class BinarySearch {

    public static void main(String[] args) {

        int[] arr = {1,3,5,6,9,12,56,89,188};
        System.out.println(binarySearch(arr, 56));


    }

    public static int binarySearch(int[] arr, int tar) {
        int min = 0;
        int max = arr.length - 1;
        while (min <= max) {
            int middle = (min + max) >> 1;
            int middleVal = arr[middle];
            if (middleVal == tar) {
                return middle;
            } else if (middleVal > tar) {
                max = middle - 1;
            } else {
                min = middle + 1;
            }
        }
        return -1;
    }

}
