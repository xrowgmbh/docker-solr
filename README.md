[Origin](https://github.com/docker-solr/docker-solr/blob/master/README.md)

# How to use this Docker image

To run a single Solr server:

```console
$ docker run --name my_solr -d -p 8983:8983 -t xrowgmbh/solr:latest
```

Then with a web browser go to `http://localhost:8983/` to see the Admin Console (adjust the hostname for your docker host).

To use Solr, you need to create a "core", an index for your data. For example:

```console
$ docker exec -it --user=solr my_solr bin/solr create_core -c ezpublish -d ezp-default/conf
```

In the web UI if you click on "Core Admin" you should now see the "gettingstarted" core.

If you want to load some example data:

```console
$ docker exec -it --user=solr my_solr bin/post -c gettingstarted example/exampledocs/manufacturers.xml
```