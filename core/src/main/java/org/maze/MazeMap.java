package org.maze;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class MazeMap {
    private int mapDepth;
    private int wrongDepth;
    private MazeRoute answer;
    private HashMap<MazeRoute, String> eventRoom;
    private HashSet<Event> event;
    private MazeRoute nowRoute;

    public MazeMap(int mapDepth, int wrongDepth) {
        this.mapDepth = mapDepth;
        this.wrongDepth = wrongDepth;
        this.answer = new MazeRoute(mapDepth);
        this.eventRoom = new HashMap<>();
        this.event = eventMapInitiolize();
        this.nowRoute = new MazeRoute("");
    }

    private HashSet<Event> eventMapInitiolize() {
        return new HashSet<>();
    }


}
