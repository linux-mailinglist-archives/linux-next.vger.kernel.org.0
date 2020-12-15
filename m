Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D77232DA4ED
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 01:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbgLOAbo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 19:31:44 -0500
Received: from mail-bn8nam11on2101.outbound.protection.outlook.com ([40.107.236.101]:3937
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725993AbgLOAbi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 19:31:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbLzU0RpERZ9o3ipmyee+e4Akzm1P6OeHvCQyRvgvjxEqaz8rPuHDG47vXJQkbiyBBMKcs0nfcqByOKnSUUTlRmH4+kSfAMlCZsFrltETz+anNOBbvWf8FDCAZdncbHXJ8WRJB0PmbEyodloi2JSJ1WRWYx+YmZOkPGYMWYXzxHsJWvZUMgotl1FXvoMT9lsUeeUzztblGObLScVTh9WiVIwEErCvXJGwfj3yoEnXAy8IOq+rmpnyXtBSy/8HsfRjvQ0pLqBDbpS6u3Zoq00QLq1hECcEYDKoZ9y5JB/TGFvrR6GC0F+t8xtTaEr5flmNj+FX78znU6uA0620J1sSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CE3L9FEjQW86EVySgl9RKqevgtonsOW274xICprf0w=;
 b=eudH63+CU60LIjOo43t0McQYuoY4PUzQuqY814fmfHUTPeDKIzT/+QlHENCLC3Fu3b+0lfKVmVwhEiF7Tradl6Ir6Dkl1UoDKkyEkx1XXvmprqDezamT/+r7keLWIyigkCsgDx2VJiP8qspgmpvM1vXHW95vvY4VOTvs1uqmUHZFDGUa09bVKxaUjIOXgsTsG2Jmnuqjv5HGZOj2P3/iwMyjcDFi7OmMeN8mEUFLJD8rTBqCB2h1YRgCLrSo8HRQYrWREzeP7DHoJuAKvLrIShtwiLE7vBvXT7gGxMay1fioaUhUs0ACYq1YZ8Ad8C6CtojiQFoY48S5A+ecm3MYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/CE3L9FEjQW86EVySgl9RKqevgtonsOW274xICprf0w=;
 b=ROKFP2rRV0U/jLFUvG/SIOTHtTo12VC/MThFvnwVjQDgCkpMORAdhUzzMGJCyaDTnDnbU7TNoHbi3V6+ky01vuP/bCgE2WQokGIOgXU4XJr/jo3Co8zw+M1/zGFwSzin9wxiQI8ajlq1LPf0tO5/4ogNOvnGMvBssLzK/4pnxZo=
Received: from MN2PR13MB3957.namprd13.prod.outlook.com (2603:10b6:208:263::11)
 by MN2PR13MB2926.namprd13.prod.outlook.com (2603:10b6:208:152::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.10; Tue, 15 Dec
 2020 00:30:45 +0000
Received: from MN2PR13MB3957.namprd13.prod.outlook.com
 ([fe80::e989:f666:131a:e210]) by MN2PR13MB3957.namprd13.prod.outlook.com
 ([fe80::e989:f666:131a:e210%9]) with mapi id 15.20.3676.018; Tue, 15 Dec 2020
 00:30:44 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Anna.Schumaker@Netapp.com" <Anna.Schumaker@Netapp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the nfs tree with Linus' tree
Thread-Topic: linux-next: manual merge of the nfs tree with Linus' tree
Thread-Index: AQHW0ni9UwwfK5NcYkyBeCSi/48786n3ThmA
Date:   Tue, 15 Dec 2020 00:30:44 +0000
Message-ID: <11a80ced88ed4cd7adcc339c7b4bf7908dc19263.camel@hammerspace.com>
References: <20201215112458.4081eb26@canb.auug.org.au>
In-Reply-To: <20201215112458.4081eb26@canb.auug.org.au>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=hammerspace.com;
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7ebe6a9-d178-465c-c6e9-08d8a090a956
x-ms-traffictypediagnostic: MN2PR13MB2926:
x-microsoft-antispam-prvs: <MN2PR13MB2926AF3D7B1D4FB483FFDC68B8C60@MN2PR13MB2926.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rb9NrU1d1HMJlGOr6Zq0oxEqh8jm2cionw4R5iWZPOPqqFEFkXu18h/yiw/QbJOnSLw8bpKxbzBOe6dSfzHEaoB3xaaKDCk2gp5WWTczYlGP0KqsdfSx0fGoIRKjIXn3bSIFlsgiTzbjTThjWwbWSV/du54z0qtLJL3wEnbS2Pe5pDLcvQnBkccKM5Zegbz+HvdDbpxqHH6mYFnsnjbw3efiXwt4flgS1X7Sg182TuqK5a7h+6e7c9JW3NB6rdqjQz5HgQs2I3/uNewF28VEqBzCWErFrT2WC2QetKV44gQrIby1k0dDDKqzSy9hXQTGKm4Cckq/YFJOWmRY9WVQekWYYpTUxymJtwtrBCmEp+c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR13MB3957.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(2906002)(54906003)(66476007)(64756008)(66556008)(66446008)(8936002)(6512007)(91956017)(76116006)(66946007)(2616005)(6916009)(71200400001)(6486002)(4326008)(508600001)(8676002)(186003)(26005)(5660300002)(86362001)(36756003)(4001150100001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MzhTUEZIOExSMmw1RHYzM2dwRGFtemxnRi9RejJsL1ZXeGFBMWRwUmM5R2Ny?=
 =?utf-8?B?dFlZalhrVVpsM1FxVE9xYzA3bnVoTnBzTnFVM3dPNHJZNGtKNE5HWm5acnpu?=
 =?utf-8?B?cVRjWTE3UEI1eXZWWmxia21JS1YxaWxpRkFpNUdXQmZkZHdrM1pEY0FPV0M3?=
 =?utf-8?B?MExtWVZab1YyRXdkQkdWMm9QQkR3dG9lcVNxQnBuTVBYKzBNa0tZOGhoTWty?=
 =?utf-8?B?bmtiMmp4Q0N4R212TTFXWWNtbmJaUEw4SU1FR05GalpoaDNEc1Q4L3NpUEFD?=
 =?utf-8?B?aWJWL3hTVG5JWS81TTdMT2IyOUJqb1NGSXYxbVlCa1B1YzJsZGs3NWZZUGdq?=
 =?utf-8?B?d28rNnpPT0xyY3R0WWpERWttOG50ZlFhcTlVcmdwSzBqMENhOWdSR2JnMjF6?=
 =?utf-8?B?Zm5xeTBZbytSWmR1R2o4TXA3eWJzSTRaQkk3OG9SeWM5T2RjbGpvTVo3K0Nh?=
 =?utf-8?B?MnBTMWFwNVJPdnFsclFsNVFFK2d3Q0RhanEreU5mMzZqRDY2SXFGZHFOVm40?=
 =?utf-8?B?TVdYcmpCbmcyTk1Kb0hXYk9zVlQwSkI2ekwvcXRieTdTRUlnVnRRc1FMVm9X?=
 =?utf-8?B?K2lOZXV5V1NQak53NEFBUytOZkNXM2lHcE1BbHpBdXFHNjZlUXZpRkJ0TlNQ?=
 =?utf-8?B?SGNJVzdNVExuc1prRnRYcVBMOEt0c2tHVVh3V0dxcnlEQjhUYnNGZll3Rzk3?=
 =?utf-8?B?ZVplemRrWFJ2TDM4Uk1WL01uV0RCdjlpWVhSZFpiYmNpeXFJVUhEWlNWa01o?=
 =?utf-8?B?QXVsVklpNFZITXlSRXhBNnZTTmlPa1pLWi83SHE3azZmT0tEZkNqT3pvYllS?=
 =?utf-8?B?U1hJSXFURDZwUUo0OUtDbnV1c2JqVHNOOW40VGJCSXFwcDhEYjBROWRGdnkw?=
 =?utf-8?B?aFIwallXODhhZ2ZjbVFrL0RCWlBBVWJucXRmc2VwTndaMDRJVnVuZE03ZEhk?=
 =?utf-8?B?TnN3TkQ4TlRuR0V1dTB0enF6RlluQWdWL2dXeC9VMXVhSEJwaW9nTDJiRHZ1?=
 =?utf-8?B?WnorTDhDM3VjZXVFbG9UVVByQVFYemNIRWxNa3lramlvZ1UzK3FFbUhxNFhl?=
 =?utf-8?B?ejAwMkgvZDdFdGFiZ1pTUU9lcCtjdFpYOEw5SzNFS2FuUHJwUHhNUWRhNHQ3?=
 =?utf-8?B?aXZqL0V5OUw5elFmR1ZTQ2Flejd3d3NIMFoxdE03SEQySGljZWhXakhzTXZV?=
 =?utf-8?B?S0dTQTliWU51Sm05ZDc5amdKRy9SRkZ4Uk5ST2U1V3RmdjZaZ0l6dS9GV29P?=
 =?utf-8?B?Q0g2R0dzWXRUVUd1eTNOdHg2dm1kUVVGQzVtNnphcVVrNC9kMUplQjJ5MldB?=
 =?utf-8?Q?HBJAQRXlg5PmBhrhkiseKrPOU5nGpTPLgS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <51C604DB8A98B9478BC0279556E9D7CD@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB3957.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ebe6a9-d178-465c-c6e9-08d8a090a956
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 00:30:44.9009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJkpQIoKqEgVa9eRVY/s0GgsQRWhNPynI6QJISiw67XWLjWg2jxWDyRSmq3Kc0sHevMqJKuGEocshT8ap1LJPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2926
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDExOjI0ICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhlIG5mcyB0
cmVlIGdvdCBhIGNvbmZsaWN0IGluOg0KPiANCj4gwqAgZnMvbmZzL25mczRwcm9jLmMNCj4gDQo+
IGJldHdlZW4gY29tbWl0Og0KPiANCj4gwqAgMjFlMzE0MDFmYzQ1ICgiTkZTOiBEaXNhYmxlIFJF
QURfUExVUyBieSBkZWZhdWx0IikNCj4gDQo+IGZyb20gTGludXMnIHRyZWUgYW5kIGNvbW1pdDoN
Cj4gDQo+IMKgIDVjMzQ4NWJiMTJjOSAoIk5GU3Y0LjIvcG5mczogRG9uJ3QgdXNlIFJFQURfUExV
UyB3aXRoIHBORlMgeWV0IikNCj4gDQo+IGZyb20gdGhlIG5mcyB0cmVlLg0KPiANCj4gSSBmaXhl
ZCBpdCB1cCAoc2VlIGJlbG93KSBhbmQgY2FuIGNhcnJ5IHRoZSBmaXggYXMgbmVjZXNzYXJ5LiBU
aGlzDQo+IGlzIG5vdyBmaXhlZCBhcyBmYXIgYXMgbGludXgtbmV4dCBpcyBjb25jZXJuZWQsIGJ1
dCBhbnkgbm9uIHRyaXZpYWwNCj4gY29uZmxpY3RzIHNob3VsZCBiZSBtZW50aW9uZWQgdG8geW91
ciB1cHN0cmVhbSBtYWludGFpbmVyIHdoZW4geW91cg0KPiB0cmVlDQo+IGlzIHN1Ym1pdHRlZCBm
b3IgbWVyZ2luZy7CoCBZb3UgbWF5IGFsc28gd2FudCB0byBjb25zaWRlciBjb29wZXJhdGluZw0K
PiB3aXRoIHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb25mbGljdGluZyB0cmVlIHRvIG1pbmltaXNl
IGFueQ0KPiBwYXJ0aWN1bGFybHkNCj4gY29tcGxleCBjb25mbGljdHMuDQo+IA0KDQpUaGFua3Mg
U3RlcGhlbiENCg0KWWVzLCB0aGUgZml4ZXMgZm9yIHRoZSBjbGllbnQgc2lkZSBSRUFEX1BMVVMg
Y29kZSBlbmRlZCB1cCBiZWluZyBhDQpsaXR0bGUgbW9yZSBleHRlbnNpdmUgdGhhbiBob3BlZCBm
b3IgaW4gdGhlIGxhc3Qgd2VlayBvZiB0aGUgMi4xMA0KY3ljbGUsIGhlbmNlIHRoZSBuZWVkIGZv
ciBhIEtjb25maWcgb3B0aW9uIHRvIGRpc2FibGUgaXQuIEFwb2xvZ2llcyBmb3INCnRoZSBleHRy
YSB3b3JrIGl0IGNhdXNlZCB5b3UuDQoNCkNoZWVycw0KICBUcm9uZA0KDQotLSANClRyb25kIE15
a2xlYnVzdA0KTGludXggTkZTIGNsaWVudCBtYWludGFpbmVyLCBIYW1tZXJzcGFjZQ0KdHJvbmQu
bXlrbGVidXN0QGhhbW1lcnNwYWNlLmNvbQ0KDQoNCg==
