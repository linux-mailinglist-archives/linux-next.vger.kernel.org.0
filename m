Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 582939D38C
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 17:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730502AbfHZP6K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 11:58:10 -0400
Received: from mail-eopbgr700121.outbound.protection.outlook.com ([40.107.70.121]:26465
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727864AbfHZP6K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 11:58:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XIx6MXqqsuAR3N+M3ioFwi3d6I7kX7gml+0ndR7NL/IrknAePCIsphE0ItS+4URF6Q98pMSTJmgldUlK/7srZIvxC6y0gx0Drug6qsZhqNidkrKu5dCO2bDKFEPEbnaTgsIqiEnLJARkuxprOooLYh98SYX4X/TvX9kjhWT0sBBQYJuqPeQIIWT63E3dxHXfo9OhHZSv3ig18JHMjUFghzjJ5yg6jrOvXDmZHD4GeI5zDqRC2h3FjHP3c+yl9EWzahgyi0s/FpUS5YqNuAH1qob/NhqI2IJ0MoIj6ghIoPxnqZMXIZkfZCySlf3kHMOprAmy4iyoXH9VUHoN1LA+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3livyXFbZmRcksN3UJ44A495x69C0g2qogsuns2cSxg=;
 b=klWfSyeiTfh+yKjyvYXSbNZM8AbrcgtQVJUMFerrlI5rrrvhNAxsK/IKm0vGoE070vBwichFRLNc6h+1E5KZFVZ9rQW4K7vwQSgcsfNeahB/m5OZjGnZXtGy9kY7VFzsueinsL04iLCbRf/KdVsj26GduZK0vbxNJAKZ0J0BEYNAuLyaYdZ0RCPq298ZxTzOXrd7MQ2fX3cZ/tUC2AFgiuY3zEJSqi1ldEeXXDQsvwpSJGIxTFwsM+Lt0OgR0qSti3/yBU5lGZNaDNH/4UoBYHg3PJc72WqmCPYSrx3YsUneaBWzqE2Kq8gH8Cxp8yauefpGQxiTQNBVEYgS7OXLVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3livyXFbZmRcksN3UJ44A495x69C0g2qogsuns2cSxg=;
 b=AzJ0CXOsHZwo4fVRrJdD++Y9TCzFTIlLxpOLpjIYQES6vt2cz2eB3aLtgJlYAncp1FTb0EnPus+RVvlWA3vnRxYo/347amn1xOe0gOVXoR4Iy11dollwzoDNOQTmlX3V4xjIeifaahQVFybhNQyrFD85YakWgNvKrHd6aGp/jlE=
Received: from DM5PR13MB1851.namprd13.prod.outlook.com (10.171.159.143) by
 DM5PR13MB1193.namprd13.prod.outlook.com (10.168.237.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.13; Mon, 26 Aug 2019 15:58:06 +0000
Received: from DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75]) by DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75%7]) with mapi id 15.20.2220.013; Mon, 26 Aug 2019
 15:58:06 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
        "jstancek@redhat.com" <jstancek@redhat.com>
CC:     "the_hoang0709@yahoo.com" <the_hoang0709@yahoo.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "ltp@lists.linux.it" <ltp@lists.linux.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "chrubis@suse.cz" <chrubis@suse.cz>,
        "alexey.kodanev@oracle.com" <alexey.kodanev@oracle.com>
Subject: Re: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed to
 run cmd: useradd hsym
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UA
Date:   Mon, 26 Aug 2019 15:58:06 +0000
Message-ID: <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
         <20190826104127.GA14729@haruka>
         <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
         <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
         <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
In-Reply-To: <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0c14d9d-4a02-45aa-cb3b-08d72a3e2f17
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR13MB1193;
x-ms-traffictypediagnostic: DM5PR13MB1193:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR13MB119375D054E6A6C184836005B8A10@DM5PR13MB1193.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(396003)(39830400003)(136003)(376002)(13464003)(189003)(199004)(71200400001)(53546011)(2616005)(476003)(186003)(966005)(26005)(8676002)(478600001)(6246003)(118296001)(2906002)(305945005)(6306002)(53936002)(66066001)(8936002)(446003)(6486002)(5660300002)(81156014)(81166006)(14444005)(256004)(11346002)(2501003)(7736002)(4326008)(14454004)(36756003)(86362001)(6512007)(110136005)(54906003)(76176011)(3846002)(6116002)(66946007)(64756008)(66476007)(66556008)(91956017)(66446008)(76116006)(71190400001)(99286004)(6506007)(229853002)(6436002)(25786009)(316002)(102836004)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR13MB1193;H:DM5PR13MB1851.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 607cCHGyMdwGZB2EoB8QeagfV1YSGZRKySWy7EBRa6RsbBgUA7NoK95yMtf6rFje2pvTH0ssD/WHWRq22MmrEkB5FIdZE2fQ+/eCwaZMQqb10szEo4mAGrxhLfQTrEkNKuhT2RMgOg7V6bE4NYKs6zJnQUhZdP0TLgVbtQjmq6hRxAlgAKoHa3107tcWLtzSFcN4VK+pKS1DIM1qDCeISZeFBsZAaSBpcHz+kltc+7a/lhV6xYKBPwemx6yO8QGb3U5vQjEzX2SVFke3kzTQKhwpamIqhL28cpz1wVH360VpgMfyEjdjDYo8u7/ZpGFr+k26Z3q3ZpFBllgH7f3MnA5y8CblEmIHcgiEczKKdjLSkzqYRfPrvxMVfoAJ0ov4ue/mR7NdfiQOTzoq6I7m1/G+BuyELfNFTSASV9IZ3yw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <594F395B996E124B9C666F10A11B7824@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c14d9d-4a02-45aa-cb3b-08d72a3e2f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 15:58:06.1592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdRXu3VtSLCIzWigkcglnGMCCqKT306B8NDY6MQqqpgf/nz1nfYeBi9ADViRut5wWnxQbHlv4Jj9pm+qdh4L2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1193
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gTW9uLCAyMDE5LTA4LTI2IGF0IDEwOjM4IC0wNDAwLCBKYW4gU3RhbmNlayB3cm90ZToNCj4g
LS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQ0KPiA+IEhpIEphbiBhbmQgQ3lyaWwsDQo+ID4g
DQo+ID4gT24gTW9uLCAyNiBBdWcgMjAxOSBhdCAxNjozNSwgSmFuIFN0YW5jZWsgPGpzdGFuY2Vr
QHJlZGhhdC5jb20+DQo+ID4gd3JvdGU6DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gLS0tLS0gT3Jp
Z2luYWwgTWVzc2FnZSAtLS0tLQ0KPiA+ID4gPiBIaSENCj4gPiA+ID4gPiBEbyB5b3Ugc2VlIHRo
aXMgTFRQIHByb3RfaHN5bWxpbmtzIGZhaWx1cmUgb24gbGludXggbmV4dA0KPiA+ID4gPiA+IDIw
MTkwODIzIG9uDQo+ID4gPiA+ID4geDg2XzY0IGFuZCBpMzg2IGRldmljZXM/DQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gdGVzdCBvdXRwdXQgbG9nLA0KPiA+ID4gPiA+IHVzZXJhZGQ6IGZhaWx1cmUg
d2hpbGUgd3JpdGluZyBjaGFuZ2VzIHRvIC9ldGMvcGFzc3dkDQo+ID4gPiA+ID4gdXNlcmFkZDog
L2hvbWUvaHN5bSB3YXMgY3JlYXRlZCwgYnV0IGNvdWxkIG5vdCBiZSByZW1vdmVkDQo+ID4gPiA+
IA0KPiA+ID4gPiBUaGlzIGxvb2tzIGxpa2UgYW4gdW5yZWxhdGVkIHByb2JsZW0sIGZhaWx1cmUg
dG8gd3JpdGUgdG8NCj4gPiA+ID4gL2V0Yy9wYXNzd2QNCj4gPiA+ID4gcHJvYmFibHkgbWVhbnMg
dGhhdCBmaWxlc3lzdGVtIGlzIGZ1bGwgb3Igc29tZSBwcm9ibGVtIGhhcHBlbmQNCj4gPiA+ID4g
YW5kIGhvdw0KPiA+ID4gPiBpcyByZW1vdW50ZWQgUk8uDQo+ID4gPiANCj4gPiA+IEluIE5hcmVz
aCcgZXhhbXBsZSwgcm9vdCBpcyBvbiBORlM6DQo+ID4gPiAgIHJvb3Q9L2Rldi9uZnMgcncNCj4g
PiA+ICANCj4gPiA+IG5mc3Jvb3Q9MTAuNjYuMTYuMTIzOi92YXIvbGliL2xhdmEvZGlzcGF0Y2hl
ci90bXAvODg2NDEyL2V4dHJhY3QtDQo+ID4gPiBuZnNyb290ZnMtdHl1ZXZveG0sdGNwLGhhcmQs
aW50cg0KPiA+IA0KPiA+IFJpZ2h0ICENCj4gPiByb290IGlzIG1vdW50ZWQgb24gTkZTLg0KPiA+
IA0KPiA+ID4gMTAuNjYuMTYuMTIzOi92YXIvbGliL2xhdmEvZGlzcGF0Y2hlci90bXAvODg2NDEy
L2V4dHJhY3QtDQo+ID4gPiBuZnNyb290ZnMtdHl1ZXZveG0NCj4gPiA+IG9uIC8gdHlwZSBuZnMN
Cj4gPiA+IChydyxyZWxhdGltZSx2ZXJzPTIscnNpemU9NDA5Nix3c2l6ZT00MDk2LG5hbWxlbj0y
NTUsaGFyZCxub2xvY2ssDQo+ID4gPiBwcm90bz10Y3AsdGltZW89NjAwLHJldHJhbnM9MixzZWM9
c3lzLG1vdW50YWRkcj0xMC42Ni4xNi4xMjMsbW91bg0KPiA+ID4gdHZlcnM9MSxtb3VudHByb3Rv
PXRjcCxsb2NhbF9sb2NrPWFsbCxhZGRyPTEwLjY2LjE2LjEyMykNCj4gPiA+IGRldnRtcGZzIG9u
IC9kZXYgdHlwZSBkZXZ0bXBmcw0KPiA+ID4gKHJ3LHJlbGF0aW1lLHNpemU9Mzk3NzY0MGssbnJf
aW5vZGVzPTk5NDQxMCxtb2RlPTc1NSkNCj4gPiA+IA0KDQpUaGUgb25seSB0aGluZyBJIGNhbiB0
aGluayBvZiB0aGF0IG1pZ2h0IGNhdXNlIGFuIEVJTyBvbiBORlN2MiB3b3VsZCBiZQ0KdGhpcyBw
YXRjaCANCmh0dHA6Ly9naXQubGludXgtbmZzLm9yZy8/cD10cm9uZG15L2xpbnV4LW5mcy5naXQ7
YT1jb21taXRkaWZmO2g9NjI3ZDQ4ZTU5N2VjNTk5M2M0YWJiM2I4MWRjNzVlNTU0YTA3YzdjMA0K
YXNzdW1pbmcgdGhhdCBhIGJpbmQtcmVsYXRlZCBlcnJvciBpcyBsZWFraW5nIHRocm91Z2guDQoN
CkknZCBzdWdnZXN0IHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dpbmcgdG8gZml4IGl0IHVwOg0K
DQo4PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KRnJvbSAxZTkzMzZh
YzUzNjM5MTRkZmNjMWY0OWJmMDkxNDA5ZWRiZjM2ZjhkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQ0KRnJvbTogVHJvbmQgTXlrbGVidXN0IDx0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29t
Pg0KRGF0ZTogTW9uLCAyNiBBdWcgMjAxOSAxMTo0NDowNCAtMDQwMA0KU3ViamVjdDogW1BBVENI
XSBmaXh1cCEgU1VOUlBDOiBEb24ndCBoYW5kbGUgZXJyb3JzIGlmIHRoZSBiaW5kL2Nvbm5lY3QN
CiBzdWNjZWVkZWQNCg0KU2lnbmVkLW9mZi1ieTogVHJvbmQgTXlrbGVidXN0IDx0cm9uZC5teWts
ZWJ1c3RAaGFtbWVyc3BhY2UuY29tPg0KLS0tDQogbmV0L3N1bnJwYy9jbG50LmMgfCAxNSArKysr
KysrKysrKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL25ldC9zdW5ycGMvY2xudC5jIGIvbmV0L3N1bnJwYy9jbG50
LmMNCmluZGV4IGYxM2VjNzNjODI5OS4uYTA3YjUxNmU1MDNhIDEwMDY0NA0KLS0tIGEvbmV0L3N1
bnJwYy9jbG50LmMNCisrKyBiL25ldC9zdW5ycGMvY2xudC5jDQpAQCAtMTk4MCw5ICsxOTgwLDEx
IEBAIGNhbGxfYmluZF9zdGF0dXMoc3RydWN0IHJwY190YXNrICp0YXNrKQ0KIA0KIAlkcHJpbnRf
c3RhdHVzKHRhc2spOw0KIAl0cmFjZV9ycGNfYmluZF9zdGF0dXModGFzayk7DQotCWlmICh0YXNr
LT50a19zdGF0dXMgPj0gMCB8fCB4cHJ0X2JvdW5kKHhwcnQpKSB7DQotCQl0YXNrLT50a19hY3Rp
b24gPSBjYWxsX2Nvbm5lY3Q7DQotCQlyZXR1cm47DQorCWlmICh0YXNrLT50a19zdGF0dXMgPj0g
MCkNCisJCWdvdG8gb3V0X25leHQ7DQorCWlmICh4cHJ0X2JvdW5kKHhwcnQpKSB7DQorCQl0YXNr
LT50a19zdGF0dXMgPSAwOw0KKwkJZ290byBvdXRfbmV4dDsNCiAJfQ0KIA0KIAlzd2l0Y2ggKHRh
c2stPnRrX3N0YXR1cykgew0KQEAgLTIwNDUsNiArMjA0Nyw5IEBAIGNhbGxfYmluZF9zdGF0dXMo
c3RydWN0IHJwY190YXNrICp0YXNrKQ0KIA0KIAlycGNfY2FsbF9ycGNlcnJvcih0YXNrLCBzdGF0
dXMpOw0KIAlyZXR1cm47DQorb3V0X25leHQ6DQorCXRhc2stPnRrX2FjdGlvbiA9IGNhbGxfY29u
bmVjdDsNCisJcmV0dXJuOw0KIHJldHJ5X3RpbWVvdXQ6DQogCXRhc2stPnRrX3N0YXR1cyA9IDA7
DQogCXRhc2stPnRrX2FjdGlvbiA9IGNhbGxfYmluZDsNCkBAIC0yMTA3LDggKzIxMTIsMTAgQEAg
Y2FsbF9jb25uZWN0X3N0YXR1cyhzdHJ1Y3QgcnBjX3Rhc2sgKnRhc2spDQogCQljbG50LT5jbF9z
dGF0cy0+bmV0cmVjb25uKys7DQogCQlnb3RvIG91dF9uZXh0Ow0KIAl9DQotCWlmICh4cHJ0X2Nv
bm5lY3RlZCh4cHJ0KSkNCisJaWYgKHhwcnRfY29ubmVjdGVkKHhwcnQpKSB7DQorCQl0YXNrLT50
a19zdGF0dXMgPSAwOw0KIAkJZ290byBvdXRfbmV4dDsNCisJfQ0KIA0KIAl0YXNrLT50a19zdGF0
dXMgPSAwOw0KIAlzd2l0Y2ggKHN0YXR1cykgew0KLS0gDQoyLjIxLjANCg0KDQoNCi0tIA0KVHJv
bmQgTXlrbGVidXN0DQpMaW51eCBORlMgY2xpZW50IG1haW50YWluZXIsIEhhbW1lcnNwYWNlDQp0
cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tDQoNCg0K
