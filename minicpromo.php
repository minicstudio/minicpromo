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
		$this->description = $this->l('A skeleton module for Minic Studio with feedback and other stuffs.');

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

		if (!parent::install() || 
			!$this->registerHook('displayFooter') || 
			!$this->registerHook('displayHeader') || 
			!$this->registerHook('displayBackOfficeHeader') || 
			!$this->registerHook('displayAdminHomeQuickLinks') || 
			!Configuration::updateValue(strtoupper($this->name).'_START', 1))
			return false;
		return true;
	}

	/**
 	 * uninstall
	 */
	public function uninstall()
	{
		if (!parent::uninstall())
			return false;
		return true;
	}

	/**
 	 * admin page
	 */	
	public function getContent()
	{
		if(Tools::isSubmit('submitSettings'))
			$this->saveSettings();


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

		return $this->display(__FILE__, 'views/templates/admin/minicpromo.tpl');
	}

	public function saveSettings()
	{
		$promo_desc = array(
			'title' => Tools::getValue('title'),
			'description' => Tools::getValue('description'),
			'activator_title' => Tools::getValue('activator_title'),

			'border' => array(
				'border_width' => Tools::getValue('border-width'),
				'border_style' => Tools::getValue('border-style'),
				'border_color' => Tools::getValue('border-color'),
				'border_radius' => Tools::getValue('border-radius'),
				'border_radius_unit' => Tools::getValue('border-radius-unit')
 			),

			'position' => Tools::getValue('position'),

			'background' => Tools::getValue('background-color'),

			'elem_dimension' => array(
				'width' => Tools::getValue('width'),
				'width_unit' => Tools::getValue('width-unit'),
				'height' => Tools::getValue('height'),
				'height_unit' => Tools::getValue('height-unit'),
				'padding' => Tools::getValue('padding'),
				'padding_unit' => Tools::getValue('padding-unit')
			),
			
		);

		Configuration::updateValue('MINIC-PROMOTION', serialize($promo_desc));
	}

	// BACK OFFICE HOOKS

	/**
 	 * admin <head> Hook
	 */
	public function hookDisplayBackOfficeHeader()
	{
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
		$this->context->controller->addJS($this->_path.'views/js/'.$this->name.'.js');
	}

	/**
 	 * Footer hook
	 */
	public function hookDisplayFooter($params)
	{
		$this->smarty->assign('minic_promo', unserialize(Configuration::get('MINIC-PROMOTION')));

		return $this->display(__FILE__, 'views/templates/hooks/footer.tpl');
	}
}

?>