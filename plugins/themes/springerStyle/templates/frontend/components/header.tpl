{strip}
    {assign var="showingLogin" value=false}
    {if $requestedPage eq "login" || $requestedPage eq "register"}
        {assign var="showingLogin" value=true}
    {/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        {if $pageTitleTranslated}
            {$pageTitleTranslated|escape} | {$currentJournal->getLocalizedName()|escape}
        {elseif $pageTitle}
            {translate key=$pageTitle} | {$currentJournal->getLocalizedName()|escape}
        {else}
            {$currentJournal->getLocalizedName()|escape}
        {/if}
    </title>
    {load_header context="frontend"}
    {load_stylesheet context="frontend"}

    <style type="text/css">
        :root {ldelim}
            --sp-max-width: {$sp_containerMaxWidth|default:"1200px"};
            --sp-pad-vert:  {$sp_padVert|default:"40px"};
            --sp-pad-side:  {$sp_padSide|default:"24px"};
        {rdelim}
    </style>
</head>
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}">

    <header class="sp-header">
        <div class="sp-container sp-header__inner">
            <a href="{url page="index"}" class="sp-brand">
                <span class="sp-brand__badge">PND</span>
                <span>{$sp_publisherBrand|escape}</span>
            </a>

            <nav class="sp-nav">
                {load_menu name="primary" id="navigationPrimary" ulClass="sp-nav-list"}
            </nav>

            <div class="sp-user-actions">
                {if $isUserLoggedIn}
                    <a href="{url page="submissions"}" class="sp-btn-link">Dashboard</a>
                    <a href="{url page="login" op="signOut"}" class="sp-btn-link">Logout</a>
                {else}
                    <a href="{url page="login"}" class="sp-btn-link">Log in</a>
                {/if}
            </div>
        </div>
    </header>