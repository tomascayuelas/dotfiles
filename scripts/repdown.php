<?php

$bitbucket_repos = array(
	'tomascayuelas' => array(
		'horariosdefutbol.es',
		'owlaa-public',
		'oknko-bloodstream',
		'logmon',
		'tomascayuelas-site',
		'simple-firewall',
		'oknko-body',
		'resources',
		'GTO',
		'colog',
		'AudioStir',
		'wanmonitor',
		'motorik-framework',
		'coolcodescheme'
    ),
    'owlaateam' => array(
	    'owlaa-heart',
	    'owlaa-bloodstream',
	    'owlaa-public',
	    'owlaa-api'
    ),
    'adeland' => array(
        'Vagrant',
        'Proyect-Home'
    )
);
$github_repos = array(
	'tomascayuelas' => array(
		'DesignPatternsPHP',
		'coolcodescheme'
    )
);

$bitbucket_url = 'git@bitbucket.org:';
$github_url = 'git@github.com:';

$user_home = '/home/tomascayuelas/';
$base_dir = $user_home . 'Development/repos/';

// Descargamos todos los repos de la cuenta de bitbucket
foreach ($bitbucket_repos as $owner => $repos) {
    if (!is_dir($base_dir . $owner)) mkdir($base_dir . $owner, 0777);    
    foreach ($repos as $repo) {
        if (chdir($base_dir . $owner)) {
            exec('git clone ' . $bitbucket_url . $owner . '/' . $repo);
       	}
    }
}

// Descargamos todos los repos de la cuenta de GitHub
foreach ($github_repos as $owner => $repos) {
    if (!is_dir($base_dir . $owner)) mkdir($base_dir . $owner, 0777);    
    foreach ($repos as $repo) {
        if (chdir($base_dir . $owner)) {
            exec('git clone ' . $github_url . $owner . '/' . $repo);
       	}
    }
}
