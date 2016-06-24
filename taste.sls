nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True

/usr/share/nginx/html/index.html:
  file:
    - managed
    - source: salt://index.html
    - template: jinja

{% if grains['host'] == 'puppy' %}
puppy:
  group:
    - present
  user:
    - present
    - groups:
      - puppy

/usr/share/nginx/html/puppy.jpg:
  file:
    - managed
    - source: https://raw.github.com/nanobeep/tt/master/puppy.jpg
    - source_hash: md5=8f3a3661eb7b34036781dac5b6cd9d32
    - user: puppy
    - group: puppy
    - mode: 664
{% endif %}


{% if grains['host'] == 'kitty' %}
kitty:
  group:
    - present
  user:
    - present
    - groups:
      - kitty

/usr/share/nginx/html/kitty.jpg:
  file:
    - managed
    - source: https://raw.github.com/nanobeep/tt/master/kitty.jpg
    - source_hash: md5=f39b24938f200e59ac9cb823fb71cad4
    - user: kitty
    - group: kitty
    - mode: 664
{% endif %}
