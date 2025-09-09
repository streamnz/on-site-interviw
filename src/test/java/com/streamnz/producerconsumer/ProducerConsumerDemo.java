package com.streamnz.producerconsumer;

import java.util.concurrent.*;

/**
 * @Author cheng hao
 * @Date 09/09/2025 18:39
 */
public class ProducerConsumerDemo {
    public static void main(String[] args) throws InterruptedException {

        BlockingQueue<Integer> queue = new ArrayBlockingQueue<>(2);

        Runnable producer = () -> {
            try {
                for (int i = 0; i < 5; i++) {
                    queue.put(i);
                    System.out.println("Produced: " + i);
                    Thread.sleep(100); // Simulate time taken to produce an item
                }
                queue.put(-1);
                System.out.println("Producer is done");
            } catch (Exception ignored) {
            }
        };

        Runnable consumer = () -> {
            try {
                while (true) {
                    Integer item = queue.take();
                    if (item == -1) {
                        System.out.println("Queue is empty");
                        break;
                    }
                    System.out.println("Consumed: " + item);
                    Thread.sleep(150); // Simulate time taken to consume an item
                }
            } catch (Exception ignored) {
            }
        };

        ExecutorService executor = Executors.newFixedThreadPool(2);
        executor.execute(producer);
        executor.execute(consumer);

        executor.shutdown();
        executor.awaitTermination(1, TimeUnit.SECONDS);

    }
}
