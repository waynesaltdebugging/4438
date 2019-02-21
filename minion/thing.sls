bloop:
  pkgrepo.managed:
    - humanname: Test Server
    - name: deb http://dev:55555/ stretch main
    - gpgcheck: 1
    - key_url: http://dev:55555/conf/test.gpg.key


install it:
  pkg.installed:
    - name: elloworld
