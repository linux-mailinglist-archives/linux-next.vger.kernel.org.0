Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94F6EF86DD
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 03:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbfKLCV4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 21:21:56 -0500
Received: from m9a0001g.houston.softwaregrp.com ([15.124.64.66]:60186 "EHLO
        m9a0001g.houston.softwaregrp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726915AbfKLCV4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Nov 2019 21:21:56 -0500
X-Greylist: delayed 944 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Nov 2019 21:21:54 EST
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY m9a0001g.houston.softwaregrp.com WITH ESMTP
 FOR linux-next@vger.kernel.org;
 Tue, 12 Nov 2019 02:21:15 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 12 Nov 2019 02:05:43 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 12 Nov 2019 02:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgpdhPjaeCfm0f51K250xjUzVht4ed6syrdcTtji2QjUabB6JXaNAFtoTZ9FtjCyIJ/F8/80Jkr/WIG2AZfQFYLgMmgLSg/DqQqL7ag9gEb0DyEA3eEjd6qsOIIQ+rGG8HRZD7WPCJSE6pBB5NFwX5fbCLl3gU4VqmpNUrD2WaRuOgLFx2OsKj4mGshvKI+mhwefl1Z3cSYC2E3nqToaqGGDGt4YyraW3uAbYveL8ViQlK6p8dQYogvOTnBl7yWVBapWygq3carSRSl9Lb2rPJqsm6UPgraV3mzhRzehaPH6mfOugFdYu6QapR4MeZcY1pNrd8jJgmt1WHNFjnvYww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QeHRmXKrJbtlk6kxT2JHIoYhzE66gE1Ne/RG1JCwWI=;
 b=f0dCBZVs3ExmQtJc+DflahZObkjYuG6ye7iytn0RYgQ2r+2yZJYCKwl5G/CN685GSu0l5+fR4pxlD862Q5FGJroSJ1oT6cTCBoYQ02oZeZngXbGwgAMU/deLcHk9ZkC3FSiQRngUekadHT7P9+G4f8cNKmE7v6LoQg0UBMl0t2OvNIIxXVdjvv5x1LVtC+onU22MRntS0bSIhIp4B0B+fZg6JB0wACKa9DdvyWU/tCWVO3Fz8KvwAmK3ScC/P0Bq5gNYRnY3aZ/GYTJv4HjWOWJJ7Mla1FPC0hgVZDZv7WPfIHRuXMkx5XG/s6MgH2VG+nMC4azK0rSskC43Pw4w7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3266.namprd18.prod.outlook.com (10.255.163.207) by
 BY5PR18MB3297.namprd18.prod.outlook.com (10.255.163.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Tue, 12 Nov 2019 02:05:40 +0000
Received: from BY5PR18MB3266.namprd18.prod.outlook.com
 ([fe80::1842:7869:d7de:a07b]) by BY5PR18MB3266.namprd18.prod.outlook.com
 ([fe80::1842:7869:d7de:a07b%3]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 02:05:40 +0000
From:   Qu WenRuo <wqu@suse.com>
To:     coverity-bot <keescook@chromium.org>
CC:     David Sterba <DSterba@suse.com>,
        Anand Jain <anand.jain@oracle.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Coverity: read_one_block_group(): Concurrent data access
 violations
Thread-Topic: Coverity: read_one_block_group(): Concurrent data access
 violations
Thread-Index: AQHVmPnF/z9t/1ErdUiNaSxtOPMF26eGyVYA
Date:   Tue, 12 Nov 2019 02:05:40 +0000
Message-ID: <8c607908-6c8e-efb0-0079-7fa74ec98bed@suse.com>
References: <201911111736.E0A3E2DDDB@keescook>
In-Reply-To: <201911111736.E0A3E2DDDB@keescook>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:404:28::18) To BY5PR18MB3266.namprd18.prod.outlook.com
 (2603:10b6:a03:1a1::15)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=wqu@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [13.231.109.76]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a000f968-30d0-44ba-894d-08d76714d0eb
x-ms-traffictypediagnostic: BY5PR18MB3297:
x-ms-exchange-purlcount: 1
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB3297753D910D621EA636DDABD6770@BY5PR18MB3297.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(189003)(64756008)(5660300002)(8676002)(25786009)(81156014)(81166006)(8936002)(6916009)(6486002)(229853002)(4326008)(66476007)(66556008)(66946007)(476003)(2616005)(486006)(11346002)(76176011)(66446008)(446003)(52116002)(256004)(14444005)(14454004)(31696002)(99286004)(966005)(36756003)(31686004)(71200400001)(316002)(186003)(86362001)(6246003)(71190400001)(26005)(54906003)(478600001)(386003)(6506007)(66066001)(6436002)(102836004)(305945005)(7736002)(6306002)(6512007)(6116002)(2906002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:BY5PR18MB3297;H:BY5PR18MB3266.namprd18.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sgby2tpHSb09qlXiHMSQMos8F4W0mclbB8yYChmWKDMjJjOYzDUU4h/8iFbbv1VvGdA8dg95cfwhZ0vqLFNunxnD8dwI/J/S1ikMTMoxRfedHp9P1+povMQBlpz3wcQVfYO3zLpJrU4ZfnvGT9Rz1RVjeJnRfviWnT18Vazc6DmkyKhzuBwFSbroKuFsArpDbc7jd4ZYDz/6wK9bhKNH6euUe9E+Kz1IDqw84nWOqyo04hxRYx7aeTS355zadr3dD5YTj7UHrb9D3jetl04x0CtCBNpEDzrEhWNPxZODBMu1CSH7WdBmH2NNzzpPrvWinz66F9cLW+kRDu80+2ELCIaFdQXchA1Y2oN/0hB/iroAeqCNjp6BafIZrNWxzdADbc48hjwXPXb5htz06nCxklZ4VQUj5JOW6HZrWaVrilFOsjnv/TPatqGAz9rtiBnn4EE8hzXM1ClGPzzpmanyg7h1EBm+XABuwKj2wlsNRs8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32B7C1D115822C41AE89B453B8001C6D@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a000f968-30d0-44ba-894d-08d76714d0eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 02:05:40.1556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nAra2hRCYJt1GeheE0PK4tOWLivdHy/pZg1cscccJ1af1xfQgeoO68E4JQMZS8et
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3297
X-OriginatorOrg: suse.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCk9uIDIwMTkvMTEvMTIg5LiK5Y2IOTozNiwgY292ZXJpdHktYm90IHdyb3RlOg0KPiBIZWxs
byENCj4gDQo+IFRoaXMgaXMgYW4gZXhwZXJpbWVudGFsIGF1dG9tYXRlZCByZXBvcnQgYWJvdXQg
aXNzdWVzIGRldGVjdGVkIGJ5IENvdmVyaXR5DQo+IGZyb20gYSBzY2FuIG9mIG5leHQtMjAxOTEx
MDggYXMgcGFydCBvZiB0aGUgbGludXgtbmV4dCB3ZWVrbHkgc2NhbiBwcm9qZWN0Og0KPiBodHRw
czovL3NjYW4uY292ZXJpdHkuY29tL3Byb2plY3RzL2xpbnV4LW5leHQtd2Vla2x5LXNjYW4NCj4g
DQo+IFlvdSdyZSBnZXR0aW5nIHRoaXMgZW1haWwgYmVjYXVzZSB5b3Ugd2VyZSBhc3NvY2lhdGVk
IHdpdGggdGhlIGlkZW50aWZpZWQNCj4gbGluZXMgb2YgY29kZSAobm90ZWQgYmVsb3cpIHRoYXQg
d2VyZSB0b3VjaGVkIGJ5IHJlY2VudCBjb21taXRzOg0KPiANCj4gNTkzNjY5ZmE4ZmQ3ICgiYnRy
ZnM6IGJsb2NrLWdyb3VwOiBSZWZhY3RvciBidHJmc19yZWFkX2Jsb2NrX2dyb3VwcygpIikNCj4g
DQo+IENvdmVyaXR5IHJlcG9ydGVkIHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAqKiogQ0lEIDE0ODc4
MzQ6ICBDb25jdXJyZW50IGRhdGEgYWNjZXNzIHZpb2xhdGlvbnMgIChNSVNTSU5HX0xPQ0spDQo+
IC9mcy9idHJmcy9ibG9jay1ncm91cC5jOiAxNzIxIGluIHJlYWRfb25lX2Jsb2NrX2dyb3VwKCkN
Cj4gMTcxNSAgICAgCQkgKiAgICB0cnVuY2F0ZSB0aGUgb2xkIGZyZWUgc3BhY2UgY2FjaGUgaW5v
ZGUgYW5kDQo+IDE3MTYgICAgIAkJICogICAgc2V0dXAgYSBuZXcgb25lLg0KPiAxNzE3ICAgICAJ
CSAqIGIpIFNldHRpbmcgJ2RpcnR5IGZsYWcnIG1ha2VzIHN1cmUgdGhhdCB3ZSBmbHVzaA0KPiAx
NzE4ICAgICAJCSAqICAgIHRoZSBuZXcgc3BhY2UgY2FjaGUgaW5mbyBvbnRvIGRpc2suDQo+IDE3
MTkgICAgIAkJICovDQo+IDE3MjAgICAgIAkJaWYgKGJ0cmZzX3Rlc3Rfb3B0KGluZm8sIFNQQUNF
X0NBQ0hFKSkNCj4gdnZ2ICAgICBDSUQgMTQ4NzgzNDogIENvbmN1cnJlbnQgZGF0YSBhY2Nlc3Mg
dmlvbGF0aW9ucyAgKE1JU1NJTkdfTE9DSykNCj4gdnZ2ICAgICBBY2Nlc3NpbmcgImNhY2hlLT5k
aXNrX2NhY2hlX3N0YXRlIiB3aXRob3V0IGhvbGRpbmcgbG9jayAiYnRyZnNfYmxvY2tfZ3JvdXBf
Y2FjaGUubG9jayIuIEVsc2V3aGVyZSwgImJ0cmZzX2Jsb2NrX2dyb3VwX2NhY2hlLmRpc2tfY2Fj
aGVfc3RhdGUiIGlzIGFjY2Vzc2VkIHdpdGggImJ0cmZzX2Jsb2NrX2dyb3VwX2NhY2hlLmxvY2si
IGhlbGQgMTIgb3V0IG9mIDEzIHRpbWVzICg2IG9mIHRoZXNlIGFjY2Vzc2VzIHN0cm9uZ2x5IGlt
cGx5IHRoYXQgaXQgaXMgbmVjZXNzYXJ5KS4NCg0KSXQncyBhIGZhbHNlIGFsZXJ0LCBhcyByZWFk
X29uZV9ibG9ja19ncm91cCgpIGlzIHJ1bm5pbmcgaW4gbW91bnQNCmNvbnRleHQsIG5vYm9keSBl
bHNlIGNhbiBhY2Nlc3MgdGhlIGZzIHlldC4NCg0KT2YgY291cnNlIHdlIGNhbiBob2xkIHRoZSBs
b2NrIGFzIGl0J3MgZ29pbmcgdG8gaGl0IGZhc3QgcGF0aCBhbmQgbm8NCnBlcmZvcm1hbmNlIGNo
YW5nZSBhdCBhbGwsIGJ1dCBJJ20gbm90IHN1cmUgd2hhdCdzIHRoZSBwcm9wZXIgd2F5IHRvIGRv
DQppbiBidHJmcy4NCg0KRGF2aWQsIGFueSBpZGVhIG9uIHRoaXM/DQoNClRoYW5rcywNClF1DQoN
Cj4gMTcyMSAgICAgCQkJY2FjaGUtPmRpc2tfY2FjaGVfc3RhdGUgPSBCVFJGU19EQ19DTEVBUjsN
Cj4gMTcyMiAgICAgCX0NCj4gMTcyMyAgICAgCXJlYWRfZXh0ZW50X2J1ZmZlcihsZWFmLCAmYmdp
LCBidHJmc19pdGVtX3B0cl9vZmZzZXQobGVhZiwgc2xvdCksDQo+IDE3MjQgICAgIAkJCSAgIHNp
emVvZihiZ2kpKTsNCj4gMTcyNSAgICAgCWlmICghbWl4ZWQgJiYgKChjYWNoZS0+ZmxhZ3MgJiBC
VFJGU19CTE9DS19HUk9VUF9NRVRBREFUQSkgJiYNCj4gMTcyNiAgICAgCSAgICAoY2FjaGUtPmZs
YWdzICYgQlRSRlNfQkxPQ0tfR1JPVVBfREFUQSkpKSB7DQo+IA0KPiBJZiB0aGlzIGlzIGEgZmFs
c2UgcG9zaXRpdmUsIHBsZWFzZSBsZXQgdXMga25vdyBzbyB3ZSBjYW4gbWFyayBpdCBhcw0KPiBz
dWNoLCBvciB0ZWFjaCB0aGUgQ292ZXJpdHkgcnVsZXMgdG8gYmUgc21hcnRlci4gSWYgbm90LCBw
bGVhc2UgbWFrZQ0KPiBzdXJlIGZpeGVzIGdldCBpbnRvIGxpbnV4LW5leHQuIDopIEZvciBwYXRj
aGVzIGZpeGluZyB0aGlzLCBwbGVhc2UNCj4gaW5jbHVkZSB0aGVzZSBsaW5lcyAoYnV0IGRvdWJs
ZS1jaGVjayB0aGUgIkZpeGVzIiBmaXJzdCk6DQo+IA0KPiBSZXBvcnRlZC1ieTogY292ZXJpdHkt
Ym90IDxrZWVzY29vaytjb3Zlcml0eS1ib3RAY2hyb21pdW0ub3JnPg0KPiBBZGRyZXNzZXMtQ292
ZXJpdHktSUQ6IDE0ODc4MzQgKCJDb25jdXJyZW50IGRhdGEgYWNjZXNzIHZpb2xhdGlvbnMiKQ0K
PiBGaXhlczogNTkzNjY5ZmE4ZmQ3ICgiYnRyZnM6IGJsb2NrLWdyb3VwOiBSZWZhY3RvciBidHJm
c19yZWFkX2Jsb2NrX2dyb3VwcygpIikNCj4gDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgYXR0ZW50
aW9uIQ0KPiANCg==
