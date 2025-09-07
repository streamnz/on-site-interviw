package com.streamnz;

import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author cheng hao
 * @Date 06/09/2025 00:03
 */
public class Algorithm217 {

    @Test
    public void test(){

    }
    public boolean containsDuplicate(int[] nums) {
        // map freq count
        if(null == nums || nums.length == 0) return false;

        Map<Integer,Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++){
            Integer f = map.getOrDefault(nums[i],0);
            map.put(nums[i],f);
        }
        for(int i : map.values()){
            if(i > 1){
                return true;
            }
        }
        return false;
    }
}
