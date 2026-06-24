/*
 * Copyright (c) 2023 EquoTech, Inc. and others.
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
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 *
 * Contributors:
 *     EquoTech, Inc. - initial API and implementation
 */
package dev.equo.ide.chatgpt;

import dev.equo.ide.IdeHookInstantiated;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.PlatformUI;

public class ChatGptIdeHookImpl implements IdeHookInstantiated {
	private final ChatGptIdeHook hook;

	public ChatGptIdeHookImpl(ChatGptIdeHook hook) {
		this.hook = hook;
	}

	@Override
	public void postStartup() throws Exception {
		IWorkbenchWindow activeWorkbenchWindow = PlatformUI.getWorkbench().getActiveWorkbenchWindow();
		if (activeWorkbenchWindow == null) {
			// Workbench window not available yet; nothing to do.
			return;
		}
		IWorkbenchPage page = activeWorkbenchWindow.getActivePage();
		if (page == null) {
			// No active page available.
			return;
		}
		page.showView("dev.equo.ide.chatgpt.views.browser", null, IWorkbenchPage.VIEW_ACTIVATE);
	}
}
