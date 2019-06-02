# UI/UX Approach

To run please install pods using `pod install`

The architecture used was an light approach of clean architecture https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html

The application have 3 differents layers:
  1. Presentation layer (MVVM)
  2. Domain layer (UseCases approach)
  3. Data source layer(networking and cache)
  
Some of the technologies used were

  * Moya (wrapper Alamofire) - Networking
    https://github.com/Moya/Moya
    
  * Core Animation

