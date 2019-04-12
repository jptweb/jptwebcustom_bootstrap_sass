#!/bin/bash
# Script to quickly create sub-theme.

echo '
+------------------------------------------------------------------------+
| With this script you could quickly create jptwebcustom_bootstrap_sass sub-theme     |
| In order to use this:                                                  |
| - jptwebcustom_bootstrap_sass theme (this folder) should be in the contrib folder   |
+------------------------------------------------------------------------+
'
echo 'The machine name of your custom theme? [e.g. mycustom_jptwebcustom_bootstrap_sass]'
read CUSTOM_BOOTSTRAP_SASS

echo 'Your theme name ? [e.g. My custom jptwebcustom_bootstrap_sass]'
read CUSTOM_BOOTSTRAP_SASS_NAME

if [[ ! -e ../../custom ]]; then
    mkdir ../../custom
fi
cd ../../custom
cp -r ../contrib/jptwebcustom_bootstrap_sass $CUSTOM_BOOTSTRAP_SASS
cd $CUSTOM_BOOTSTRAP_SASS
for file in *jptwebcustom_bootstrap_sass.*; do mv $file ${file//bootstrap_sass/$CUSTOM_BOOTSTRAP_SASS}; done
for file in config/*/*jptwebcustom_bootstrap_sass.*; do mv $file ${file//bootstrap_sass/$CUSTOM_BOOTSTRAP_SASS}; done
mv {_,}$CUSTOM_BOOTSTRAP_SASS.theme
grep -Rl jptwebcustom_bootstrap_sass .|xargs sed -i '' -e "s/bootstrap_sass/$CUSTOM_BOOTSTRAP_SASS/"
sed -i '' -e "s/SASS Bootstrap Starter Kit Subtheme/$CUSTOM_BOOTSTRAP_SASS_NAME/" $CUSTOM_BOOTSTRAP_SASS.info.yml
echo "# Check the themes/custom folder for your new sub-theme."
