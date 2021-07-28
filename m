Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C313D944C
	for <lists+linux-next@lfdr.de>; Wed, 28 Jul 2021 19:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhG1R1I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jul 2021 13:27:08 -0400
Received: from mga17.intel.com ([192.55.52.151]:34381 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229567AbhG1R1H (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jul 2021 13:27:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="192992985"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="192992985"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2021 10:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; 
   d="scan'208";a="506618581"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Jul 2021 10:27:05 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 10:27:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 28 Jul 2021 10:27:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 28 Jul 2021 10:27:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq/aORYyySXesj7t63kP4+jiH8RYEwV8iW4dFHKulesMlKTa1v5ChN2f8Qg/Nd/fkebqBjzZ0tVJzzof4fCayfwt7KV7Ga7puVDxS9bvfh9i2Gb8DC0OxGOm9zi5dsX3FaK1p3awBQjstEH33BZeEskOdI8FZl5N8GI1r0HyqdSLuFmq5YU64Pwpbv0ZzsVdhkYJq1EC0LiUM7tLaUnNMLc8woxfEoKnHmMEkJSDkAhkuOhM82x6WFfRwpfApQ3N01ErC754h5c9EVZ31I6gpOZ+7GeRq31XSxRbsdXGtJAE/DMFHKNIBai1c8h1T3sSHSNNDuFl2aj6rZ2S68k47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWsp51Cqo23hfLAjq+g17/nU9cn+0R025t54y7jcE0Q=;
 b=VsY/Xl/yjMEpXgVi+MITXCN3YS1cp2yewYekF0smQPx0Zm8PZ1yAnS5piqi71cdmD27DyHoFG3ny/piKnC9LhT5LWuH7cAgz5asrNfBJjswhMQ1PsRylAYfv2kvv4gG84V24a1BiCvZVXaScfar0L3+35doQbqHRH36HGuMHRxuJ9AEmWkw/KZBQXzYbZFnIKxPitAK+OJGkjZnmWCVc7S3sBgOqLddlRNEcMQXU7F1LItbqOgToC8bn/EBMMBPg6qkU0ePZt+7pMmuqVP1gllTeAOBDBfEK61pvdhTnibVvOq1unG7rCSH4doTHVKB63nBTGmXIa+2GGrggpRVKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWsp51Cqo23hfLAjq+g17/nU9cn+0R025t54y7jcE0Q=;
 b=BsX22qJjlGQs1kKTav3Dw971jbILVi8gTn1q1G+2Ir0eVnn3i+53LuwmK4/4E9zU5MdsduQvY3gnBqkKb+ichVNX4ZMmeV06GbBHZzOr9prtMMbHFoN1IY8YC1DgFqAnQttCXhV7xZwvK06Q9agqN7+AlEBRZ4fw8gDgDtKL9qQ=
Received: from MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16)
 by MWHPR11MB1341.namprd11.prod.outlook.com (2603:10b6:300:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 17:27:02 +0000
Received: from MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464]) by MW3PR11MB4523.namprd11.prod.outlook.com
 ([fe80::a87d:ca62:f143:7464%9]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 17:27:02 +0000
From:   "Kammela, Gayatri" <gayatri.kammela@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        "Gross, Mark" <mark.gross@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the drivers-x86 tree
Thread-Topic: linux-next: build failure after merge of the drivers-x86 tree
Thread-Index: AQHXg9B9PLJaZUpSKkmHJ0/J20jq06tYnNyAgAAGjRA=
Date:   Wed, 28 Jul 2021 17:27:02 +0000
Message-ID: <MW3PR11MB45238F497A4960B3D8FE60A7F2EA9@MW3PR11MB4523.namprd11.prod.outlook.com>
References: <20210728164847.46855-1-broonie@kernel.org>
 <CAHp75VcP2V2j_ZHtc9y9Jw527E8PZaoFngsXD3oA0Yvmm=L4SA@mail.gmail.com>
In-Reply-To: <CAHp75VcP2V2j_ZHtc9y9Jw527E8PZaoFngsXD3oA0Yvmm=L4SA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.100.41
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fa79633-01b8-4fcc-3c1f-08d951ece9f8
x-ms-traffictypediagnostic: MWHPR11MB1341:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB13414AE7ACCB6CBEE2F86E87F2EA9@MWHPR11MB1341.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0QmGEOxg2uHwVRulGXEmJpNDQK3ZjbojVMfnVMW3KrPPk6Kh0q+cHH7Bk381Gu1jwgOmqovjw7bfK0w81xDVtl69ydIujXFR86BbVR7h7nPWiI9Ibat0Ibv5xoiSMChY11amwEwHYdhT/6dETijYU6nIcfRt4v5+ES5QexJiihxiMHdH00F2Zk/f0by7es6Hkr7gu+hAPRYCcHAEO3e6lxwI4b2c+uDpmvFG/efzvgbe5KbaPGXjChHTOhPiPXQ0ocbzvBCHCYfoBTCTXgJvKafoIHUF4lIi0rL05558n/is4nTptl424oTqbvLArSj/M096kbf+wRqWouHuJ9q3P2mf4c3rMxo7CVY9WzOvKkNfYqSf0/2xRFlfwXoB9KJ1I2RS3MMedsFqLasUbxtlLAT5oQuRqrLcHpNDU85p8I3ObNS72EKoURKLvty4/lcEfNo6RMqLH0Om5QRKde79YWDcX8d1h5pIf4x/nOWAC5qBa54FOmhL8q58dmrESZpLs/xpuHyo9ow3IaAw/QYgG5Wo6o2802m4rQcGHTEZVb95iw+DDE4Y9xQUrdBZFiioGMG0bVAg/b4FCs+PRBYlI4Kq/Z4L/xdTVWbRsbZSxHI9E9pTBrhpKeO23XjABie/9a47jEL+Dj8/0JnduzRFuQFY8cpNTt0vaAAr0OZM1QBMnmthvLJiretiOMw75OZpGQKMGhPzm/aNXOOEWnKhow==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4523.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(7696005)(55016002)(9686003)(5660300002)(38100700002)(122000001)(186003)(6506007)(76116006)(316002)(8936002)(66946007)(26005)(33656002)(66556008)(66446008)(64756008)(66476007)(53546011)(2906002)(86362001)(110136005)(71200400001)(508600001)(52536014)(8676002)(4326008)(54906003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWk3ai9EblJCKzlMc1ZQbThOVUhBazZFSloxL1VNS3p5VGt1am84ZDM0eW9M?=
 =?utf-8?B?QzhPVzVnMGNxaFpEYXA5SHBmWkNpR29NT3BnY3RIdDh0c3hZL1NHdThGZ1hH?=
 =?utf-8?B?b04zZXBncy9iT1ZGbVZLUzhKS2tZSjF5NkUzdU9tN1h4cnZNMjl1NFJMS1hI?=
 =?utf-8?B?VE8xNWpBM2U3N1d0VkF4eDZjZTN2VUN6ekNoQnJ4dlNoWkQ0L1pIYkYzYVVt?=
 =?utf-8?B?WS9ZL3puOGtUZzd1dFpHdXI3R2tneDVWMmQvR3RaMWVGSzdyNStDVmo5cGhs?=
 =?utf-8?B?YnNvcTI5aEd5U1BsbXliSmJwYWdnVXdhYXV3bXNiVm1aV0ZDNllNNkhmMWpM?=
 =?utf-8?B?RFFFanpQU2lHZjR3azJJUmhzOU5pcFp1RkROQXkzVm9wQStyQTlpbHBDeUZn?=
 =?utf-8?B?MjJyZDNYNzJYU0NCNUNaaEZzbVdpcGJHOGsyUmdHUzBIM2RZQnUrMm1IdzVL?=
 =?utf-8?B?cEZqOU9ZSEhUc0FsWnFVRTJKdXE4WnNleUFHV3UydEpLY0NjdWcxNFJ5VWcw?=
 =?utf-8?B?UFF5NUxzR21UMXIwcGRXVlYrNVpmTW1SWHdOd0NtWG9UWUozOGt3d1RvSnZL?=
 =?utf-8?B?L2ttZE96VWpBWGhNR3lrTk51MisyWWtxSDFMcE85UTcvc3o2SkJybkx0OTZL?=
 =?utf-8?B?bCtTYmE4bTJvTnMrTXZPSFVlSk9xZWxRR1kxQ1BLd2xOZWdKaXdLSTlnaU9W?=
 =?utf-8?B?VnBYRXhtWGM4dnVCT24zNVdWQ1Nacm9tbW5CMThsTW9jcCt6R0NWVGJkVkc5?=
 =?utf-8?B?STc2bHNINTV5Z1NxVEpYdXY5STU3cG8xWFFiTm5Hc3hQRjJIYVZUZXYwYTMz?=
 =?utf-8?B?MlFOSVphYkNYcktvOXF4M242ZVFsVUQ1S1o3MkdDOXltdEE4eVB4bHowU0s0?=
 =?utf-8?B?anJMYWY3R00vTHM4L1JhQ1lzUDg1U2VQYVRIMUszOW9MN1BIcjRNUVB6d3ZD?=
 =?utf-8?B?dkVwQndKZFhqbVB6TU5nUUdmaGlEMHVGWlRPMTNPYjFBNDZ1QkM3OTQ5blVI?=
 =?utf-8?B?RldaSk01eTRPNzd2WGZmL1FpakRhVGJSTDdBNkRuV2g1OWswM3FibnFhb0pi?=
 =?utf-8?B?cnFBNWdDRWNkNW93dUdwcEVsWDVDMUxGeVpRbmZUNGZnV0lrejNtOHlQKzgy?=
 =?utf-8?B?M1pzaTY0cndBclFiRERGR3ZhL1ZyWitVb3gvUzd4Zjl1YmVMSTlYRG1DMm41?=
 =?utf-8?B?STdFYWszUVNSWUhuRkMvRjBPWGQvS0FwODYrdDIzZ2xtZFNGbHpaL2dlclNW?=
 =?utf-8?B?Y1lCU0hYSGFZVDNKcnNERHNVR21YbUwrZFNYTTVJb0NZUFYxZ0Y2VENlKy9I?=
 =?utf-8?B?Vnc4M0ZBaW9sclZjNUw1UWx2TG5POXpLa2ZuckpBd3Z3eDVjQXoxMm9RZUxz?=
 =?utf-8?B?T2hXWHhqcldTblhVU3h1OThzc2ZPSmxseWg1YmNSdXNIbjBaazNtYVZYb0pY?=
 =?utf-8?B?Z0FXRzBORURhZWhKaW9neDE5NE44em1QdDBRbkVtaUpKd255RVM4dWxPc1BY?=
 =?utf-8?B?b0ttYlo4em1NOGtna0RQZ0FaNGdiS01rSGc4akRBNXJ2NEZ2bVpWYVVhTVlu?=
 =?utf-8?B?eGJyRyszZ3ZLbHNDdmVrVVlLazJJSGdTRnBpT3diTlp4VDdDLzBVbzRuZ1pQ?=
 =?utf-8?B?S2NVdno5dzZweU1UNHR5My95MW1WaXVOYVVaVUt4RUJjY1BlYm0rOGZzYVh0?=
 =?utf-8?B?OW9XZDlqKzlaVVlGN3A4M3VqSEZEaStvUTdVTmwyMGtMdEVPN0tRbmpXbHBJ?=
 =?utf-8?Q?0jzoJuUe5cvRddYqWw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4523.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa79633-01b8-4fcc-3c1f-08d951ece9f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 17:27:02.7992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/1Z/684/zDtSyAyDmT7ndf+Yeqfun2ZvTqSWDH4Zy2ZpRkhA+WvE119b8oJiTkfIH2/rMBAnMh0dmT4eKSAXFrhDGcWFo5FKsA3V9TkTVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1341
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFu
ZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyOCwgMjAy
MSAxMDowMiBBTQ0KPiBUbzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiBDYzog
SGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT47IEdyb3NzLCBNYXJrDQo+IDxtYXJr
Lmdyb3NzQGludGVsLmNvbT47IEthbW1lbGEsIEdheWF0cmkgPGdheWF0cmkua2FtbWVsYUBpbnRl
bC5jb20+Ow0KPiBSYWpuZWVzaCBCaGFyZHdhaiA8aXJlbmljLnJham5lZXNoQGdtYWlsLmNvbT47
IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QNCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+OyBMaW51eCBOZXh0IE1haWxpbmcgTGlzdCA8bGludXgtDQo+IG5leHRAdmdlci5rZXJuZWwu
b3JnPjsgUGxhdGZvcm0gRHJpdmVyIDxwbGF0Zm9ybS1kcml2ZXItDQo+IHg4NkB2Z2VyLmtlcm5l
bC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBsaW51eC1uZXh0OiBidWlsZCBmYWlsdXJlIGFmdGVyIG1l
cmdlIG9mIHRoZSBkcml2ZXJzLXg4NiB0cmVlDQo+IA0KPiBPbiBXZWQsIEp1bCAyOCwgMjAyMSBh
dCA3OjQ5IFBNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6DQo+ID4NCj4g
PiBIaSBhbGwsDQo+ID4NCj4gPiBBZnRlciBtZXJnaW5nIHRoZSBkcml2ZXJzLXg4NiB0cmVlLCB0
b2RheSdzIGxpbnV4LW5leHQgYnVpbGQNCj4gPiAoeDg2IGFsbG1vZGNvbmZpZykgZmFpbGVkIGxp
a2UgdGhpczoNCj4gPg0KPiA+IGVycm9yOiB0aGUgZm9sbG93aW5nIHdvdWxkIGNhdXNlIG1vZHVs
ZSBuYW1lIGNvbmZsaWN0Og0KPiA+ICAgZHJpdmVycy9taXNjL2MycG9ydC9jb3JlLmtvDQo+ID4g
ICBkcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvY29yZS5rbw0KPiA+DQo+ID4gQ2F1c2Vk
IGJ5IGNvbW1pdA0KPiA+DQo+ID4gICAyOTAzNmZjYzkyYjIyZCAoInBsYXRmb3JtL3g4Ni9pbnRl
bDogaW50ZWxfcG1jX2NvcmU6IE1vdmUNCj4gPiBpbnRlbF9wbWNfY29yZSogZmlsZXMgdG8gcG1j
IHN1YmZvbGRlciIpDQo+ID4NCj4gPiBTaW5jZSB0aGVyZSB3YXMgbm90aGluZyBpbiB0aGUgYnJh
bmNoIHllc3RlcmRheSBJJ3ZlIGp1c3QgZHJvcHBlZCB0aGUNCj4gPiB0cmVlIGVudGlyZWx5Lg0K
PiANCj4gWWVhaCwgUE1DIE1ha2VmaWxlIHNob3VsZCBrZWVwIHRoZSBvYmplY3QgbmFtZSB0aGUg
c2FtZSwgc29tZXRoaW5nIGxpa2UNCj4gDQo+IG9iai0kKC4uLl9QTUNfLi4uKSArPSBpbnRlbF9w
bWNfLi4uLm8NCj4gaW50ZWwtcG1jXy4uLi15IDo9IGNvcmUubyAuLi4NCj4gDQpIaSBBbmR5IGFu
ZCBNYXJrLA0KV2UndmUgZm91bmQgdGhlIGlzc3VlIG9uIG91ciBzaWRlIGFzIHdlbGwgYW5kIHBs
YW5uaW5nIHRvIHB1c2ggdGhlIGZpeCBzb29uLiBXb3VsZCB5b3UgcHJlZmVyIHRvIGhhdmUgdGhl
IHdob2xlIHBhdGNoIHNlcmllcyByZWRvbmUgb3IganVzdCB0aGUgZml4ID8NCg0KPiANCj4gLS0N
Cj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0K
