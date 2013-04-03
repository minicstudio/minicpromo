<?php 
/*
* minicskeleton - a module template for Prestashop v1.5+
* Copyright (C) 2013 S.C. Minic Studio S.R.L.
* 
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

if (!defined('_PS_VERSION_'))
  exit;
 
class MinicPromo extends Module
{
	// DB file
	const INSTALL_SQL_FILE = 'install.sql';

	private $module_path;
	private $admin_tpl_path;
	private $front_tpl_path;
	private $hooks_tpl_path;

	public function __construct()
	{
		$this->name = 'minicpromo';
		$this->tab = 'front_office_features';
		$this->version = '1.0';
		$this->author = 'minic studio';
		$this->need_instance = 0;
		$this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.6'); 
		// $this->dependencies = array('blockcart');

		parent::__construct();

		$this->displayName = $this->l('Minic Promo');
		$this->description = $this->l('An easy to use promotion modul for your shop.');

		$this->confirmUninstall = $this->l('Are you sure you want to uninstall?');

		// Paths
		$this->module_path 		= _PS_MODULE_DIR_.$this->name.'/';
		$this->admin_tpl_path 	= _PS_MODULE_DIR_.$this->name.'/views/templates/admin/';
		$this->front_tpl_path	= _PS_MODULE_DIR_.$this->name.'/views/templates/front/';
		$this->hooks_tpl_path	= _PS_MODULE_DIR_.$this->name.'/views/templates/hooks/';
		
	}

	/**
 	 * install
	 */
	public function install()
	{
		// Create DB tables - uncomment below to use the install.sql for database manipulation
		/*
		if (!file_exists(dirname(__FILE__).'/'.self::INSTALL_SQL_FILE))
			return false;
		else if (!$sql = file_get_contents(dirname(__FILE__).'/'.self::INSTALL_SQL_FILE))
			return false;
		$sql = str_replace(array('PREFIX_', 'ENGINE_TYPE'), array(_DB_PREFIX_, _MYSQL_ENGINE_), $sql);
		// Insert default template data
		$sql = str_replace('THE_FIRST_DEFAULT', serialize(array('width' => 1, 'height' => 1)), $sql);
		$sql = str_replace('FLY_IN_DEFAULT', serialize(array('width' => 1, 'height' => 1)), $sql);
		$sql = preg_split("/;\s*[\r\n]+/", trim($sql));

		foreach ($sql as $query)
			if (!Db::getInstance()->execute(trim($query)))
				return false;
		*/

		$promo_desc = array(
			'description' => 'Your promotion description.',
			'activator_title' => 'Promotion',

			'title' => array(
				'promo_title' => 'The title of your promotion.',
				'link' => 'http://minic.ro/en/',
				'title_color' => '#ccc',
				'title_size' => 24,
				'title_unit' => 'px',
				'title_line_height' => 1
			),

			'border' => array(
				'border_width' => '1px',
				'border_style' => 'solid',
				'border_color' => '#cecece',
				'border_radius' => 4,
				'border_radius_unit' => 'px'
 			),

			'position' => 'left',

			'background' => '#ccc',

			'dimension' => array(
				'width' => 300,
				'width_unit' => 'px',
				'height' => 250,
				'height_unit' => 'px',
				'padding' => 20,
				'padding_unit' => 'px'
			),
			'animation' => array(
				'duration' => 500,
				'easing' => 'snap'
			)
			
		);

		if (!parent::install() || 
			!$this->registerHook('displayFooter') || 
			!$this->registerHook('displayHeader') || 
			!$this->registerHook('displayBackOfficeHeader') || 
			!$this->registerHook('displayAdminHomeQuickLinks') || 
			!Configuration::updateValue(strtoupper($this->name).'_START', 1) || 
			!Configuration::updateValue('MINIC_PROMOTION', serialize($promo_desc)))
			return false;
		return true;
	}

	/**
 	 * uninstall
	 */
	public function uninstall()
	{
		if (!parent::uninstall() ||
			!Configuration::deleteByName(strtoupper($this->name).'_START') ||
			!Configuration::deleteByName('MINIC_PROMOTION') ||
			!Configuration::deleteByName('MINIC_PROMOTION_TEXTS'))
			return false;
		return true;
	}

	/**
 	 * admin page
	 */	
	public function getContent()
	{
		$languages = Language::getLanguages(false);
		$message = array(
			'message' => false,
			'type' => 'conf'
			);

		// Image upload
		if(Tools::isSubmit('submitSettings')){
			$message = $this->saveSettings();

			if(!empty($_FILES['file']['name']) && $message['type'] == 'conf'){

				// Check image size and format
				if(!$message['message'] = ImageManager::validateUpload($_FILES['file'], 1048576)){
					if(!ImageManager::resize($_FILES['file']['tmp_name'], dirname(__FILE__).'/upload/minicpromo_background.jpg')){
						$message = array(
							'message' => $this->l('An error occured during the upload, please check the permissions.'),
							'type' => 'error'
						);
					}
				}else{
					$message['type'] = 'error';
				}
			}

						
		}



		// Smarty for admin
		$this->smarty->assign('minic', array(
			'first_start' 	 => Configuration::get(strtoupper($this->name).'_START'),

			'post_action' => 'index.php?tab=AdminModules&configure='.$this->name.'&token='.Tools::getAdminTokenLite('AdminModules').'&tab_module='. $this->tab .'&module_name='.$this->name,

			'admin_tpl_path' => $this->admin_tpl_path,
			'front_tpl_path' => $this->front_tpl_path,
			'hooks_tpl_path' => $this->hooks_tpl_path,

			'info' => array(
            	'name'      => Configuration::get('PS_SHOP_NAME'),
        		'domain'    => Configuration::get('PS_SHOP_DOMAIN'),
        		'email'     => Configuration::get('PS_SHOP_EMAIL'),
        		'version'   => $this->version,
            	'psVersion' => _PS_VERSION_,
        		'server'    => $_SERVER['SERVER_SOFTWARE'],
        		'php'       => phpversion(),
        		'mysql' 	=> Db::getInstance()->getVersion(),
        		'theme' 	=> _THEME_NAME_,
        		'userInfo'  => $_SERVER['HTTP_USER_AGENT'],
        		'today' 	=> date('Y-m-d'),
        		'module'	=> $this->name,
        		'context'	=> (Configuration::get('PS_MULTISHOP_FEATURE_ACTIVE') == 0) ? 1 : ($this->context->shop->getTotalShops() != 1) ? $this->context->shop->getContext() : 1,
			)
		));
			
		// Change first start
		if(Configuration::get(strtoupper($this->name).'_START') == 1)
			Configuration::updateValue(strtoupper($this->name).'_START', 0);

		$texts = array();

		foreach ($languages as $key => $lang) {
			$texts[$lang['id_lang']] = unserialize(Configuration::get('MINIC_PROMOTION_TEXTS', $lang['id_lang']));
		}

		$texts['flags']['activator'] = $this->displayFlags($languages, $this->context->language->id, 'activator¤title¤description¤link', 'activator', true);
		$texts['flags']['title'] = $this->displayFlags($languages, $this->context->language->id, 'activator¤title¤description¤link', 'title', true);
		$texts['flags']['description'] = $this->displayFlags($languages, $this->context->language->id, 'activator¤title¤description¤link', 'description', true);
		$texts['flags']['link'] = $this->displayFlags($languages, $this->context->language->id, 'activator¤title¤description¤link', 'link', true);

		// p($texts);

		$this->context->smarty->assign('promo', array(
			'settings' => unserialize(Configuration::get('MINIC_PROMOTION')),
			'texts' => $texts,
			'error' => $message,
			'image' => (file_exists(dirname(__FILE__).'/upload/minicpromo_background.jpg')) ? true : false,
			'languages' => $languages,
			'default_lang' => $this->context->language->id
		));

		return $this->display(__FILE__, 'views/templates/admin/minicpromo.tpl');
	}

	public function saveSettings()
	{

		$message = '';
		if(!Validate::isUnsignedFloat(Tools::getValue('title-font-size')))
			$message .= $this->l('Add value between 16 - 40.'). '<br>';

		if(!Validate::isUnsignedFloat(Tools::getValue('border-width')))
			$message .= $this->l('Ez nem jo szam'). '<br>';
				

		$promo_desc = array(

			'title' => array(
				'title_color' => Tools::getValue('title-color'),
				'title_size' => Tools::getValue('title-font-size'),
				'title_unit' => Tools::getValue('title-size-unit'),
				'title_line_height' => Tools::getValue('title-line-height')
			),

			'border' => array(
				'border_width' => Tools::getValue('border-width'),
				'border_style' => Tools::getValue('border-style'),
				'border_color' => Tools::getValue('border-color'),
				'border_radius' => Tools::getValue('border-radius'),
				'border_radius_unit' => Tools::getValue('border-radius-unit')
 			),

			'position' => Tools::getValue('position'),

			'background' => Tools::getValue('background-color'),

			'dimension' => array(
				'width' => Tools::getValue('width'),
				'width_unit' => Tools::getValue('width-unit'),
				'height' => Tools::getValue('height'),
				'height_unit' => Tools::getValue('height-unit'),
				'padding' => Tools::getValue('padding'),
				'padding_unit' => Tools::getValue('padding-unit')
			),
			'animation' => array(
				'duration' => Tools::getValue('duration'),
				'easing' => Tools::getValue('easing')
			)
			
		);

		if(!$message){
			Configuration::updateValue('MINIC_PROMOTION', serialize($promo_desc));
			$texts = array();
			$languages = Language::getLanguages(false);

			foreach ($languages as $key => $lang) {
				$activator = Tools::getValue('activator_'.$lang['id_lang']);
				$title = Tools::getValue('title_'.$lang['id_lang']);
				$description = Tools::getValue('description_'.$lang['id_lang']);
				$link = Tools::getValue('link_'.$lang['id_lang']);
				$texts[$lang['id_lang']] = serialize(array(
					'activator' 	=> ($activator) ? $activator : Tools::getValue('activator_'.Configuration::get('PS_LANG_DEFAULT')),
					'title' 		=> ($title) ? $title : Tools::getValue('title_'.Configuration::get('PS_LANG_DEFAULT')),
					'description' 	=> ($description) ? $description : Tools::getValue('description_'.Configuration::get('PS_LANG_DEFAULT')),
					'link' 			=> ($link) ? $link : Tools::getValue('link_'.Configuration::get('PS_LANG_DEFAULT'))
				));
			}


			Configuration::updateValue('MINIC_PROMOTION_TEXTS', $texts);

			return array(
				'message' => $this->l('Settings are saved!'),
				'type' => 'conf'
				);
		}

		return array(
			'message' => $message,
			'type' => 'error'
			);
	}

	// BACK OFFICE HOOKS

	/**
 	 * admin <head> Hook
	 */
	public function hookDisplayBackOfficeHeader()
	{
		// Check if module is loaded
		if (Tools::getValue('configure') != $this->name)
			return false;
		
		// CSS
		$this->context->controller->addCSS($this->_path.'views/css/elusive-icons/elusive-webfont.css');
		$this->context->controller->addCSS($this->_path.'views/css/bootstrap.css');
		$this->context->controller->addCSS($this->_path.'views/css/color-picker/colorpicker.css');
		$this->context->controller->addCSS($this->_path.'views/css/admin.css');
		// JS
		$this->context->controller->addJquery();
		$this->context->controller->addJS($this->_path.'views/js/bootstrap.js');
		$this->context->controller->addJS($this->_path.'views/js/color-picker/bootstrap-colorpicker.js');
		$this->context->controller->addJS($this->_path.'views/js/admin.js');
		$this->context->controller->addJS($this->_path.'views/js/'.$this->name.'.js');	
	}

	/**
	 * Hook for back office dashboard
	 */
	public function hookDisplayAdminHomeQuickLinks()
	{	
		$this->context->smarty->assign('minicpromo', $this->name);
	    return $this->display(__FILE__, 'views/templates/hooks/quick_links.tpl');    
	}

	// FRONT OFFICE HOOKS

	/**
 	 * <head> Hook
	 */
	public function hookDisplayHeader()
	{
		// CSS
		$this->context->controller->addCSS($this->_path.'views/css/'.$this->name.'.css');
		// JS
		$this->context->controller->addJS($this->_path.'views/js/transit.js');
	}

	/**
 	 * Footer hook
	 */
	public function hookDisplayFooter($params)
	{
		// Default axis
		$axis = 'x';

		// Get settings
		$settings = unserialize(Configuration::get('MINIC_PROMOTION'));
		$settings['texts'] = unserialize(Configuration::get('MINIC_PROMOTION_TEXTS', $params['cookie']->id_lang));

		// Modify axis
		if(($settings['position'] == 'top' || $settings['position'] == 'bottom'))
			$axis = 'y';

		$dimension = $settings['dimension']['width'] + 2*($settings['border']['border_width'] + $settings['dimension']['padding']);
		if($axis == 'y')
			$dimension = $settings['dimension']['height'] + 2*($settings['border']['border_width'] + $settings['dimension']['padding']);
		


		$settings['animation']['axis'] = $axis;
		$settings['dimension']['value'] = ($settings['position'] == 'bottom' || $settings['position'] == 'right') ? -$dimension : $dimension;


		$this->smarty->assign('minic_promo', $settings);
		$this->smarty->assign('minic_promo_image', (file_exists(dirname(__FILE__).'/upload/minicpromo_background.jpg')) ? true : false);

		return $this->display(__FILE__, 'views/templates/hooks/footer.tpl');
	}
}

?>