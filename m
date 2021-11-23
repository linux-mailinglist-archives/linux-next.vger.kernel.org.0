Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB41A459E27
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 09:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhKWIgz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 03:36:55 -0500
Received: from mail-eopbgr10071.outbound.protection.outlook.com ([40.107.1.71]:1540
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230428AbhKWIgy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Nov 2021 03:36:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bx1D81VlnpYcre/3b3XStweR02AFygDZMljBzRUugMdt6qac4bjkedPqBJE3D8XA0sSh9HHmc8wi/5r7qJwceuFmrGzwk4/57cDZRX8UaLmUC8oC5ihfCY9e24l3vAEyiQ7ZZSJ317eAWQ+OWrxzZAvZJh825av8EvjLFhX65LE7t6HdbQKY9qhZQ+Qdk0Uh8cNKhqJQDwfrFXEyMUptuValBtGNPGbjqId8UsGrhf9P7JfuT4yGxD/ZcNwuZpIfHOPMj354KCKEaIPwd2vwbGdIIvWRkHlESjVMBRViYnfzjAVJDONOSUJwO2rq/HEwiE/vPs7OtAK2Sp2hXCm7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0R2rvJFqZvrwgr1LuUlJulYAiOYY/H6ogg3xvjL4Fl4=;
 b=M197L866gnxYlW9//MfdqzNFjG+WaCoe9PS6/Z3Md0FzIAZcw9V/AEAyaaAXn0CjDsoO2dDJpm/Sujf6vPBjabGYkXIlHBiBOAzPJYfAJopnhMc6NfweW1c2rAsi+/jOrLNo+xdm/FzFoTUGzz1iyZT40bZSf2EJQknM5u7oe5Pg9Hzwfg1Atcyrp+KwrQ+KTMd6cXgZ8zCFltLHr1IzlE5BQjllLWoKUfc/YOX2CGG4GA9feP6qayNhZGiiqR+RXPK1qxyLYqpVH2mltv5L6rFwynRanwDGAEySp6BKL+gTPP9B4l50Ae1crwIuCQKcIM8q614hAPycjyVZiQq3Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R2rvJFqZvrwgr1LuUlJulYAiOYY/H6ogg3xvjL4Fl4=;
 b=d1l9UuPACJxANfUyIxEq/Q6cT83ANbVq/p3vr+nCymglPyGAo0G+lyvLW341VTBf6G+wTAZ4GgqoiV5CKvPkCGzehpleZEPZU+w8Im+fDiWlDkNNFPN2LY+53509OK3AZawsYXcbjxJ9k+/VV6pWhvUoqtrhhCiDY4CHeCzpJfI=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB3067.eurprd03.prod.outlook.com (2603:10a6:7:5e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.24; Tue, 23 Nov 2021 08:33:45 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::544e:754:6241:aa7f]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::544e:754:6241:aa7f%6]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 08:33:44 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
CC:     "heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Thread-Topic: linux-next: build failure after merge of the regulator tree
Thread-Index: AQHX4D2USFB6fNyejkmXjnndrEACuqwQySsA
Date:   Tue, 23 Nov 2021 08:33:44 +0000
Message-ID: <aaa19a07-f4fe-e2e0-ff56-d75c334a9af1@fi.rohmeurope.com>
References: <20211123184142.50ff56c3@canb.auug.org.au>
In-Reply-To: <20211123184142.50ff56c3@canb.auug.org.au>
Accept-Language: fi-FI, en-US
Content-Language: fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856adf23-a1c7-42a7-c9f4-08d9ae5bf66b
x-ms-traffictypediagnostic: HE1PR03MB3067:
x-microsoft-antispam-prvs: <HE1PR03MB3067DD5441BF32ED7001C7B2AD609@HE1PR03MB3067.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fxap2mukVOkgqBh13NrQ8MJB298PO53YCZlRhSDU3haQCd08AMspgwRRb8rufU6SVBFJYN70c2RiNcIsMbpc/QDqRfF3oAxwa+0l+JEtj7qqnZnKjYklARmx1Bux4Ir3LEcEoTrREHuEpZI/cvLchXXtJjqg+OGvyhRikD1nvs6nzDNxRyG2uyJ0aHBKRWakBmaI+1FiCkkZmGC5md/V9eGCs1SYOJ3m65Xq4c1jxospRvVgvwOokP/VFgbGcaUGaRUL1GM6LXzCveoED90TGAuSFuJry+YIDV8/R8x8+qYbii4j+mPj5NKU/f5C9vEMS+YUnd8vmcX7m9UkbUSxsddAePQYiwjwZ1zTlvW9lhh9IjFs8sSSkuzznW7Kvjdgy1dexBt5Db/d0nRpn4l8WkWrkNcc2OAx91OCdpEllELb3YwqQw6FD5XozJItHCkodtbJYnrhhxpvrbMW0RYLF3brqZEJhb2WqTLP7FgLgerS64FcxeBasHxelqffNts8ZGuV274967uU8m+FtEKHV5ie7MSa5meYTTK8QWRY7Vpd8UVXyhZdaMpw7UNblU7nfQSWtw6HwaAFIODSypvzyVF20/h7fkZOFoQGpLr+VGaB4ykooWed4vRttMLsJ6posry+a3VtDH0W8SKPI+eQVZg04Wpl2j20KADqs2DVWmADwFr7heEFL9qy/PAK3qw1JDWKO9Rq3ttmIWjdKN1hUR0LqFDqc6CGCALlPiNpwdg7jzZigiXS6gAJVQrobP0Iob9y7V6zBU/vsOWS5b3B1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(4326008)(8676002)(26005)(316002)(110136005)(76116006)(66446008)(54906003)(4744005)(6486002)(6512007)(38070700005)(186003)(5660300002)(38100700002)(66946007)(2906002)(122000001)(31686004)(53546011)(66476007)(66556008)(83380400001)(2616005)(71200400001)(86362001)(6506007)(8936002)(508600001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmEvOTlQRjdFeFdIcWN6VXB4RmU1TGNpcitRa3dSVkYrWmI2N3pUK2xaNi9X?=
 =?utf-8?B?cFF3Z1RIZ3lXU1Q1MS93QlExUEo0YU5MVnI2N3hDZXRnNUVVbDBUOXFNT29s?=
 =?utf-8?B?by8wZ05RZ1M4elZuQ1dxS0hxQjh4T0FoZnRRYm1wQnlYZlVrRlBocnQ4V0Ev?=
 =?utf-8?B?VXh1NmU5ODdmR0M3NXBOMGFiYUJtTDM0dEtQSDVxajJ3T1BXL3pleWkxUmpU?=
 =?utf-8?B?ZEt0cmhjdk5FZGxMaUpXNEY1OGVMK2RpcE56QXdGM1hyU0dlTEpuR3BxdS9W?=
 =?utf-8?B?djZtVGxUbkZmbWJjTUtyNWpyZjNWcE1vUFpsUGlldUpadGY4aE15QWFyaDg0?=
 =?utf-8?B?WVBhazlEL21IV1RYVTJtUDV5d3dSQTloK1pTYjJXQnlBaDR3YzEvYzVvYXp2?=
 =?utf-8?B?U1JOU2ptUTV5VmZkRUU4ZGk0dnExZnRTZTlBcEVRUzg4emF5SkxjMUxLcnlh?=
 =?utf-8?B?WW1FKzE5Y0FtZnZpZDBhSEU5OUFReXdXaTAzOVd6NmdEdGNIQnFadUQ5MDhy?=
 =?utf-8?B?STR6ODA0N3JzNFlwTEFCcDAwaXhiWmNTU2FMM05xOCtONExJYW12d08zVCsv?=
 =?utf-8?B?c2dlYjlldThRS3ZnVjhYYkk2ZGswMTk3MGNRaGxpRzhDRGFXRjNDME9YZU40?=
 =?utf-8?B?Wk5nZ01aenc5Z3VSZ2V2YWZGMG5aQ2owZlVwMXA4V0E2YXZkZ2dvUm5ZS0V3?=
 =?utf-8?B?OFVmdlJMUkdJWjdjZi9IN3FIOTZ6TEpva2NVZGFZMytXOUM5NVhHS2h2QWJB?=
 =?utf-8?B?bkordjlDZnVuRTlHckgyMTNVY3lQa3l5ekZRNUtrVktmM3pNcjhiMjhUZ1Rw?=
 =?utf-8?B?YVRVSnEzaWtjMjV5VmZOSVRKOE1CZnNuNWJHSTE0eHBPT2gxaHB2VFBvb0hi?=
 =?utf-8?B?TEtlQmVJUzFBc2xiNnFuNXZTc2QyMkdLWmZXYmF2OWIzcHBzWEFDMmZPeDlj?=
 =?utf-8?B?L2N5K212Zm8rNjJDa0Y4TTlaMnFxRHRsd1VOMjYxaHNyd0c0TGRpN1kyUnl6?=
 =?utf-8?B?b29KS09OU0lRcEJzWUJaWVNsNkp5QWFjTlhabXRpR3RLMWRINmJRYzV1Y2Iz?=
 =?utf-8?B?VGRtblZVN3hSV0l3S1VjMXNCZzZWVi92dEJrKytjMC9sS21TdEp3UitZSDVz?=
 =?utf-8?B?U29QR2NzK0QxcG01UGJIVmJRN0xyWDNIM0d5QmUrN0RIT3Y3RWdrT3QxUDI0?=
 =?utf-8?B?bXZRMTFsNjBraGRBL1EwUENTMXBKMUFpK0VUV09iL01QNVNSWTlZWGhqTWhp?=
 =?utf-8?B?WHE5KzJESlQ5NCtqNjJReUxaMU5JdnQ1aWVYKzRQTGZJOEs5bTdYbTZLSGpi?=
 =?utf-8?B?bUlLZnlHYld6amdnZFdCeFF3SzB0M0krb1JUaUN4MkdEZmdOZ09odTljZzc0?=
 =?utf-8?B?RXdqUjN3RUFpZVRHNVo5OEQvOURDOGUyMGpoK0Q0SnJBTjE5QU1BTUJvVWN0?=
 =?utf-8?B?bEVYWnVreVV6cU1MRUEzNWR4RGZoYUEyM25iZllFS2kxbktldXpScnFrY1lu?=
 =?utf-8?B?NDgyb1RBZGJvM3RGdlV0WXQyK3MwV2FVZHNuUCtLUXJ3eGFlcEVTU0lDeXFG?=
 =?utf-8?B?NEQ4c21FNFFBKy9DQkU4NTdtNmdDWUwvdGdSN2pOcGNzS1orOUdud1h6QnhU?=
 =?utf-8?B?a1FTalZ2WldTdVVFSHI0K3kvM3pqZGFEYnQ5cUlJOXJJSFFzWGVFdUh3SFpi?=
 =?utf-8?B?VVNQQWVWVnFqNFJNU3F5d3NmZkhGeEtubVFLNEJjR3J4U2ZZS2RybFlvQm1N?=
 =?utf-8?B?ZnQwdTkvUHhNZ2EyL2NNbFgyZDJITUZEWi9abE5BZTg1OUhSb1BNQU10dy9J?=
 =?utf-8?B?Y0tab2F6QUxIdGg4RHBiNURyMkhNcmxkbHIxME5KQkVzWXpET2dGUFZkQzhH?=
 =?utf-8?B?MlhOcGlZUUV1V3R3OWF6QkhMNW1Pa1lzdjJIRW9CMTdTU21uc2FnOFVtUXZk?=
 =?utf-8?B?ZjFDVDBORUlMYzhudnZRVS8xVWdYTHlWYWtRZ1dUS0RlQm14RWg5a2VmU1Qr?=
 =?utf-8?B?YTg0bm9oWjBhOHpWL3dQc2FrZ2dMRWFqU0F2eUFFTHpEVUg2NWxRdXV4NnBK?=
 =?utf-8?B?cGdPdjlzckpzMnQ4U1BrRkdjR0NCMktZSlJXUjYyWU96akpyRW1NN1FPaTJ5?=
 =?utf-8?B?cnRHYjllWUlsME8rNStBR1puNnR4dnlQWmtBYStyTHJBNVNxUUd6ZXNpU0E3?=
 =?utf-8?B?Rm9RWitxN1d2d0NSaXdLd3hLS2t1am5SMVpEeEpFR2IybGF2SFd3amlVZ05T?=
 =?utf-8?B?YXBpdm43WnF0QWZ2ZTQyMFFycE9USzZXTkF5c0liVG5mTGxCbXczUUFNdkNX?=
 =?utf-8?Q?8Psad8XA+zGypoB5o/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E40013FB5E9CE4F8F54D5A14FBAB06F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856adf23-a1c7-42a7-c9f4-08d9ae5bf66b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 08:33:44.8332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7gSVU6kUx8zfI/ZarEu0VyRTadwFXoA+H98V6Q0J0nhpDuVMD21H8AuQ8+CuZlIhxyG3koO7o4keA6IHyvhex5wCPeipB+WJ8XLTFwj7uBCHpqofsHAseqXnCn6e52rY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB3067
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgZGVlIEhvIHBlZXBzLA0KDQpPbiAxMS8yMy8yMSAwOTo0MSwgU3RlcGhlbiBSb3Rod2VsbCB3
cm90ZToNCj4gSGkgYWxsLA0KPiANCj4gQWZ0ZXIgbWVyZ2luZyB0aGUgcmVndWxhdG9yIHRyZWUs
IHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoczM5MA0KPiBhbGxtb2Rjb25maWcpIGZhaWxlZCBs
aWtlIHRoaXM6DQo+IA0KPiBpbmNsdWRlL0xpbnV4L21mZC9yb2htLWdlbmVyaWMuaDo5MzoxMjog
ZXJyb3I6ICdyb2htX3JlZ3VsYXRvcl9zZXRfdm9sdGFnZV9zZWxfcmVzdHJpY3RlZCcgZGVmaW5l
ZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQ0KPiBjYzE6IGFsbCB3YXJu
aW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPiANCj4gQ2F1c2VkIGJ5IGNvbW1pdA0KPiAN
Cj4gICAgOGI2ZTg4NTU1OTcxICgicmVndWxhdG9yOiByb2htLXJlZ3VsYXRvcjogYWRkIGhlbHBl
ciBmb3IgcmVzdHJpY3RlZCB2b2x0YWdlIHNldHRpbmciKQ0KDQoNCk91Y2guIFRoZSBzdHViIGlu
IGhlYWRlciBzaG91bGQgYmUgaW5saW5lZC4gU29ycnkgZm9yIHRoYXQuIEknbGwgc2VuZCANCmlu
Y3JlbWVudGFsIHBhdGNoIHRvIE1hcmsgLSBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhhdCdzIG5v
dCBzdWZmaWNpZW50Pw0KDQpCZXN0IFJlZ2FyZHMNCgktLSBNYXR0aSBWYWl0dGluZW4NCg0KLS0g
DQpUaGUgTGludXggS2VybmVsIGd1eSBhdCBST0hNIFNlbWljb25kdWN0b3JzDQoNCk1hdHRpIFZh
aXR0aW5lbiwgTGludXggZGV2aWNlIGRyaXZlcnMNClJPSE0gU2VtaWNvbmR1Y3RvcnMsIEZpbmxh
bmQgU1dEQw0KS2l2aWhhcmp1bmxlbmtraSAxRQ0KOTAyMjAgT1VMVQ0KRklOTEFORA0KDQp+fiB0
aGlzIHllYXIgaXMgdGhlIHllYXIgb2YgYSBzaWduYXR1cmUgd3JpdGVycyBibG9jayB+fg0K
