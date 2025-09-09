package com.streamnz.builder;

import lombok.AllArgsConstructor;

/**
 * @Author cheng hao
 * @Date 10/09/2025 11:48
 */
public class BuilderDemo {

    // Builder Pattern Example
    @AllArgsConstructor
    static class Computer {
        private final String CPU;
        private final String RAM;
        private final String storage;
        private final String GPU;
        private final String OS;
        private final boolean isBluetoothEnabled;
        @Override
        public String toString() {
            return "Computer{" +
                    "CPU='" + CPU + '\'' +
                    ", RAM='" + RAM + '\'' +
                    ", storage='" + storage + '\'' +
                    ", GPU='" + GPU + '\'' +
                    ", OS='" + OS + '\'' +
                    ", isBluetoothEnabled=" + isBluetoothEnabled +
                    '}';}
    }

    static class ComputerBuilder {
        private String CPU;// essential
        private String RAM; // essential
        private String storage; //essential
        private String GPU;
        private String OS;
        private boolean isBluetoothEnabled;

        // No-arg constructor
        private ComputerBuilder() {}
        public ComputerBuilder(String CPU, String RAM, String storage) {
            this.CPU = CPU;
            this.RAM = RAM;
            this.storage = storage;
        }
        public ComputerBuilder setGPU(String GPU) {
            this.GPU = GPU;
            return this;
        }

        public ComputerBuilder setOS(String OS) {
            this.OS = OS;
            return this;
        }

        public ComputerBuilder setBluetoothEnabled(boolean bluetoothEnabled) {
            isBluetoothEnabled = bluetoothEnabled;
            return this;
        }

        public Computer build() {
            return new Computer(CPU, RAM, storage, GPU, OS, isBluetoothEnabled);
        }
    }

    public static void main(String[] args) {
        Computer gamingPC = new ComputerBuilder("Intel i9", "32GB", "1TB SSD")
                .setGPU("NVIDIA RTX 4090")
                .setOS("Windows 11")
                .setBluetoothEnabled(true)
                .build();

        Computer officePC = new ComputerBuilder("Intel i5", "16GB", "512GB SSD")
                .setOS("Windows 11")
                .build();

        System.out.println("Gaming PC: " + gamingPC);
        System.out.println("Office PC: " + officePC);
    }
}
