package org.util.hero;

public enum HeroName {
    DOCTOR_STRANGE("닥터 스트레인지"),
    WINTER_SOLDIER("윈터솔져"),
    BLACK_WIDOW("블랙 위도우"),
    BLACK_PANTHER("블랙 팬서"),
    VISION("비즈"),
    SCARLET_WITCH("스칼렛 위치"),
    STAR_LORD("스타로드"),
    SPIDER_MAN("스파이더맨"),
    IRON_MAN("아이언맨"),
    ANT_MAN("앤트맨"),
    WAR_MACHINE("워머신"),
    CAPTAIN_AMERICA("캡틴 아메리카"),
    THOR("천둥의 신 (토르)"),
    FALCON("팔콘"),
    HULK("헐크"),
    HAWK_EYE("호크 아이"),
    ;

    private final String name;

    HeroName(String name) {
        this.name = name;
    }
}
