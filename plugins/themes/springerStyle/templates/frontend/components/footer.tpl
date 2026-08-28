<footer class="sp-footer" style="background-color: {$sp_footerBgColor|escape};">
        <div class="sp-container sp-footer__grid">
            <div class="sp-footer__col">
                <h4>About {$currentJournal->getLocalizedName()|escape}</h4>
                <p>{$sp_footerAbout|escape}</p>
            </div>
            <div class="sp-footer__col">
                <h4>Publish with us</h4>
                <ul class="sp-footer__links">
                    <li><a href="{url page="about" op="submissions"}">Author Guidelines</a></li>
                    <li><a href="{url page="about" op="editorialTeam"}">Editorial Team</a></li>
                    <li><a href="{url page="about"}">Peer Review Policy</a></li>
                    <li><a href="{url page="about" op="privacy"}">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="sp-footer__col">
                <h4>Discover Content</h4>
                <ul class="sp-footer__links">
                    <li><a href="{url page="issue" op="current"}">Latest Issue</a></li>
                    <li><a href="{url page="issue" op="archive"}">Archive</a></li>
                    <li><a href="{url page="about" op="contact"}">Contact the Journal</a></li>
                </ul>
            </div>
        </div>
        <div class="sp-container sp-footer__bottom">
            <span>&copy; {$smarty.now|date_format:"%Y"} {$currentJournal->getLocalizedName()|escape}. Powered by OJS &amp; Springer Nature UI.</span>
            <span>All rights reserved.</span>
        </div>
    </footer>

    {load_script context="frontend"}
</body>
</html>