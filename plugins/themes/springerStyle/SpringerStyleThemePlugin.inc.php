<?php
import('lib.pkp.classes.plugins.ThemePlugin');

class SpringerStyleThemePlugin extends ThemePlugin {

    public function init() {
        $this->setParent('defaultthemeplugin');
        
        // Load CSS Utama Springer
        $this->addStyle('springerCss', 'styles/springer.css');

        // Font Open Sans & Serif
        $this->addStyle(
            'springerFonts',
            'https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,400&family=Lora:ital,wght@0,400;0,600;1,400&display=swap',
            array('baseUrl' => '')
        );

        // --- 1. MASTHEAD & BRANDING CONTROLS ---
        $this->addOption('springerPublisherBrand', 'text', array(
            'label' => 'Publisher Brand Text (Kiri Atas)',
            'description' => 'Teks label publisher (contoh: Springer Nature Link / SpringerOpen).',
            'default' => 'Springer Nature Link',
        ));

        $this->addOption('springerPublishingModel', 'text', array(
            'label' => 'Publishing Model',
            'description' => 'Model penerbitan jurnal (contoh: Open Access atau Hybrid).',
            'default' => 'Open access',
        ));

        $this->addOption('springerMastheadBg', 'text', array(
            'label' => 'Masthead Background Color (Hex)',
            'description' => 'Warna latar masthead/banner jurnal (contoh: #01324b atau #1e293b).',
            'default' => '#01324b',
        ));

        $this->addOption('springerCoverUrl', 'text', array(
            'label' => 'Custom Journal Cover Image URL',
            'description' => 'URL gambar cover naskah di masthead (opsional).',
            'default' => '',
        ));

        // --- 2. JOURNAL METRICS (SIDEBAR) ---
        $this->addOption('metricImpactFactor', 'text', array(
            'label' => 'Journal Impact Factor Value',
            'description' => 'Nilai Impact Factor (contoh: 2.4 (2025)).',
            'default' => '2.4 (2025)',
        ));

        $this->addOption('metricFiveYearIF', 'text', array(
            'label' => '5-Year Impact Factor Value',
            'description' => 'Nilai 5-year IF (contoh: 2.9 (2025)).',
            'default' => '2.9 (2025)',
        ));

        $this->addOption('metricFirstDecision', 'text', array(
            'label' => 'Submission to First Decision (Median)',
            'description' => 'Kecepatan review pertama (contoh: 16 days).',
            'default' => '16 days',
        ));

        $this->addOption('metricDownloads', 'text', array(
            'label' => 'Annual Downloads Count',
            'description' => 'Jumlah unduhan berkas (contoh: 497.2k (2025)).',
            'default' => '497.2k (2025)',
        ));

        // --- 3. DETAIL PAGE CONTAINER MARGIN & PADDING ---
        $this->addOption('pageContainerMaxWidth', 'text', array(
            'label' => 'Page Container Max-Width',
            'description' => 'Lebar maksimal area konten (contoh: 1200px atau 1280px).',
            'default' => '1200px',
        ));

        $this->addOption('pagePaddingTopBottom', 'text', array(
            'label' => 'Page Vertical Padding (Top/Bottom)',
            'description' => 'Jarak vertikal isi konten terhadap header/footer (contoh: 40px).',
            'default' => '40px',
        ));

        $this->addOption('pagePaddingSide', 'text', array(
            'label' => 'Page Horizontal Padding (Left/Right)',
            'description' => 'Jarak sisi kiri & kanan konten (contoh: 24px).',
            'default' => '24px',
        ));

        // --- 4. FOOTER CONTROLS ---
        $this->addOption('footerBgColor', 'text', array(
            'label' => 'Footer Background Color (Hex)',
            'description' => 'Kode warna latar belakang footer (contoh: #111111, #01324b, atau #1e293b).',
            'default' => '#111111',
        ));

        $this->addOption('footerAbout', 'text', array(
            'label' => 'Footer About Text',
            'description' => 'Deskripsi singkat profil jurnal di footer.',
            'default' => 'An international open access peer-reviewed scientific journal publishing high-impact multidisciplinary research.',
        ));

        // Hook untuk inject variabel ke template Smarty
        HookRegistry::register('TemplateManager::display', array($this, 'injectThemeVariables'));
    }

    public function injectThemeVariables($hookName, $args) {
        $templateMgr = $args[0];

        $templateMgr->assign(array(
            'sp_publisherBrand'    => $this->getOption('springerPublisherBrand') ?: 'Springer Nature Link',
            'sp_publishingModel'   => $this->getOption('springerPublishingModel') ?: 'Open access',
            'sp_mastheadBg'        => $this->getOption('springerMastheadBg') ?: '#01324b',
            'sp_coverUrl'          => $this->getOption('springerCoverUrl') ?: '',
            'sp_metricIF'          => $this->getOption('metricImpactFactor') ?: '2.4 (2025)',
            'sp_metric5Y'          => $this->getOption('metricFiveYearIF') ?: '2.9 (2025)',
            'sp_metricDecision'    => $this->getOption('metricFirstDecision') ?: '16 days',
            'sp_metricDownloads'   => $this->getOption('metricDownloads') ?: '497.2k (2025)',
            'sp_containerMaxWidth' => $this->getOption('pageContainerMaxWidth') ?: '1200px',
            'sp_padVert'           => $this->getOption('pagePaddingTopBottom') ?: '40px',
            'sp_padSide'           => $this->getOption('pagePaddingSide') ?: '24px',
            'sp_footerBgColor'     => $this->getOption('footerBgColor') ?: '#111111',
            'sp_footerAbout'       => $this->getOption('footerAbout') ?: 'An international open access peer-reviewed scientific journal.',
        ));

        return false;
    }

    public function getDisplayName() {
        return 'Springer Nature Academic Theme';
    }

    public function getDescription() {
        return 'Tema jurnal OJS modern mengadopsi estetika portal Springer Nature Link & SpringerOpen.';
    }
}