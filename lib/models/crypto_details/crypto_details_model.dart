///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CryptoDetailsModelUrls {
/*
{
  "website": [
    "https://bitcoin.org/"
  ],
  "twitter": [
    ""
  ],
  "message_board": [
    "https://bitcointalk.org"
  ],
  "chat": [
    ""
  ],
  "facebook": [
    ""
  ],
  "explorer": [
    "https://blockchain.info/"
  ],
  "reddit": [
    "https://reddit.com/r/bitcoin"
  ],
  "technical_doc": [
    "https://bitcoin.org/bitcoin.pdf"
  ],
  "source_code": [
    "https://github.com/bitcoin/bitcoin"
  ],
  "announcement": [
    ""
  ]
}
*/

  List<String?>? website;
  List<String?>? twitter;
  List<String?>? messageBoard;
  List<String?>? chat;
  List<String?>? facebook;
  List<String?>? explorer;
  List<String?>? reddit;
  List<String?>? technicalDoc;
  List<String?>? sourceCode;
  List<String?>? announcement;

  CryptoDetailsModelUrls({
    this.website,
    this.twitter,
    this.messageBoard,
    this.chat,
    this.facebook,
    this.explorer,
    this.reddit,
    this.technicalDoc,
    this.sourceCode,
    this.announcement,
  });
  CryptoDetailsModelUrls.fromJson(Map<String, dynamic> json) {
    if (json['website'] != null) {
      final v = json['website'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      website = arr0;
    }
    if (json['twitter'] != null) {
      final v = json['twitter'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      twitter = arr0;
    }
    if (json['message_board'] != null) {
      final v = json['message_board'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      messageBoard = arr0;
    }
    if (json['chat'] != null) {
      final v = json['chat'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      chat = arr0;
    }
    if (json['facebook'] != null) {
      final v = json['facebook'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      facebook = arr0;
    }
    if (json['explorer'] != null) {
      final v = json['explorer'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      explorer = arr0;
    }
    if (json['reddit'] != null) {
      final v = json['reddit'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      reddit = arr0;
    }
    if (json['technical_doc'] != null) {
      final v = json['technical_doc'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      technicalDoc = arr0;
    }
    if (json['source_code'] != null) {
      final v = json['source_code'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      sourceCode = arr0;
    }
    if (json['announcement'] != null) {
      final v = json['announcement'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      announcement = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (website != null) {
      final v = website;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['website'] = arr0;
    }
    if (twitter != null) {
      final v = twitter;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['twitter'] = arr0;
    }
    if (messageBoard != null) {
      final v = messageBoard;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['message_board'] = arr0;
    }
    if (chat != null) {
      final v = chat;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['chat'] = arr0;
    }
    if (facebook != null) {
      final v = facebook;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['facebook'] = arr0;
    }
    if (explorer != null) {
      final v = explorer;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['explorer'] = arr0;
    }
    if (reddit != null) {
      final v = reddit;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['reddit'] = arr0;
    }
    if (technicalDoc != null) {
      final v = technicalDoc;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['technical_doc'] = arr0;
    }
    if (sourceCode != null) {
      final v = sourceCode;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['source_code'] = arr0;
    }
    if (announcement != null) {
      final v = announcement;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['announcement'] = arr0;
    }
    return data;
  }
}

class CryptoDetailsModel {
/*
{
  "id": 1,
  "name": "Bitcoin",
  "symbol": "BTC",
  "category": "coin",
  "description": "Bitcoin (BTC) is a cryptocurrency launched in 2010. Users are able to generate BTC through the process of mining. Bitcoin has a current supply of 19,453,106. The last known price of Bitcoin is 29,510.05727657 USD and is down -1.06 over the last 24 hours. It is currently trading on 10386 active market(s) with $14,039,674,204.81 traded over the last 24 hours. More information can be found at https://bitcoin.org/.",
  "slug": "bitcoin",
  "logo": "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png",
  "subreddit": "bitcoin",
  "notice": "",
  "tags": [
    "mineable"
  ],
  "tag-names": [
    "Mineable"
  ],
  "tag-groups": [
    "OTHERS"
  ],
  "urls": {
    "website": [
      "https://bitcoin.org/"
    ],
    "twitter": [
      ""
    ],
    "message_board": [
      "https://bitcointalk.org"
    ],
    "chat": [
      ""
    ],
    "facebook": [
      ""
    ],
    "explorer": [
      "https://blockchain.info/"
    ],
    "reddit": [
      "https://reddit.com/r/bitcoin"
    ],
    "technical_doc": [
      "https://bitcoin.org/bitcoin.pdf"
    ],
    "source_code": [
      "https://github.com/bitcoin/bitcoin"
    ],
    "announcement": [
      ""
    ]
  },
  "platform": "null",
  "date_added": "2010-07-13T00:00:00.000Z",
  "twitter_username": "",
  "is_hidden": 0,
  "date_launched": "2010-07-13T00:00:00.000Z",
  "contract_address": [
    ""
  ],
  "self_reported_circulating_supply": "null",
  "self_reported_tags": "null",
  "self_reported_market_cap": "null",
  "infinite_supply": false
}
*/

  int? id;
  String? name;
  String? symbol;
  String? category;
  String? description;
  String? slug;
  String? logo;
  String? subreddit;
  String? notice;
  List<String?>? tags;
  List<String?>? tagNames;
  List<String?>? tagGroups;
  CryptoDetailsModelUrls? urls;
  String? platform;
  String? dateAdded;
  String? twitterUsername;
  int? isHidden;
  String? dateLaunched;
  List<String?>? contractAddress;
  String? selfReportedCirculatingSupply;
  String? selfReportedTags;
  String? selfReportedMarketCap;
  bool? infiniteSupply;

  CryptoDetailsModel({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.urls,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
    this.dateLaunched,
    this.contractAddress,
    this.selfReportedCirculatingSupply,
    this.selfReportedTags,
    this.selfReportedMarketCap,
    this.infiniteSupply,
  });
  CryptoDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    symbol = json['symbol']?.toString();
    category = json['category']?.toString();
    description = json['description']?.toString();
    slug = json['slug']?.toString();
    logo = json['logo']?.toString();
    subreddit = json['subreddit']?.toString();
    notice = json['notice']?.toString();
    if (json['tags'] != null) {
      final v = json['tags'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      tags = arr0;
    }
    if (json['tag-names'] != null) {
      final v = json['tag-names'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      tagNames = arr0;
    }
    if (json['tag-groups'] != null) {
      final v = json['tag-groups'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      tagGroups = arr0;
    }
    urls = (json['urls'] != null) ? CryptoDetailsModelUrls.fromJson(json['urls']) : null;
    platform = json['platform']?.toString();
    dateAdded = json['date_added']?.toString();
    twitterUsername = json['twitter_username']?.toString();
    isHidden = json['is_hidden']?.toInt();
    dateLaunched = json['date_launched']?.toString();
    if (json['contract_address'] != null) {
      final v = json['contract_address'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      contractAddress = arr0;
    }
    selfReportedCirculatingSupply = json['self_reported_circulating_supply']?.toString();
    selfReportedTags = json['self_reported_tags']?.toString();
    selfReportedMarketCap = json['self_reported_market_cap']?.toString();
    infiniteSupply = json['infinite_supply'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['category'] = category;
    data['description'] = description;
    data['slug'] = slug;
    data['logo'] = logo;
    data['subreddit'] = subreddit;
    data['notice'] = notice;
    if (tags != null) {
      final v = tags;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['tags'] = arr0;
    }
    if (tagNames != null) {
      final v = tagNames;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['tag-names'] = arr0;
    }
    if (tagGroups != null) {
      final v = tagGroups;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['tag-groups'] = arr0;
    }
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    data['platform'] = platform;
    data['date_added'] = dateAdded;
    data['twitter_username'] = twitterUsername;
    data['is_hidden'] = isHidden;
    data['date_launched'] = dateLaunched;
    if (contractAddress != null) {
      final v = contractAddress;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['contract_address'] = arr0;
    }
    data['self_reported_circulating_supply'] = selfReportedCirculatingSupply;
    data['self_reported_tags'] = selfReportedTags;
    data['self_reported_market_cap'] = selfReportedMarketCap;
    data['infinite_supply'] = infiniteSupply;
    return data;
  }
}

