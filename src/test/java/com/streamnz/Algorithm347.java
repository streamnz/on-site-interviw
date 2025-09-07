package com.streamnz;

import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.PriorityQueue;

/**
 * @Author cheng hao
 * @Date 07/09/2025 01:22
 */
public class Algorithm347 {

    @Test
    public void test(){
        /**
         nums =
         [4,1,-1,2,-1,2,3]
         k = 2
         */
        int[] r = topKFrequent(new int[]{5,2,5,3,5,3,1,1,3},2);
        for(int i : r){
            System.out.print(i + " ");
        }
        System.out.println();
    }

    public int[] topKFrequent(int[] nums, int k) {
        if(nums == null || k == 0) return new int[0];

        // frequent map
        Map<Integer,Integer> map = new HashMap<>();
        for(int n : nums){
            map.put(n,map.getOrDefault(n,0)+1);
        }

        // PriorityQueue int 0:element 1:frequent order desc by frequent
        PriorityQueue<int[]> p = new PriorityQueue<>((m, n)->Integer.compare(n[1],m[1]));
        for(Map.Entry<Integer,Integer> entry: map.entrySet()){
            Integer key = entry.getKey();
            Integer freq = entry.getValue();
            if(p.size() > k){
                if(null != p.peek() && p.peek()[1] < freq){
                    p.poll();
                    p.offer(new int[]{key,freq});
                }
            }else{
                p.offer(new int[]{key,freq});
            }
        }

        // construct result
        int[] res = new int[k];
        for(int i = 0; i < k; i++){
            res[i] = Objects.requireNonNull(p.poll())[0];
        }
        return res;
    }
}
