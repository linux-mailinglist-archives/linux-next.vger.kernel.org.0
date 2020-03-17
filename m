Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A22D81889EA
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 17:12:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgCQQMF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 12:12:05 -0400
Received: from mail-dm6nam10on2098.outbound.protection.outlook.com ([40.107.93.98]:13344
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726016AbgCQQMF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 12:12:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoeDrT6vN1CHhIz6X3psptKQXBiFCRwNWVwqh1FZ7xxPdgTpu9vzX7bzkK7ROxORyCZqthrfXORgEjdC/8Sg3f7qz/hlalHJJQswaeoobfkBUQwXupma6TGyTk9LpuYewkMf+vGkxrWAHAdRl4oW07PG7S81w0qiZL5vUOCu/p9fUkTMZqYqEkdpFpT4CJ2qAYsx4ropDj9yOwZ288RAH62yysupT77gUT00sfk+oc5FyHsXiHM+PV6x7e6XjZXEzmrMSgYVO4tLOdH+It64jmiwleNkr+//Vq5/IspCYknP2rJKAFF0Ca4JAisQI58vUSx3/ui4DHVBW5v8YCILbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8lX1p6PA2LfRaH7VmL749b+c7h0OnQWeNtLNE+E4hE=;
 b=JLLwI+u0D8lUfa9QVpKn22QN/lHQH2oA2zjDBiYQiHEdaqCXN7vVnfN3w9vquBO02CAxajffOl7TNpakCKyDfgHjp/LtPQbto/RUi5MfvEu4voQtwNU0TZ1fvnYG/kkWJQwXzUV4LFrvsgwIN/DSZ1F6vf3qektIQaX3mImsc++n0xMw+Q/h8h6Je7WE5SIQOWJTrGcjbfc3r+cfF85BH53w9xRxGiziZU+DHvIjnTFRC5PI30sbMigL076IOTtO0AZiSsky0fm1upd6pvyLpBSokeEN4f6ULF/sWBu12/Q4Xs8rBr70Ib13zlUit/FDz/YzxJ+OO3lAJr6kT0OyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8lX1p6PA2LfRaH7VmL749b+c7h0OnQWeNtLNE+E4hE=;
 b=fAUIs8OlFjz4mMCmVCUTYXhb4ZianVQvGMzDHAsoSjoLqcdW/+IwTmX7ueKt/hYE5PmjUnUvuw+YaibcnPAsGNupSrW7D5J+TcV0wxv2CVmYE5/EpCKDZ2DqBm45D89Dx9ODnS1w7KS6XhF6AjTzITd5qOrwSiZXof0ann2WS7Q=
Received: from CH2PR13MB3398.namprd13.prod.outlook.com (2603:10b6:610:2a::33)
 by CH2PR13MB3525.namprd13.prod.outlook.com (2603:10b6:610:21::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.12; Tue, 17 Mar
 2020 16:12:01 +0000
Received: from CH2PR13MB3398.namprd13.prod.outlook.com
 ([fe80::9570:c1b8:9eb3:1c36]) by CH2PR13MB3398.namprd13.prod.outlook.com
 ([fe80::9570:c1b8:9eb3:1c36%7]) with mapi id 15.20.2835.013; Tue, 17 Mar 2020
 16:12:01 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "smayhew@redhat.com" <smayhew@redhat.com>
CC:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@paul-moore.com" <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the selinux tree with the nfs tree
Thread-Topic: linux-next: manual merge of the selinux tree with the nfs tree
Thread-Index: AQHV/GCdCTUQjWouDEyc7fMKz7N8wqhM5d6AgAAO84A=
Date:   Tue, 17 Mar 2020 16:12:01 +0000
Message-ID: <c28fe5dc9bd58388ce413f30878fd35ef0f1eb1b.camel@hammerspace.com>
References: <20200317133117.4569cc6a@canb.auug.org.au>
         <bb623275e936c026cc425904e6c1cee0cbe85f28.camel@hammerspace.com>
         <20200317151829.GA4442@aion.usersys.redhat.com>
In-Reply-To: <20200317151829.GA4442@aion.usersys.redhat.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f76fec3-f7d1-461e-17be-08d7ca8ded65
x-ms-traffictypediagnostic: CH2PR13MB3525:
x-microsoft-antispam-prvs: <CH2PR13MB35256E73953194A183D5D994B8F60@CH2PR13MB3525.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(39830400003)(376002)(346002)(396003)(199004)(6512007)(5660300002)(8936002)(81166006)(81156014)(36756003)(478600001)(8676002)(6506007)(2906002)(6486002)(91956017)(76116006)(316002)(66946007)(66476007)(6916009)(2616005)(186003)(86362001)(66446008)(54906003)(26005)(4326008)(71200400001)(64756008)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:CH2PR13MB3525;H:CH2PR13MB3398.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EbWnLpiZuYzDx82WnQ58MEpC2b2XzufR0hdTjzJQ0DrCuw2cxRfgVIsof/MHmsNh7Gc7RxsrjodyO4ol3UaSwO+jr/A3RkFP67SmJAKayKhQ4K5/OG2h3TnioCg9kpjlCaSFwCzQeUdLr9zINTG9Xs90G9OJ+ESAd0tgvmYagF0Yt7YeBXM9gGXqNObQ7Dkya0mbTffaF7mFfrkPHJfnuFHEUloUGi7uS/f11PUGO0Y1KKb9JAxlkJA3iZKD8ZGmwe9meIgbU2Dch5sfUDAkh9MsxHHgwniC9DtRaat1REy7W6DVc+JfC7LCtdA97+xkUGyVam4QUjcvvErOn3+xnNmLzupvDa0fAa+3MGoZkbu82GCiDATKavoj5Q9jqWloHeXerryNVlNc1De8hQvLjkF6R2Lf4OeB5oKqW44DPJ1HeQSidG/gGUnVaKy5QcLw
x-ms-exchange-antispam-messagedata: nP0BdOv+aNgUK4La6ndL+Q37wHHWDIdmuSUkC4qYihDgacsd0QY7GUyVqgAvNJJoK1T99LjFTUVPAtkFZfteDLfiPIuQE3b1eebTrMekHVxZlphppoUVjFfSDfCIq8hLuV/i+TrW/W0Qqq8oP7Aj2g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7A56A8B941BB24CA621EAB0F6C83153@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f76fec3-f7d1-461e-17be-08d7ca8ded65
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 16:12:01.6680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdRD8xCass2ePuI1LVPNAhDp7FHgFTu+a2SG0lMZEtrRff3/uB+4x52P6/RcMMJUzzQTN0qQitQlIZQgg9v1Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3525
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVHVlLCAyMDIwLTAzLTE3IGF0IDExOjE4IC0wNDAwLCBTY290dCBNYXloZXcgd3JvdGU6DQo+
IE9uIFR1ZSwgMTcgTWFyIDIwMjAsIFRyb25kIE15a2xlYnVzdCB3cm90ZToNCj4gDQo+ID4gT24g
VHVlLCAyMDIwLTAzLTE3IGF0IDEzOjMxICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0K
PiA+ID4gSGkgYWxsLA0KPiA+ID4gDQo+ID4gPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2Yg
dGhlIHNlbGludXggdHJlZSBnb3QgYSBjb25mbGljdCBpbjoNCj4gPiA+IA0KPiA+ID4gICBmcy9u
ZnMvZ2V0cm9vdC5jDQo+ID4gPiANCj4gPiA+IGJldHdlZW4gY29tbWl0Og0KPiA+ID4gDQo+ID4g
PiAgIGU4MjEzZmZjMmFlYyAoIk5GUzogRW5zdXJlIHNlY3VyaXR5IGxhYmVsIGlzIHNldCBmb3Ig
cm9vdA0KPiA+ID4gaW5vZGUiKQ0KPiA+ID4gDQo+ID4gPiBmcm9tIHRoZSBuZnMgdHJlZSBhbmQg
Y29tbWl0Og0KPiA+ID4gDQo+ID4gPiAgIDI4ZDRkMGUxNmYwOSAoIldoZW4gdXNpbmcgTkZTdjQu
MiwgdGhlIHNlY3VyaXR5IGxhYmVsIGZvciB0aGUNCj4gPiA+IHJvb3QNCj4gPiA+IGlub2RlIHNo
b3VsZCBiZSBzZXQgdmlhIGEgY2FsbCB0byBuZnNfc2V0c2VjdXJpdHkoKSBkdXJpbmcgdGhlDQo+
ID4gPiBtb3VudA0KPiA+ID4gcHJvY2Vzcywgb3RoZXJ3aXNlIHRoZSBpbm9kZSB3aWxsIGFwcGVh
ciBhcyB1bmxhYmVsZWQgZm9yIHVwIHRvDQo+ID4gPiBhY2Rpcm1pbiBzZWNvbmRzLiAgQ3VycmVu
dGx5IHRoZSBsYWJlbCBmb3IgdGhlIHJvb3QgaW5vZGUgaXMNCj4gPiA+IGFsbG9jYXRlZCwgcmV0
cmlldmVkLCBhbmQgZnJlZWQgZW50aXJlbHkgd2l0aW4NCj4gPiA+IG5mczRfcHJvY19nZXRfcm9v
dCgpLiIpDQo+ID4gPiANCj4gPiA+IGZyb20gdGhlIHNlbGludXggdHJlZS4NCj4gPiA+IA0KPiA+
ID4gVGhlc2UgYXJlIGJhc2ljYWxseSB0aGUgc2FtZSBwYXRjaCB3aXRoIHNsaWdodCBmb3JtYXR0
aW5nDQo+ID4gPiBkaWZmZXJlbmNlcy4NCj4gPiA+IA0KPiA+ID4gSSBmaXhlZCBpdCB1cCAoSSB1
c2VkIHRoZSBsYXR0ZXIpIGFuZCBjYW4gY2FycnkgdGhlIGZpeCBhcw0KPiA+ID4gbmVjZXNzYXJ5
Lg0KPiA+ID4gVGhpcyBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5leHQgaXMgY29uY2Vy
bmVkLCBidXQgYW55IG5vbg0KPiA+ID4gdHJpdmlhbA0KPiA+ID4gY29uZmxpY3RzIHNob3VsZCBi
ZSBtZW50aW9uZWQgdG8geW91ciB1cHN0cmVhbSBtYWludGFpbmVyIHdoZW4NCj4gPiA+IHlvdXIN
Cj4gPiA+IHRyZWUNCj4gPiA+IGlzIHN1Ym1pdHRlZCBmb3IgbWVyZ2luZy4gIFlvdSBtYXkgYWxz
byB3YW50IHRvIGNvbnNpZGVyDQo+ID4gPiBjb29wZXJhdGluZw0KPiA+ID4gd2l0aCB0aGUgbWFp
bnRhaW5lciBvZiB0aGUgY29uZmxpY3RpbmcgdHJlZSB0byBtaW5pbWlzZSBhbnkNCj4gPiA+IHBh
cnRpY3VsYXJseQ0KPiA+ID4gY29tcGxleCBjb25mbGljdHMuDQo+ID4gPiANCj4gPiBPSy4uLiBX
aHkgaXMgdGhpcyBiZWluZyBwdXNoZWQgdGhyb3VnaCB0aGUgc2VsaW51eCB0cmVlPyBXYXMgdGhh
dA0KPiA+IHlvdXINCj4gPiBpbnRlbnRpb24gU2NvdHQ/DQo+IA0KPiBOb3QgcmVhbGx5Li4uIEkg
YWRkcmVzc2VkIHRoZSBwYXRjaCB0byB5b3UgYW5kIEFubmEsIGFmdGVyIGFsbC4gIE9uDQo+IHRo
ZQ0KPiBvdGhlciBoYW5kLCBJIGRpZG4ndCBvYmplY3Qgd2hlbiBQYXVsIHBpY2tlZCB1cCB0aGUg
cGF0Y2ggaW4gaGlzDQo+IHRyZWUuDQo+IEknbSBndWVzc2luZyBJIHNob3VsZCBoYXZlIHNwb2tl
biB1cC4gIFNvcnJ5IGFib3V0IHRoYXQuDQo+IA0KDQpPSy4gV2VsbCB0aGVyZSBkb2Vzbid0IHNl
ZW0gdG8gYmUgYW55dGhpbmcgZWxzZSB0b3VjaGluZyB0aGUgTkZTIG1vdW50DQpjb2RlIGluIHRo
aXMgZGV2IGN5Y2xlLCBzbyBJIGRvbid0IGV4cGVjdCBhbnkgaW50ZWdyYXRpb24gaXNzdWVzIGF0
DQp0aGlzIHBvaW50LiBJJ20gdGhlcmVmb3JlIE9LIHdpdGggaXQgZ29pbmcgdGhyb3VnaCB0aGUg
c2VsaW51eCB0cmVlLg0KDQpJJ2xsIHRoZXJlZm9yZSBkcm9wIHRoZSBwYXRjaCBmcm9tIHRoZSBO
RlMgdHJlZSwgYXNzdW1pbmcgeW91IHN0aWxsDQpoYXZlIGl0IGluIHRoZSBzZWxpbnV4IHRyZWUs
IFBhdWwuDQoNCi0tIA0KVHJvbmQgTXlrbGVidXN0DQpMaW51eCBORlMgY2xpZW50IG1haW50YWlu
ZXIsIEhhbW1lcnNwYWNlDQp0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3BhY2UuY29tDQoNCg0K
