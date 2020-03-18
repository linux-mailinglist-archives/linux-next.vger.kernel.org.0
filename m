Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EB9189406
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 03:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgCRCbV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 22:31:21 -0400
Received: from mail-vi1eur05on2079.outbound.protection.outlook.com ([40.107.21.79]:6045
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726478AbgCRCbV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 22:31:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDt1H0ujHlPZUlF/bbCoWYQHu7nGZI4nE99yIH72t0Uza1dMemxk+E18UqhK6RrODHviDGOJSjlbP/Bs6pTOkPLcKn2YEvM9QghLYSBc3IL7EIBzV6TGGRUIkbVKz31xnZ3cSmcwFtJON/UL9PJFuh+kUYWNTnZJue15Rqwgi9m3zmeV4BDMtTQxQbVhBrbZomWJKxZYeEv46dRatHplj3WNuqyWilDSIOO5lxduC8SvI5umdj+1z66xtY6VVO10DkCGV96iNS6IPz8HdJvZ1GIWv5dfXy+5Vb9YaBTSruE5bUp09eKPi7Oyo6iBQMUmIcdFoZ2D0HJ+mY04gc3GGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNjyaZ8kvy5vEnQIA/hNqeM5YhtRN61kTCWYNtIba7w=;
 b=OjIvEYOqMotkCGPF5s5Q0t+O/hk2P3NjlAgPAdWMBrqgkelTZm3cf8D3xX9MTJ1mua9t6dlMkoE/23IHDrktHRruUnCf2EyLWQxa7FoeUVsruZIN+HgghhVbbXZbhk0KmtvhkPsBFGx2C+Gm+mKG8WLv3254ClQMTJNC8jo0Hz2VjRKJ+iY4x+x0UMxBHQ0g8bNHrTQFMfgnTJ/dk0KhMAEgL3l4UcftTCGXkQgZYs8OwdFQsTTmo2WfdfMlJbDTMHKWhjRlMIJjo9vubZ/xohC7RT2g2zK4CS8/qjORzerryjRdTbHEuMFM/xXrY7HkQzfRpV5Ph15jPqe+gggYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNjyaZ8kvy5vEnQIA/hNqeM5YhtRN61kTCWYNtIba7w=;
 b=Va/WbQ0ykzjNwOrcwtsc3OWF+ZTN8NR1t6kEDEItZ4h8IL1KoBJs5raShzsezqJ8m2Rc+9rHcL+OPwBFv6c5Je8ZSpSP8+GbE+PpkoKDiWPxhdWrB3xas3uaDapJI0JR8dSIHsI9/7dyksI+yCWnFtsIr/PcWMDJ3Y69PKSOXTg=
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com (20.177.51.151) by
 VI1PR05MB7118.eurprd05.prod.outlook.com (20.181.34.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.22; Wed, 18 Mar 2020 02:31:18 +0000
Received: from VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::8cea:6c66:19fe:fbc2]) by VI1PR05MB5102.eurprd05.prod.outlook.com
 ([fe80::8cea:6c66:19fe:fbc2%7]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 02:31:18 +0000
From:   Saeed Mahameed <saeedm@mellanox.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        Jason Gunthorpe <jgg@mellanox.com>,
        "dledford@redhat.com" <dledford@redhat.com>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "leon@kernel.org" <leon@kernel.org>
Subject: Re: linux-next: build warning after merge of the mlx5-next tree
Thread-Topic: linux-next: build warning after merge of the mlx5-next tree
Thread-Index: AQHV+yL1tTMEOsS9OkKcAGfcGgwCsqhNnSGAgAAHLwA=
Date:   Wed, 18 Mar 2020 02:31:17 +0000
Message-ID: <a6612dbf3cd0ecdde7c0e4c8d35ebf470e2cf346.camel@mellanox.com>
References: <20200316103913.659d3a5e@canb.auug.org.au>
         <20200318130531.1df149c7@canb.auug.org.au>
In-Reply-To: <20200318130531.1df149c7@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=saeedm@mellanox.com; 
x-originating-ip: [73.15.39.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bed863be-31d9-4b14-fd8e-08d7cae47039
x-ms-traffictypediagnostic: VI1PR05MB7118:|VI1PR05MB7118:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB711871072A0BD54E16D5D717BEF70@VI1PR05MB7118.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:68;
x-forefront-prvs: 03468CBA43
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(199004)(81166006)(8936002)(81156014)(8676002)(966005)(478600001)(2616005)(6512007)(316002)(6506007)(110136005)(54906003)(26005)(186003)(36756003)(2906002)(71200400001)(6486002)(76116006)(86362001)(66556008)(66946007)(66476007)(5660300002)(64756008)(91956017)(66446008)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB7118;H:VI1PR05MB5102.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SVQZhI3Ube1+SIPmq2EnSBSSQMgHIe5xePfEyASrZXL/SJVcQ1VFaxgyWLtiL81bSl2CTchLfBZ8tsVcNqbd//tJCnhdcUfnMinAQMluTLkzoWhVRh5kVMoV8CqxoNNpFqPe0FCeuIdJr6KjthWVKBEFEzrwQqmH7iepE6uUVjxp1m5VWRigBVOWXAXIeZbjvGP0CZHWLHGT56K7uy4ZfbQxpNy10jdzTPsg7YTUQ+RVWiHGyJ5PBHlcrOIBc7Q614gD7y8SfHWaZV5LKciIW6N7oj8DGSjCZPXqkgKcdYIgSd23Cc+c6/lwzjKUtgQ4UP6LoJKSHizrNFmAM+goXCJseXGrXSJlgsiiozkGp/6E2Un6n/rmp0dmUYucveXiW75FxjiFgA8bTHvrCo8BvnKsRKcMoyQY4dE2/B+LbK2hDlZ/4LPy1tvdnDp26rA3wvLrMKRFu/aU2uSNVMyiMNn61NSnpa5JAslz7wy6I+vq54/Qr9UQOJZgU1GkTydfiFDTWMOHmL+Zp6M0ULSEZA==
x-ms-exchange-antispam-messagedata: wiNoECjCEiJU50CsdR8yRzF26w78BwH1Q/9ddgf2u9tdHWHtwLGq/ehJ7KFMPLKZbDyFqi61v95CsSVsn9o9EqctJMu2smkPPVqXlzGFayf4x91miTqjQoyU/33psB4lg5rIN0/Dzf8GTMr+T6F8EA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <682EB244EBD7D84F999645F301E598A5@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed863be-31d9-4b14-fd8e-08d7cae47039
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2020 02:31:17.9028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcJKSQxreWUK6aqyMAj2agKuyGhsFSgt5FVeS8B+efqWXrLXDvBeNr4P2KtfzCdDVSEuktmejXOWeBbr7xw41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB7118
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gV2VkLCAyMDIwLTAzLTE4IGF0IDEzOjA1ICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBPbiBNb24sIDE2IE1hciAyMDIwIDEwOjM5OjEzICsxMTAwIFN0
ZXBoZW4gUm90aHdlbGwgPA0KPiBzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6DQo+ID4gSGkg
YWxsLA0KPiA+IA0KPiA+IEFmdGVyIG1lcmdpbmcgdGhlIG1seDUtbmV4dCB0cmVlLCB0b2RheSdz
IGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NA0KPiA+IGFsbG1vZGNvbmZpZykgcHJvZHVjZWQgdGhp
cyB3YXJuaW5nOg0KPiA+IA0KPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2xpbnV4
L3ByaW50ay5oOjMzMSwNCj4gPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9r
ZXJuZWwuaDoxNSwNCj4gPiAgICAgICAgICAgICAgICAgIGZyb20NCj4gPiBkcml2ZXJzL25ldC9l
dGhlcm5ldC9tZWxsYW5veC9tbHg1L2NvcmUvbXIuYzozMzoNCj4gPiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9tZWxsYW5veC9tbHg1L2NvcmUvbXIuYzogSW4gZnVuY3Rpb24NCj4gPiAnbWx4NV9jb3Jl
X2NyZWF0ZV9ta2V5JzoNCj4gPiBpbmNsdWRlL2xpbnV4L2R5bmFtaWNfZGVidWcuaDoxNTc6MjU6
IHdhcm5pbmc6ICdrZXknIG1heSBiZSB1c2VkDQo+ID4gdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1
bmN0aW9uIFstV21heWJlLXVuaW5pdGlhbGl6ZWRdDQo+ID4gICAxNTcgfCAgX2R5bmFtaWNfZnVu
Y19jYWxsKGZtdCxfX2R5bmFtaWNfZGV2X2RiZywgICBcDQo+ID4gICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPiA+IGRyaXZlcnMvbmV0L2V0aGVybmV0
L21lbGxhbm94L21seDUvY29yZS9tci5jOjQ3OjU6IG5vdGU6ICdrZXknIHdhcw0KPiA+IGRlY2xh
cmVkIGhlcmUNCj4gPiAgICA0NyB8ICB1OCBrZXk7DQo+ID4gICAgICAgfCAgICAgXn5+DQo+ID4g
DQo+ID4gUHJvYmFibHkgaW50cm9kdWNlZCBieSBjb21taXQNCj4gPiANCj4gPiAgIGZjNmE5Zjg2
ZjA4YSAoIntJQixuZXR9L21seDU6IEFzc2lnbiBta2V5IHZhcmlhbnQgaW4gbWx4NV9pYg0KPiA+
IG9ubHkiKQ0KPiANCj4gVGhpcyB3YXJuaW5nIG5vdyBhcHBlYXJzIGluIHRoZSByZG1hIHRyZWUu
DQo+IA0KDQp0aGFua3MgU3RlcGhlbiwNCg0KYWN0dWFsbCBhIGZpeCBwYXRjaCB3YXMgbWVyZ2Vk
IHllc3RlcmRheSBpbnRvIG1seDUtbmV4dCBbMV0NCg0KYW5kIHNob3VsZCBhbHJlYWR5IGJlIGlu
IGxpbnV4LW5leHQgYnVpbGQsIGFuZCB3aWxsIHNvb24gbGFuZCBpbiByZG1hDQp0cmVlLg0KDQpU
aGFua3MsDQpTYWVlZC4NCg0KWzFdIA0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbWVsbGFub3gvbGludXguZ2l0L2NvbW1pdC8/aD1tbHg1LW5leHQmaWQ9
ODI2MDk2ZDg0ZjUwOWQ5NWVlOGY3MjcyOGZlMTljNDRmYmI5ZGY2Yg0K
