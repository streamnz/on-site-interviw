package com.streamnz.adapter;

import java.math.BigDecimal;

/**
 * @Author cheng hao
 * @Date 09/09/2025 16:46
 */
public class AdapterDemo {

    interface legacyPaymentSystem {
        boolean payCents(int cents);
    }

    static class NewToLegacy{
        public boolean payNZD(BigDecimal nzd){
            // new logic
            return nzd.compareTo(BigDecimal.valueOf(100)) < 0;
        }
    }


    static class PaymentAdapter implements legacyPaymentSystem{
        private final NewToLegacy newToLegacy;

        public PaymentAdapter(NewToLegacy newToLegacy) {
            this.newToLegacy = newToLegacy;
        }

        @Override
        public boolean payCents(int cents) {
            BigDecimal nzd = BigDecimal.valueOf(cents).divide(BigDecimal.valueOf(100), 2, BigDecimal.ROUND_HALF_UP);
            return newToLegacy.payNZD(nzd);
        }
    }

    // Client code
    public static void main(String[] args) {
      // Using the legacy payment system interface
      legacyPaymentSystem paymentSystem = new PaymentAdapter(new NewToLegacy());
      int amountInCents = 5000; // $50.00
      boolean paymentResult = paymentSystem.payCents(amountInCents);
      System.out.println("Payment successful: " + paymentResult);
    }
}
