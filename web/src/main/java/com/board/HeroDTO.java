package com.board;

public class HeroDTO {
    private int id;
    private String heroname;
    private String realname;
    private String actor;
    private int age;
    // -1은 알 수 없음, -2는 무한대 같은 식으로 자연수 이외의 값은 음수에 할당.

    public void setId(int id) {
        this.id = id;
    }

    public void setHeroname(String heroname) {
        this.heroname = heroname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
