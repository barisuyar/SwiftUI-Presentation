/*:
 
 UIKit ile arayüz geliştirirken UIView class'ını kullanarak yeni componentler oluşturulur.
 
 Böylece bir miras yapısı sağlanır. Yani UIView'ın sahip olduğu alpha, backgroundColor gibi değişkenler yeni component'e aktarılır.
 
 Bu durumda oluşturulan her bir component bu özellikleri ile beraber memory'de yer kaplayacaktır.
 
 UIStackView'ın da UIView ile türediğini düşünürsek, aslında yalnızca yerleştirme işlemlerini yapan, ekrana çizilmeyen component
 hiç kullanmayacak olsa dahi backgroundColor gibi birçok değişkene sahip olacaktır.
 
 View bir protocoldür ve içerisinde değişkenler yerine "modifier"lar tutar. Böylece yalnızca ihtiyacımız olan view ve anda kullanmamıza olanak sağlar.
 
 [Modifier](Modifier)
 */
