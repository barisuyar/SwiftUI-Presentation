/*:
 Modifier, View üzerinde değiştirmek istediğimiz özellikler için kullandığımız fonksiyonlardır.
 
 Arkaplan rengi, font, boşluklandırma gibi özellikleri bu sayede değiştirebiliriz.
 
 Modifier kullandığımız her yerde var olan view üzerinden yeni bir view yaratılır.
 
 ````
    Text("Hello, World!")
                    .background(Color.red)
 ````
 
gibi bir kod yazdığımız zaman aşağıdaki gibi bir hiyerarşi oluşacaktır.
 
 * background(Color.red)
    * Text("Hello, World!")
 
 Yani son modifier'dan tepeye doğru çıkılarak istediğimiz View yaratılır. Bu sebeple modifier'ları çağırma sıramız çok önemlidir.
 
 ````
    Text("Hello, World!")
                    .background(Color.red)
                    .padding()
 ````
 
 Örneğin yukarıdaki örnekte öncelikle "padding()" modifier'ı işleme alınacağı için ekranda aşağıdaki gibi beklenmedik bir sonuç görürüz.
 
 ![Beklenmedik Text](unexpected-text.png)
 
 modifier'ların çağrım sırasını değiştirerek yeni sonuca bakalım.
 
 ````
    Text("Hello, World!")
                    .background(Color.red)
                    .padding()
 ````
 
  ![Beklenmedik Text](expected-text.png)
 
 # Sharing Modifiers
 
 Aynı özelliğe sahip olmasını istediğimiz bir grup View için tek tek modifier çağırmak yerine, grup için bir kez çağırırız.
 
 ````
    VStack {
        Text("Hello, World!")
        .padding()
        
        Text("Hello, World!")
        .padding()
    }.background(Color.red)
 ````
 
 Bir View üzerinde yapmak istediğimiz döndürme, alpha değiştirme gibi özellikleri mümkün olduğunca modifier kullanarak yapmak gerekmektedir.
 
 Bu sayede modifier'ların sunduğu default animasyonlar ile çalışmış oluruz.
 
 Ayrıca bazı durumlarda modifier kullanmazsak ekstra View'lar yaratılmasına sebep olabilir böylece memory-leak durumlarıyla karşılaşabiliriz.
 
 Örneğin
 
 ````
    if flipped
        Logo().rotationEffect(.degrees(90))
    else
        Logo()
 ````
 
 Yukarıdaki haliyle bir kod yazdığımızda else durumunda modifier kullanmamış oluyoruz bu sebeple sunduğu animasyon çalışmayacak.
 
 Ama aşağıdaki gibi yazsaydık hem animasyonu elde edebilecektik hem de yeni bir View yaratmadan işimiz çözülecekti.
 
 ````
    Logo().rotationEffect(.degrees(flipped ? 90 : 0))
 ````
 
 [devam](SwiftUI)
 */
