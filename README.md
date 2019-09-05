# Online _Nushu_ Dictionary [![Build status](https://ci.appveyor.com/api/projects/status/08un6ojbgni1433o?svg=true)](https://ci.appveyor.com/project/chromezh/nushu-script-github-io)

[_Nushu_](https://en.wikipedia.org/wiki/N%C3%BCshu) (女书) is a mysterious script used exclusively among women in Jiangyong County of Southern China

## The Website

The Online _Nushu_ Dictionary website is published on <https://nushuscript.org/>.

It is an open-source project. It is the free and comprehensive website for searching and learning the _Nushu_ script.

## Project Structure

This repository contains the following contents:

* Website homepage
* Converter of _Dictionary of Nushu Standard Characters_ (《女书标准字字典》转换器), in `nsbzz` folder
* Converter of _Calligraphy Copybook of Nushu Standard Characters_ (《女书规范字书法字帖》转换器), in `unicode` folder

Other parts of the website are developed in independent repositories.

## Deploy

The content of the website is built from the `master` branch of this repository.

Modifications should be done on the `proto` branch. It would be automatically deployed to the `master` branch by `.appveyor.yml`.
