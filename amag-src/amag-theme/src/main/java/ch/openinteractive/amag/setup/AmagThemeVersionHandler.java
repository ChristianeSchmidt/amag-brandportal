package ch.openinteractive.amag.setup;

import java.util.ArrayList;
import java.util.List;

import info.magnolia.cms.beans.config.ContentRepository;
import info.magnolia.module.DefaultModuleVersionHandler;
import info.magnolia.module.InstallContext;
import info.magnolia.module.delta.BootstrapSingleResource;
import info.magnolia.module.delta.DeltaBuilder;
import info.magnolia.module.delta.ModuleBootstrapTask;
import info.magnolia.module.delta.ModuleFilesExtraction;
import info.magnolia.module.delta.RegisterModuleServletsTask;
import info.magnolia.module.delta.RemoveNodeTask;
import info.magnolia.module.delta.SetupModuleRepositoriesTask;
import info.magnolia.module.delta.Task;
import info.magnolia.module.templatingkit.setup.ThemeInstallTask;

public class AmagThemeVersionHandler extends DefaultModuleVersionHandler {

	protected List<Task> getBasicInstallTasks(InstallContext installContext) {
		final List<Task> basicInstallTasks = new ArrayList<Task>();
		basicInstallTasks.add(new SetupModuleRepositoriesTask());
		basicInstallTasks.add(new ModuleBootstrapTask());

		basicInstallTasks.add(new BootstrapSingleResource("Amag Theme", "Bootstraping Amag Theme", "/mgnl-bootstrap/amag-theme/config.modules.standard-templating-kit.config.themes.amag-theme.xml"));

		basicInstallTasks.add(new ModuleFilesExtraction());
		basicInstallTasks.add(new RegisterModuleServletsTask());
		basicInstallTasks.add(new ThemeInstallTask(true));

		return basicInstallTasks;
	}

	public AmagThemeVersionHandler() {
		register(DeltaBuilder.update("1.1.4", "Update module configuration...")
			/**
			 *  remove and add theme
			 */
			.addTask(new RemoveNodeTask("Amag Theme", "Deleting Amag Theme", ContentRepository.CONFIG, "/modules/standard-templating-kit/config/themes/amag-theme"))
			.addTask(new BootstrapSingleResource("Amag Theme", "Bootstraping Amag Theme", "/mgnl-bootstrap/amag-theme/config.modules.standard-templating-kit.config.themes.amag-theme.xml"))
			.addTask(new ModuleFilesExtraction())
			.addTask(new ThemeInstallTask(true))
		);
	}
}
