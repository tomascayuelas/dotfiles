#!/usr/bin/env python
import json
import os
import shutil

with open('./config.json') as configFile:
    config = json.load(configFile)

homePath = os.getenv('HOME')
dotfilesPath = homePath + config['paths']['dotfiles']
backupsPath = homePath + config['paths']['backups']
appsPath = homePath + config['paths']['apps']
scriptsPath = homePath + config['paths']['scripts']

def link(from_path: str, to_path: str):
    to_execute: str = 'ln -sf {0} {1} &>/dev/null'.format(from_path, to_path)
    os.system(to_execute)

def remove_original(path: str):
    try:
        if os.path.islink(path):
            os.unlink(path)
        else:
            shutil.rmtree(path)
    except OSError as e:
        print("Error deleting: %s : %s" % (path, e.strerror))
        return os.path.islink(path) == os.path.isdir(path)


def create_backup(app_name: str, path: str):
    os.chdir(backupsPath)
    to_execute: str = 'tar -cvzPf ' + app_name + '.tar.gz' + ' ' + path + ' &>/dev/null'
    os.system(to_execute)

for appFolder in config['apps']:
    if os.path.isdir(dotfilesPath + "/" + appFolder):
        for app in config['apps'][appFolder]:
            if os.path.isdir(dotfilesPath + "/" + appFolder + "/" + app):
                print("--> Installed <-- [{0}]".format(app.capitalize()))
                if app == ("x11" or "zsh"):
                    for configFile in os.listdir(dotfilesPath + "/" + appFolder + "/" + app):
                        remove_original(homePath + "/" + configFile)
                        link(dotfilesPath + "/" + appFolder + "/" + app + "/" + configFile, homePath + "/" + configFile)
                else:
                    remove_original(appsPath + "/" + app)
                    link(dotfilesPath + "/" + appFolder + "/" + app, appsPath + "/" + app)

for script in config['scripts']:
    if os.path.isdir(dotfilesPath + "/scripts"):
        scriptFiles = os.listdir(dotfilesPath + "/scripts")
        for scriptFile in scriptFiles:
            remove_original(scriptsPath + "/" + scriptFile)
            link(dotfilesPath + "/scripts/" + scriptFile, scriptsPath + "/" + scriptFile)
