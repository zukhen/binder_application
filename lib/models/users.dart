class User {
  final int id;
  final String name;
  final int age;
  final List<String> imageUrls;
  final String bio;
  final String status;
  final String message;

  User(
      {required this.id,
      required this.name,
      required this.status,
      required this.age,
      required this.message,
      required this.imageUrls,
      required this.bio});

  List<Object?> get props => [id, name, age,message, imageUrls, bio, status];

  static List<User> users = [
    User(
        id: 1,
        name: "Bơ",
        age: 19,
        status: "Đang hoạt động",
        message: 'Em 2007',
        imageUrls: [
          'https://images-ssl.gotinder.com/u/vtkDQti6Ro5SwA1tYvsQX8/3AQysDyH3RnqiZ4JPdtUfC.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS92dGtEUXRpNlJvNVN3QTF0WXZzUVg4LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODYwMTIzNDR9fX1dfQ__&Signature=L6k~Xj9YAfyx53OJCAJDuJQTTep9skQxkCgihKH8Av7sdDlgH5wyKshdjW8nrI1UxiKVGcKs5KtR23SGmFXRqKDE8xJRtXj8Cup563ToI-QoRizjY~QGYvbR4F6D-SoKcc1B-UcxKoWfmHGIL~pxA~acMoDkCiA0k5SCjbz5l~SGMZvDwERgex~1jbUdF~4g7Z3GYoEnhAEtUeG4Okhaox2z5Z7uujWDHgaqyFlmOcpdo8iGZ8HtvWY-9H21YOGr68ZIEnBB1TqhC-H4wDSOV7wcG90h1VfVLySh8OY-nZxWj~k7VQfeiAkysolCBSMdugzwGXpTiFVDDjYOjQR5yA__&Key-Pair-Id=K368TLDEUPA6OI',
          'https://images-ssl.gotinder.com/u/mUohRLpGRMVZH9rYJNeXK6/fj8qNBTUmHWcGHT1ZEG6xx.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS9tVW9oUkxwR1JNVlpIOXJZSk5lWEs2LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODYwMTIzNDR9fX1dfQ__&Signature=e7ph~0Q8oMSbJsSRjTRkDTBOgocP4t0njJVfgV2o5-L~eg7~o2xPyofo03i-Z84qaTej5pCifP4ynvRLqgx-cF9G~L1p1J3tqytIPfKgapGXZUQbLrhM1-aPt4egW61vjGH6lxtp~I14oCPyoK4BeDyM5BnuRmfREfXkfP~o2zN8lqEvwmlFeBnOSDcl6LGbKvJNiKmK5pgh73zm~RizRu2g4qpHGBbii4MC1KVCARefd68WZmbf1MT8OlZODAg8S0uUqnGFv6azMIvvjHurr6wOj0RJ60qTwVOHB2lUdhcKXA5rvLXrg9bcNQlwdz2XVY96jT2Ipk46QV~o41z8DQ__&Key-Pair-Id=K368TLDEUPA6OI',
          'https://images-ssl.gotinder.com/u/jjEeoLLXFMWrcq1JEx5ZKz/bxoBvLMUrcdaRTYqXsu3Dt.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS9qakVlb0xMWEZNV3JjcTFKRXg1Wkt6LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODYwMTIzNDR9fX1dfQ__&Signature=aBJ~Wh0CcfonfUzeJesn0mkr4Vc6U4vQMIH1OWp6t2WOIXnudyIUd9D47BQYgQpnpO4ml1vHEdZu7NprQJPEQqXhMI~jFHx-t2cCiyJA426qLpP4-DD3OsycaO-yGxm4PrnOx3qbuHJAn-MYNj5G4ukDpLTau6ltFITektj~ZEWZMZm7mJCK~V1ImmG6PCNAilOhUOnU5mIB2LNX2Km~obsXP4XB-jQOZr17VuINUC82LlXVWXW1MXdeWdz~CxStwdFH-urZ8j1BEJtwbyh8jpt~7b67iT8rvzu953U7BbkQQI8FirNXGOAFwkOdRoPUcY8avRxC2wFG36tcchN7YA__&Key-Pair-Id=K368TLDEUPA6OI'
        ],
        bio: "babygirl tim nhiều vết xước😔✌🏻"),
    User(
        id: 2,
        name: 'Thảo',
        age: 22,
        message: 'Em vẫn ế anh ạ',
        status: "Hoạt động gần đây",
        imageUrls: [
          'https://images-ssl.gotinder.com/u/vR4Vhgrf2DaQfXKK4Terau/mCW6ytTbWi3Nzx8LUP29Ng.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS92UjRWaGdyZjJEYVFmWEtLNFRlcmF1LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODU5ODIxODJ9fX1dfQ__&Signature=SSxO~d7bgkcPEpiqLaRp0k-8bH-bxRPFT45XCVYW6ZAXsUSnRUKlk0eO0NO8oe3NqHuTxpl9lK21XNMYWFO4yc9Q-Z2GNhTp-LLMvwowe0qGAHJq-NaOan73GHr8iJJU531JQcY3Y2GDeBoKPxVzWlokcG3ggGgIGTJUYU-OXabzK0YiZbUhe4-6pnmVmOrfIbuPP2e1cf6-oIqv8WqVohvLi6I8XouqtiP-EsU0ObPFvyzqRkqzmK2PEJAN~sbP9Kv16CO7fSZBt91pOXnRw8ocJF6RkDcyp-jAZ-r7YnuVF7cfVe6KnCk7XlTxUGS80qXeD4w1kB-lDo7qvctDkA__&Key-Pair-Id=K368TLDEUPA6OI',
          'https://images-ssl.gotinder.com/u/n84vgGfhxVTLzhsmurTMhu/tK8j9irkugYMQyhC73FAdu.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS9uODR2Z0dmaHhWVEx6aHNtdXJUTWh1LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODU5ODIxODJ9fX1dfQ__&Signature=sRNi~CiMrxyJYcKOVxn5HsW7Wqlv5wuKd0qm6KPTfC8m3cxR9lp198Hv7yRAzxQxuAcJePphp6FyAVjnaK3CQByqsCQEpCS30Bjx17WxSmfgDHJ3sZEBshYIhU-eKagBcoBusMQTawCKsDyH76ywGeWE9NeD3jJi-Q-Zo8UnHk~51us3ldfSMO~h~HBnEo~i2iU~w25mTA5hJh5-GveyO4bcOKHnc520unAFS-JQu~bobmWjGgSqcqE4TZ027SmcXRJszwifMxt9kezy-yNgv-I9ro0CYQxayiklS5NbFYN3sQ~l9~xku~2ercRMHlshEIW-eI8DMljDFyTyUJoaKA__&Key-Pair-Id=K368TLDEUPA6OI',
          'https://images-ssl.gotinder.com/u/cDfvRVoCmdSoa2V4fhLjU7/1HWbehS7ZCyWnkNqCAZgLM.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS9jRGZ2UlZvQ21kU29hMlY0ZmhMalU3LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODU5ODIxODJ9fX1dfQ__&Signature=So1Y8JdJAxnvBvane~~SZNt2iUJhO3o4ScZfC9GqTjqPCkGdeNMxvN1I6ofz2z0Ggn770~GQC~6f4bXKnwuvqPlCU7t7yO9yMdOT6h7qV4rV7Xo7RJXyVyJ2o0GgDZEkcT9ZK-2i28Kqhq3fcee7QLBovHbY~VsES3MvK5fxgsitc4qmkErBTN-ozEQDVYOl-YaWI0ieAIIAi0RUawc~83eiRYQQRMuaI4cKmC~kKn064XBdgVAflANUIQHQRytEdwWyMnOF9kwjhiol0e4cRQsFNf-SU2po7faFPS085z3L06jCeFZnlnkE8teVdfHlP4vxgtDCl8ny0PJjLeAbyQ__&Key-Pair-Id=K368TLDEUPA6OI'
        ],
        bio:
            'Nhận trông trẻ từ 18 - 25 tuổi, chấp nhận tăng ca đến 4h sáng, sau 4h lười lắm '),
    User(
        id: 3,
        name: 'Ngoc Anh',
        age: 20,
        message: 'Uuwuwuwuwuwuwu',
        status: "Đang hoạt động",
        imageUrls: [
          'https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/349867893_615031944020255_622188113780105926_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=SKuFIJe4O4MAX-irge8&_nc_ht=scontent.fhan5-2.fna&oh=00_AfAwTS6C8mVV7udtefSaowhI6Gfd8RH327YSauT7xy9OSA&oe=6480E053',
          'https://images-ssl.gotinder.com/u/uqMcVXMJtPhXwTi63FWNM4/b7o4jrKXmSga66GTgpqHDk.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS91cU1jVlhNSnRQaFh3VGk2M0ZXTk00LyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODU5OTA3Njd9fX1dfQ__&Signature=ot3edlrV3hDEm5VraJ3lp-PdJ6TFpZ6dBkHXBqzupHZwBLkARlNK6FPsMdFPqtfffEGBr-sJn23nq-gHu3bOSVOSswCSv4FirKWA017mBT8qzOSVofjs4RndvwyV0b3Q2DM3sUuF8t35fk6uhX1Q9C5yNTd9R2OPmLqMHiVQ75b33PRI8fochf5aLjDyDH9G8511z91xutPJq-Qm6LXC8M4H2aGg6D7Pj8ZOUqHmoYbDywc3mQtIKazbFpXx0HQGCDbXsiJaE~uJiLVshIog4h0voKSRBAULW-LoIGH3YgTSq924or06ph0X3Zu01kSeUAEEe5BciipmU3XHR6wNdQ__&Key-Pair-Id=K368TLDEUPA6OI',
          'https://images-ssl.gotinder.com/u/agLJQkQb2bw6Z3UKMGzN7j/uuavgwhPuYRDvycu1Vvr6b.jpg?Policy=eyJTdGF0ZW1lbnQiOiBbeyJSZXNvdXJjZSI6IiovdS9hZ0xKUWtRYjJidzZaM1VLTUd6TjdqLyoiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2ODU5OTA3Njd9fX1dfQ__&Signature=HfhcnkidFnbtA7HPlYDfylDwzR9pok8olrTJaLF9F53bODGLGZWvdS86g-PCbGd3S3plpBWVMUGmLOj-2UJvCYJGWHSuZeaIkxjyR2~CQ90hRGIjYhAvsABc8Dhm06kvemhTgwRh34S~e4ZZ7Ye7Xj5NCMZ7aEYeH9xBpQGcJT9pJSBHCMqhr61tOMe077Wp93n~cGB9PDPk3pQYdJEKn46ZN1BVbFfLdM6JcUw7UL-UPnff-IuUErQY~zqqUSfl0QoPNPQmYDN~X3bedT-N6YzlypLzlSxcv3z3C0YVuzvzreA642nxrQf~OJsVifg~KtnapO6cl3AGKtDt77NiJA__&Key-Pair-Id=K368TLDEUPA6OI'
        ],
        bio: 'đừng quét tinder nữa quét nhà điii'),
    User(
        id: 4,
        name: 'Phuong Anh',
        age: 19,
        message: 'Em chưa có bạn trai',
        status: "Đang hoạt động",
        imageUrls: [
          'https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/350513474_2653989028081680_3793578199276024459_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=623JmdkMm34AX8i8-Bi&_nc_ht=scontent.fhan5-11.fna&oh=00_AfAKWFE6c2VpP9ZkahmF9LmEU_lY4kIWVoDseLCViQ1sDw&oe=647E6D22',
          'https://scontent.fhan5-8.fna.fbcdn.net/v/t39.30808-6/349981312_789562942749084_9073422845750546122_n.jpg?stp=dst-jpg_p526x296&_nc_cat=110&ccb=1-7&_nc_sid=0debeb&_nc_ohc=8piSaEv5yCEAX-P9LND&_nc_ht=scontent.fhan5-8.fna&oh=00_AfBVN3ge9P-deV67rFBKLUBOn3yFbgDcfLnUgPcGfMBNpA&oe=647E1100',
          'https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/340983890_5499813316786738_8388217980038010659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=segc_AttCawAX_lfmg0&_nc_ht=scontent.fhan5-11.fna&oh=00_AfBspj2hzSdznSvBVJexzk0dJR42umJV2GVPgs2NFC_L7A&oe=647EFA7F'
        ],
        bio: 'Em không phải chảnh, mà em chờ anh hỏi'),
  ];
}
