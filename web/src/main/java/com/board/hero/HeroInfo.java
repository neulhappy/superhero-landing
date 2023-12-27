package com.board.hero;



public class HeroInfo {

    private final String heroName;
    private final String name;
    private final String actor;
    private final int age;
    private final String mbti;
    private final int recommend;
    private final String story;

    public HeroInfo(String heroName, String name, String actor, int age, String mbti, int recommend, String story) {
        this.heroName = heroName;
        this.name = name;
        this.actor = actor;
        this.age = age;
        this.mbti = mbti;
        this.recommend = recommend;
        this.story = story;
    }

    public String getHeroName() {
        return heroName;
    }

    public String getName() {
        return name;
    }

    public String getActor() {
        return actor;
    }

    public int getAge() {
        return age;
    }

    public String getMbti() {
        return mbti;
    }

    public int getRecommend() {
        return recommend;
    }

    public String getStory() {
        return story;
    }

}
