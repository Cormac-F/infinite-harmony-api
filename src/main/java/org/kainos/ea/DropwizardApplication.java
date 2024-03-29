package org.kainos.ea;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.federecio.dropwizard.swagger.SwaggerBundle;
import io.federecio.dropwizard.swagger.SwaggerBundleConfiguration;
import org.kainos.ea.resources.AuthController;
import org.kainos.ea.resources.BandController;
import org.kainos.ea.resources.CapabilityController;
import org.kainos.ea.resources.JobController;
import org.kainos.ea.resources.ResponsibilityController;

public class DropwizardApplication extends Application<DropwizardConfiguration> {

    public static void main(final String[] args) throws Exception {
        new DropwizardApplication().run(args);
    }

    @Override
    public String getName() {
        return "ih-java-api";
    }

    @Override
    public void initialize(final Bootstrap<DropwizardConfiguration> bootstrap) {
        bootstrap.addBundle(new SwaggerBundle<DropwizardConfiguration>() {
            @Override
            protected SwaggerBundleConfiguration getSwaggerBundleConfiguration(DropwizardConfiguration configuration) {
                return configuration.getSwagger();
            }
        });    }

    @Override
    public void run(final DropwizardConfiguration configuration,
                    final Environment environment) {
        environment.jersey().register(new JobController());
        environment.jersey().register(new AuthController());
        environment.jersey().register(new CapabilityController());
        environment.jersey().register(new ResponsibilityController());
        environment.jersey().register(new BandController());
    }

}
