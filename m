Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52CFBE7FFB
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 06:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730866AbfJ2F7L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 01:59:11 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:47216 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfJ2F7L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 01:59:11 -0400
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
  Tudor.Ambarus@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="Tudor.Ambarus@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com a:mx1.microchip.iphmx.com
  a:mx2.microchip.iphmx.com include:servers.mcsv.net
  include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
  envelope-from="Tudor.Ambarus@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com; spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 4TZEne25EUyhhewwIG+9Uz6JvbE+2t+GzOGVfExy/jw8WUHeF0JPhyjUCw57gbsRMKLaxnzQuX
 lP8/0M91uOzCjw9YRA+FiJ+/uQfuj41nWIFt1n+rETIroEtAKiAgyFiffEuDeKp6MyUmVYRypD
 vljsiy3BCoOJ5vA/kxuI+zobYKBmb9z6bZYsreFRqwDJsphNerivDtTi4oKAu96nvaC+3bPoBM
 hXZ752wOngtC1ljDe5NZWTgYXbntdIvPce6LRPs7uRm6qcNaF71RWz51z5diXdgn/IUBo+BHa0
 FQc=
X-IronPort-AV: E=Sophos;i="5.68,242,1569308400"; 
   d="scan'208";a="54388692"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Oct 2019 22:59:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 28 Oct 2019 22:59:05 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 28 Oct 2019 22:59:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3gPpLl0iJhwB8VZzzOsCSmmOM6jeBtMh/2j8OyKhR9JTk+94yCruK0fDSAa3wIf/8yzD0bPx8ZeUguWyVozmKcfbn4jjd07WlapP01F9bulCWhGjdU1b3XDensoyPD4f35t3qLhnl8TfqdbHpGUzoEQf0FZRL/JqteMUZwkBLncgFZ6ocTU57CVxxE3SMyF5QFNbJae/vEwGmjjFbBiEeyMaTHloy3TGvwS8wNzzqwmyU8zqFfGv8wOWTAqs8ViJeWN32rJY2T/2VkhqgD5DFv6bCWohCKVHVAanky08SY8/vLibxEXbpyb3gnQoyfdLr9CTuOPrKqTlNfkOItzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw+8KUMLx+YFWK9OABXvHxiD5XJhw7DZJirJb37HfLo=;
 b=LH/L3GOsiQO01DT5aQM9xF48um4n4MAHR+Ht1cfGe93HTySjeKfvKMVYlMtGGpyp5fV2VuEEI4rqVux9Ns5sA531lwvgpZE4J3bQagnWawHALs6RidgV3UK9BBUx6vmXBKdKKt4vc1MyPHXsU506B8No2QIkquvfSisHSMVE5fd6hB3yv86e8A/qZGUjXGA7w1w0IXASUop+AkmMyvElW01HQwI41y2ojwg5aXDLuvZCh7+p6TqyBiKYJXCiFLAIsU7VHqE10uYCaydsuAmGqX4pb6SSrzlsukEOYL98xBvtg77MzNKqNNdwTOLZboLJkrFGJstjDYRGRXId8zyztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw+8KUMLx+YFWK9OABXvHxiD5XJhw7DZJirJb37HfLo=;
 b=i+0WnAufAFGpZj3saw/bRRExspjTloKbZAca6QUVaWA59KSh9ZGtyMZVlU2fh6Xt8hdtNxaySIA9rznOtFyAJ4bl05BIkyJMgV8Vj8+yHXJcZx+1HErzsQS2o71KZd3tyrXng+Reoesu9xXoMxVpqiE5pJbJY0wcxcXT5ZVr9T8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4319.namprd11.prod.outlook.com (52.135.39.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 05:59:04 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 05:59:04 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <keescook@chromium.org>
CC:     <boris.brezillon@collabora.com>, <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>
Subject: Re: Coverity: spi_nor_erase_sector(): Null pointer dereferences
Thread-Topic: Coverity: spi_nor_erase_sector(): Null pointer dereferences
Thread-Index: AQHVjeRXQaA5WyCnM0aVxrUi43Qw9adxIB0A
Date:   Tue, 29 Oct 2019 05:59:04 +0000
Message-ID: <c1fae93d-ea1c-ace1-28d9-00ac558129c4@microchip.com>
References: <201910281605.9E90B64E86@keescook>
In-Reply-To: <201910281605.9E90B64E86@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0040.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::29) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95c51baa-c81d-48c6-9eb1-08d75c351a42
x-ms-traffictypediagnostic: MN2PR11MB4319:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR11MB4319B9A845D0AB244D622A60F0610@MN2PR11MB4319.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(376002)(39860400002)(346002)(366004)(396003)(189003)(51914003)(199004)(478600001)(8936002)(4326008)(71190400001)(71200400001)(966005)(66066001)(99286004)(25786009)(6306002)(6512007)(229853002)(6436002)(14444005)(6486002)(316002)(256004)(86362001)(5660300002)(54906003)(31696002)(8676002)(6916009)(26005)(36756003)(486006)(6506007)(305945005)(31686004)(3846002)(64756008)(66446008)(52116002)(66556008)(76176011)(66476007)(66946007)(386003)(6116002)(11346002)(476003)(2616005)(102836004)(446003)(6246003)(186003)(81166006)(81156014)(53546011)(7736002)(14454004)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR11MB4319;H:MN2PR11MB4448.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OtlgSYhtmU5iOu7DAjsFPFx6yFwj+zpf0Pdx7pq3HHw18Ntpfnj/zdFQBzs93zSbeIbTIWXv/ePuKubd6yolOi8L8mzNxeP44627zya63SGOgChlrz6h1GiU0GrPY51+UN+VLXQQ+IOpRg+5/A+uKrCHZrnTjywUbJHgVz+bcG36MImYSTElOb5tu0IBO9Xrddj+4IN+suVIlfU9ywwdgrCnuBi1v375NjFeqm/Kwk7pLZuBh34/Ly+aXD2RZ5SyGpebJKnPKEfUVz3A0xvbZVx/wLzA3hr+CKGQU8mQlhNQkefTvF41/7F24ukVALjeccUmH1tPyQj1o/ZH2nnELZTXgL02F1HQeuGTFuKX/9HEWbrC3XGohHBxYP8nWL9R4tjXTnxNq0/C/ZBeVu0CY2RL6A9Qfeyk+0xEluWxQZ+Z+LHn4FpSotkINLrye+DUkKj1C51UtPmRCCQpJCWebbOUlgfAiz3cZ/C3y1/ScX4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <368CB4334A0F7E499F31ECFE8D9D9E97@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c51baa-c81d-48c6-9eb1-08d75c351a42
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 05:59:04.3348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dzWc4v6J01u+rWsQ2lO6zimS3vB8D2EOb2QVijsxLZtE/Evk0TVHn00RTy2ouimc3A4TEJqePKfm/ouGCin1zUdl7L/7/wB0hek/20ckplM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4319
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkuIFRoYW5rcyBmb3IgdGhlIHJlcG9ydCENCg0KT24gMTAvMjkvMjAxOSAwMTowNSBBTSwgY292
ZXJpdHktYm90IHdyb3RlOg0KPiBFeHRlcm5hbCBFLU1haWwNCj4gDQo+IA0KPiBIZWxsbyENCj4g
DQo+IFRoaXMgaXMgYW4gZXhwZXJpbWVudGFsIGF1dG9tYXRlZCByZXBvcnQgYWJvdXQgaXNzdWVz
IGRldGVjdGVkIGJ5IENvdmVyaXR5DQo+IGZyb20gYSBzY2FuIG9mIG5leHQtMjAxOTEwMjUgYXMg
cGFydCBvZiB0aGUgbGludXgtbmV4dCB3ZWVrbHkgc2NhbiBwcm9qZWN0Og0KPiBodHRwczovL3Nj
YW4uY292ZXJpdHkuY29tL3Byb2plY3RzL2xpbnV4LW5leHQtd2Vla2x5LXNjYW4NCj4gDQo+IFlv
dSdyZSBnZXR0aW5nIHRoaXMgZW1haWwgYmVjYXVzZSB5b3Ugd2VyZSBhc3NvY2lhdGVkIHdpdGgg
dGhlIGlkZW50aWZpZWQNCj4gbGluZXMgb2YgY29kZSAobm90ZWQgYmVsb3cpIHRoYXQgd2VyZSB0
b3VjaGVkIGJ5IHJlY2VudCBjb21taXRzOg0KPiANCj4gNDUzOTc3ODc1MzY0ICgibXRkOiBzcGkt
bm9yOiBJbnRyb2R1Y2UgJ3N0cnVjdCBzcGlfbm9yX2NvbnRyb2xsZXJfb3BzJyIpDQo+IA0KPiBD
b3Zlcml0eSByZXBvcnRlZCB0aGUgZm9sbG93aW5nOg0KPiANCj4gKioqIENJRCAxNDg3MzYzOiAg
TnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlcyAgKEZPUldBUkRfTlVMTCkNCj4gL2RyaXZlcnMvbXRk
L3NwaS1ub3Ivc3BpLW5vci5jOiA5NjcgaW4gc3BpX25vcl9lcmFzZV9zZWN0b3IoKQ0KPiA5NjEg
ICAgIAkgKi8NCj4gOTYyICAgICAJZm9yIChpID0gbm9yLT5hZGRyX3dpZHRoIC0gMTsgaSA+PSAw
OyBpLS0pIHsNCj4gOTYzICAgICAJCW5vci0+Ym91bmNlYnVmW2ldID0gYWRkciAmIDB4ZmY7DQo+
IDk2NCAgICAgCQlhZGRyID4+PSA4Ow0KPiA5NjUgICAgIAl9DQo+IDk2Ng0KPiB2dnYgICAgIENJ
RCAxNDg3MzYzOiAgTnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlcyAgKEZPUldBUkRfTlVMTCkNCj4g
dnZ2ICAgICBEZXJlZmVyZW5jaW5nIG51bGwgcG9pbnRlciAibm9yLT5jb250cm9sbGVyX29wcyIu
DQo+IDk2NyAgICAgCXJldHVybiBub3ItPmNvbnRyb2xsZXJfb3BzLT53cml0ZV9yZWcobm9yLCBu
b3ItPmVyYXNlX29wY29kZSwNCj4gOTY4ICAgICAJCQkJCSAgICAgIG5vci0+Ym91bmNlYnVmLCBu
b3ItPmFkZHJfd2lkdGgpOw0KPiA5NjkgICAgIH0NCj4gOTcwDQo+IDk3MSAgICAgLyoqDQo+IDk3
MiAgICAgICogc3BpX25vcl9kaXZfYnlfZXJhc2Vfc2l6ZSgpIC0gY2FsY3VsYXRlIHJlbWFpbmRl
ciBhbmQgdXBkYXRlIG5ldyBkaXZpZGVuZA0KPiANCj4gSWYgdGhpcyBpcyBhIGZhbHNlIHBvc2l0
aXZlLCBwbGVhc2UgbGV0IHVzIGtub3cgc28gd2UgY2FuIG1hcmsgaXQgYXMNCj4gc3VjaCwgb3Ig
dGVhY2ggdGhlIENvdmVyaXR5IHJ1bGVzIHRvIGJlIHNtYXJ0ZXIuIElmIG5vdCwgcGxlYXNlIG1h
a2UNCj4gc3VyZSBmaXhlcyBnZXQgaW50byBsaW51eC1uZXh0LiA6KSBGb3IgcGF0Y2hlcyBmaXhp
bmcgdGhpcywgcGxlYXNlDQo+IGluY2x1ZGU6DQoNCkl0J3MgYSBmYWxzZSBwb3NpdGl2ZSwgYnV0
IHRoZSBidWcgcmVwb3J0IGhlbHBlZCB1cyBpbXByb3ZlIHRoZSBjb2RlLiBJIHJlY2VpdmVkDQpz
aW1pbGFyIHJlcG9ydCB3aXRoIHNtYXRjaCwgc2VlIHRoZSBkaXNjdXNzaW9uIGhlcmU6DQpodHRw
czovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1tdGQvbXNnMDk3MDEuaHRtbA0KDQoNCkNo
ZWVycywNCnRhDQo+IA0KPiBSZXBvcnRlZC1ieTogY292ZXJpdHktYm90IDxrZWVzY29vaytjb3Zl
cml0eS1ib3RAY2hyb21pdW0ub3JnPg0KPiBBZGRyZXNzZXMtQ292ZXJpdHktSUQ6IDE0ODczNjMg
KCJOdWxsIHBvaW50ZXIgZGVyZWZlcmVuY2VzIikNCj4gRml4ZXM6IDQ1Mzk3Nzg3NTM2NCAoIm10
ZDogc3BpLW5vcjogSW50cm9kdWNlICdzdHJ1Y3Qgc3BpX25vcl9jb250cm9sbGVyX29wcyciKQ0K
PiANCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBhdHRlbnRpb24hDQo+IA0K
