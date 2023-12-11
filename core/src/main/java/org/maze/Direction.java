package org.maze;

public enum Direction {
    BACKWARD(0),
    FORWARD(1),
    LEFT(2),
    RIGHT(3);

    private final int value;

    Direction(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static Direction getByValue(int value) {
        for (Direction direction : values()) {
            if (direction.value == value) {
                return direction;
            }
        }
        throw new IllegalArgumentException("Invalid Direction value " + value);
    }
}