Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7435814119D
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 20:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbgAQTZi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jan 2020 14:25:38 -0500
Received: from mail-eopbgr70091.outbound.protection.outlook.com ([40.107.7.91]:65095
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727115AbgAQTZh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Jan 2020 14:25:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+2Cd0hhe3erdxd0HjHRU7AMaJGPT6xNLKO2Zd65O/riQ1gQRq3eWGNGs9kUXGp8Dw/iAyVczHZbmiGvK0MC511IrpT6LSuLFxPjgyZ8MLD6F3BVoihGexWkO2LahhmxAqUkiFHECNJJNqnQQ3hWoYuySmsny9TgoC+tw7P8cnnBMlvOhTProuh8a+iKbud8/4jtkGJt9V7Iz8OuFEF3GYVyihbaXaAlVttNioVkwE9tq5syrF0n/7k+FCU/LHfzr8Hv9hLrS4BAnkHq2FwcsEvb9Aj/k1NAQZ7ibVOgVA8jGvx93Bm5EJu0mpQqNhpFOiu+BIoLODW//EIeNRvirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgQnG6EbZhFseySRN1N5tNYd1liLIpiifI6G70saHps=;
 b=mwGCNCy/fhy99faG/LgmTk1hdEEgdPs9PCLl6x5XuNSjlqVOJI6LOUvVDxyaHlQ88FOgpmeAn+7b9LVJudsvM2NA5lSu3ZfD/a+9bHu+ZC+fG4qhVz9NG5IacBjNf8qoNAwQcUHlfT9Ru3ZGkWAq36w32x56VQTVnpneIoMm1TF1hZPQNRjN+GFGLZizjvmoiM/E/JQ/zbODq9mFJY/VzB7G0NIbe3Rc2H7q3KCmJbnEq/7D5m2h6heEuYVX+ghrk7mSXIWyxp30NIJIWeTasY4/ABKy+BFvL/TpgjWmYT5CAgxal5ZuwRIhYgW2+miRjFjyqgTvrmfokqjJLo06qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgQnG6EbZhFseySRN1N5tNYd1liLIpiifI6G70saHps=;
 b=Kb5CDA22kK4F9RK8VSCHA1PfWbAbpbgCGZxEBnsGel0bAo65eJhh3DC9jIor6E8f94mck0fm+N3j/2OVia5kLayreyTr1DicowIPHMBFREsAtZkWy16arQYbn0hcxjd950y8Hr3/oDNxthHsanvr2nf751jSxjXYgAS9OzLy/gg=
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB4927.eurprd05.prod.outlook.com (20.177.49.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Fri, 17 Jan 2020 19:25:32 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2644.023; Fri, 17 Jan 2020
 19:25:32 +0000
Received: from mail-qt1-f171.google.com (209.85.160.171) by MN2PR06CA0019.namprd06.prod.outlook.com (2603:10b6:208:23d::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.23 via Frontend Transport; Fri, 17 Jan 2020 19:25:28 +0000
Received: by mail-qt1-f171.google.com with SMTP id k40so22609407qtk.8;        Fri, 17 Jan 2020 11:25:28 -0800 (PST)
From:   Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To:     Lucas Stach <l.stach@pengutronix.de>
CC:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Igor Opanyuk <igor.opanyuk@toradex.com>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: colibri-imx7: fix ethernet performance
Thread-Topic: [PATCH] ARM: dts: colibri-imx7: fix ethernet performance
Thread-Index: AQHVzFWee8FNmNUk8keE1wDvLk5RZKftKX0AgAIVg4A=
Date:   Fri, 17 Jan 2020 19:25:28 +0000
Message-ID: <CAGgjyvEOBeh_qQwimOT6Nk=nvq=1_+2ByBQkgY4F=XHE0J3BhQ@mail.gmail.com>
References: <20200116101313.2524795-1-oleksandr.suvorov@toradex.com>
 <d3b02f79be206a14d7810c42e08ab9e224f40ae2.camel@pengutronix.de>
In-Reply-To: <d3b02f79be206a14d7810c42e08ab9e224f40ae2.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:208:23d::24) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAWC7hSrbVfarl4iXHFxgvjPA0NNEajmD1W/rdTLZix/ZTfrkqTQ
        r2YfftEDJXVArYMr2sBDmOjHXGGxaz1/bU+e3GA=
x-google-smtp-source: APXvYqym+sJd4UGR5CzxEiQvyvKmga7qU1pg3wbKFCYPXJ1mqf3OEByYDyVNPWYf4DPjVM6zv/oF7JyFHKr7yJEtIeg=
x-received: by 2002:ac8:1851:: with SMTP id n17mr9279297qtk.305.1579289124468;
 Fri, 17 Jan 2020 11:25:24 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvEOBeh_qQwimOT6Nk=nvq=1_+2ByBQkgY4F=XHE0J3BhQ@mail.gmail.com>
x-originating-ip: [209.85.160.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9509bd5f-8dcd-4129-c8c6-08d79b8302b3
x-ms-traffictypediagnostic: VI1PR05MB4927:
x-microsoft-antispam-prvs: <VI1PR05MB49271E0C12BEE8E8B0196417F9310@VI1PR05MB4927.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0285201563
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(189003)(199004)(316002)(42186006)(54906003)(2906002)(71200400001)(9686003)(81156014)(53546011)(55236004)(107886003)(5660300002)(55446002)(26005)(52116002)(8936002)(186003)(478600001)(81166006)(8676002)(44832011)(4326008)(450100002)(6862004)(66476007)(66556008)(86362001)(64756008)(66446008)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR05MB4927;H:VI1PR05MB3279.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QaxnHWIMLo2+4/1fBfQ2QY9wGyWtLLosNjft7lILW3K2GeRGPgW39Z25caPFCQBPqWmFZ7+ZbCBt1tsbqar83fzNX44g90prj5Z91c7mS2e7+P5RDo+rOtTb2HdMbLLEXWbhAfqQRZa59t5N14iAhUL+qLnDrOxLL6we4+n2FBH5/5ScatIKAHF4kEWpVOGpNgmCKH7Y5qHINntnSMlYVgBpEa6bPD3Olu2feeznp4xG9NecJxB07Hj9CFt0bjuRQlTWeqOGqo7g/vKIpEYEHsDozInyNHugHxTXuEVLN3+wv/d0bx8TeRpW2TskT36x3+ZCEuC1tfrw4GrS2vCEMYaKfOxNo7uRgkWrwpZqCThovZzuYPGvgtRoOkG74kDVJ6Twf5WxLU4jisYVpFl1JU0/rdiAP0JHCrdC07peN1p1N5ZsLsL0lpoQAt9WYv4Y
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E1FEA1790CFD949BDDE82DA7D2E5BA6@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509bd5f-8dcd-4129-c8c6-08d79b8302b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2020 19:25:28.5481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFcVcAvQThHZhlYGWcCBE0w+EdXYamCTZmsUIVQfL9LW3NhdIJW1srr58v5OOGEbY7ki4Ucg6gQGX848C/F0gvRttRX7hR08Y5qWzu+k18A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4927
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Mm1udG5yczogcGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoc2V0Lg0KDQpPbiBUaHUsIEphbiAxNiwg
MjAyMCBhdCAxOjM1IFBNIEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90
ZToNCj4NCj4gT24gRG8sIDIwMjAtMDEtMTYgYXQgMTA6MTMgKzAwMDAsIE9sZWtzYW5kciBTdXZv
cm92IHdyb3RlOg0KPiA+IFBlcmZvcm1hbmNlIHRlc3Qgb2YgZXRoZXJuZXQgaW50ZXJmYWNlIHNo
b3dzIGV4dHJlbWVseSBsb3cgcmVzdWx0Og0KPiA+DQo+ID4gPT09IHcvbyBmaXggPT09PT09PT09
PT09PT09PT0NCj4gPiBDb25uZWN0aW5nIHRvIGhvc3QgMTkyLjE2OC54LngsIHBvcnQgNTIwMQ0K
PiA+IFsgIDVdIGxvY2FsIDE5Mi4xNjgueC55IHBvcnQ1OTAyMCBjb25uZWN0ZWQgdG8gMTkyLjE2
OC54LnggcG9ydCA1MjAxDQo+ID4gLi4uDQo+ID4gWyBJRF0gSW50ZXJ2YWwgICAgICAgICAgIFRy
YW5zZmVyICAgICBCaXRyYXRlICAgICAgICAgUmV0cg0KPiA+IFsgIDVdICAgMC4wMC0xMC4wMCAg
c2VjICAyLjc4IE1CeXRlcyAgMi4zMyBNYml0cy9zZWMgIDMzNyAgICAgIHNlbmRlcg0KPiA+IFsg
IDVdICAgMC4wMC0xMC4wMCAgc2VjICAyLjY2IE1CeXRlcyAgMi4yMw0KPiA+IE1iaXRzL3NlYyAg
ICAgICAgICAgcmVjZWl2ZXINCj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+
DQo+ID4gQWRkaW5nIGNvcnJlY3Qgc2V0dGluZ3Mgb2YgdGhlIG1kaW8gYnVzIHdpdGggdGhlIHJl
c3BlY3RpdmUgcGh5DQo+ID4gZml4ZXMgdGhpcyBpc3N1ZS4NCj4NCj4gU28gd2hhdCdzIHRoZSBh
Y3R1YWwgaXNzdWUgYmVpbmcgZml4ZWQgaGVyZT8gSGlnaCBwYWNrZXQgbG9zcyBkdWUgdG8NCj4g
dHJ5aW5nIHRvIGZvcmNlIEdCaXQgc3BlZWRzIHRocm91Z2ggMTAwTUJpdCBtYWduZXRpY3M/IFNv
IHRoZSBhZGRpdGlvbg0KPiBvZiAibWF4LXNwZWVkID0gPDEwMD47IiBpcyB0aGUgcmVhbCBjb3Jl
IG9mIHRoZSBmaXg/DQoNCkx1Y2FzLCBtYXgtc3BlZWQgaXMgbm90IHRoZSBjb3JlIG9mIHRoaXMg
Zml4LCBhY3R1YWxseSwgTWljcmVsIDgwNDEgaXMNCmEgMTAvMTAwIHBoeSBvbmx5Lg0KQnV0IHRo
YW5rIHlvdSBmb3IgcGF5aW5nIGF0dGVudGlvbiB0byB0aGlzIHBhdGNoc2V0LiBUaGlzIGlzIGp1
c3QgYQ0KcGFydCBvZiBhIGZpeCwNCmFuZCBpdCB3YXMgbWlzdGFrZW5seSBwb3N0ZWQgcGFydGlh
bGx5IGFuZCB3aXRoIG1lc3NlZCBjb21taXQgbG9nLg0KSSdsbCByZXNlbmQgYSBjb21wbGV0ZSBz
b2x1dGlvbiB3aGVuIGl0IGlzIHJlYWR5IGFuZCByZXRlc3RlZCBhZ2Fpbi4NCg0KPiBUaGUgY29t
bWl0IGxvZyBzaG91bGQgbWVudGlvbiB0aGlzLg0KPg0KPiBSZWdhcmRzLA0KPiBMdWNhcw0KPg0K
PiA+DQo+ID4gPT09IGFmdGVyIGZpeCA9PT09PT09PT09PT09PT0NCj4gPiBpcGVyZjMgLWMgMTky
LjE2OC54LngNCj4gPiBDb25uZWN0aW5nIHRvIGhvc3QgMTkyLjE2OC54LngsIHBvcnQgNTIwMQ0K
PiA+IFsgIDVdIGxvY2FsIDE5Mi4xNjgueC55IHBvcnQgNTA3MDIgY29ubmVjdGVkIHRvIDE5Mi4x
NjgueC54IHBvcnQgNTIwMQ0KPiA+IC4uLg0KPiA+IFsgSURdIEludGVydmFsICAgICAgICAgICBU
cmFuc2ZlciAgICAgQml0cmF0ZSAgICAgICAgIFJldHINCj4gPiBbICA1XSAgIDAuMDAtMTAuMDAg
IHNlYyAgIDExNCBNQnl0ZXMgIDk1LjQgTWJpdHMvc2VjICAgNTYgICAgICBzZW5kZXINCj4gPiBb
ICA1XSAgIDAuMDAtMTAuMDAgIHNlYyAgIDExMiBNQnl0ZXMgIDk0LjENCj4gPiBNYml0cy9zZWMg
ICAgICAgICAgIHJlY2VpdmVyDQo+ID4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4g
Pg0KPiA+IEZpeGVkOiBjb21taXQgYjMyNjYyOWYyNWI3ICgiQVJNOiBkdHM6IGlteDc6IGFkZCBU
b3JhZGV4IENvbGlicmkNCj4gPiAgICAgICAgICAgICAgICAgICAgIGlNWDdTL2lNWDdEIHN1cHBv
cnQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVy
QHRvcmFkZXguY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBTdXZvcm92IDxvbGVr
c2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+DQo+ID4gIGFyY2gv
YXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpIHwgMTMgKysrKysrKysrKysrKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpDQo+ID4gYi9hcmNoL2FybS9ib290L2R0
cy9pbXg3LWNvbGlicmkuZHRzaQ0KPiA+IGluZGV4IGQwNWJlM2YwZTJhNy4uN2I2YTdjMTI0MzQ1
IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDctY29saWJyaS5kdHNpDQo+
ID4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvaW14Ny1jb2xpYnJpLmR0c2kNCj4gPiBAQCAtMTE1
LDcgKzExNSwyMCBAQCAmZmVjMSB7DQo+ID4gICAgICAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8
MD4sIDwxMDAwMDAwMDA+Ow0KPiA+ICAgICAgIHBoeS1tb2RlID0gInJtaWkiOw0KPiA+ICAgICAg
IHBoeS1zdXBwbHkgPSA8JnJlZ19MRE8xPjsNCj4gPiArICAgICBwaHktaGFuZGxlID0gPCZldGhw
aHkwPjsNCj4gPiAgICAgICBmc2wsbWFnaWMtcGFja2V0Ow0KPiA+ICsNCj4gPiArICAgICBtZGlv
IHsNCj4gPiArICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgZXRocGh5
MDogZXRoZXJuZXQtcGh5QDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzIyIjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgbWF4LXNwZWVkID0gPDEwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG1pY3JlbCxs
ZWQtbW9kZSA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+
ICsgICAgICAgICAgICAgfTsNCj4gPiArICAgICB9Ow0KPiA+ICB9Ow0KPiA+DQo+ID4gICZmbGV4
Y2FuMSB7DQo+DQoNCg0KLS0gDQpCZXN0IHJlZ2FyZHMNCk9sZWtzYW5kciBTdXZvcm92DQoNClRv
cmFkZXggQUcNCkFsdHNhZ2Vuc3RyYXNzZSA1IHwgNjA0OCBIb3J3L0x1emVybiB8IFN3aXR6ZXJs
YW5kIHwgVDogKzQxIDQxIDUwMA0KNDgwMCAobWFpbiBsaW5lKQ0K
