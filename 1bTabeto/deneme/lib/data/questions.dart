

import 'package:deneme/data/model/question_model.dart';

const questions = [
  QuestionModel(
    "1Flutter'da Stateful Widget ile Stateles Widget arasındaki temel fark nedir??",
    [
      "Stateful Widget, iç durumunu değiştirebilir; Stateles Widget ise durumu değiştiremez...",
      "Stateful Widget, yapılarını oluşturmak için initState() fonksiyonunu kullanır; Stateles Widget bunu kullanmaz.",
      "Stateful Widget, setState() metodunu kullanarak iç durumu günceller; Stateles Widget bu özelliği barındırmaz.",
      "Stateful Widget, build() fonksiyonunu kullanarak arayüzü oluşturur; Stateles Widget ise initState() fonksiyonunu kullanır."
    ],
  ),
  QuestionModel(
    "2Flutter'da Hot Reload özelliği nedir?",
    [
      "Kodu değiştirdiğinizde, uygulamanın tamamen yeniden başlamasını sağlayan bir özellik.",
      "Uygulama üzerinde yapılan değişikliklerin anında görsel olarak uygulamaya yansıtılmasını sağlayan bir özellik.",
      "Sadece belirli bir bölümünü güncellemek için kodu yeniden yüklemenizi sağlayan bir özellik.",
      "Uygulama hatalarını düzeltmek için kullanılan özel bir geliştirici aracı."
    ],
  ),
  QuestionModel(
    "3Flutter'da Pubspec.yaml dosyası ne işe yarar?",
    [
      "Proje için temel yapılandırmayı belirler ve harici paketleri yönetir.",
      "Uygulamanın ikonlarını ve görünümünü belirlemek için kullanılır.",
      "Sadece uygulamanın sürüm numarasını içerir.",
      "Kodun düzenini ve biçimlendirmesini belirleyen bir dosyadır."
    ],
  ),
  QuestionModel(
    "4Flutter'da Widget ve Element arasındaki fark nedir?",
    [
      "Widget, arayüzdeki görsel öğeleri temsil ederken, Element bu öğelerin konumunu belirler.",
      "Widget, kullanıcı etkileşimini algılar; Element ise arayüzü oluşturur.",
      "Widget, kullanıcı arabirimi parçalarını oluştururken, Element bu parçaların konumlarını belirler.",
      "Widget, uygulamanın işlevselliğini sağlar; Element ise uygulamanın görsel yapısını temsil eder."
    ],
  )
];
