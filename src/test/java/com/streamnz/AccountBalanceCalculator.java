package com.streamnz;

/**
 * @Author cheng hao
 * @Date 05/08/2025 22:39
 */
public class AccountBalanceCalculator {


    public double calculateAvailableBalance(double currentBalance, double[] pendingTransactions) {
        for (int i = 0; i <= pendingTransactions.length-1; i++) {
            currentBalance += pendingTransactions[i];
        }
        return currentBalance;
    }


    public static void main(String[] args) {
        AccountBalanceCalculator calc = new AccountBalanceCalculator();
        double balance = calc.calculateAvailableBalance(1000.0, new double[]{-100.0, -50.0, 200.0});
        System.out.println(balance); // Expected: 1050.0
    }
}

