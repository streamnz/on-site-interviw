package com.streamnz.factory;

import java.util.List;

/**
 * @Author cheng hao
 * @Date 09/09/2025 18:58
 */
public class FactoryDemo {

    interface Car {
        void move();
    }

    static class Sedan implements Car {
        @Override
        public void move() {
            System.out.println("Sedan is moving");
        }
    }

    static class SUV implements Car {
        @Override
        public void move() {
            System.out.println("SUV is moving");
        }
    }

    interface CarFactory {
        Car createCar();
    }

    static class SedanFactory implements CarFactory {
        @Override
        public Car createCar() {
            return new Sedan();
        }
    }

    static class SUVFactory implements CarFactory {
        @Override
        public Car createCar() {
            return new SUV();
        }
    }

    public static void main(String[] args) {
        List<CarFactory> carFactories = List.of(new SedanFactory(), new SUVFactory());
        for (CarFactory carFactory : carFactories) {
            Car car = carFactory.createCar();
            car.move();
        }
    }



}
