package com.streamnz.observer;

/**
 * @Author cheng hao
 * @Date 09/09/2025 18:35
 */
public class ListenerDemo {

    interface Listener {
        void onEvent(String event);
    }

    static class EventPublisher {
        private final java.util.List<Listener> listeners = new java.util.ArrayList<>();

        public void registerListener(Listener listener) {
            listeners.add(listener);
        }

        public void notifyEvent(String event) {
            for (Listener listener : listeners) {
                listener.onEvent(event);
            }
        }
    }

    static class EmailListener implements Listener {
        @Override
        public void onEvent(String event) {
            System.out.println("EmailListener received event: " + event);
        }
    }

    static class SMSListener implements Listener {
        @Override
        public void onEvent(String event) {
            System.out.println("SMSListener received event: " + event);
        }
    }

    public static void main(String[] args) {
        EventPublisher publisher = new EventPublisher();
        publisher.registerListener(new EmailListener());
        publisher.registerListener(new SMSListener());

        publisher.notifyEvent("UserSignedUp");
        publisher.notifyEvent("OrderPlaced");
    }
}
