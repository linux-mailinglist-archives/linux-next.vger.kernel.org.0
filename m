Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49419E87F
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 14:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbfH0M6U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 08:58:20 -0400
Received: from mail-eopbgr680127.outbound.protection.outlook.com ([40.107.68.127]:23887
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727089AbfH0M6U (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Aug 2019 08:58:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdDPN8DxDSTBFwxswdaXHXltlXKeWkZg9fwaK1ac1oFLixz+K3ORWpQuiip3ApRedzvYffYeH+wON0URto++tfdmvn0d3uEn6KUW9rqMW9b4vczRQ+9vCZFd4ph1TPUSbTeknZEczXHxsoBPqTiUnmf69BebmPCbVUFZ3CSqNs/kXxS1No0G5bPdLsH6uLRcg6SS2rydMGg6gKV7n2kGVYXJgiCAxpyv8nROLc0Rxkn3upOJmSDuTOWAHt4bTXX5GeQ5dhUxB1BmXTg5YjOh5WbzeHhA8BWNsPkf+TcDlbm+kv0HzE9gr652xNp8iAJMtjCY9hJjoqx+tBUEv3uiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/C4PkNQedwNYM1EURSjwvdEGsXbXUrRck47AsO7/eU=;
 b=JPmrRdijjnqoNNuYbsrJKaCCqILIWNmSJfWGt1gXjJO3DxO1ZQo1xd6zagrwbvPdURCinyD7nzoFiIuc611pVfGttr7tt0CHhuP5BWwCLoQkkDEy/yviAwUoBvmHkQ1iGi3NM/jGTtB7SpMk+LtO8RKNBrwriHNoT/BHVTmPhOZnyBede0HrqyXNoy7U/suvbiiXnL8cag0FDGtMSOMlDJro1iy5DubV8wuyVTkLLjYIMIXEz8wuUBS8BqkvuXQfjgHh2FwQ0qiBPF3TTvea//36FH+rvef5H69gk1usDz+HwU43gOl/9OdE/JpJkOsdS3uvA7hZeuSfyRAdP7P/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/C4PkNQedwNYM1EURSjwvdEGsXbXUrRck47AsO7/eU=;
 b=XRSKmg+toZ6E5ur/RzPEHpWpO0nwh29RixbNhx66o0g4zLcbUeItb4FbqrtKsMXMWKwdSrLVNlk81G9KG3CU6i46IKKljlrVsBiZfl2ezmknVk+MgwVNRXvXOsKSJnByDUizqjZECcs2bsxJfEXX/TBNDTypJ8G7GPJ6mO2v1mY=
Received: from DM5PR13MB1851.namprd13.prod.outlook.com (10.171.159.143) by
 DM5PR13MB1578.namprd13.prod.outlook.com (10.175.110.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.14; Tue, 27 Aug 2019 12:58:16 +0000
Received: from DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75]) by DM5PR13MB1851.namprd13.prod.outlook.com
 ([fe80::5d60:e645:84a2:be75%7]) with mapi id 15.20.2220.013; Tue, 27 Aug 2019
 12:58:16 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "jstancek@redhat.com" <jstancek@redhat.com>
CC:     "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
        "the_hoang0709@yahoo.com" <the_hoang0709@yahoo.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "ltp@lists.linux.it" <ltp@lists.linux.it>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "chrubis@suse.cz" <chrubis@suse.cz>,
        "alexey.kodanev@oracle.com" <alexey.kodanev@oracle.com>
Subject: Re: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed to
 run cmd: useradd hsym
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UAj4lK/k3wd0xbAPZWZFoxiapkYwA=
Date:   Tue, 27 Aug 2019 12:58:16 +0000
Message-ID: <294428f05e4dba1a6b10b8744cfa5da0637f84a4.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
         <20190826104127.GA14729@haruka>
         <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
         <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
         <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com>
         <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
         <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
         <566e862d9bfaf88cdde6d66f0f59033fe6225a22.camel@hammerspace.com>
         <866876796.8349197.1566901536625.JavaMail.zimbra@redhat.com>
In-Reply-To: <866876796.8349197.1566901536625.JavaMail.zimbra@redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cb6392f-fa45-4bd5-a064-08d72aee3a4e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR13MB1578;
x-ms-traffictypediagnostic: DM5PR13MB1578:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR13MB15783D05D2CC0AE37C3DB1FDB8A00@DM5PR13MB1578.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(376002)(39840400004)(366004)(199004)(189003)(478600001)(71190400001)(53936002)(66066001)(6436002)(71200400001)(86362001)(1730700003)(81156014)(81166006)(8676002)(6512007)(5660300002)(5640700003)(91956017)(66946007)(6116002)(66556008)(66446008)(36756003)(118296001)(8936002)(76116006)(6486002)(6506007)(6306002)(64756008)(186003)(2501003)(2351001)(2906002)(76176011)(66476007)(486006)(6246003)(2616005)(476003)(26005)(25786009)(3846002)(966005)(102836004)(14444005)(14454004)(11346002)(4326008)(99286004)(7736002)(54906003)(305945005)(6916009)(256004)(229853002)(316002)(446003);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR13MB1578;H:DM5PR13MB1851.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VZElwg4Xi9UB1zKFdCKgk56rwCJWEoK/BU+HvS9g6Mogmm0LMEtJ6YrJRjW4K/HQ6z4PxAyGlWuH81jqYvNt4+6RcQo7V1SFiWDhGtKH3dqX8f2RLzWInrF254HjkpaZ81WbXM6swl3ifBXhe3QqyENzLvxGX1l1cpHmfvuytisjA/j7A7bVz6VvBOuOIx677f/gH/z2hH9XDVHEYYICaf2HNjlcLB5gtBU8MFGNlI1Y4rDacUTGku8M7swAdahqDLzosFWEE7fQPeIefPK6RC4kUraVk4Ab5o8WHn9LUEs0VDbY83iShbgNMkDVTLGfLBlMXezy+FbVB+fBz1Wm59ZMBsfSz9xEp7DLa6PCzrGB7RpZ0ETf/s4OP7cXeFxRsnR/EDo5L/fR/jY45mNgT4mskFrRJ8hWrHAD8GuM0hw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BAF43BB42B35B409DA83EB004335E6B@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb6392f-fa45-4bd5-a064-08d72aee3a4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 12:58:16.3949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yNGIzV3qjUqBWzqLiyxFqHgbfg4Xubn971yOa0xSxiuixPBv8i3gFMQ5/IM2rJgJpci/RpUnzyyQGowR1cszow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1578
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVHVlLCAyMDE5LTA4LTI3IGF0IDA2OjI1IC0wNDAwLCBKYW4gU3RhbmNlayB3cm90ZToNCj4g
VGhhdCB0aGVvcnkgaXMgcHJvYmFibHkgbm90IGNvcnJlY3QgZm9yIHRoaXMgY2FzZSwgc2luY2Ug
RUlPIEkgc2VlDQo+IGFwcGVhcnMNCj4gdG8gb3JpZ2luYXRlIGZyb20gd3JpdGUgYW5kIG5mc193
cml0ZWJhY2tfcmVzdWx0KCkuIFRoaXMgZnVuY3Rpb24NCj4gYWxzbw0KPiBwcm9kdWNlcyBtZXNz
YWdlIHdlIHNhdyBpbiBsb2dzIGZyb20gTmFyZXNoLg0KPiANCj4gSSBjYW4ndCBmaW5kIHdoZXJl
L2hvdyBpcyByZXNwLT5jb3VudCB1cGRhdGVkIG9uIFdSSVRFIHJlcGx5IGluDQo+IE5GU3YyLg0K
PiBJc3N1ZSBhbHNvIGdvZXMgYXdheSB3aXRoIHBhdGNoIGJlbG93LCB0aG91Z2ggSSBjYW4ndCBz
cGVhayBhYm91dCBpdHMNCj4gY29ycmVjdG5lc3M6DQo+IA0KPiBORlMgdmVyc2lvbiAgICAgVHlw
ZSAgICBUZXN0ICAgIFJldHVybiBjb2RlDQo+IG5mc3ZlcnM9MiAgICAgICB0Y3AgICAgIC1iOmJh
c2UgICAgICAgICAwDQo+IG5mc3ZlcnM9MiAgICAgICB0Y3AgICAgIC1nOmdlbmVyYWwgICAgICAw
DQo+IG5mc3ZlcnM9MiAgICAgICB0Y3AgICAgIC1zOnNwZWNpYWwgICAgICAwDQo+IG5mc3ZlcnM9
MiAgICAgICB0Y3AgICAgIC1sOmxvY2sgICAgICAgICAwDQo+IFRvdGFsIHRpbWU6IDE0MQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2ZzL25mcy9uZnMyeGRyLmMgYi9mcy9uZnMvbmZzMnhkci5jDQo+IGlu
ZGV4IGNiYzE3YTIwMzI0OC4uNDkxM2M2ZGEyNzBiIDEwMDY0NA0KPiAtLS0gYS9mcy9uZnMvbmZz
Mnhkci5jDQo+ICsrKyBiL2ZzL25mcy9uZnMyeGRyLmMNCj4gQEAgLTg5Nyw2ICs4OTcsMTYgQEAg
c3RhdGljIGludCBuZnMyX3hkcl9kZWNfd3JpdGVyZXMoc3RydWN0IHJwY19ycXN0DQo+ICpyZXEs
IHN0cnVjdCB4ZHJfc3RyZWFtICp4ZHIsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKmRhdGEpDQo+ICB7DQo+ICAgICAgICAgc3RydWN0IG5mc19wZ2lvX3JlcyAqcmVz
dWx0ID0gZGF0YTsNCj4gKyAgICAgICBzdHJ1Y3QgcnBjX3Rhc2sgKnJxX3Rhc2sgID0gcmVxLT5y
cV90YXNrOw0KPiArDQo+ICsgICAgICAgaWYgKHJxX3Rhc2spIHsNCj4gKyAgICAgICAgICAgICAg
IHN0cnVjdCBuZnNfcGdpb19hcmdzICphcmdzID0gcnFfdGFzay0NCj4gPnRrX21zZy5ycGNfYXJn
cDsNCj4gKw0KPiArICAgICAgICAgICAgICAgaWYgKGFyZ3MpIHsNCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmVzdWx0LT5jb3VudCA9IGFyZ3MtPmNvdW50Ow0KPiArICAgICAgICAgICAgICAg
fQ0KPiArICAgICAgIH0NCj4gIA0KPiAgICAgICAgIC8qIEFsbCBORlN2MiB3cml0ZXMgYXJlICJm
aWxlIHN5bmMiIHdyaXRlcyAqLw0KPiAgICAgICAgIHJlc3VsdC0+dmVyZi0+Y29tbWl0dGVkID0g
TkZTX0ZJTEVfU1lOQzsNCg0KVGhhbmtzISBJJ3ZlIG1vdmVkIHRoZSBhYm92ZSB0byBuZnNfd3Jp
dGVfZG9uZSgpIHNvIHRoYXQgd2UgZG8gaXQgb25seQ0Kb24gc3VjY2VzcyAoc2VlIA0KaHR0cDov
L2dpdC5saW51eC1uZnMub3JnLz9wPXRyb25kbXkvbGludXgtbmZzLmdpdDthPWNvbW1pdGRpZmY7
aD0zYmE1Njg4ZGE3MDlkZDBmN2Q5MTcwMjljMjA2YmMxODQ4YTZhZTc0DQopDQotLSANClRyb25k
IE15a2xlYnVzdA0KTGludXggTkZTIGNsaWVudCBtYWludGFpbmVyLCBIYW1tZXJzcGFjZQ0KdHJv
bmQubXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbQ0KDQoNCg==
