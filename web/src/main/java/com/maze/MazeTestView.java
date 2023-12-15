package com.maze;

import java.util.Arrays;

import static com.util.Tester.stringOutput;

public class MazeTestView {
    String[] background;
    String[] textBox;

    public void mazeView() {
        stringOutput(""
                , "########################################"
                , "##########       테스트 뷰      ##########"
                , "########################################"
                , Arrays.toString(background)
                , "########################################"
                , Arrays.toString(textBox)
                , "########################################");
    }

}
