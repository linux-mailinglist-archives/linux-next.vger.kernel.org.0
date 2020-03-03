Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DBC17708F
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 08:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbgCCH5O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 02:57:14 -0500
Received: from mail-eopbgr50061.outbound.protection.outlook.com ([40.107.5.61]:61670
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725879AbgCCH5N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Mar 2020 02:57:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gio4WDDzoeVSrBfCorTV+cFknHrtOlPdT2D232j0ZvKFE/TXzqDMT9y5nUe1q4LF5XX6S6Ta5zFISDWChgqmxT0dNzwIDnmV9lXIuZMGdhuv8mnPIBHJYAG6LbOzoReP7CdmxokMHlYknlLDhh5ligJjx5OYrm4PJ0MA+GqIvwgys9dL/tqj88ymOB7BSVQRGmHBaRbk4UfPTxi+aM1jDErG6laYImRgVV9WgDolj03ru/NJ8LauwtPGBaXzoIQqtiozDh8xty9GUw15Njz55QkcUNCB3ICTTWLtaHVrPmX36/RM5wI8U7ltSe6THmlMhXN7+7VhxePTQ11beyGW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTX1AxTMrUjRVYjuNaveBq0onVFf9dMZCQIjCjwfgU4=;
 b=ic10YcNifhnA6lLOmBGCAeZsWDS/VmkSi4oMuL01Wrx6IGU9qG9DqQkdeZPhkFR2wIZmQz9rAC/fKT4naPPUV0/L7zTaLpQGZm8kjz42CxOzoKyi9M1Br60dahnU12G/1ZfDizrsGEOFhw49aYiCCTdxVic7WFsTjitOi4z65wXx6fPdTCRy5E9PeBb6Pr9sf2F0nnWnd/wK+IDWgFNO/4zpKj5QuddVh53KejZRYrOL95wXbU6S70WYoUtH0wAMexmeJVIA5SfIaYCjv5QSiWxJkw/mdowsEDDm3g8R9uLPE73DxwbMfDCsUDNYvK0GDh48x7fzVoqeFmb+7Y72TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTX1AxTMrUjRVYjuNaveBq0onVFf9dMZCQIjCjwfgU4=;
 b=oufUHeglxwRD2M39MkPrNz803OXm0itq6jhqB8W7GaSL5Rc6TEBsGaSm6YRSl9Xhs3uDVWxWCEduEizlrpMl8JW1dBKFxN/x51+NU42rHdFitH/VPvlhAztBt9VbF4C7/CBVXrebFWt1MhsSP88ht7cvRxlfK4om1RjAIKayg2I=
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com (52.134.72.18) by
 DB3PR0402MB3884.eurprd04.prod.outlook.com (52.134.71.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Tue, 3 Mar 2020 07:57:10 +0000
Received: from DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96]) by DB3PR0402MB3916.eurprd04.prod.outlook.com
 ([fe80::e44d:fa34:a0af:d96%5]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 07:57:09 +0000
From:   Anson Huang <anson.huang@nxp.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the thermal tree
Thread-Topic: linux-next: build failure after merge of the thermal tree
Thread-Index: AQHV8SIVUy0QqJ+frECuKuIId0lrZag2gAEAgAAAN0A=
Date:   Tue, 3 Mar 2020 07:57:09 +0000
Message-ID: <DB3PR0402MB391635FF1AFBAA8553978A0EF5E40@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <20200303170743.44d4c271@canb.auug.org.au>
 <6cfd2958-dc6c-e9c5-af62-592d7706da6a@linaro.org>
In-Reply-To: <6cfd2958-dc6c-e9c5-af62-592d7706da6a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=anson.huang@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: afb53bdf-3095-4a56-0a22-08d7bf4879e0
x-ms-traffictypediagnostic: DB3PR0402MB3884:
x-microsoft-antispam-prvs: <DB3PR0402MB3884BD23E89F063C48C033B1F5E40@DB3PR0402MB3884.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(189003)(199004)(76116006)(8676002)(81166006)(81156014)(4326008)(44832011)(7696005)(5660300002)(26005)(86362001)(55016002)(316002)(186003)(2906002)(71200400001)(478600001)(66446008)(66556008)(64756008)(53546011)(6506007)(33656002)(66476007)(52536014)(9686003)(66946007)(110136005)(8936002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB3PR0402MB3884;H:DB3PR0402MB3916.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d4oHDjHq5yqPatE/LuK5Falymt5YFnkjnyv6ZZd3ElZKEUMFMp+vZv5P/BTzGYtxbbQhCqt7HSc3fYtXwoBM0/m6GMwsr6uUAG21HvOpwrzzNOnxHyQrESW6W385MpwG3r4zfaEeni5HkJ07C5yHaOlBr2e7DJvocjqFy/x7hJ0+cnKwC1aqjrBpGCADgAHX9O02J+aDt8l5TnsNr/7sV5bwwEU8AlSADiUAMdVs3fswK1dkUH/1svTdPBp6iVTKLs2UqF0fSQiC8xIDElQ6YBcFGUBqpYcn1nMfKYec0IsNcl0pvVNIfhCFsHAEIaeqXCiqdAZYwJtwABIOHORoPVuYDHRPrEIklM4ShP9Zv5++TTeM049fEoDHwKTxx2rXq+6sMjp9w3EwD1raeh/ggmSsn/5lAXqiIVht5PCUVS+O9hRExriN1fScFHAUifMFXx8gSPu+KQF//EEfkY2WFrvHlIs9F7lI6pap4U/bLmLvMytfuH4vYNCAstIVS++YyngW7N80KCVjN+R8KcEaVg==
x-ms-exchange-antispam-messagedata: a52upu+KPdSaB7sfiKSXwCDU4pLiM6xj5PkZnrbIOL+uw2LzWd8bjNnwcX5gCTDb/4s3qpd+zSdHIie/ZG6Rs27MrKgM5lntQS/tW9U3Inz/SJ94Ap/2J25Ev3TOoLE33Y0rvXkFQGp6XpdBtPfT5w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb53bdf-3095-4a56-0a22-08d7bf4879e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 07:57:09.8541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YoUpTX+N1IGeaZXeqA0xkZ8H3d4zgJgVyDRguJL806eSFeQgrGygZeTJn9S1l5EbLUHBkQs9E3psYy8Qu/QggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3884
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGksIERhbmllbA0KDQo+IFN1YmplY3Q6IFJlOiBsaW51eC1uZXh0OiBidWlsZCBmYWlsdXJlIGFm
dGVyIG1lcmdlIG9mIHRoZSB0aGVybWFsIHRyZWUNCj4gDQo+IA0KPiBIaSBBbnNvbiwNCj4gDQo+
IGNvdWxkIGJlIHBsZWFzZSBmaXggdGhvc2UgdHdvIGVycm9ycyAodGhpcyBvbmUgYW5kIHRoZQ0K
PiB0aGVybWFsX3pvbmVfb2ZfZ2V0X3NlbnNvcl9pZCkNCg0KDQpTdXJlLCBJIHdpbGwgZml4IHRo
ZW0gYW5kIHNlbmQgb3V0IHBhdGNoIGZvciByZXZpZXcuDQoNClRoYW5rcywNCkFuc29uDQoNCj4g
DQo+IFRoYW5rcw0KPiANCj4gICAtLSBEYW5pZWwNCj4gDQo+IE9uIDAzLzAzLzIwMjAgMDc6MDcs
IFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+ID4gSGkgYWxsLA0KPiA+DQo+ID4gQWZ0ZXIgbWVy
Z2luZyB0aGUgdGhlcm1hbCB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHBvd2VycGMN
Cj4gPiBhbGx5ZXNjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6DQo+ID4NCj4gPiBsZDogZHJpdmVy
cy90aGVybWFsL2lteF9zY190aGVybWFsLm86IGluIGZ1bmN0aW9uDQo+IGAuaW14X3NjX3RoZXJt
YWxfZ2V0X3RlbXAnOg0KPiA+IGlteF9zY190aGVybWFsLmM6KC50ZXh0LmlteF9zY190aGVybWFs
X2dldF90ZW1wKzB4NjgpOiB1bmRlZmluZWQNCj4gcmVmZXJlbmNlIHRvIGAuaW14X3NjdV9jYWxs
X3JwYycNCj4gPiBsZDogZHJpdmVycy90aGVybWFsL2lteF9zY190aGVybWFsLm86IGluIGZ1bmN0
aW9uIGAuaW14X3NjX3RoZXJtYWxfcHJvYmUnOg0KPiA+IGlteF9zY190aGVybWFsLmM6KC50ZXh0
LmlteF9zY190aGVybWFsX3Byb2JlKzB4MzApOiB1bmRlZmluZWQNCj4gcmVmZXJlbmNlIHRvIGAu
aW14X3NjdV9nZXRfaGFuZGxlJw0KPiA+DQo+ID4gQ2F1c2VkIGJ5IGNvbW1pdA0KPiA+DQo+ID4g
ICBlZDA4NDM2MzNmZWUgKCJ0aGVybWFsOiBpbXhfc2M6IGFkZCBpLk1YIHN5c3RlbSBjb250cm9s
bGVyIHRoZXJtYWwNCj4gPiBzdXBwb3J0IikNCj4gPg0KPiA+IEkgaGF2ZSBhZGRlZCB0aGUgZm9s
bG93aW5nIHBhdGNoIGZvciB0b2RheS4NCj4gPg0KPiA+IEZyb206IFN0ZXBoZW4gUm90aHdlbGwg
PHNmckBjYW5iLmF1dWcub3JnLmF1Pg0KPiA+IERhdGU6IFR1ZSwgMyBNYXIgMjAyMCAxNjo1Mjo0
OSArMTEwMA0KPiA+IFN1YmplY3Q6IFtQQVRDSF0gdGhlcm1hbDogaW14X3NjOiByZW1vdmUgQ09N
UElMRV9URVNUIGZyb20NCj4gPiBJTVhfU0NfVEhFUk1BTA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvdGhlcm1hbC9LY29uZmlnIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3RoZXJtYWwvS2NvbmZpZyBiL2RyaXZlcnMvdGhlcm1hbC9LY29uZmlnIGluZGV4DQo+ID4gNDc4
ZWRhNzk1MjBkLi5mM2Y3MDUwM2RmMDQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy90aGVybWFs
L0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL3RoZXJtYWwvS2NvbmZpZw0KPiA+IEBAIC0yNTQs
NyArMjU0LDcgQEAgY29uZmlnIElNWF9USEVSTUFMDQo+ID4NCj4gPiAgY29uZmlnIElNWF9TQ19U
SEVSTUFMDQo+ID4gIAl0cmlzdGF0ZSAiVGVtcGVyYXR1cmUgc2Vuc29yIGRyaXZlciBmb3IgTlhQ
IGkuTVggU29DcyB3aXRoIFN5c3RlbQ0KPiBDb250cm9sbGVyIg0KPiA+IC0JZGVwZW5kcyBvbiBJ
TVhfU0NVIHx8IENPTVBJTEVfVEVTVA0KPiA+ICsJZGVwZW5kcyBvbiBJTVhfU0NVDQo+ID4gIAlk
ZXBlbmRzIG9uIE9GDQo+ID4gIAloZWxwDQo+ID4gIAkgIFN1cHBvcnQgZm9yIFRlbXBlcmF0dXJl
IE1vbml0b3IgKFRFTVBNT04pIGZvdW5kIG9uIE5YUCBpLk1YDQo+IFNvQ3MNCj4gPiB3aXRoDQo+
ID4NCj4gDQo+IA0KPiAtLQ0KPiAgPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29Dcw0KPiANCj4gRm9sbG93IExpbmFy
bzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwNCj4g
PGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfCA8aHR0cDovL3d3dy5s
aW5hcm8ub3JnL2xpbmFyby0NCj4gYmxvZy8+IEJsb2cNCj4gDQoNCg==
