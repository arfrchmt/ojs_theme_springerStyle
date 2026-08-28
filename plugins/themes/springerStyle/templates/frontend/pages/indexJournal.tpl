{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

{* --- 1. SPRINGER MASTHEAD SECTION --- *}
<section class="sp-masthead" style="background-color: {$sp_mastheadBg|escape};">
    <div class="sp-container">
        <div class="sp-masthead__breadcrumbs">
            <span>Home</span> &gt; <span>{$currentJournal->getLocalizedName()|escape}</span>
        </div>

        <div class="sp-masthead__grid">
            <div class="sp-masthead__cover">
                {if $sp_coverUrl}
                    <img src="{$sp_coverUrl|escape}" alt="Journal Cover" />
                {elseif $homepageImage}
                    <img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}" />
                {else}
                    <div class="sp-masthead__cover-placeholder">📖</div>
                {/if}
            </div>

            <div class="sp-masthead__info">
                <h1 class="sp-masthead__title">{$currentJournal->getLocalizedName()|escape}</h1>
                <div class="sp-masthead__model">
                    Publishing model: <span>{$sp_publishingModel|escape}</span>
                </div>
                <div class="sp-masthead__actions">
                    <a href="{url page="about" op="submissions"}" class="sp-btn-submit">
                        Submit your manuscript &rarr;
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

{* --- 2. SUB-NAVIGATION STRIP --- *}
<div class="sp-subnav">
    <div class="sp-container sp-subnav__inner">
        <a href="{url page="about"}">About this journal</a>
        <a href="{url page="issue" op="current"}">Articles &amp; Issues</a>
        <a href="{url page="about" op="submissions"}">For authors</a>
        <a href="{url page="about" op="editorialTeam"}">Editorial board</a>
    </div>
</div>

{* --- 3. MAIN HOMEPAGE CONTENT (2 COLUMNS) --- *}
<div class="sp-container sp-main-layout">
    <main class="sp-main-content">
        <h2 class="sp-section-heading">Overview</h2>
        <div class="sp-overview-box">
            {if $currentJournal->getLocalizedDescription()}
                {$currentJournal->getLocalizedDescription()}
            {else}
                <p>{$sp_footerAbout|escape}</p>
            {/if}
        </div>

        <h2 class="sp-section-heading">Latest Articles</h2>
        {if $publishedSubmissions}
            <div class="sp-articles-list">
                {foreach from=$publishedSubmissions item=article}
                    {include file="frontend/objects/article_summary.tpl" article=$article}
                {/foreach}
            </div>
        {else}
            <div class="cmp_notification">
                <p>This journal has not published any issues yet.</p>
            </div>
        {/if}
    </main>

    {* --- 4. SIDEBAR METRICS WIDGET ALA SPRINGER --- *}
    <aside class="sp-sidebar">
        <div class="sp-sidebar-card">
            <h3 class="sp-sidebar-card__title">Journal metrics</h3>
            
            <div class="sp-metric-item">
                <span class="sp-metric-icon">⚡</span>
                <div>
                    <span class="sp-metric-label">Journal Impact Factor</span>
                    <span class="sp-metric-value">{$sp_metricIF|escape}</span>
                </div>
            </div>

            <div class="sp-metric-item">
                <span class="sp-metric-icon">📈</span>
                <div>
                    <span class="sp-metric-label">5-year Impact Factor</span>
                    <span class="sp-metric-value">{$sp_metric5Y|escape}</span>
                </div>
            </div>

            <div class="sp-metric-item">
                <span class="sp-metric-icon">⏱️</span>
                <div>
                    <span class="sp-metric-label">Submission to first decision</span>
                    <span class="sp-metric-value">{$sp_metricDecision|escape}</span>
                </div>
            </div>

            <div class="sp-metric-item">
                <span class="sp-metric-icon">📥</span>
                <div>
                    <span class="sp-metric-label">Downloads</span>
                    <span class="sp-metric-value">{$sp_metricDownloads|escape}</span>
                </div>
            </div>
        </div>

        <div class="sp-sidebar-card" style="background: #eff6ff; border-color: #bfdbfe;">
            <h3 class="sp-sidebar-card__title" style="color: #1e3a8a;">Publish with us</h3>
            <p style="font-size: 0.88rem; color: #1e40af; margin-bottom: 15px;">Fast peer review, open access visibility, and international indexing.</p>
            <a href="{url page="about" op="submissions"}" class="sp-btn-submit" style="background: #1e40af; color: #ffffff !important; border-radius: 4px; padding: 7px 14px; font-size: 0.85rem;">Author Guidelines</a>
        </div>
    </aside>
</div>

{include file="frontend/components/footer.tpl"}