package com.board.hero;

import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

public class HeroManager {
    private Files request;
    private Map<HeroName, HeroInfo> heros = new HashMap<>();

    // 기존 메서드들 유지...

    // 모든 히어로 정보를 가져오는 메서드
    public Map<HeroName, HeroInfo> getAllHeroes() {
        return heros;
    }


    private void init() {
        heros.put(HeroName.DOCTOR_STRANGE, new HeroInfo("닥터 스트레인지",
                "스티븐 빈센트 스트레인지",
                "베너딕트 컴버배치",
                47,
                "INTJ",
                0,
                "천재적인 신경외과 의사 였던 그는 교통사고를 당하게 되고 치료를 위해 힘을 쓰다가 카마르 타지에 들어가 에이션트 원을 만나게 된다. 그 후 피를깎는 수련을 통해 마법을 배워 닥터 스트레인지로 활동하게 된다."));

        heros.put(HeroName.WINTER_SOLDIER, new HeroInfo("윈터솔져",
                "제임스 뷰캐넌 '버키' 반즈",
                "세바스찬 스탠",
                41,
                "ISFP",
                0,
                "어린 시절 캡틴 아메리카의 친구로 제2차 세계 대전에서 사망한줄 알았으나 특수한 장치에 의해 기억이 지워져 하이드라의 인형으로 윈터솔져로 불리며 활동했으나 점점 기억을 되찾고 있다"));

        heros.put(HeroName.BLACK_WIDOW, new HeroInfo("블랙 위도우",
                "나탈리야 알리야노브나 '나타샤' 로마노프",
                "스칼렛 요한슨",
                39,
                "INTP",
                0,
                "어린시절 레드룸에서 훈련받고 KGB소속의 악명 높은 스파이이자 암살자였으나 호크아이가 목숨을 구해준 이후 어벤져스로써 활동한다."));

        heros.put(HeroName.BLACK_PANTHER, new HeroInfo("블랙 팬서",
                "트찰라",
                "채드윅 보즈먼(故)",
                43,
                "ISFP",
                0,
                "와칸다라는 땅에서 태어나 블랙 팬서의 힘과 비브라늄 슈트를 배제한채 와칸다의 부족 도전자와 결투를 해서 이긴 후 정식으로 와칸다의 국왕이 되며 하트 허브를 먹고 블랙팬서로 각성하게 된다."));

        heros.put(HeroName.VISION, new HeroInfo("비즈",
                "비전",
                "폴 베터니",
                52,
                "INFJ",
                0,
                "울트론의 인공 생명체를 육체로 자고 있던 자비스가 깨어나 토니와 배너 박사에 의해 다시 한번 완벽한 울트론이 되어 가던 중 토르가 마인드 스톤을 활성화시키며 비전이 된다. 경계하는 어벤져스를 설득하여 어벤져스에 합류한다."));

        heros.put(HeroName.SCARLET_WITCH, new HeroInfo("스칼렛 위치",
                "완다 막시모프",
                "엘리자베스 올슨",
                34,
                "INFP",
                0,
                "가족을 모두 잃고 울트론 저지 때 쌍둥이 오빠를 잃고 고향 소코비아가 박살이 나버린 비운의 캐릭터이다. 울트론의 탄생에 기여하고 시빌워 사태의 방아쇠로 빌런같이 등장하였으나 자신의 행동에 큰 책임감을 느끼며 속죄를 위해 히어로 활동을 한다. "));

        heros.put(HeroName.STAR_LORD, new HeroInfo("스타로드",
                "피터 제이슨 퀼",
                "크리스 프랫",
                44,
                "ESTP",
                0,
                "어린 시절 어머니를 잃고 외계인 도적단에 납치 되어 그들 밑에서 성장하였다. 트라우마 때문에 지구를 가지 않으며 우주를 떠돌며 가디언즈 오브 갤럭시의 리더로써 활동한다."));

        heros.put(HeroName.SPIDER_MAN, new HeroInfo("스파이더맨",
                "피터 파커",
                "토머스 스탠리 '톰' 홀랜드",
                27,
                "ENFP",
                0,
                "방사능 거미에 물리며 강한 완력과 벽을 기어오를 수 있는 등 거미와 관한 능력이 생긴다. 웹 슈터를 제작하여 거미줄을 발사하며 친절한 이웃 스파이더맨으로 활동한다.(1대, 2대 스파이더맨도 있으나 여기서는 3대 스파이더맨만 다루겠다.)"));

        heros.put(HeroName.IRON_MAN, new HeroInfo("아이언맨",
                "토니 스타크",
                "로버트 다우니 주니어",
                58,
                "ENTP",
                0,
                "스타크 인더스트리의 CEO였던 그는 테러리스트에게 납치를 당하게 되고 자신의 회사가 만든 무기들이 안좋게 사용되는 것을 본다. 이 후 최초의 슈트인 Mk.1을 제작하여 테러리스트에게서 탈출, 그 후 슈트를 개발하며 아이언맨으로 활동한다."));

        heros.put(HeroName.ANT_MAN, new HeroInfo("앤트맨",
                "스콧 에드워드 해리스 랭",
                "폴 스테판 러드",
                54,
                "ESFJ",
                0,
                "좀도둑인 스콧 랭은 출소 후 정직한 삶을 찾으려 했으나 전과 때문에 직장을 구하지 못하고 금고를 털다가 앤트맨 슈트를 발견하게 된다. 이후 다시 감옥에 갇히지만 1대 앤트맨인 행크의 도움으로 빠져나오게 되고 2대 앤트맨이 된다."));

        heros.put(HeroName.WAR_MACHINE, new HeroInfo("워머신",
                "제임스 루퍼트 '로디' 로즈",
                "도널드 프랭크 치들 주니어",
                59,
                "ESFJ",
                0,
                "현역 미군 장교이며 토니 스타크의 절친으로 토니와 마찰이 일어나며 토니의 슈트중 하나를 입고 토니와 싸움 후 복귀, 슈트를 개조하여 후일 워머신인 아이언맨의 보조 사이드킥으로 활동하게 된다."));

        heros.put(HeroName.CAPTAIN_AMERICA, new HeroInfo("캡틴 아메리카",
                "스티븐 그랜트 '스티브' 로저스",
                "크리스토퍼 로버트 에번스",
                42,
                "ISFJ",
                0,
                "허약한 신체 때문에 군 입대를 거부 당했지만 끊임없이 노력하던 중 슈퍼솔져 프로젝트에 스카웃되고 슈퍼혈청을 맞아서 인간의 한계를 넘어서는 신체 능력을 가지게 된다. 이 후 하워드 스타크(토니의 아버지)가 만들어준 비브라늄 방패를 들고 활동하게 된다."));

        heros.put(HeroName.THOR, new HeroInfo("천둥의 신 (토르)",
                "토르 오딘슨",
                "크리스 햄스워스",
                40,
                "ESFP",
                0,
                "오딘과 프리가의 맏아들로 지구가 아닌 아스가르드인이다. 아버지인 오딘에 의해 힘을 잃고 지구로 추방당하고 묠니르를 들지 못하게 되었으나 디스트로이어와 싸움중 묠니르가 토르를 인정하고 토르에게 날아가 토르는 다시 본래의 힘을 되찾는다. 이후 어벤져스에 합류하며 신이지만 히어로로 활동하게 된다."));

        heros.put(HeroName.FALCON, new HeroInfo("팔콘",
                "새뮤얼 토머스 '샘' 윌슨",
                "앤서니 매키",
                45,
                "INFP",
                0,
                "경험 많은 퇴역군인으로써 미 공군 파라레스큐에서 실전에 응용되는 EXO슈트를 착용한다. 슈트 자체는 워머신과 아이언맨 슈트랑 비교하면 하위호환으로 보이지만 착용자의 뛰어난 전투 센스로 비초인 히어로지만 밀리지않는 모습으로 활동한다."));

        heros.put(HeroName.HULK, new HeroInfo("헐크",
                "로버트 브루스 배너",
                "마크 앨런 러팔로",
                56,
                "INTP",
                0,
                "천재적인 과학자였으나 썬더볼트 로스 장군에게 속아 자신의 몸에 감마선 피폭 실험을 진행하였고 이 후 화가 나거나 흥분하면 헐크라는 폭력적인 괴생명체로 변하게 된다. 다른 히어로와 다르게 헐크는 히어로 명칭이라기보다는 화가 났을때 나오는 자신의 또다른 인격체의 이름이다."));

        heros.put(HeroName.HAWK_EYE, new HeroInfo("호크 아이",
                "클린턴 프랜시스 '클린트' 바튼",
                "제레미 리 레너",
                52,
                "ISFJ",
                0,
                "초능력은 없지만 뛰어난 저격실력과 타고난 전투센스와 판단력 등으로 어벤져스의 원년 멤버이다."));

    }

    public HeroManager() {
        init();

//        heros.forEach((key,value)->{});
    }


    //히어로 정보 가져오기 (getHeroInfo쓰는 곳엔 모두 try catch문 사용)
    public HeroInfo getHeroInfo(HeroName heroName){
        HeroInfo heroInfo = heros.get(heroName);
       if(heroInfo == null){
           throw new IllegalArgumentException("[ERROR] 존재하지 않는 영웅 이름입니다."); // 예외 처리
       }
        return heroInfo;
   }

}

