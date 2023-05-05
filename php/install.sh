
echo -e "\n>> Installing xdebug for PHP"
pecl install xdebug

# Note:
# PHP ini (here /usr/local/etc/php/7.1/php.ini) had
# to have the path to xdebug.so updated to
# zend_extension="/usr/local/Cellar/php@7.1/7.1.16_1/pecl/20160303/xdebug.so"
