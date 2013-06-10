<html lang="en">
        <?php include Kohana::find_file("views","header"); ?>
    <body>
        <?php include Kohana::find_file("views","header_menu");?>
        <div class="main-bg">
        <div class="main">
         
        <section id="content" class="p6">
        <div class="main-2 ident-bot-11">
        <div class="wrapper ident-bot-3">
        <div class="fl-l ident-right-2">
            <ul class="kwicks horizontal" >
                <li id="kwick_1">
                    <div class="kwick-box-1">
                        <div class="kwick-bg-1">
                            <div class="fl-l">
                                <p class="kwick-slogan-1">
                                    <?php echo Kohana::lang("main.hope")?>
                                </p>
                                <p class="kwick-slogan-2">
                                    <?php echo Kohana::lang("main.hope_2")?>
                                </p>
                            </div>
                            <a class="kwiks-button fl-r" href="/pages/priednyuytes-do-nas">
                                <?php echo Kohana::lang("main.read_more");?>
                            </a>
                            <div class="clear"></div>
                        </div>
                    </div>
                </li>
                <li id="kwick_2" >
                    <div class="kwick-box-1">
                        <div class="kwick-bg-2">
                            <div class="fl-l">
                                <p class="kwick-slogan-1">
                                    <?php echo Kohana::lang("main.save_ea")?>
                                </p>
                                <p class="kwick-slogan-2">
                                    <?php echo Kohana::lang("main.save_ea_2")?>
                                </p>
                            </div>
                            <a class="kwiks-button fl-r" href="/pages/priednyuytes-do-nas">
                                <?php echo Kohana::lang("main.read_more");?>
                            </a>
                            <div class="clear"></div>
                        </div>
                    </div>
                </li>
                <li id="kwick_3">
                    <div class="kwick-box-1">
                        <div class="kwick-bg-3">
                            <div class="fl-l">
                                <p class="kwick-slogan-1">
                                    <?php echo Kohana::lang("main.help_ch")?>
                                </p>
                                <p class="kwick-slogan-2">
                                    <?php echo Kohana::lang("main.help_ch_2")?>
                                </p>
                            </div>
                            <a class="kwiks-button fl-r" href="/pages/priednyuytes-do-nas">
                                <?php echo Kohana::lang("main.read_more");?>
                            </a>
                            <div class="clear"></div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="extra-wrap">
            <a class="button-3 ident-bot-12" href="/problems">
                <?php echo Kohana::lang("main.problems_map");?>
            </a>
        <p class="h1 ident-bot-13">
            <?php echo Kohana::lang("main.hellow");?>
        </p>
        <div class="h2 ident-bot-7">
        <p class="ident-top-4"><?php echo Kohana::lang("main.we_are") ?></p>
        </div>
        <p class="block-3">
            <?php echo Kohana::lang("main.we_are_desc");?>
        </p>
        </div>
        </div>
        <div class="wrapper block-2 ident-bot-10">
            <div class="col-1">
                <div class="col-head">
                    <div class="wrapper">
                    <img class="fl-l ident-right-3" src="images/icon-1.png" alt="">
                    <div class="extra-wrap ident-top-5">
                        <?php echo Kohana::lang("main.JOIN_US");?>
                    </div>
                    </div>
                </div>
                <div class="inner-ident-1">
                    <p style="height: 120px;" class="ident-bot-1">
                         <?php echo Kohana::lang("main.JOIN_US_text");?>
                    </p>
                    <a class="button-2" href="/pages/priednyuytes-do-nas">
                        <?php echo Kohana::lang("main.read_more");?>
                    </a>
                </div>
            </div>
            <div class="col-2">
            <div class="col-head-2">
                <div class="wrapper">
                    <img class="fl-l ident-right-3" src="images/icon-2.png" alt="">
                    <div class="extra-wrap ident-top-5">
                     <?php echo Kohana::lang("main.OUR_MISSION");?>
                    </div>
                </div>
            </div>
                <div class="inner-ident-2">
                    <p style="height: 120px;" class="ident-bot-1">
                        <?php echo Kohana::lang("main.OUR_MISSION_text");?>
                    </p>
                    <a class="button-2" href="/pages/nashi-tsili">
                        <?php echo Kohana::lang("main.read_more");?>
                    </a>
                </div>
            </div>
            <div class="col-3">
                <div class="col-head-2">
                    <div class="wrapper">
                        <img class="fl-l ident-right-3" src="images/icon-3.png" alt="">
                        <div class="extra-wrap ident-top-5">
                        <?php echo Kohana::lang("main.OUR_projects");?>
                        </div>
                    </div>
                </div>
                <div class="inner-ident-2">
                    <p style="height: 120px;" class="ident-bot-1">
                        <?php echo Kohana::lang("main.OUR_projects_text");?>
                    </p>
                <a class="button-2" href="/pages/nashi-proectu">
                    <?php echo Kohana::lang("main.read_more");?>
                </a>
                </div>
            </div>
        </div>
        <div class="line"></div>
        </div>
        <div class="container_24">
            <div class="wrapper">
                <div class="grid_6 suffix_1">
                    <h2 class="ident-bot-3">
                        <?php echo Kohana::lang("main.MEET_OUR_TEAM");?>
                    </h2>
                    <?php foreach($members as $member):?>
                        <div class="wrapper ident-bot-4">
                            <img class="fl-l ident-top-3 ident-right-1" src="/upload/avatars/<?php echo $member->id?>/pic_105.jpg" alt="">
                            <div class="extra-wrap">
                            <p>
                                <strong class="strong1">
                                    <a href="#"><?php echo $member->name; ?></a>
                                </strong>
                            </p>
                            <p>
                                <?php echo text::limit_chars($member->about,50,"...");?>
                            </p>
                            </div>
                        </div>
                    <?php endforeach;?>
                    <a class="button" href="/about">
                        <?php echo Kohana::lang("main.read_more");?>
                    </a>
                </div>
                <div class="grid_17">
                    <div class="wrapper ident-bot-8 ">
                        <h2 class="ident-bot-3">
                            <?php echo Kohana::lang("main.news_on_main");?>
                        </h2>
                        <div class="wrapper ident-bot-4">
                            <img class="fl-l ident-top-3 ident-right-1" src="/upload/news/h_<?php echo $important_news->id?>.jpg" alt="">
                            <div class="extra-wrap">
                                <p class="ident-bot-5">
                                    <strong class="strong1">
                                        <?php echo $important_news->title?>
                                    </strong>
                                </p>
                                <p class="ident-bot-7">
                                    <?php echo text::limit_chars($important_news->anons,250,"...")?>
                                </p>
                                <a class="button" href="/news/<?php echo $important_news->seo_name?>"><?php echo Kohana::lang("main.read_more");?></a>
                            </div>
                        </div>
                    </div>
                    <div class="wrapper">
                        <h2 class="ident-bot-9">
                            <?php echo Kohana::lang("main.hope_in_action")?>
                        </h2>
                        <div class="grid_6 suffix_1 alpha" style="padding-right:0;width:250px">
                            <?php $news = array_chunk($news, 2);?>
                            <ul class="list-1">
                                <?php foreach($news[0] as $n):?>
                                    <li>
                                        <a href="/news/<?php echo $n->seo_name?>">
                                            <?php echo text::limit_chars($n->title,30,"...") ?>
                                        </a>
                                    </li>
                                <?php endforeach;?>
                            </ul>
                        </div>
                        <div class="grid_6 suffix_1 omega" style="padding-right:0;width:250px">
                            <ul class="list-1">
                                <?php foreach($news[1] as $n):?>
                                    <li>
                                        <a href="/news/<?php echo $n->seo_name?>">
                                            <?php echo text::limit_chars($n->title,30,"...") ?>
                                        </a>
                                    </li>
                                <?php endforeach;?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section> 
        </div>
        </div>


        <?php include Kohana::find_file("views","footer"); ?>
         

    </body>
</html>