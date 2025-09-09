package com.streamnz.strategy;

import java.math.BigDecimal;

/**
 * @Author cheng hao
 * @Date 09/09/2025 16:33
 */
public class StrategyDemo {

    interface PriceStrategy {
        BigDecimal calculatePrice(BigDecimal price);
    }

    static class NormalPriceStrategy implements PriceStrategy {
        @Override
        public BigDecimal calculatePrice(BigDecimal price) {
            return price;
        }
    }

    static class MemberPriceStrategy implements PriceStrategy {
        private static final BigDecimal DISCOUNT_RATE = BigDecimal.valueOf(0.9);
        @Override
        public BigDecimal calculatePrice(BigDecimal price) {
            return price.multiply(DISCOUNT_RATE); // 10% discount for members
        }
    }

    static class PromotionPriceStrategy implements PriceStrategy {
        @Override
        public BigDecimal calculatePrice(BigDecimal price) {
            if(price.compareTo(BigDecimal.valueOf(100)) < 0) {
                return price; // No discount for prices below 100
            }
            return price.subtract(BigDecimal.valueOf(20)); // Flat $20 discount for prices 100 and above
        }
    }

    static class Checkout {
        private PriceStrategy priceStrategy;

        public Checkout(PriceStrategy priceStrategy) {
            this.priceStrategy = priceStrategy;
        }

        public void setPriceStrategy(PriceStrategy priceStrategy) {
            this.priceStrategy = priceStrategy;
        }

        public BigDecimal calculateFinalPrice(BigDecimal price) {
            return priceStrategy.calculatePrice(price);
        }
    }

    public static void main(String[] args) {
        BigDecimal price = new BigDecimal("100");

        Checkout checkout = new Checkout(new NormalPriceStrategy());
        System.out.println("Normal Price: " + checkout.calculateFinalPrice(price));

        checkout.setPriceStrategy(new MemberPriceStrategy());
        System.out.println("Member Price: " + checkout.calculateFinalPrice(price));

        checkout.setPriceStrategy(new PromotionPriceStrategy());
        System.out.println("Promotion Price: " + checkout.calculateFinalPrice(price));
    }

}
