package org.util.hero;



public class HeroInfo {

    private String heroName;
    private String name;
    private String actor;
    private int age;
    private String mbti;
    private int recommend;
    private Status status;
    private String story;

    public HeroInfo(String heroName, String name, String actor, int age, String mbti, int recommend, Status status, String story) {
        this.heroName = heroName;
        this.name = name;
        this.actor = actor;
        this.age = age;
        this.mbti = mbti;
        this.recommend = recommend;
        this.status = status;
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

    public Status getStatus() {
        return status;
    }

    public String getStory() {
        return story;
    }

}
