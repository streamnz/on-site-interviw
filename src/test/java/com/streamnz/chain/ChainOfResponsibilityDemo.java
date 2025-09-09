package com.streamnz.chain;

/**
 * @Author cheng hao
 * @Date 09/09/2025 19:03
 */
public class ChainOfResponsibilityDemo {

    static class Request {
       String token;
       String param;
       int risk;
    }

    interface Handler {
        void setNext(Handler next);
        void handle(Request request);
    }

    static abstract class AbstractHandler implements Handler {
        protected Handler next;
        @Override
        public void setNext(Handler next) {
            this.next = next;
        }
        protected void passToNext(Request request) {
            if (next != null) {
                next.handle(request);
            } else {
                System.out.println("End of chain, request processed");
            }
        }
    }

    static class AuthHandler extends AbstractHandler {
        @Override
        public void handle(Request request) {
            if ("valid-token".equals(request.token)) {
                System.out.println("AuthHandler: Authentication passed");
                passToNext(request);
            } else {
                System.out.println("AuthHandler: Authentication failed");
            }
        }
    }

    static class ParamHandler extends AbstractHandler {
        @Override
        public void handle(Request request) {
            if (request.param != null && !request.param.isEmpty()) {
                System.out.println("ParamHandler: Parameter validation passed");
                passToNext(request);
            } else {
                System.out.println("ParamHandler: Parameter validation failed");
            }
        }
    }

    static class RiskHandler extends AbstractHandler {
        @Override
        public void handle(Request request) {
            if (request.risk < 5) {
                System.out.println("RiskHandler: Risk assessment passed");
                passToNext(request);
            } else {
                System.out.println("RiskHandler: Risk assessment failed");
            }
        }
    }
    public static void main(String[] args) {
        Handler authHandler = new AuthHandler();
        Handler paramHandler = new ParamHandler();
        Handler riskHandler = new RiskHandler();

        authHandler.setNext(paramHandler);
        paramHandler.setNext(riskHandler);

        Request request = new Request();
        request.token = "valid-token";
        request.param = "some-param";
        request.risk = 3;

        authHandler.handle(request);

        System.out.println("---- Testing with invalid token ----");
        Request badRequest = new Request();
        badRequest.token = "invalid-token";
        badRequest.param = "some-param";
        badRequest.risk = 3;

        authHandler.handle(badRequest);
    }
}
