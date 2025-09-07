package com.streamnz;

import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author cheng hao
 * @Date 05/09/2025 22:57
 */
public class Algorithm {

    @Test
    public void test(){
        /**
         * Example 1:
         * Input: s = "anagram", t = "nagaram"
         * Output: true
         * Example 2:
         * Input: s = "rat", t = "car"
         * Output: false
         */
        System.out.println(isAnagram("anagram","nagaram"));
        System.out.println(isAnagram("rat","car"));
    }

    public boolean isAnagram(String s, String t) {
        // edge case
        if(s.length()!= t.length()) return false;
        // sort array and compare
        char[] sArray = s.toCharArray();
        char[] tArray = t.toCharArray();
        Arrays.sort(sArray);
        Arrays.sort(tArray);
        return Arrays.equals(sArray,tArray);

    }
}
