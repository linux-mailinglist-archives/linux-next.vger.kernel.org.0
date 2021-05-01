Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0156137045D
	for <lists+linux-next@lfdr.de>; Sat,  1 May 2021 02:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhEAA1u (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 20:27:50 -0400
Received: from mail-dm6nam08on2118.outbound.protection.outlook.com ([40.107.102.118]:31521
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230226AbhEAA1u (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Apr 2021 20:27:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqjLjugF4hQGQnt4GXnawnM7VY4McoJ2s0u83iUG305ne/4k1C9sl0uk0TMfqJC8cFr4NKtDnt1n38pIH/6mF4dAcdct9wX69tIgtk0lSWHRfU5W/GFjFGwS4GlFUasHjNLd9XRLRzJtSajNQ6N/9CydrGcMsZqvSQerd9JfHCPBmnCp6/yBX9z1pRHERFb6O7uGDXtadrNT9R3EuhZ1oSASQmyoGupnHyAoNsMZTc17K2VRXI2lS0818MW2c/cFAr7e8GSIb+c1dCEXB0xAEstLSUsFXWQnnTGyKUJOqmlKmdHT1FZhRE9qlSkjbn7CV9WO0SN5ZC3e8KS5OLrm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46uHc9ctM08nyzCFDgJ+henE8bbMm/ImIzzGK4w0uzw=;
 b=I5QM4PJsHCSwbMzubyAMnLqlE5ApZfmHWBRWRpeC67lh8HeeNK46NS5BN5BFYfquAx/pzd5Fy8Z/06KwRLcWjAGLT+U5qcH025BeRw2q7gQ4UYPhDeXDWc4SlpQbbzLdbzUbZSSqjxTMUs0spa7qzsxTk6IaFN9G3RRsZm4UtN0jBS4ME6QbqF6WsRbjecl03daRohXQ3hjl7Jjjub5K/O96vKpKG+azxbt56tgbTLA0WDb+NQ1bMosfr9KxGbyY++pSDz/7wGpKqGAOMHPl9MFhp/HNiY6K3F79Y4sWy0H7do30Aktqe380UtDIjOLIE6KJ1T4gLAHYPr+mDhm/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46uHc9ctM08nyzCFDgJ+henE8bbMm/ImIzzGK4w0uzw=;
 b=XBZyrEs417qyHWLRKUim1h26JN2kZPlTgfOeb+FiRvUPkpF7ir9YyTK6A8mfIBGYR5vrGv5CTHQs2zBlJPwCK76o0rrqOL3DL5UMv1dL/zec2qHFAPPUZMhFF50IDBibTl9YnCo1do44TMqPUT7R3SaMDapo9Zn71+flPPZR134=
Received: from DS7PR13MB4733.namprd13.prod.outlook.com (2603:10b6:5:3b1::24)
 by DM6PR13MB4505.namprd13.prod.outlook.com (2603:10b6:5:1fb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.8; Sat, 1 May
 2021 00:26:52 +0000
Received: from DS7PR13MB4733.namprd13.prod.outlook.com
 ([fe80::4c65:55ca:a5a2:f18]) by DS7PR13MB4733.namprd13.prod.outlook.com
 ([fe80::4c65:55ca:a5a2:f18%7]) with mapi id 15.20.4108.015; Sat, 1 May 2021
 00:26:52 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "chuck.lever@oracle.com" <chuck.lever@oracle.com>
CC:     "keescook@chromium.org" <keescook@chromium.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "gustavo@embeddedor.com" <gustavo@embeddedor.com>
Subject: Re: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Topic: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Index: AQHXPe5Owev6hK6G6EmjYYhzldelXKrNZhyAgAAGooCAABGegIAARyOA
Date:   Sat, 1 May 2021 00:26:52 +0000
Message-ID: <8724e5cb46c9cbc97d3f5bef19aadd50ea8210a5.camel@hammerspace.com>
References: <202104301126.5A1D9706E@keescook>
         <B431253D-E874-45BA-9303-79C7FA950D1B@oracle.com>
         <08aa80f9bfeb1b48daf804aa2903d6217e599fa4.camel@hammerspace.com>
         <84662251-DF84-4827-9D89-293BB2340433@oracle.com>
In-Reply-To: <84662251-DF84-4827-9D89-293BB2340433@oracle.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=hammerspace.com;
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c60ef9f-d4f8-4bb4-3557-08d90c37d18e
x-ms-traffictypediagnostic: DM6PR13MB4505:
x-microsoft-antispam-prvs: <DM6PR13MB4505494DAF05568A663044E4B85D9@DM6PR13MB4505.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9Z8SI1NwibNUrs3BGrAj95dYUWtGZ6xoK//aTAJvTJ+TQ5uS/2HSyZ35JXZn+R70fwcCk760vi6ZJ8ZwUSdWesZ5QRdJdGyXmuWOEYm+dbJ+rVqgYvtnf+k334c+YI89QJCBQ8J4+8SAojsDQzuxACtuYQZrrk8OOojTvLyj1Y11cF7u5bcUKguIz3hnAEcKOv3hYRgJelE4lIQUc0gwv80eUejdgCF/7xb9Nrz9NLlBSDaVscy+qHfauQb9HN34+zN7PvOQKk7TVjPU7EeSRoPkggEOWEkhQExz5M+5eJOVtyJN60B9ODXi9dsOQBr5EZT0HHhfwM1jyIyau9c6aXG26ShXDVjhIFQRK4boRf+06x4SekYNsiT++A5NS4ORNKxh00F4CSYdeCmXgmM8WjN5QRGmQq1iULNTdQLC+bsVBgQuYoIXBJQJvDRBLKNbHWpJcO40wqqqz0LD2Nn4kk3SmPHoNPY3sSm65NCUXQv0YU+sHebD/H8O5kX30vag2M8qIjhY9jBxbkL33gu1huvjAFqnKYMv0xtQUnAZ4eI/hFztHFjiylT01RYLg3VqgWIJLIBA16YDF3UQ+4BUUzMSNK/wUTKGruKPB2YJQp7Km8izutoOG8kZn0H0WBJZS5tVvVgUILfKUa27OuTVY5i2lDMs9xs6L9w+6zJHelv2O1CUWpCU5wrfEOUVY2oq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR13MB4733.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(376002)(136003)(366004)(39840400004)(53546011)(26005)(5660300002)(6506007)(2906002)(2616005)(6916009)(186003)(122000001)(38100700002)(36756003)(6512007)(83380400001)(8936002)(478600001)(66446008)(54906003)(66476007)(76116006)(64756008)(91956017)(71200400001)(66556008)(6486002)(8676002)(316002)(4326008)(966005)(86362001)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VGZoTDNGdmc1d2xudjQ2NWpFKzFpaWFzRFg0T3ZQcWlIcEp1VXJLMUpSWHQ3?=
 =?utf-8?B?VWxaV3lvZmxSOE1Ga29hUE9JQWpUWVlnTDlvcEJqZm0ranlxQkJKTlZLU202?=
 =?utf-8?B?ekVydHNvL1JML2FtMmg3WlBMUFNMbE1YRENYcDdVUWNwS1Btc2p1VDZ2WEZN?=
 =?utf-8?B?NnR1TnBEbDg0bTljYmR6SGNEbFBudEpKNUdxNTBYL2p2RmVQck8xcnhiZW1p?=
 =?utf-8?B?LzNTOVFudnBqc1U2b3lwRHFGOGgvVUcrWXlncCtwUDhpNldMOGNZQ1NkUUhu?=
 =?utf-8?B?Mkl4bHkrSWZvQ0VtbmxuRjdXVnBUUUlQeWNmbTU5aFlUMDBsdVBqYXNkdzFC?=
 =?utf-8?B?ZW1ZNGJLL3gvRk05RE5yYzk1Z3BkVDRPMWhwQTBKQnhxQTdFc0ZDUUZjVHQz?=
 =?utf-8?B?dnpVWGt0Q2tSQXlIMXQ3UzhYSUo2WFpLblNDeFh6RW13SVNhZGdHemZQZTF3?=
 =?utf-8?B?QWwxYU52eHBkUkxacGxxRHJocWtvaExpY1dQNnlkK3JNNkYxMmlyWmJlT1cz?=
 =?utf-8?B?Tk05dkZ0ZEphdi9kalEyOXp6aW9YSHRxS1gzQmZTYVJJdlliYVlaTW1nL1pP?=
 =?utf-8?B?WEJpVGdpUEZpZGZldXBCWUF6dmJ3MVFQM1FLQlorajBtVFZnNjM3NTRxZVdl?=
 =?utf-8?B?S0FjZTF5SzZmQTU5VjkrNjd6VWh4NlhJbDV3ZFNETUhKMHFlV0VaQjNxUWc1?=
 =?utf-8?B?bGxMNFh0WXpkaVhDS3ArMEkyUWZ6ajhVTWFkcWRCZ2R5NjliZ0tQSmlTeHhw?=
 =?utf-8?B?SkFlb05wZ0V4RCtkSFk0Y1A2OUlqeU9rUjBMcHR4cTkvd2J1bEhQNmNnaitu?=
 =?utf-8?B?Vi9mMmRQekEzak1QTjBvYm5DdU9GaE5NYWhETzN2SFdRVEZYaXd4b2xiTk9l?=
 =?utf-8?B?Z2pkZHB3MVZRVCtrMTArUGdzMk1ZVEFDaFhma095QTBLZVFLSk5FalpiQ1hY?=
 =?utf-8?B?b1VVaW1rSGtpSjcwRlQvM0ZVaXlyY1krV1hRbktEYUZlNTdWRDcrL05RWEJW?=
 =?utf-8?B?WjRMcStUdDRURjlUUmRCdkR2TkM2a3RYTDJLclptMExPQ3FWMVJ4a1hka1lH?=
 =?utf-8?B?M0ZuVEloSEJrbkttQU5WTktScFA4M3ZCeEFNdTRzYmkzNjljSUtWWmVraFNB?=
 =?utf-8?B?S21BaW5ZbzVYbUlwZ21YZkZIanBHcFFMQlZacnpiRUFaWlViV1RtOVAxY2hy?=
 =?utf-8?B?QlJFVXVzd09UZ2paTG12ZEpnUUlqdjhmWkVzenlKN1JGRVpVVzcyNWNleEZR?=
 =?utf-8?B?TS9nbHpodW1ramJ1UHNkUG5mWUIrdjZsVWFlS2txZWFXVEF4Y1RWOHRxU25o?=
 =?utf-8?B?V3ZwbjUxSXNwODhLaUxTM2ZjL2tmZVo4MlZzWHJtcnhydjB3SmFZK3dLaVBG?=
 =?utf-8?B?OVZ3NjFQTSsvM1NTKzMxbmpET3ltNllxZSs4KzlPbE42RHhrSVhOVk1LUC80?=
 =?utf-8?B?L3Y0UEVhVlgvM2RWREdlOFR0cTNiQ1V3OU9iQkRtZTZOY0k3SVR3eEZmaldB?=
 =?utf-8?B?MVJGeGUwRUt2ams1aUs0UlNiZlhiR2Q1NnBnbE9hajlyUThVOFhkMVBaU1F0?=
 =?utf-8?B?MzMvelVQQ1k3YUNTelNOblFodE5WejJ3OGhHeWxLQjNwQ1YzMzhxc3VveWRF?=
 =?utf-8?B?U1FJUjFxZWd4aVhiak9ubjhxNWtEdTVnbmFEUkNwaTl5Mitya1NKdFFxUjZt?=
 =?utf-8?B?N21YUU15RHJNR3BVL2cvVkNGbHI0WGxPWlVEWFlpZUdxQjQyem1yNlJTMVU1?=
 =?utf-8?Q?qq5fRFgTD5vu+HzPoFfIonT7f0Cf33Wk6U0pMh6?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FFF1A291A06144883CB78BAF472ED97@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR13MB4733.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c60ef9f-d4f8-4bb4-3557-08d90c37d18e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2021 00:26:52.7152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqAVgV4BcKBKfAhZCnHEskC11/Jpq19tdJkdsxrabxTdEjpMLuarJRP7pWLgpdh1AuWUuVUZNMTWkDvKO3UVmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB4505
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gRnJpLCAyMDIxLTA0LTMwIGF0IDIwOjEyICswMDAwLCBDaHVjayBMZXZlciBJSUkgd3JvdGU6
DQo+IA0KPiANCj4gPiBPbiBBcHIgMzAsIDIwMjEsIGF0IDM6MDkgUE0sIFRyb25kIE15a2xlYnVz
dCA8DQo+ID4gdHJvbmRteUBoYW1tZXJzcGFjZS5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIEZy
aSwgMjAyMS0wNC0zMCBhdCAxODo0NSArMDAwMCwgQ2h1Y2sgTGV2ZXIgSUlJIHdyb3RlOg0KPiA+
ID4gDQo+ID4gPiANCj4gPiA+ID4gT24gQXByIDMwLCAyMDIxLCBhdCAyOjI2IFBNLCBjb3Zlcml0
eS1ib3QgPA0KPiA+ID4gPiBrZWVzY29va0BjaHJvbWl1bS5vcmc+DQo+ID4gPiA+IHdyb3RlOg0K
PiA+ID4gPiANCj4gPiA+ID4gSGVsbG8hDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGlzIGFuIGV4
cGVyaW1lbnRhbCBzZW1pLWF1dG9tYXRlZCByZXBvcnQgYWJvdXQgaXNzdWVzDQo+ID4gPiA+IGRl
dGVjdGVkDQo+ID4gPiA+IGJ5DQo+ID4gPiA+IENvdmVyaXR5IGZyb20gYSBzY2FuIG9mIG5leHQt
MjAyMTA0MzAgYXMgcGFydCBvZiB0aGUgbGludXgtbmV4dA0KPiA+ID4gPiBzY2FuIHByb2plY3Q6
DQo+ID4gPiA+IGh0dHBzOi8vc2Nhbi5jb3Zlcml0eS5jb20vcHJvamVjdHMvbGludXgtbmV4dC13
ZWVrbHktc2Nhbg0KPiA+ID4gPiANCj4gPiA+ID4gWW91J3JlIGdldHRpbmcgdGhpcyBlbWFpbCBi
ZWNhdXNlIHlvdSB3ZXJlIGFzc29jaWF0ZWQgd2l0aCB0aGUNCj4gPiA+ID4gaWRlbnRpZmllZA0K
PiA+ID4gPiBsaW5lcyBvZiBjb2RlIChub3RlZCBiZWxvdykgdGhhdCB3ZXJlIHRvdWNoZWQgYnkg
Y29tbWl0czoNCj4gPiA+ID4gDQo+ID4gPiA+IMKgTW9uIEFwciAyNiAwOToyNzowNiAyMDIxIC0w
NDAwDQo+ID4gPiA+IMKgwqAgOWEzMDFjYWZjODYxICgieHBydHJkbWE6IE1vdmUgZnJfbGludl9k
b25lIGZpZWxkIHRvIHN0cnVjdA0KPiA+ID4gPiBycGNyZG1hX21yIikNCj4gPiA+ID4gDQo+ID4g
PiA+IENvdmVyaXR5IHJlcG9ydGVkIHRoZSBmb2xsb3dpbmc6DQo+ID4gPiA+IA0KPiA+ID4gPiAq
KiogQ0lEIDE1MDQ1NTY6wqAgTnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlc8KgIChGT1JXQVJEX05V
TEwpDQo+ID4gPiA+IC9uZXQvc3VucnBjL3hwcnRyZG1hL2Zyd3Jfb3BzLmM6IDUzOSBpbiBmcndy
X3VubWFwX3N5bmMoKQ0KPiA+ID4gPiA1MzMNCj4gPiA+ID4gNTM0wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC8qIFN0cm9uZyBzZW5kIHF1ZXVlIG9yZGVyaW5nIGd1YXJhbnRlZXMgdGhhdA0KPiA+
ID4gPiB3aGVuDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiA1MzXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIGxhc3QgV1IgaW4gdGhlIGNoYWluIGNvbXBsZXRlcywgYWxsIFdScyBpbg0KPiA+ID4g
PiB0aGUNCj4gPiA+ID4gY2hhaW4NCj4gPiA+ID4gNTM2wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBhcmUgY29tcGxldGUuDQo+ID4gPiA+IDUzN8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICovDQo+ID4gPiA+IDUzOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYXN0LT53cl9jcWUtPmRv
bmUgPSBmcndyX3djX2xvY2FsaW52X3dha2U7DQo+ID4gPiA+IHZ2dsKgwqDCoMKgIENJRCAxNTA0
NTU2OsKgIE51bGwgcG9pbnRlciBkZXJlZmVyZW5jZXPCoCAoRk9SV0FSRF9OVUxMKQ0KPiA+ID4g
PiB2dnbCoMKgwqDCoCBQYXNzaW5nIG51bGwgcG9pbnRlciAiJm1yLT5tcl9saW52X2RvbmUiIHRv
DQo+ID4gPiA+ICJyZWluaXRfY29tcGxldGlvbiIsIHdoaWNoIGRlcmVmZXJlbmNlcyBpdC4NCj4g
PiA+ID4gNTM5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlaW5pdF9jb21wbGV0aW9uKCZtci0+
bXJfbGludl9kb25lKTsNCj4gPiA+ID4gNTQwDQo+ID4gPiA+IDU0McKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKiBUcmFuc3BvcnQgZGlzY29ubmVjdCBkcmFpbnMgdGhlIHJlY2VpdmUgQ1ENCj4g
PiA+ID4gYmVmb3JlIGl0DQo+ID4gPiA+IDU0MsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICog
cmVwbGFjZXMgdGhlIFFQLiBUaGUgUlBDIHJlcGx5IGhhbmRsZXIgd29uJ3QNCj4gPiA+ID4gY2Fs
bCB1cw0KPiA+ID4gPiA1NDPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHVubGVzcyByZV9p
ZC0+cXAgaXMgYSB2YWxpZCBwb2ludGVyLg0KPiA+ID4gPiA1NDTCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqLw0KPiA+ID4gPiANCj4gPiA+ID4gSWYgdGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZl
LCBwbGVhc2UgbGV0IHVzIGtub3cgc28gd2UgY2FuIG1hcmsNCj4gPiA+ID4gaXQNCj4gPiA+ID4g
YXMNCj4gPiA+ID4gc3VjaCwgb3IgdGVhY2ggdGhlIENvdmVyaXR5IHJ1bGVzIHRvIGJlIHNtYXJ0
ZXIuDQo+ID4gPiANCj4gPiA+IFN1cmUsIG5vdCBteSBwcm91ZGVzdCBtb21lbnQgaGVyZS4NCj4g
PiA+IA0KPiA+ID4gVGhlIHNvbGUgY2FsbCBzaXRlIGZvciBmcndyX3VubWFwX3N5bmMoKSBpcyB0
aGlzIG9uZToNCj4gPiA+IA0KPiA+ID4gbmV0L3N1bnJwYy94cHJ0cmRtYS90cmFuc3BvcnQuYzoN
Cj4gPiA+IDYwNsKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KCFsaXN0X2VtcHR5KCZyZXEt
PnJsX3JlZ2lzdGVyZWQpKSkgew0KPiA+ID4gNjA3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdHJhY2VfeHBydHJkbWFfbXJzX3phcCh0YXNrKTsNCj4gPiA+IDYwOMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyd3JfdW5tYXBfc3luYyhycGN4X3RvX3JkbWF4KHJxc3Qt
PnJxX3hwcnQpLA0KPiA+ID4gcmVxKTsNCj4gPiA+IDYwOcKgwqDCoMKgwqDCoMKgwqAgfQ0KPiA+
ID4gDQo+ID4gPiBUaHVzLCBpbiB0aGUgY3VycmVudCBjb2RlIGJhc2UsIHRoZSB3aGlsZSgpIGxv
b3A6DQo+ID4gPiANCj4gPiA+IG5ldC9zdW5ycGMveHBydHJkbWEvZnJ3cl9vcHMuYzoNCj4gPiA+
IDUxNMKgwqDCoMKgwqDCoMKgwqAgd2hpbGUgKChtciA9IHJwY3JkbWFfbXJfcG9wKCZyZXEtPnJs
X3JlZ2lzdGVyZWQpKSkgew0KPiA+ID4gDQo+ID4gPiBTaG91bGQgYWx3YXlzIHRlcm1pbmF0ZSB3
aXRoIG1yIGNvbnRhaW5pbmcgYSBub24tTlVMTCBhZGRyZXNzLg0KPiA+ID4gDQo+ID4gPiBTZWVt
cyB0byBtZSB0aGUgZnJ3cl91bm1hcF9zeW5jKCkgY29kZSBiZWZvcmUgZmRmNWVjYjE5MzRiDQo+
ID4gPiAoInhwcnRyZG1hOiBNb3ZlIGZyX2xpbnZfZG9uZSBmaWVsZCB0byBzdHJ1Y3QgcnBjcmRt
YV9tciIpIGhhcw0KPiA+ID4gdGhlIHNhbWUgcmlzayAtLSBmcndyIGNhbiBiZSBOVUxMIGlmIHJs
X3JlZ2lzdGVyZWQgaXMgZW1wdHkuDQo+ID4gPiANCj4gPiA+IEknbSBvcGVuIHRvIHN1Z2dlc3Rp
b25zIGZvciBpbXByb3ZlbWVudCwgYnV0IEknbSBub3Qgc2VlaW5nIHRoaXMNCj4gPiA+IHJpc2Ug
dG8gdGhlIGxldmVsIG9mIGEgcGVydmFzaXZlIGFuZCBoaWdoIGltcGFjdCBpc3N1ZS4NCj4gPiA+
IA0KPiA+IA0KPiA+IENodWNrLCBJIHRoaW5rIHRoZSBwb2ludCBpcyB0aGF0IHlvdSBjYW4ndCBl
dmVyIGV4aXQgdGhhdCB3aGlsZSgpDQo+ID4gbG9vcA0KPiA+IF91bmxlc3NfIG1yID09IE5VTEwu
IFNvIGNhbGxpbmcgcmVpbml0X2NvbXBsZXRpb24oJm1yLQ0KPiA+ID5tcl9saW52X2RvbmUpDQo+
ID4gYWZ0ZXIgZXhpdGluZyB0aGF0IGxvb3Agd2lsbCBpbmRlZWQgT29wcy4NCj4gDQo+IEQnb2gu
DQo+IA0KPiANCj4gPiBTbyB3aWxsIHRoZSBjYWxsIHRvIHdhaXRfZm9yX2NvbXBsZXRpb24oJm1y
LT5tcl9saW52X2RvbmUpLg0KPiA+IA0KPiA+IElPVzogSSB0aGluayB5b3UgbmVlZCB0byBzYXZl
IHRoZSBsYXN0IG5vbi1OVUxMIHZhbHVlIG9mICdtcicNCj4gPiBpbnNpZGUNCj4gPiB0aGUgbG9v
cC4NCj4gDQo+IEkgdGhpbmsgZm9sbG93aW5nIHRoZSB3aGlsZSgpIGxvb3Agd2l0aDoNCj4gDQo+
IMKgwqAgbXIgPSBjb250YWluZXJfb2YobGFzdCwgc3RydWN0IHJwY3JkbWFfbXIsIG1yX2ludndy
KTsNCj4gDQo+IE1pZ2h0IGFsc28gd29yay4NCj4gDQoNClNvdW5kcyBnb29kLiBXaWxsIGJlIHlv
dSBzZW5kaW5nIG1lIGFuIHVwZGF0ZWQrdGVzdGVkIHBhdGNoPw0KDQotLSANClRyb25kIE15a2xl
YnVzdA0KTGludXggTkZTIGNsaWVudCBtYWludGFpbmVyLCBIYW1tZXJzcGFjZQ0KdHJvbmQubXlr
bGVidXN0QGhhbW1lcnNwYWNlLmNvbQ0KDQoNCg==
