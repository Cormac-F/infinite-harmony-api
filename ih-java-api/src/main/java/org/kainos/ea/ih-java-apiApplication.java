package org.kainos.ea;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class ih-java-apiApplication extends Application<ih-java-apiConfiguration> {

    public static void main(final String[] args) throws Exception {
        new ih-java-apiApplication().run(args);
    }

    @Override
    public String getName() {
        return "ih-java-api";
    }

    @Override
    public void initialize(final Bootstrap<ih-java-apiConfiguration> bootstrap) {
        // TODO: application initialization
    }

    @Override
    public void run(final ih-java-apiConfiguration configuration,
                    final Environment environment) {
        // TODO: implement application
    }

}
