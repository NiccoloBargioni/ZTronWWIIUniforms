# ZTronWWIIUniforms

This library contains the data model for Call of Duty: WWII character uniforms challenges, as well as `View`s and view models built on top of it. The whole library is built with thread safety and immutability as a priority as a part of Swift 6 effort toward complete compile-time concurrency checks.

This model splits the domain as follows: every character has an associated `Quest` (for example, _Big Game_ is an istance of such class), each with a `name`, consisting in multiple `Challenge`s. 
Each `Challenge` can be identified through a `name` and a `riddle`, and has a set of `requirements`, and can have a set of things that can't be done (that is, cause the challenge to fail), denoted as `donts`, a set of known `glitches`, and `proTips` to help the user improving their chances of easily beating the challenge.
