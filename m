Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E719F0E1D
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 06:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbfKFFNZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 00:13:25 -0500
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:11057 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfKFFNZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2019 00:13:25 -0500
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
  Ajay.Kathat@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ajay.Kathat@microchip.com";
  x-sender="Ajay.Kathat@microchip.com"; x-conformance=spf_only;
  x-record-type="v=spf1"; x-record-text="v=spf1 mx
  a:ushub1.microchip.com a:smtpout.microchip.com
  a:mx1.microchip.iphmx.com a:mx2.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
  envelope-from="Ajay.Kathat@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com; spf=Pass smtp.mailfrom=Ajay.Kathat@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: u+dJvM7m1RERMFQN0ayRwEiBRX6JSaIgllO+0hX+tb6N+Fvs5lZjIFMqdvfr4hEsTt50dsKOmn
 ZRUa3OfeLrVdFMmJdrSs9p8PZ2dx06ZxdrnnP0FoQpri6TUx8YjbaLsvUtvE8+TmlpHDIo9nBb
 hnJeXctsKJFoVfVm/t5YRvzfKrFieDUTVBkk+FJPd2l7PiXaP5aJuQSUGOnfNi8B5Tcu6FIpdA
 MdbPrDjO4mZAPJGqQQldbiJ58wNLqavCuugQ54RCGYM3MH9QJwlnRgncpg5cpZXgGuGAN2Xl9U
 +84=
X-IronPort-AV: E=Sophos;i="5.68,272,1569308400"; 
   d="scan'208";a="57160101"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Nov 2019 22:13:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 5 Nov 2019 22:13:24 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 5 Nov 2019 22:13:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmMh5R3cP01TfOOxYytYm1CVZpJ0ejkXo40PKhVy+3xsUlK1lWOOK/jaIHHRNwMBeOO7iCc4b6oEGD++dNsYm7O7drhhZx4yflunDXP3JdznRSx+yK1qp6sBblIf9M/aAocwPxzoP1SIluwh+HHUi1UG4MfTtxGzEIKVTGARF9Pz97bLTEgAiKLSg3J0GEruASqFQGSVxir3k1kPhGMM6JH8Cr/+Dh/rqdNsLZdgVxOTkz1wFs5LzekE1g+FpTtzewfWzr7hv6jG1RnGiyOkuD4W0cgyAT25uTvfIrm2NjZaQWLDg4JsOH/KQCOzGV2HONdG8LW53AIXaLRl6b65vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pyfht0a4ZIUXxH249CFkjEl172v1sUVONAeuhXoJ5C0=;
 b=dbMk3NsuubsY1QHeX7fYTzzO88qOCqqnL1vly/dfJrB66IifBthCf57Soq3ZcZDygZH6ozQlSEATKH3Np2/W7Kde1xwWU26piW7z+Q2ZPjCXngJ6XWCW4nTqxe6xFtHkn6CzSLIpQmeVc223exkaETR9oR+H6Fsu54zsuZPr3PYFCIfor9UMXkS224+T+qLPv9XdayQy5oAxaJ4tLtXASOMuh4/vqyuRHR6ZAdsXDiWGv5dSJZw2gW1XZXgPJy1616gWj9HWz6k91bVEmX1as+tKMrKEMiXeDf6mGVY5Rycz93Q1NVzOvH1Gjo0QPvBm0fyC5GhGe2DrSqA+wdQaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pyfht0a4ZIUXxH249CFkjEl172v1sUVONAeuhXoJ5C0=;
 b=mamIHgyjkNBLajwyfUceoaUZcMkGCP5EJo13lsk361WOuMW6H8IGLVj5nCEk/ORNNbOLRsJpfPNMMIzZrUQ8EuKCIt/afTb3LSXcaPvOv5/EKE4eA+l2ky+srslC+/Tpk6pLx8Y8BJ+4ibQwfwZXiVZ5ITEnIg0lWhuozQXMdAk=
Received: from BN6PR11MB3985.namprd11.prod.outlook.com (10.255.129.78) by
 BN6PR11MB1922.namprd11.prod.outlook.com (10.175.98.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 05:13:22 +0000
Received: from BN6PR11MB3985.namprd11.prod.outlook.com
 ([fe80::5994:7522:979f:5e29]) by BN6PR11MB3985.namprd11.prod.outlook.com
 ([fe80::5994:7522:979f:5e29%7]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 05:13:22 +0000
From:   <Ajay.Kathat@microchip.com>
To:     <keescook@chromium.org>
CC:     <gregkh@linuxfoundation.org>, <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>, <Adham.Abozaeid@microchip.com>
Subject: Re: Coverity: wilc_parse_join_bss_param(): Memory - illegal accesses
Thread-Topic: Coverity: wilc_parse_join_bss_param(): Memory - illegal accesses
Thread-Index: AQHVkzbIbwrvZcNwZUuxKscbThwdXKd8GR8AgAC4zgCAAMlpgA==
Date:   Wed, 6 Nov 2019 05:13:22 +0000
Message-ID: <bff3b3cd-de14-028a-34fa-a338aaa36463@microchip.com>
References: <201911040938.57CCE1B@keescook>
 <ce212f1d-e04d-6c95-ff18-2ddbed982bd9@microchip.com>
 <201911050911.E5A34776F3@keescook>
In-Reply-To: <201911050911.E5A34776F3@keescook>
Reply-To: <Ajay.Kathat@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:35::35) To BN6PR11MB3985.namprd11.prod.outlook.com
 (2603:10b6:405:7b::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [121.244.27.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d59f3bb0-9d27-4b3e-bfa6-08d762780b84
x-ms-traffictypediagnostic: BN6PR11MB1922:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB19220C33FC5DDC4AE0240370E3790@BN6PR11MB1922.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(346002)(136003)(366004)(39860400002)(189003)(199004)(6306002)(31696002)(478600001)(6512007)(26005)(14454004)(476003)(6916009)(3450700001)(2616005)(2906002)(966005)(43066004)(36756003)(66066001)(14444005)(316002)(256004)(54906003)(5660300002)(305945005)(102836004)(52116002)(76176011)(386003)(6506007)(7736002)(31686004)(86362001)(6246003)(81156014)(186003)(486006)(71190400001)(4326008)(11346002)(446003)(8936002)(66556008)(66946007)(99286004)(66476007)(3846002)(6116002)(25786009)(107886003)(71200400001)(66446008)(6486002)(64756008)(6436002)(8676002)(53546011)(229853002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR11MB1922;H:BN6PR11MB3985.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RYOk6xCq4AQZhR8uL9B6RRAJ/A93tIPgRi/5iA7NdBdOP4qlLc/BhYmGlsLy5WguNWSwHeyvj8g5mc+cJ05kDXB2JsDVN+85OJh0G0k5TNpl72P7G5KW1gcQdj/wNY9vsDBNRoYtGCpQ1Sw+Ir8R4m1l90MoY335klLpMyXpOr7Ft791DjxlQnTDa6OvxXhEvJenNLoCqGzh0qhrXNw6pRhb2BluP6cPqFTOjB/tFr2aYMNBeqYf+AxxyFcaVg8MP1/A+FpDPmSGlZO5wlGjwWWs0ypJGJPRURF5Rt4UgBUZF8rm/EYSfNRX16+aPvbS/sPYzaeTAThvY6LPjTHWWoA+Ykvdtm97ZKX0loQHokdYUF0cJ931P2AOMhzsYeBEafIzc049zs+Vm4EvlJoPZBcTf6iOlQFXTE3k5onLQ/ei9xoSWgNwGvzMURxGDERxzpcMtLFrQeWnOetYo4rE3MiwTuMfIj4qoEIAdEWAL/g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6D2C2D8E84D8046BA196861A668CB4C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f3bb0-9d27-4b3e-bfa6-08d762780b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 05:13:22.6470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Or9VAQnlJTiiLwDZnBtXfhVmbRDCep3t3UPih3VOddwWAW1jUm2pIEdBKkPZM8tVMbxMX0geSNIh8uM0xRCeFxHWgOdjDB1unhaoHvAhbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1922
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCk9uIDA1LU5vdi0xOSAxMDo0MiBQTSwgS2VlcyBDb29rIHdyb3RlOg0KPiBFeHRlcm5hbCBF
LU1haWwNCj4gDQo+IA0KPiBPbiBUdWUsIE5vdiAwNSwgMjAxOSBhdCAwNjoxMTowM0FNICswMDAw
LCBBamF5LkthdGhhdEBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAwNC1Ob3Yt
MTkgMTE6MDggUE0sIGNvdmVyaXR5LWJvdCB3cm90ZToNCj4+PiBFeHRlcm5hbCBFLU1haWwNCj4+
Pg0KPj4+DQo+Pj4gSGVsbG8hDQo+Pj4NCj4+PiBUaGlzIGlzIGFuIGV4cGVyaW1lbnRhbCBhdXRv
bWF0ZWQgcmVwb3J0IGFib3V0IGlzc3VlcyBkZXRlY3RlZCBieSBDb3Zlcml0eQ0KPj4+IGZyb20g
YSBzY2FuIG9mIG5leHQtMjAxOTEwMzEgYXMgcGFydCBvZiB0aGUgbGludXgtbmV4dCB3ZWVrbHkg
c2NhbiBwcm9qZWN0Og0KPj4+IGh0dHBzOi8vc2Nhbi5jb3Zlcml0eS5jb20vcHJvamVjdHMvbGlu
dXgtbmV4dC13ZWVrbHktc2Nhbg0KPj4+DQo+Pj4gWW91J3JlIGdldHRpbmcgdGhpcyBlbWFpbCBi
ZWNhdXNlIHlvdSB3ZXJlIGFzc29jaWF0ZWQgd2l0aCB0aGUgaWRlbnRpZmllZA0KPj4+IGxpbmVz
IG9mIGNvZGUgKG5vdGVkIGJlbG93KSB0aGF0IHdlcmUgdG91Y2hlZCBieSByZWNlbnQgY29tbWl0
czoNCj4+Pg0KPj4+IDRlMGIwZjQyYzljNyAoInN0YWdpbmc6IHdpbGMxMDAwOiB1c2Ugc3RydWN0
IHRvIHBhY2sgam9pbiBwYXJhbWV0ZXJzIGZvciBGVyIpDQo+Pj4NCj4+PiBDb3Zlcml0eSByZXBv
cnRlZCB0aGUgZm9sbG93aW5nOg0KPj4+DQo+Pj4gKioqIENJRCAxNDg3NDAwOiAgTWVtb3J5IC0g
aWxsZWdhbCBhY2Nlc3NlcyAgKE9WRVJSVU4pDQo+Pj4gL2RyaXZlcnMvc3RhZ2luZy93aWxjMTAw
MC93aWxjX2hpZi5jOiA0OTYgaW4gd2lsY19wYXJzZV9qb2luX2Jzc19wYXJhbSgpDQo+Pj4gNDkw
ICAgICAJaWYgKHN1cHBfcmF0ZXNfaWUpIHsNCj4+PiA0OTEgICAgIAkJaWYgKHN1cHBfcmF0ZXNf
aWVbMV0gPiAoV0lMQ19NQVhfUkFURVNfU1VQUE9SVEVEIC0gcmF0ZXNfbGVuKSkNCj4+PiA0OTIg
ICAgIAkJCXBhcmFtLT5zdXBwX3JhdGVzWzBdID0gV0lMQ19NQVhfUkFURVNfU1VQUE9SVEVEOw0K
Pj4+IDQ5MyAgICAgCQllbHNlDQo+Pj4gNDk0ICAgICAJCQlwYXJhbS0+c3VwcF9yYXRlc1swXSAr
PSBzdXBwX3JhdGVzX2llWzFdOw0KPj4+IDQ5NQ0KPj4+IHZ2diAgICAgQ0lEIDE0ODc0MDA6ICBN
ZW1vcnkgLSBpbGxlZ2FsIGFjY2Vzc2VzICAoT1ZFUlJVTikNCj4+PiB2dnYgICAgIE92ZXJydW5u
aW5nIGFycmF5IG9mIDEzIGJ5dGVzIGF0IGJ5dGUgb2Zmc2V0IDEzIGJ5IGRlcmVmZXJlbmNpbmcg
cG9pbnRlciAiJnBhcmFtLT5zdXBwX3JhdGVzW3JhdGVzX2xlbiArIDFdIi4gW05vdGU6IFRoZSBz
b3VyY2UgY29kZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24gaGFzIGJlZW4gb3ZlcnJp
ZGRlbiBieSBhIGJ1aWx0aW4gbW9kZWwuXQ0KPj4+IDQ5NiAgICAgCQltZW1jcHkoJnBhcmFtLT5z
dXBwX3JhdGVzW3JhdGVzX2xlbiArIDFdLCBzdXBwX3JhdGVzX2llICsgMiwNCj4+PiA0OTcgICAg
IAkJICAgICAgIChwYXJhbS0+c3VwcF9yYXRlc1swXSAtIHJhdGVzX2xlbikpOw0KPj4NCj4+IEFz
IEkgdW5kZXJzdGFuZCwgSWRlYWxseSB0aGlzIGNvbmRpdGlvbiBzaG91bGQgbmV2ZXIgYXJpc2Ug
YmVjYXVzZSB0aGUNCj4+IG1heGltdW0gbnVtYmVyIG9mIHN1cHBvcnRlZCAqYmFzaWMgcmF0ZXMq
IGlzIHVwIHRvIDggc28gdGhlIHZhbHVlIG9mDQo+PiDigJhyYXRlX2xlbuKAmSB3aWxsIGFsd2F5
cyBiZSBsZXNzIHRoZW4gV0lMQ19NQVhfUkFURVNfU1VQUFBSVEVEIChpLmUgMTIpLg0KPj4gVGhl
cmVmb3JlICcmcGFyYW0tPnN1cHBfcmF0ZXNbcmF0ZXNfbGVuKyAxXScgd2lsbCBuZXZlciB0cnkg
dG8gYWNjZXNzDQo+PiB0aGUgMTMgYnl0ZXMgaW4gdGhlIGFycmF5Lg0KPj4gQnV0IGZvciB0aGUg
c2FmZXIgc2lkZSwgaWYgbmVlZCBJIGNhbiBjcmVhdGUgYSBwYXRjaCB0byBibG9jayB0aGUNCj4+
IGFkZGl0aW9uIG9mIGV4dGVuZGVkIHN1cHBvcnRlZCByYXRlcyBpbiDigJhwYXJhbS0+c3VwcF9y
YXRlc+KAmSBhcnJheSBpZg0KPj4g4oCYcmF0ZXNfbGVu4oCZIGlzIDEyIChpLmUgJ3BhcmFtLT5z
dXBwX3JhdGVzJyBhcnJheSBpcyBmdWxsIGFmdGVyIGZpbGluZw0KPj4gdGhlIGJhc2ljIHN1cHBv
cnRlZCByYXRlcykuDQo+IA0KPiBJIGRvbid0IGtub3cgdGhlIGNvZGUgbXlzZWxmLCBidXQgZ2Vu
ZXJhbGx5IHNwZWFraW5nLCBpdCdzIGJlc3QgdG8NCj4gdmFsaWRhdGUgYW55IGFzc3VtcHRpb25z
IGxpa2UgdGhpcy4gSSdkIHNheSBhZGQgYSBwYXRjaCBmb3IgaXQsIHNpbmNlIGl0DQo+IHNvdW5k
cyBwcmV0dHkgc3RyYWlnaHQtZm9yd2FyZCB0byB0ZXN0Lg0KDQpTdXJlLCBJIHdpbGwgYWRkIGEg
cGF0Y2ggZm9yIHRoaXMuDQoNClJlZ2FyZHMsDQpBamF5DQo=
