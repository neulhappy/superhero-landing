package com.test;

import com.util.hero.HeroManager;
import com.util.hero.HeroName;

public class HeroInfoExample {
    public static void main(String[] args) {
        HeroManager heroManager = new HeroManager();



        System.out.println(heroManager.getHeroInfo(HeroName.VISION).getActor());
        System.out.println(heroManager.getHeroInfo(HeroName.ANT_MAN).getStatus().humor());
    }
}
