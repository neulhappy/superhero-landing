package com.maze;

import java.util.Random;

public class MazeRoute {
    private String route;

    public MazeRoute(int depth) {
        this.route = RandomRoute(depth);
    }
    public MazeRoute(String route) {
        this.route = route;
    }

    public String RandomRoute(int depth) {
        StringBuilder sb = new StringBuilder();
        Random rd = new Random();
        for (int i = 0; i < depth; i++) {
            sb.append(rd.nextInt(3) + 1);
        }
        return sb.toString();
    }

    public String getRoute() {
        return route;
    }

    //public String proceed(Direction dir) {
     //   route += dir.getValue();
      //  return route;
    //}
}
