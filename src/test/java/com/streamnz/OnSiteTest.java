package com.streamnz;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author cheng hao
 * @Date 05/08/2025 22:54
 */
public class OnSiteTest {

    public int[] mergeTransactions(int[] list1, int[] list2) {
        List<Integer> result = new ArrayList<>();
        int i = 0, j = 0;
        // Merge the two sorted lists into one sorted list
        while( i< list1.length && j < list2.length){
            if(list1[i] < list2[j]){
                result.add(list1[i]);
                i++;
            }else if(list1[i] > list2[j]){
                result.add(list2[j]);
                j++;
            }else{
                result.add(list1[i]);
                i++;
                j++;
            }
        }
        // Add remaining elements from list1 or list2
        while(i< list1.length){
            result.add(list1[i]);
            i++;
        }
        while(j < list2.length){
            result.add(list2[j]);
            j++;
        }
        return result.stream().mapToInt(Integer::intValue).toArray();
    }

    public static void main(String[] args) {
        OnSiteTest test = new OnSiteTest();
        int[] list1 = {100, 200, 300, 400};
        int[] list2 = {150, 200, 300, 500};

        int[] mergedList = test.mergeTransactions(list1, list2);
        for (int num : mergedList) {
            System.out.print(num + " ");
        }
    }
}
