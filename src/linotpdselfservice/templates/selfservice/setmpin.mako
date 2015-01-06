# -*- coding: utf-8 -*-
<!--
 *
 *   LinOTP - the open source solution for two factor authentication
 *   Copyright (C) 2010 - 2015 LSE Leading Security Experts GmbH
 *
 *   This file is part of LinOTP server.
 *
 *   This program is free software: you can redistribute it and/or
 *   modify it under the terms of the GNU Affero General Public
 *   License, version 3, as published by the Free Software Foundation.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Affero General Public License for more details.
 *
 *   You should have received a copy of the
 *              GNU Affero General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *    E-mail: linotp@lsexperts.de
 *    Contact: www.linotp.org
 *    Support: www.lsexperts.de
 *
-->
<h1>${_("Set mOTP PIN")}</h1>

${_("This (re)sets the mOTP PIN, which is the PIN that is entered in the motp application on your phone.")}
<div id='passwordform'>
	<form class="cmxform" name='myForm'>
		<fieldset>
	
		<table>
		<tr>
		<td>${_("selected Token")}</td>
		<td><input type='text' class='selectedToken' class="text ui-widget-content ui-corner-all" disabled value='' /></td>
		</tr>
		<tr>
		<td><label for=mpin1>mOTP PIN</label></td>
		<td><input type='password' autocomplete=off onkeyup="checkpins('mpin1', 'mpin2');" id='mpin1' class="text ui-widget-content ui-corner-all" value='' /></td>		
		</tr>
		<tr>
		<td><label for=mpin2>${_("repeat mOTP PIN")}</label></td>
		<td><input type='password' autocomplete=off onkeyup="checkpins('mpin1', 'mpin2');" id='mpin2' class="text ui-widget-content ui-corner-all" value=''/></td>
  		</tr>
		</table>
		<button class='action-button' id='button_setmpin' onclick="setmpin(); return false;">${_("set mOTP PIN")}</button>
		<input type='hidden' value='${_("The passwords do not match!")}' 	id='setpin_fail'/>
		<input type='hidden' value='${_("Error setting mOTP PIN: ")}'		id='setpin_error'/>
		<input type='hidden' value='${_("mOTP PIN set successfully")}'		id='setpin_ok'/>		
		</fieldset>	
	</form>
</div>
