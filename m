Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37828A594E
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 16:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbfIBO0p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 10:26:45 -0400
Received: from mail-eopbgr810053.outbound.protection.outlook.com ([40.107.81.53]:22464
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726421AbfIBO0o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 10:26:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dQElvjnRBNBFz1E5xHAKqcDsVgReskpQa6+2XkfHsQ/m9zGoGjdAO3iOkPkulzt+AHZtXp5T/Jmn4+apQDlbbB6p9cd5z9DpQtK7HwiMGJGpAJv+gobHTxaip3ljtaOsR8L8h3R0gvIyN/yRl8kajwjIRrgOWajyxB/2HJZaU0fILnvstRV5AVizbDF9Y78ZldSMoxMob2kw9773vCMOqkCYP7nYAC6UTD4Vng8mxd1J2CRdm/+02rIIO3c1m/yxf/P758LEBLs6tLpdP1XLAMMp3wGjNXzOe0Qt+bE5vKUoK6yTkbhQsD8F03jWS+lCg2f2t6mPdyQw3YMUokEMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNiWqyNTQSc9qbhHNndOmMVbXooFxKEp/2Pxv9EfT48=;
 b=IS6YBDJKAB3Z8IqkJR6ab96PKykzNmcZGpRRHMlyznhMm931V6wjyFYPSy1ietF1931NNuogzKQYRGgwkojZeBsyNhWAyVT9bYc+RNpQHxKkAOQf2jmX1OEE59tQF0ip24dVk5cpU2B86CHeC/6fj/HwwblETSiFwyiW0z7w+EIHqjlwpdpfhjXbhPXlHOWtdSKbsE2g/sUiZaCixlYU/YlBJpvij6AdIlh9M+Qps8xTgzrKOUoh6IFE/Jl1Amn21WjD0Ph9nA5rcDnlLhrxILHhsl6z327PpMJx9rq0tA+wO+FeCOLkTUMXKQV0izulQzDWXeWyZSBZjpQs2Lyoeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNiWqyNTQSc9qbhHNndOmMVbXooFxKEp/2Pxv9EfT48=;
 b=v4rH/Jvm9insoB5wfLxIk2/qqYcY8T111GfXVVF23LGuxgFNJD+x3cvFdVt1k8bJ9RI7hiyw6Ismw1iKVxIGodyhTEoD5Frv9/vOhn9HE/m+KO+NDQAnWoHzG+RXJHzMxjbBhs90NJKvtHsShcLAXprc8w3wCwg/QKwqUxV64JA=
Received: from DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) by
 DM6PR12MB3018.namprd12.prod.outlook.com (20.178.30.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Mon, 2 Sep 2019 14:26:40 +0000
Received: from DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::585:2d27:6e06:f9b0]) by DM6PR12MB3163.namprd12.prod.outlook.com
 ([fe80::585:2d27:6e06:f9b0%7]) with mapi id 15.20.2220.013; Mon, 2 Sep 2019
 14:26:40 +0000
From:   "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
To:     Joerg Roedel <joro@8bytes.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iommu tree
Thread-Topic: linux-next: build failure after merge of the iommu tree
Thread-Index: AQHVYVk9gFdkSFpRjUiq0ufK4uRoKacYa8eAgAAGYYA=
Date:   Mon, 2 Sep 2019 14:26:40 +0000
Message-ID: <d2493e6b-08fa-9ea8-a0a4-076def54e91b@amd.com>
References: <20190902163951.6280e030@canb.auug.org.au>
 <20190902140347.GA23482@8bytes.org>
In-Reply-To: <20190902140347.GA23482@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR16CA0058.namprd16.prod.outlook.com
 (2603:10b6:805:ca::35) To DM6PR12MB3163.namprd12.prod.outlook.com
 (2603:10b6:5:182::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Thomas.Lendacky@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [67.79.209.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bf16322-5ada-4313-2803-08d72fb19204
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM6PR12MB3018;
x-ms-traffictypediagnostic: DM6PR12MB3018:
x-microsoft-antispam-prvs: <DM6PR12MB301824120256C135425768CAECBE0@DM6PR12MB3018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(199004)(189003)(7736002)(5660300002)(486006)(446003)(305945005)(11346002)(6486002)(52116002)(476003)(2616005)(31696002)(6512007)(8936002)(14454004)(36756003)(86362001)(2906002)(64756008)(66556008)(66476007)(26005)(66446008)(66946007)(102836004)(4326008)(66066001)(186003)(386003)(6506007)(53546011)(99286004)(53936002)(316002)(6246003)(54906003)(25786009)(478600001)(31686004)(110136005)(76176011)(71200400001)(256004)(8676002)(6436002)(71190400001)(81166006)(81156014)(3846002)(6116002)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB3018;H:DM6PR12MB3163.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qJjBKsJMIGLcHYyr/PYysO8/4nfd0UlDb9i0cqZIC0xBX9qEYpAYY9SmHa70wwRkuBIUARYargGWFlbva0+SOc/tU00ysIFiuB4QBAUdQuP/pfjoCNSDx9c5646RGCLuNpdZD77JOdk/PHLAtyHZ8Uhq+2MFXD+U878VceZJyw07mOE6NcqEDVPHR2a5fLS1jaZfa/PlZlsQ1Zx5TNjb3qJGXSMvsaKW1nmg1h1cXn1So2EZtkgnBFkeRURyRLrt2W9J5EVmGObrjQWOs6MLCLOrLG26Xlaqw3mnZ0f7rkyqjyvCK+j4HrkLIeIRaWIXTclZotsO6kCZdg6znjfTEYPnGQ3nlSmJ/aNDseAkoBbCGZ2buVcwjFtAcxHrxxUICK78SvdAq4lQTfbp6WWEFJnK/yBMK0IDE9creRJEASQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <21981F0C1AD5194EB5F262676984B550@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf16322-5ada-4313-2803-08d72fb19204
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 14:26:40.3516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wIaP9/pScrIWBTTT2ppkPB3vs8RHetgguLxd6KvMExIuLgei/DEhiIaU8TZ662Dzpb+GDcaMrYsAlChCjOjc0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3018
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gOS8yLzE5IDk6MDMgQU0sIEpvZXJnIFJvZWRlbCB3cm90ZToNCj4gSGksDQo+IA0KPiB0bDtk
cjogQW5kIElPTU1VIGNvbW1pdCBpbnRyb2R1Y2VzIGEgbmV3IHVzZXIgZm9yIHNtZV9hY3RpdmUo
KSBpbg0KPiAgICAgICAgIGdlbmVyaWMgY29kZSwgYW5kIGNvbW1pdA0KPiANCj4gICAgICAgICAJ
Mjg0ZTIxZmFiMmNmIHg4NiwgczM5MC9tbTogTW92ZSBzbWVfYWN0aXZlKCkgYW5kIHNtZV9tZV9t
YXNrIHRvIHg4Ni1zcGVjaWZpYyBoZWFkZXINCj4gDQo+ICAgICAgICAgYnJlYWtzIHRoZSBidWls
ZCBvZiBkcml2ZXJzL2lvbW11LyBmb3IgYWxsIGFyY2hpdGVjdHVyZXMgbm90DQo+ICAgICAgICAg
aW1wbGVtZW50aW5nIHNtZV9hY3RpdmUoKS4NCj4gDQo+IE9uIE1vbiwgU2VwIDAyLCAyMDE5IGF0
IDA0OjM5OjUxUE0gKzEwMDAsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+PiBkcml2ZXJzL2lv
bW11L2lvbW11LmM6IEluIGZ1bmN0aW9uICdpb21tdV9zdWJzeXNfaW5pdCc6DQo+PiBkcml2ZXJz
L2lvbW11L2lvbW11LmM6MTIzOjM4OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24gJ3NtZV9hY3RpdmUnOyBkaWQgeW91IG1lYW4gJ2NwdV9hY3RpdmUnPyBbLVdlcnJvcj1p
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4+ICAgIDEyMyB8ICAgaWYgKGlvbW11X2Rl
ZmF1bHRfcGFzc3Rocm91Z2goKSAmJiBzbWVfYWN0aXZlKCkpIHsNCg0KTWF5YmUgd2Ugc2hvdWxk
IG1ha2UgdGhpcyBtZW1fZW5jcnlwdF9hY3RpdmUoKSwgc2luY2UgdGhpcyB3aWxsIHByb2JhYmx5
DQpiZSBuZWVkZWQgaWYvd2hlbiBhbiBJT01NVSBkZXZpY2UgaXMgZXZlbnR1YWxseSBhZGRlZCB0
byBhIGd1ZXN0LCBhbmQgdGhlDQpyZWZlcmVuY2VkIGNvbW1pdCBiZWxvdyBkb2Vzbid0IHJlbW92
ZSB0aGF0IGNhbGwuDQoNClRoYW5rcywNClRvbQ0KDQo+PiAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fg0KPj4gICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9hY3RpdmUNCj4+DQo+PiBDYXVzZWQgYnkg
Y29tbWl0DQo+Pg0KPj4gICAgMmNjMTNiYjRmNTlmICgiaW9tbXU6IERpc2FibGUgcGFzc3Rocm91
Z2ggbW9kZSB3aGVuIFNNRSBpcyBhY3RpdmUiKQ0KPiANCj4gDQo+IEFjdHVhbGx5IGl0IGlzIGNh
dXNlZCBieToNCj4gDQo+IAljb21taXQgMjg0ZTIxZmFiMmNmY2Y5MGRhY2NlNTY1ZTBiMTJmMjll
NWRmMDBjMQ0KPiAJQXV0aG9yOiBUaGlhZ28gSnVuZyBCYXVlcm1hbm4gPGJhdWVybWFuQGxpbnV4
LmlibS5jb20+DQo+IAlEYXRlOiAgIFR1ZSBBdWcgNiAwMTo0OToxNyAyMDE5IC0wMzAwDQo+IA0K
PiAJICAgIHg4NiwgczM5MC9tbTogTW92ZSBzbWVfYWN0aXZlKCkgYW5kIHNtZV9tZV9tYXNrIHRv
IHg4Ni1zcGVjaWZpYyBoZWFkZXINCj4gDQo+IHdoaWNoIHJlbW92ZXMgdGhlIHNtZV9hY3RpdmUg
cHJvdG90eXBlIGZyb20gdGhlIGdlbmVyaWMgaGVhZGVycy4gVGhlDQo+IGlvbW11IGNvbW1pdCBp
cyBpbiBuZXh0IGFscmVhZHkgZm9yIGEgY291cGxlIG9mIGRheXMgYW5kIGRpZG4ndCBjYXVzZQ0K
PiBwcm9ibGVtcyBiZWZvcmUuDQo+IA0KPj4gc21lX2FjdGl2ZSgpIHNlZW1zIHRvIGJlIG9ubHkg
cmVsZXZhbnQgdG8gWDg2Lg0KPiANCj4gSXQgaGFzIGFuIGltcGxlbWVudGF0aW9uIG9uIHg4NiBh
bmQgczM5MC4NCj4gDQo+PiBJIGhhdmUgcmV2ZXJ0ZWQgdGhhdCBjb21taXQgZm9yIHRvZGF5Lg0K
PiANCj4gVGhhbmtzLCBidXQgSSBzdWdnZXN0IHJldmVydGluZyBhYm92ZSBjb21taXQgaW5zdGVh
ZC4NCj4gDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gCUpvZXJnDQo+IA0K
