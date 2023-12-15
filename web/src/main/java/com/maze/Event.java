package com.maze;

import java.util.HashSet;
import java.util.function.Function;

public class Event {
    private final int ID;
    private final String Name;
    private final String desc;
    private final HashSet<Event> nextEvent;
    private final Function function;
    private boolean isAble;


//    public int choice(String desc,);

    public Event(int ID, String name, String desc, HashSet<Event> nextEvent, Function function, boolean isAble) {
        this.ID = ID;
        Name = name;
        this.desc = desc;
        this.nextEvent = nextEvent;
        this.function = function;
        this.isAble = isAble;
    }
}
