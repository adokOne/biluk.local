<div class="main">
         
        <header>
            <div class="block-1 fl-l">
                <h1>
                    <a href="/"><?php echo Kohana::lang("main.logo_title") ?></a>
                </h1>
                <div class="slogan fl-l">
                <p><?php echo Kohana::lang("main.logo_title_1") ?></p>
                <p class="ident-top-2"><?php echo Kohana::lang("main.logo_title_2") ?></p>
                <p class="ident-top-2"><?php echo Kohana::lang("main.logo_title_3") ?></p>
                </div>
            </div>
            <div>
             
                <nav class="fl-r">
                    <?php echo widget::render_menu(Kohana::lang("main.header_menu"),"sf-menu sf-js-enabled")?>
                    <div class="clear"></div>
                </nav> 
                <div class="clear"></div>
            </div>
        </header> 
</div>