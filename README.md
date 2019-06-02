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

<img width="371" alt="Screen Shot 2019-06-01 at 10 13 23 PM" src="https://user-images.githubusercontent.com/18216713/58756268-a5aef180-84ba-11e9-803c-8290f49bfed4.png">
