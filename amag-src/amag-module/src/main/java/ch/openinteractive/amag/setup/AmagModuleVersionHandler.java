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
import info.magnolia.module.delta.RemoveNodeTask;
import info.magnolia.module.delta.Task;
import info.magnolia.module.inplacetemplating.setup.TemplatesInstallTask;

/**
 * This class is optional and lets you manager the versions of your module,
 * by registering "deltas" to maintain the module's configuration, or other type of content.
 * If you don't need this, simply remove the reference to this class in the module descriptor xml.
 */
public class AmagModuleVersionHandler extends DefaultModuleVersionHandler {

	public AmagModuleVersionHandler() {
		register(DeltaBuilder.update("1.2.2", "Update Module configuration...")
			// NODE SITE DEVITION
			.addTask(new RemoveNodeTask("SiteDefinition Amag", "Deleting Amag site definition", ContentRepository.CONFIG, "/modules/extended-templating-kit/config/sites/amag"))
			.addTask(new BootstrapSingleResource("SiteDefinition Amag", "Bootstraping Amag  site definition", "/mgnl-bootstrap/amag-module/config.modules.extended-templating-kit.config.sites.amag.xml"))
			// NODE MODULE
			.addTask(new RemoveNodeTask("Amag Module", "Deleting Amag Module", ContentRepository.CONFIG, "/modules/amag-module"))
			.addTask(new BootstrapSingleResource("Amag Module", "Bootstraping Amag Module", "/mgnl-bootstrap/amag-module/config.modules.amag-module.xml"))
			// NODE UI SCROLLER
			.addTask(new BootstrapSingleResource("Amag Module", "Bootstraping STK UI-Scroller", "/mgnl-bootstrap/amag-module/resources.templating-kit.js.all.ui-scroller.xml"))
			// NODE INIT BEHAVIOUR
			.addTask(new BootstrapSingleResource("Amag Module", "Bootstraping Amag Module", "/mgnl-bootstrap/amag-module/resources.templating-kit.themes.pop.js.init-behaviour.xml"))

			.addTask(new ModuleFilesExtraction())
			.addTask(new TemplatesInstallTask("/amag-module/.*\\.ftl", false))
			.addTask(new TemplatesInstallTask("/amag-module/.*\\.ftl", true))
			.addTask(new ModuleBootstrapTask())
		);
	}

	@Override
	protected List<Task> getBasicInstallTasks(InstallContext installContext) {
		final List<Task> installTasks = new ArrayList<Task>();
		installTasks.add(new ModuleFilesExtraction());
		installTasks.add(new TemplatesInstallTask("/amag-module/.*\\.ftl", true));
		installTasks.add(new ModuleBootstrapTask());
		//installTasks.add(new RemoveNodeTask("Amag Theme", "Deleting Amag Theme", ContentRepository.CONFIG, "/modules/standard-templating-kit/config/themes/amag-theme"));

		installTasks.addAll(super.getBasicInstallTasks(installContext));
		

		return installTasks;
	}

	@Override
	protected List<Task> getExtraInstallTasks(InstallContext installContext) {
		final List<Task> installTasks = new ArrayList<Task>();

		//installTasks.add(new BootstrapSingleResource("Data: DefaultSearchValues: Tree", "Data module tree Default Search Values", "/mgnl-data/audi-module/config.modules.data.trees.DefaultSearchValues.xml"));

		// Add default extra tasks
		installTasks.addAll(super.getExtraInstallTasks(installContext));

		return installTasks;
	}
}