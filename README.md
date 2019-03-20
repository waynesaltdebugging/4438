# 4438
Working on SaltStack issue 4438

# Usage

To use this, run:

    docker-compose up -d

And then go get a sandwich. It will download a bunch of stuff and at the end
you should have two running containers which you can verify with:

    docker-compose ps

You should see:

    4438_minion_1   tail -f /dev/null              Up
    4438_ppa_1      python3 -m http.server 55555   Up      0.0.0.0:55555->55555/tcp

Now you can attach to the minion:

    docker exec -it 4438_minion_1 /bin/bash
    # salt-call state.apply thing

You should see that now the repository was configured. Now go ahead and include
the `key_url` and attempt to install the package. You can do this with the
following:

    # sed -i 's/^#//' /etc/salt/thing.sls

Now attempt to re-apply the state:

    # salt-call state.apply thing

You should see it fail with this:

    - E: There were unauthenticated packages and -y was used without --allow-unauthenticated

