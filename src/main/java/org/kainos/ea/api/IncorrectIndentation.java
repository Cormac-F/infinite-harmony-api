package org.kainos.ea.api;

public class IncorrectIndentation {
    public static void main(String[] args) {
        System.out.println("Incorrectly Indented Method");
    }

    public void someMethod() {
        int x = 5;
        if (x > 0) {
            System.out.println("x is positive");
        } else {
            System.out.println("x is non-positive");
        }
    }
}
