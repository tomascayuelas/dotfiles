#!/bin/bash

searchMotor=$1
searchTerm=$2

function linguee()
{
  xdg-open "https://www.linguee.es/espanol-ingles/search?source=auto&query=${searchTerm}"
}

function wordReference()
{
  xdg-open "https://www.wordreference.com/es/translation.asp?tranword=${searchTerm}"
}

if [ "l" = $searchMotor ]
then
  linguee
fi

if [ "w" = $searchMotor ]
then
  wordReference
fi

