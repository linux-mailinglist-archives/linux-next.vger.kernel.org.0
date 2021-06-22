Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36643B08FC
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 17:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhFVPaL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 11:30:11 -0400
Received: from mail-eopbgr150072.outbound.protection.outlook.com ([40.107.15.72]:58485
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231936AbhFVPaK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 11:30:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQG+DowKkS2RW2YiXnkY8SsVpu9uThSkRC5TL7qyf8w8KWBJX6rm4rUbusgWRQpJ4FoAl194I58h36UAoAT1CDIf2NGVBqLzXIv+vnbg1AJ2i03bDh0sadMOYnZPl6tu7049Ju9qsEqkO0fGjhoRxfwCxAMS0u/8Ndt5QLUgMVwEKmR6M6Z+SXiSFFNy0ZizTGqoILANCVpAtkushXpl+5OeDgLOBTl13OxUxWLRlSzmpsycf4J0Y2l8GON66wDRqgL+Vl1pPP6KG4cawR/oYLpmUgNQzdqBuGdXSsBp8UIL5tOaxZABXeZRru7z7y2enmn42DVuo9iJCEqNEC5MoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4qw9E2dLCCokETCIflhSipwEVYcL6s10H1WWLffReM=;
 b=CsTp0tTSI6+QB1lRgRLTZdhprCrzdiA21Nx60CZ7/MdDbXVSWvg8LorNezkyv/JiekFFIPjd6EieU08UnYcKcjFYOO0TK2Yt2/NPRr28pBoeBxc69RMMlKu1CsdeiwGPPIrNe1o+++1sTsYYISGEVvPFKuwLTCXQlG8Ls0+QpvKpkPt1nyCXaXkYhAYFJ5vUn05CqjFrhpdjJ52iQ0Hp/sDVNQzKfBLP+Ds0xFr8LRVT8HuqdOgSy3x7+eUvUxOzAQPJ15LZb98BC7tp9RO7AGOXrFK9mGq7A7iwAna6YJdcvKLAFiORPFt18F7v2GXkYe08VET/rXhvShmNI9O+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4qw9E2dLCCokETCIflhSipwEVYcL6s10H1WWLffReM=;
 b=f9e/qglROnrmpIobDeFbAVMNSgyncreafJj3tfHIK2MfAiwQO2CoCLk0+M6cIixtXmmr0CM8mbHo08Xfnke7s1v+N9NLcB4uz4mYZkpg2054IOQjhWajm6EUdj/VA2168UOuI44pDMI6o943bodaNyseeAp8glOzLY/oETotUGQ=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2476.eurprd03.prod.outlook.com (2603:10a6:3:6e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Tue, 22 Jun 2021 15:27:51 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d0d6:aefc:17d9:bcb9]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::d0d6:aefc:17d9:bcb9%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:27:51 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "wim@iguana.be" <wim@iguana.be>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Thread-Topic: linux-next: build failure after merge of the watchdog tree
Thread-Index: AQHXZl+2Nd8FLT5ZHEi4FgmrXFfE8KsgKZIA
Date:   Tue, 22 Jun 2021 15:27:50 +0000
Message-ID: <ffb5ed53e4edd9aeb7e307290768237a387d722b.camel@fi.rohmeurope.com>
References: <20210621153839.43dd423e@canb.auug.org.au>
In-Reply-To: <20210621153839.43dd423e@canb.auug.org.au>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [46.132.21.91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bb62a17-cf9c-49c8-3f16-08d935924c4c
x-ms-traffictypediagnostic: HE1PR0301MB2476:
x-microsoft-antispam-prvs: <HE1PR0301MB2476864BEB3A269FF6CA2451AD099@HE1PR0301MB2476.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jaF2kF6H0jAHw1j74gQ2mwoZmpg6Dl6QvKZKQZyJ48eAlqNbzA2sm2xRxZtr6Obc3lAVaJoydY/IIzDYC587f1twqfwDfzkHfhbMcVF3LRQ9+xvhqxZXSE8AUEPxpfxQ02MgESSOUkxdFmRCOsBeVQqNieMNpTtT+n3rfV178Q+XZoU8D3YKg4DwO50SzQ68gUE4tOA3Y5s+AXC1M7ZEZJJicJaCHVBIbRP/xeQts15n7Y69Er8IB17IFFEDIktB8NDZ0WpBC3qUHPKGVmmTr7QQDpzavPaYC1Zq6DuRiRj9yIm/oFI+zbhbu3CC60+PrVIcjrwlItXIjLjDOu5vkEsuAgNWjDAk6IXOnKkyV1vZTKFp0jJD+z8s4v2o95PBy+jc3fJuwznXKGN7AnEqFjn5h4KRpZn0NRklR8HeJnfGUZygf4JMUvXwMvex9s68dj3YlNuC0WknWszM+6Ez/CzqPQbVm1soScS9tZQQBQFXDsEKbitdt+xqiib+7dBxCIyC/8/Da2XBNNoHAFQwG4ZmWoYgxeINZicF7I5qRjrFrdHHD4O2HokTc6UjbQtTV1DQtl2oufQ/GqEcbgu6O3OXqNGlx88xwFUnPO/FqV9k/7LLZDiMiRFsOW1vrlDij6hdZbnexhhPBJwk66Qr8X/XyJinVQj7xstJlFEtawXKpzito1j1CXroIhV0NyYdZ6d/2y2aIGbkHk++gOdSUL2RY5HWXTil9mW6c+KCyh4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39840400004)(2906002)(966005)(76116006)(186003)(66446008)(5660300002)(86362001)(6512007)(71200400001)(4326008)(64756008)(83380400001)(26005)(66556008)(66946007)(4744005)(66476007)(6486002)(110136005)(2616005)(8936002)(6506007)(38100700002)(3450700001)(122000001)(316002)(54906003)(8676002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFF3WGEvNncvWHQ3TUpzVkUrR0MwdXgwYTNlRXpvK0VrVmF5SndiMTN0cWZX?=
 =?utf-8?B?cWpHUnNOUzVlcStEMVpCcjZqN2ZCdk5FWXR2L2V3ZWk1M21Wei9ESUJqb1Nr?=
 =?utf-8?B?N3JNcFRGKzQ3RjBiTk1mbTJGN0JnanZVSlFjTXByRkxHZmVCOE5weTFUL2Ir?=
 =?utf-8?B?QklIVWRMSHVoWEZqTThVQ3RmZUE5ektuV3M0RXNaOVZaWG5RZ1gySlZjNEl0?=
 =?utf-8?B?aXFoeTg5T1UrN1l6VTRZaGhzQUJJNWttVitJU2FpSGk3UmVZRXZzRkpRYllH?=
 =?utf-8?B?enZBU3BjZ2c5SUtZWGMvTFJzOE1UQnMwclJuYUhtT29FdkUrUThrOXpwUTM4?=
 =?utf-8?B?emhZT1lGeDVGbllQc1RTSUZxV2NtR2ZLV1VLVXJkZjcyc3lQOVNDNjJoSWZV?=
 =?utf-8?B?YVVsdnB0SDYwWmtEQWxXTDZWWndkZklDVmFKbUROOW56dHhETFpJanNFZDlu?=
 =?utf-8?B?NWZ5Tk1MY3BRenZpSEQxT2dBLzZBTSsweWhEbHVpQmJvSUNLdjlqMVdPV2Q4?=
 =?utf-8?B?ZS9ZT2pMbDdqbmNMT28yZFR2by9uUTJIeExjQ0dheDRXN0xGOTV6N1FHa214?=
 =?utf-8?B?UkRpcElmNlBtMmh5OEVuTHVzbVVPMlFhMEwvM1dhbEtHNnNkYWRtNm1pVG9T?=
 =?utf-8?B?ZXRoeStUOWVjZU1nY0h6bjRlQjNmZ1F3WktneGQrU05SZmlLaXRKL1dEaFR1?=
 =?utf-8?B?UVIzdUlYVVgwVlE1ZkRCVm9paURpWFAxby9RbElSVFJVTUNJY1BDejhIbHFk?=
 =?utf-8?B?akJHTW1RWjZQUkk3cmZzRk9xcTBBN3FmWVliblZqdmdEUkNyT1I4QTdXdVUv?=
 =?utf-8?B?UjNiOTRwVk5sZi8zTVBTVGdMQTNYdDd6eFhsWGVsMjBYbmpKK0p4RGFYL2Rl?=
 =?utf-8?B?cDNTcmZLN3RUcjkzV0NhZWVIRmZjTFMxMHJsL25JWFFVOGNGWERpc1kyb3Ez?=
 =?utf-8?B?aHN6dmZEbkQvVTd1ZTN3RmxvTy9TQkc5WTRpclVhMWJ0ZkJrVW9NTkg0WHRU?=
 =?utf-8?B?NlRDdGI5ZUlqQjJCckxsU3RHazE2a1dVMDFjZndwdHVaZWY4WFRMZVdPSFdQ?=
 =?utf-8?B?Ym1mUkdJZkxvVWw3SUlpZk51OXkzOUFLMUdUMmVhTVdaYkNMT1pyd1RBMFpZ?=
 =?utf-8?B?Um5nenFnZDc2d0lCMEpYZlg5ekZqQTZ4QWpzWnFLOE5NaHd6NXdMN2pRR0Ir?=
 =?utf-8?B?b1VaYVdSaHhNbzFkb0xybGZyZVdPbXVCSlFta3FqcHZTUEIzc0FxcGhoVmZ4?=
 =?utf-8?B?Y2pwakxNWFl1SzVBZlZ5RHVvNjFCU1U1N012amFBeENLOWtRRlB5eTNiUG5u?=
 =?utf-8?B?cHRmVHpES2VHVUg1cDR1bTJ5NW5zc3lGT1RZMXpaZWRDSWlKVC84QmN4NXV2?=
 =?utf-8?B?VW50T2pjQ3RiN0p5K2RrN0dRNTR6WnQraDZEUVJhY2hHSEFkV21TbzJWZDB6?=
 =?utf-8?B?R1B4NU4rVEdUSWJwM3FtR3k5N3AxeDhGSkVwUVFsUSs3RXk1dG15U1BRVFpT?=
 =?utf-8?B?T2tqUWxTSElVV1FXR1ZKM2hJYmdvMk1BVktXSW84NEJZL253WCsvRjdVN3lh?=
 =?utf-8?B?WkkvazVMMUVDZnFLNjUzaERiVGFtdEZSazZhYVZpMDNMWkRKODU2Sm9uRUVj?=
 =?utf-8?B?aTY5WU9yMFN3aXNIYk9BalM1OExLeHM5NU0wSlpsc1lralk0T3dyZTJsOHY4?=
 =?utf-8?B?YzI2QVJBQzNmMDJoK0JUMkNhb0hibjFlTWszV1I2TUw2UGJqb2tvcGQxWVg2?=
 =?utf-8?Q?chUEiZeyqM4j3hFyGmzkt1x/zmr4jTXEG0jSMpX?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF131FD60DFAE14D93313654B077FE61@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb62a17-cf9c-49c8-3f16-08d935924c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 15:27:50.9639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnKRxs4tWM2PS5K2mHIt2nuNsvWvmIm9C4x5DTvxV3vQEguFDt9EBIv1M3hZycrL4fZXqvyUcqBH6ZuSimbbjlLg+lvy2jQgvdYDP1djG4sy0JnUScbItx4c1YPXBX5p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2476
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgR3VlbnRlciwgU3RlcGhlbiwgQWxsLA0KDQpPbiBNb24sIDIwMjEtMDYtMjEgYXQgMTU6Mzgg
KzEwMDAsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+IEFmdGVyIG1l
cmdpbmcgdGhlIHdhdGNoZG9nIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0
DQo+IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxpa2UgdGhpczoNCj4gDQo+IEVSUk9SOiBtb2Rwb3N0
OiAiYmQ3MDUyOF93ZHRfdW5sb2NrIiBbZHJpdmVycy9ydGMvcnRjLWJkNzA1Mjgua29dDQo+IHVu
ZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJiZDcwNTI4X3dkdF9sb2NrIiBbZHJpdmVycy9y
dGMvcnRjLWJkNzA1Mjgua29dDQo+IHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJiZDcw
NTI4X3dkdF9zZXQiIFtkcml2ZXJzL3J0Yy9ydGMtYmQ3MDUyOC5rb10NCj4gdW5kZWZpbmVkIQ0K
PiANCj4gQ2F1c2VkIGJ5IGNvbW1pdA0KPiANCj4gICBmMmE1MTc4YjBiOWYgKCJ3YXRjaGRvZzog
YmQ3MDUyOCBkcm9wIGJkNzA1Mjggc3VwcG9ydCIpDQoNClRoaXMgb25lIHJlcXVpcmVzIHRoZSBS
VEMgY2hhbmdlIHdoaWNoIHdhcyBhcHBsaWVkIGJ5IEFsZXhhbmRyZSBoZXJlOiANCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMTYyNDIyMDY5NzMxLjEwODg3NjQuMTI5Nzg2NjA2NjAyNTc5
MzgxMjcuYjQtdHlAYm9vdGxpbi5jb20vDQoNClRoaXMgaXMgbXkgYmFkLiBJIGNvbXBsZXRlbHkg
bWlzc2VkIHRoaXMgZGVwZW5kZW5jeS4gSSBhbSByZWFsbHkgc29ycnkhDQpUaGUgUlRDIGNoYW5n
ZSBzaG91bGQgZ2V0IGluIHByaW9yIHRoZSBXREcgY2hhbmdlLg0KDQpCeSB0aGUgd2F5LCBJIGFt
IGhhdmluZyBhIHZhY2F0aW9uIGFuZCB0cnkgdG8ga2VlcCBteSBjb21wdXRlciB0dXJuZWQNCm9m
ZiBzbyByZXNwb25zZXMgbWF5IGJlIGRlbGF5ZWQuDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZh
aXR0aW5lbg0K
