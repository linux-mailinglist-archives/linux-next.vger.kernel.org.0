Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCF41B02D7
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 09:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDTHXh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 03:23:37 -0400
Received: from mail-eopbgr70087.outbound.protection.outlook.com ([40.107.7.87]:32294
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725865AbgDTHXg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 03:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/WqE41KH6c5B8k1HoutE/LizxHg2HQ2Iasn6qFbnfY=;
 b=w+HDDY0VD5uy9ZFtLRhVnskYnZExyG0wHumm+Vdy/GzwIQI8fBmR/teygUBcfEPAYhjOOLvLZV6QdO/wYPkQRH0tdU/FitYT+ByuffkZ9ZeTsWEssWvpPZpfdMZTaEXjPMZ4jTt6wQIeQ5arW1ZRTl5jm2mSUr6dKl4HcCRdabE=
Received: from DB8PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:100::26)
 by HE1PR0801MB1802.eurprd08.prod.outlook.com (2603:10a6:3:88::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 07:23:31 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::10) by DB8PR06CA0013.outlook.office365.com
 (2603:10a6:10:100::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Mon, 20 Apr 2020 07:23:31 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Mon, 20 Apr 2020 07:23:31 +0000
Received: ("Tessian outbound ecb846ece464:v53"); Mon, 20 Apr 2020 07:23:31 +0000
X-CR-MTA-TID: 64aa7808
Received: from 820c5e14a562.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0273C539-8494-4BEF-8A80-54DF31A4208C.1;
        Mon, 20 Apr 2020 07:23:26 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 820c5e14a562.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Apr 2020 07:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0w8ebpFudRBTaMSr7f/zr3yUKPDvCGUqNziqBYcfabhWQN+hDwqGmdKOZ6Yq1Gn8s5MPSQR8K8ryWhHI1Pp9UcNq3OTbTHvfR5yvaELPSTRLwYj5d/5H8lrKbJvfTNIfR4LDYGOb3RguIQ3CO2EkGDv2EpWrhkQK11a8KcxL/DoW4SP+fKOJ4jKzIf0G+gvmHffaZlrO4cj754WhNMV5z5o23lvO1m+5wJRUjkxox8xUYu9oeKEDUA/jHslTtmMcTsHb/3WpRube5Fwb46nUPM8QIF0BqjdKJC9CVxqiEgtml1CYHB9onBg+6Zl+7Q22/1ZR5Z1GDETlr4TfVmVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/WqE41KH6c5B8k1HoutE/LizxHg2HQ2Iasn6qFbnfY=;
 b=CqiXjxegg51znzHJ0/eOaxO28Ul/ehH7litLoajTM7u1P8QhuC34VDjy6xBcHMWGug9JLjHDP5VbdxL/X4xa7D9vVlyoQKU3a4tW4hGrdOdC/NjBCa+2oHzgj4iUinlY9RQ7k3TGIjjWRkRlF3+dT+HnNV2pT7qM/NCy9OA1HGoWgVC6b/ICA7mjkg1T6Rp6SS3QH44WJmrr+4EQM18mbwYtovag5B0wlL9ZZ/JyeZk8qQ8QP1Q7CiITps/HvX/t0D75b2N8neSvP/PumkL4+yBVg0y/az1dkdI2Qp/gZTJAdpEj1j+TvLuVbN/kAUXLbeesOslvinwT6Cpx0WP3iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/WqE41KH6c5B8k1HoutE/LizxHg2HQ2Iasn6qFbnfY=;
 b=w+HDDY0VD5uy9ZFtLRhVnskYnZExyG0wHumm+Vdy/GzwIQI8fBmR/teygUBcfEPAYhjOOLvLZV6QdO/wYPkQRH0tdU/FitYT+ByuffkZ9ZeTsWEssWvpPZpfdMZTaEXjPMZ4jTt6wQIeQ5arW1ZRTl5jm2mSUr6dKl4HcCRdabE=
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com (2603:10a6:4:a0::12)
 by DB6PR0802MB2341.eurprd08.prod.outlook.com (2603:10a6:4:89::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Mon, 20 Apr
 2020 07:23:19 +0000
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117]) by DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117%8]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 07:23:18 +0000
From:   Hadar Gat <Hadar.Gat@arm.com>
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Ofir Drang <Ofir.Drang@arm.com>, nd <nd@arm.com>
Subject: RE: linux-next: Tree for Apr 20
Thread-Topic: linux-next: Tree for Apr 20
Thread-Index: AQHWFuNS9+RR8x68TUSSGfeRxMWUdaiBmeQA
Date:   Mon, 20 Apr 2020 07:23:18 +0000
Message-ID: <DB6PR0802MB2533E416D358177D5CA53564E9D40@DB6PR0802MB2533.eurprd08.prod.outlook.com>
References: <20200420142610.390e5922@canb.auug.org.au>
 <2d87a4f9-9d87-e929-9b03-31f92dad5ca6@de.ibm.com>
In-Reply-To: <2d87a4f9-9d87-e929-9b03-31f92dad5ca6@de.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 3d413c7a-6486-4827-93bc-e4746ee82d4d.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
x-originating-ip: [84.109.179.203]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e7133ee-0ef8-441d-4729-08d7e4fbbab3
x-ms-traffictypediagnostic: DB6PR0802MB2341:|DB6PR0802MB2341:|HE1PR0801MB1802:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1802CD7BC079C8BD6AFF97ACE9D40@HE1PR0801MB1802.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 03793408BA
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0802MB2533.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(316002)(33656002)(2906002)(478600001)(81156014)(8676002)(8936002)(110136005)(5660300002)(6506007)(186003)(53546011)(86362001)(9686003)(66946007)(26005)(54906003)(71200400001)(4326008)(66446008)(64756008)(66556008)(66476007)(76116006)(966005)(55016002)(52536014)(7696005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DR8So4v4QSnPK7y5FEY3fFwUd/Wck7BciXqtJBx5MrNjeP5dO3xbIW9UrFBUXazNOaBBiFoNHRTrpKt1hJ1KY5oY87CMPbYrvTemzPhCWrcgBH/P45kYaP0O1UTALZqvOc16ZH9Bwv4uktqNwVuk6bMjh0EGo2h8QtWWhVURlGHz+61E0tbGBtN9dw4JjTx/nfhsvNgBkjBq8YLjEezgjiGvJ0qp1saUynjX+lv+HrzBc5qowqNmQcQAKMQ3KIePOpK3dq1sUu+KtNt8X/idmobFskt2yZRFK8+hHawtkhdx2NVaTne+R0g7yhVxXIs82uI4SaCaUrtF4iAXmDUBbC63Yz2Zco6+kwjetMcR17/AkMLo/AX+bwqD+0qGYAAy7TMPUDC31KKETsd7/vpr+BTVaqyHCMXcHGPvleWiw9OwZUsaHvAV0ViPQJkXUKeYfZXGeuKvzvwLjBX+6VjTc+es5bzu3PatKXy3nuV4onnSsNdsp0TmbIvndNelUogYDy1sfMCjEjGJWNcVgNg4lg==
x-ms-exchange-antispam-messagedata: kHce+jB7a47oXxtwhzCkHGB5E7jVkLVbx6yTRqqg8npfoGyd9RnDNP/ckfgEUpJkgCcahYWVf6Jey+igQ2PxJiNYI7jxkVqiu3O+sv1MUobiXCGIjACuJSvRKSMSqsoobUgYa4GyIX6LndTguHb6dg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2341
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(966005)(5660300002)(9686003)(33656002)(82740400003)(186003)(4326008)(450100002)(2906002)(7696005)(26005)(6506007)(53546011)(81156014)(316002)(55016002)(336012)(70206006)(8676002)(86362001)(70586007)(110136005)(81166007)(52536014)(356005)(8936002)(47076004)(478600001)(54906003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 14e7ff30-3499-4308-4857-08d7e4fbb323
X-Forefront-PRVS: 03793408BA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npfvFyeBMjDRDPMs3Zrg60FnPQrCsP/mgEfC6593qlyP3qm7zbMapmZqQxAvAe0iRvcT62qHVIDxNe1ofOY2VGb5cZdeINl3mphs08A/CUcA+asNHfTbDvLEShdn3BJHnXtyv3YO4YR62UlHCwL+PhyiqvwK6r3G7EyqqBIOCZYtbNrhxcozPuMuRTvT4Qzq1PUHyd0U0k89MmhU2JBygQUrrviYEUQQNqwAcsQly74OrGIVsxN2YhZwPKVUEDWxl9nR++v+C7P7VMH3NEQ4kJ6xx569XMtsS0XKrAYumwcwoOq2S6g1i+2qzR/tdPzFmfCbW3PEY4DYxW0ycDKh6QZr0oufWrewh64R9rvkKcB0hQqX1rm9J0UjSpqGdx1IKCYx/hZHxr1NeYAMxKq3/WzNDc+yPrMudVLJNnQHFMdMFzM38uwMFWWxSIEk21R9zeQPf8glUpDtc4dd7PUlsH3agnLF16I174TMLxMTjyu0JC6A6/+SzGbJmTUj6EjVMYxNraaRaluif7H1+3CN2GNl9H+UTQKb9wKw5wxLcZNCQmo9eRyit5VO0Rbw9T8L52UT5p0C1Kie33YdJyu+Hg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2020 07:23:31.6350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7133ee-0ef8-441d-4729-08d7e4fbbab3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1802
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQo+IE9uIDIwLjA0LjIwIDA2OjI2LCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0KPiA+IEhpIGFs
bCwNCj4gPg0KPiA+IENoYW5nZXMgc2luY2UgMjAyMDA0MTc6DQo+ID4NCj4gPiBNeSBmaXhlcyB0
cmVlIGlzIGVtcHR5IGFnYWluLg0KPiA+DQo+ID4gVGhlIHFjb20gdHJlZSBzdGlsbCBoYWQgaXRz
IGJ1aWxkIGZhaWx1cmUgZm9yIHdoaWNoIEkgcmV2ZXJ0ZWQgYSBjb21taXQuDQo+ID4NCj4gPiBU
aGUgY3J5cHRvIHRyZWUgc3RpbGwgaGFzIGl0cyBidWlsZCBmYWlsdXJlIGZvciB3aGljaCBJIHJl
dmVydGVkIDUgY29tbWl0cy4NCj4gPg0KPiA+IFRoZSBkcm0tbWlzYyB0cmVlIGdhaW5lZCBhIGJ1
aWxkIGZhaWx1cmUgZm9yIHdoaWNoIEkgZGlzYWJsZWQgYQ0KPiA+IENPTVBJTEVfVEVTVCBzZXR0
aW5nLg0KPiA+DQo+ID4gVGhlIHNvdW5kLWFzb2MgdHJlZSBzdGlsbCBoYXMgaXRzIGJ1aWxkIGZh
aWx1cmVzIHNvIEkgdXNlZCB0aGUgdmVyc2lvbg0KPiA+IGZyb20gbmV4dC0yMDIwMDQxNC4NCj4g
Pg0KPiA+IFRoZSBpcG1pIHRyZWUgZ2FpbmVkIGEgYnVpbGQgZmFpbHVyZSBmb3Igd2hpY2ggSSBh
cHBsaWVkIGEgcGF0Y2guDQo+ID4NCj4gPiBOb24tbWVyZ2UgY29tbWl0cyAocmVsYXRpdmUgdG8g
TGludXMnIHRyZWUpOiAyNzMyDQo+ID4gIDM1NDQgZmlsZXMgY2hhbmdlZCwgNzY1MTUgaW5zZXJ0
aW9ucygrKSwgMzcyNzEgZGVsZXRpb25zKC0pDQo+IA0KPiBzMzkwIGRlZmNvbmZpZyBzdGlsbCBk
b2VzIG5vdCBjb21waWxlLiBXaGlsZSB0aGUgbWVkaWEga2NvbmZpZyBwcm9ibGVtIGlzDQo+IGdv
bmUgSSBub3cgaGF2ZQ0KPiANCj4gICBDQyBbTV0gIGRyaXZlcnMvY2hhci9od19yYW5kb20vY2N0
cm5nLm8NCj4gZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9jY3RybmcuYzogSW4gZnVuY3Rpb24g4oCY
Y2NfdHJuZ19jb21wd29ya19oYW5kbGVy4oCZOg0KPiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL2Nj
dHJuZy5jOjMzNDo0OTogZXJyb3I6IOKAmGZpcHNfZW5hYmxlZOKAmSB1bmRlY2xhcmVkDQo+IChm
aXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJh2ZHNvX2VuYWJsZWTi
gJk/DQo+ICAgMzM0IHwgIGlmIChDQ19SRUdfRkxEX0dFVChSTkdfSVNSLCBDUk5HVF9FUlIsIGlz
cikgJiYgZmlwc19lbmFibGVkKSB7DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+DQo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmRzb19lbmFibGVkDQo+IGRy
aXZlcnMvY2hhci9od19yYW5kb20vY2N0cm5nLmM6MzM0OjQ5OiBub3RlOiBlYWNoIHVuZGVjbGFy
ZWQgaWRlbnRpZmllciBpcw0KPiByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24g
aXQgYXBwZWFycyBpbg0KPiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL2NjdHJuZy5jOjMzNTozOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YNCj4gZnVuY3Rpb24g4oCYZmlwc19mYWlsX25v
dGlmeeKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4gICAzMzUg
fCAgIGZpcHNfZmFpbF9ub3RpZnkoKTsNCj4gICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+fn4NCj4g
Y2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQo+IA0KPiBDYW4gd2Ug
bWF5YmUgbWFrZSB0aGlzIGRyaXZlciBkZXBlbmQgb24gQVJNPw0KDQpIaSwNClRoaXMgY29tcGls
YXRpb24gaXNzdWUgaXMgYWxyZWFkeSBmaXhlZC4NCkl0IHdhcyBwdXNoZWQgZmV3IGRheXMgYWdv
IGFuZCBpcyB3YWl0aW5nIHRvIGJlIGFwcGxpZWQuDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1jcnlwdG8vMDk2ZGI3NjktYTUwOC1iMGZhLWYwMTgtMmM0YzgwNzA2MWNiQGluZnJhZGVh
ZC5vcmcvDQpUaGFua3MsDQpIYWRhcg0KDQo=
