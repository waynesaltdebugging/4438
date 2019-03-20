bloop:
  pkgrepo.managed:
    - humanname: Test Server
    - name: deb http://ppa:55555/ stretch main
    - gpgcheck: 1
## Uncomment me
#    - key_url: http://ppa:55555/conf/test.gpg.key
#
#
#install it:
#  pkg.installed:
#    - name: elloworld
