package org.maze;

import java.util.Arrays;

import static org.util.Tester.stringOutput;

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
