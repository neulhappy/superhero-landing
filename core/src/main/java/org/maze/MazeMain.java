package org.maze;
public class MazeMain {
    boolean isChoice;


    public boolean action(int action) {
        if (action >= 0 && action <= 4) {
            if (isChoice) {
//                Event
            } else {
//                Direct
            }
            return true;
        } else {
            return false;
        }
    }
}
