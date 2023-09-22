<!--
 * **********************************************************
 * Author: Balita Rakotonarivo								*
 * Date: September 2023										*
 * Context: Deliberate practice, as an iOS developper		*
 * Language: Swift 											*
 * **********************************************************
-->


# MovieTracker

A sample app to showcase **Test-Driven Development** (TDD) in Xcode, with UIKit.

This app serves to have a list of movies that the user has to watch, and allows her to check it off once done.

## Screenshot and Videos 

Here is the screenshot of the app, and a link to a short video demonstration.
<p  align="center"><a href="https://youtube.com/shorts/mSlzWnqIKWw?feature=share">
<img src="./img/MovieTrackerCapture.png" width="267" height="542" alt="MovieTracker App screen, with a link to youtbe video">
</a><br/>
MovieTracker App, <a target=”_blank” href="https://youtube.com/shorts/mSlzWnqIKWw?feature=share">watch demo on Youtube</a>
</p>

## Technical Details


This app is written in Swift and relies on Storyboards and UIKit. It implements a **Model-View-Controller** pattern.

It showcases simple unit tests, testing Models - Views - Controllers, using mocks, and dependancy injection. It also has *code coverage* enabled, so that testing analytics are available.


### Testing analytics

Here are the data from the final testing report, after enabling *Code Coverage*:

<p align="center">
<img src="./img/CodeCoverage.png" width="691" height="488" alt="Code Coverage screen capture"><br/>
Code Coverage: 100% on self-written code, only AppDelegate and SceneDelegate classes were not tested.
</p>

<p align="center">
<img src="./img/Log.png" width="691" height="488" alt="Log screen capture"><br/>
Log: All tests passed, without any issue.
</p>

<p align="center">
<img src="./img/Tests.png" width="691" height="488" alt="Tests screen capture "><br/>
Tests details (duration, number, ...)
</p>

## Advice for implementing TDD

### From Kent Beck

In his book, *Test-Driven Development: By Example*:
>
1. Programmers need to write tests
2. All features need to be covered by these tests
3. A product can't be shipped if the test suite is not satisfied

### From Robert C. Martin

From [Uncle Bob website](http://www.butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd):
>
1. You are not allowed to write any production code unless it is to make a failing unit test pass.
2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

<!--
### New Horizons

Test-Driven Development: By Example by Kent Beck

Test-Driven iOS Development with Swift by Dr. Dominik
Hauser

XCTAssert classes deep dive
-->


## Contact

<a href="mailto:jery.sarim@gmail.com?subject=SwiftUI-GeniusApp">Let's get in touch.</a> 
