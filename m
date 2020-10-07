Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943EB2857E7
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 06:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgJGEsK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Oct 2020 00:48:10 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57991 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJGEsJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2020 00:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1602046148; x=1633582148;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AV5+UWCDdEVN67bilXzN25R/1kLGmwX8fKlA8NLwVtw=;
  b=HsnopH6p3S0H1V41H4W7leEXGR5Nm6NbyoYSTLiDR6BDiYkAuGfzP6x0
   28ovkC01FFckjvAF8PFHUo7KVeBX+kMHN5E+hTio2kSsNgJhLRzVOt0GN
   E3AjH0fSOzy3nHfgqY+jv8OcUWROIw51kSzmTGNgQgeUZsdbV9ksGoX8E
   jkq/d/ywo8CIMjvxMRuS4eCrBS9znoP1klWDYRkgfpJ+oVglH7d9/nDbr
   tRuTyjOxhYkG5miwKCtUqPo4xS/y9vZm+df24OAdkXejASWhSpeu1zxaY
   BC1QJ9jv1fa/j8Rk35zcyiJ83QKLKyAl7UhpZRXAB6VSPtYJsYTm0B9oA
   g==;
IronPort-SDR: 373OGYQEZsqzx9Bdrn7t3ZuarMVVb11wqzcvdYWIfBEQgTSdTfmQpGWqu2zUXiE9IwcUXneIH5
 LR9Qt5oSFjTNLIZM1RSNwB/t27l6qLAgjXqMz4SZ0o2lkRBGpcmpvpbD3/fQiI5GkO5oGcWzTK
 huaPUWQZXAqQA0FfAI2V1dVej1+TWWicqvl5jbyoxAuVF5vuZbyCXNxkbIlbdrN8BpP6w2JhHJ
 MterY4Pif2gGYvI5sziFZDDyZydHVSBSGKzeQYHoyXfk6tyfzQZtEq+P9B6ISz8s4iC9f54yIE
 JS4=
X-IronPort-AV: E=Sophos;i="5.77,345,1596470400"; 
   d="scan'208";a="252669330"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
  by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2020 12:49:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcZYVi8HOANojTTibNwnfpf7BsLD2yh/k1KBTUMlgm6wFkSHah7EfKwpJ3iOXplXN3BrGP8vsSGJ7dcj3vbZ+jhPfDoT5pZPBLeza4rczp4+pjNbYx23IfFJU91rc1cPFHkLuCU8Dk05yepacAsSRL1rMxZO36JzFYATeXAe1ABO0J8vppTlCDplfnTP8DSHOaUc7uafPObtzHmmWP10FuzinvEAoX2jhCZeBlzmagttUT3Gm71G98y7It/Y8qek2l6tekET2I9pYWL5Y8KJDmBnudm+pkZ2iTWQ3ISv0v73xVBOHrrq3NFVOs50MyzRjNAFvHxx+DCM1T4U6An5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV5+UWCDdEVN67bilXzN25R/1kLGmwX8fKlA8NLwVtw=;
 b=M60cNCzfmDcnNTuSEiosFB7SdYAbgv8nDGT1JDLxjyYzB4mpv0RS27NDMn5osWXbkVzLJeKX4TsrHOnxSIRVZ0OXIZMUHkZlrV5xTvnJ5MokABwseq4GYxe2yIhDiFiZr1ZcDhRsMNgA5tYz/zx3YC3RlOCsc2+hYB8NhyU9WazSJ3OHqmrZooa1eqbo9t6xkUUmXmUdPiGzGqtBPep1oLCuY5mIAO5cFxH2SxSU7Kbu4mI85x/8GbzweJRRnKIY8i21hQUvddCKFeq2kDSQt01/5DZjz3zFm/a+bcs1pjOmUFqGgKvoHV+5urZ6EN9kjM7vH2w4YiBZKKWa7pM6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV5+UWCDdEVN67bilXzN25R/1kLGmwX8fKlA8NLwVtw=;
 b=eHsZMJw6ajKRYUmWoAvNx6Opd56kZo44DvxEeiZ9awcoZy6zjjSdgdv4CgnfMyAjTr5IavLF1q0/waelbgyIfFb8810jWs5ZKEMkdANiz9dPTr40nNvl+AaxE8QnvYM+u5yLp93xwT56/DpGexEOod48GN6M5pX/hGgJJ2Y2O34=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB3990.namprd04.prod.outlook.com (2603:10b6:a02:ae::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Wed, 7 Oct
 2020 04:48:04 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::f122:ad41:aebe:6785]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::f122:ad41:aebe:6785%3]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 04:48:04 +0000
From:   Atish Patra <Atish.Patra@wdc.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "paul@pwsan.com" <paul@pwsan.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "rppt@linux.ibm.com" <rppt@linux.ibm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Thread-Topic: linux-next: manual merge of the akpm-current tree with the
 risc-v tree
Thread-Index: AQHWm8zzrn4huwEHWkqnYHWvYEDohamLjf+AgAAEegA=
Date:   Wed, 7 Oct 2020 04:48:04 +0000
Message-ID: <944718b60797f69628110db590dd0e6d350fc600.camel@wdc.com>
References: <mhng-2d15c259-f5ff-4bab-92eb-b5f0eb2f4bd6@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-2d15c259-f5ff-4bab-92eb-b5f0eb2f4bd6@palmerdabbelt-glaptop1>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [98.248.240.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ae10f16-1971-479b-dfa4-08d86a7c2daa
x-ms-traffictypediagnostic: BYAPR04MB3990:
x-microsoft-antispam-prvs: <BYAPR04MB39907B5102CEE2DED9FF8559FA0A0@BYAPR04MB3990.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hv7/EBUaz2rko/y6za21ORRLA+diHu6jKVawngaUEHP4WfOAYu+b+WXonT1Yaj5tl40xfrOhx0G2ODxpDLaX9C4JLUhHdYSKU79zs7ZlfLb3apO9EJ3/GVbPP6RKrnzWgbNADJ+BNIevNM755Q374ihBdyKVhNMgHEJWbWyRaIROyxITuSeZftGAz4AcSNkVG5X09rLnMSKGj5dpbAOJu+TlpIHE2Fi8dCAjmDnt1jUzHy/PHs+dZbCXFy8oPfTlF0BlbwPExwFbqKTGuJuvH5jdOSWxCfSWLgEwJ9F/36NK7OVktCed5ZPv9FOkWehA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6724.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(83380400001)(6506007)(4326008)(110136005)(36756003)(54906003)(8676002)(26005)(316002)(71200400001)(8936002)(2906002)(2616005)(186003)(478600001)(86362001)(64756008)(66476007)(66946007)(66446008)(5660300002)(66556008)(76116006)(6512007)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 6DuIoayjddkvEV3eme/XaOpQHddNCyk5s5Lyy7m/lZO/Fh7fb4OpAMvQhW2VKisA6xqcj9bY1ip/xjmnRDGAtoi4tXQL6SWuJNAHD4fWs+ttqjy0UELffk+EMNyzrOCpFhxXeBMc3roQGnz4T4leexFmvbQHnxUSUf6ZYw65tME8lbO5b1quKlA8WYrvjv3m/tss8/Bz0x2/2pCeXYT+Gb9C44QY6UWO8xvs1W01BdVsmuQig/pQErA4sG84eQ8/ePtUl9Th1l+nSO+QVa4qRYa4vdmT2BJnQbAJfQ/2VQY/rgSy2XhPjri1XzWUhxFzJqhb24cM/mmNU39vBso2+r+1pu1I15b3Enq0tSXi9JJw3r0S79UKUH7TWmDTXsmf7+xCyi3F2x/QCR9OVs3FtofV/Lv9vCwW9IkjdHgGV9aAo5iYJOToTmgy8Bz7WK1yzkHUCxzZEqjsDi7RQQLkvU5nAI5DMbZ+eRRePw3imjzeZQhoICK4rKeUmph50j0fKva2FIknwjwf9Sla/jeddCbP/lRTSZ+SLOYg1IAG6Td8U2Xcsh3NQ7lBXo8vP4oAXjmelOLvMpYVgnmcmc1IpnAP8xxcgwFBm0x6vuM6t33S2/FaFBjLsLVvjvNeAfpxwDn5DN7bAVm6IXDCGT5dNg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E882437E7EB0C74F93DF3BCC60DB5A6A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae10f16-1971-479b-dfa4-08d86a7c2daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 04:48:04.5675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKy9hOFYwn52Lw6ae6HwVaM1h2ReSXm2+JvLxmLLbK6ynI618gdbeURrhFw5y7XtWeSiZoHy787NUYcHlj0v5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3990
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVHVlLCAyMDIwLTEwLTA2IGF0IDIxOjMyIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToN
Cj4gT24gVHVlLCAwNiBPY3QgMjAyMCAwMzozOTowNiBQRFQgKC0wNzAwKSwgU3RlcGhlbiBSb3Ro
d2VsbCB3cm90ZToNCj4gPiBIaSBhbGwsDQo+ID4gDQo+ID4gVG9kYXkncyBsaW51eC1uZXh0IG1l
cmdlIG9mIHRoZSBha3BtLWN1cnJlbnQgdHJlZSBnb3QgYSBjb25mbGljdA0KPiA+IGluOg0KPiA+
IA0KPiA+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMNCj4gPiANCj4gPiBiZXR3ZWVuIGNvbW1pdDoN
Cj4gPiANCj4gPiAgIGMyOWMzOGZhMmE4YiAoIlJJU0MtVjogUmVtb3ZlIGFueSBtZW1ibG9jayBy
ZXByZXNlbnRpbmcgdW51c2FibGUNCj4gPiBtZW1vcnkgYXJlYSIpDQo+ID4gDQo+ID4gZnJvbSB0
aGUgcmlzYy12IHRyZWUgYW5kIGNvbW1pdHM6DQo+ID4gDQo+ID4gICAzNTIwZWViNzkxNDIgKCJh
cmNoLCBkcml2ZXJzOiByZXBsYWNlIGZvcl9lYWNoX21lbWJvY2soKSB3aXRoDQo+ID4gZm9yX2Vh
Y2hfbWVtX3JhbmdlKCkiKQ0KPiA+IA0KPiA+IGZyb20gdGhlIGFrcG0tY3VycmVudCB0cmVlLg0K
PiA+IA0KPiA+IEkgZml4ZWQgaXQgdXAgKHNlZSBiZWxvdykgYW5kIGNhbiBjYXJyeSB0aGUgZml4
IGFzIG5lY2Vzc2FyeS4gVGhpcw0KPiA+IGlzIG5vdyBmaXhlZCBhcyBmYXIgYXMgbGludXgtbmV4
dCBpcyBjb25jZXJuZWQsIGJ1dCBhbnkgbm9uIHRyaXZpYWwNCj4gPiBjb25mbGljdHMgc2hvdWxk
IGJlIG1lbnRpb25lZCB0byB5b3VyIHVwc3RyZWFtIG1haW50YWluZXIgd2hlbiB5b3VyDQo+ID4g
dHJlZQ0KPiA+IGlzIHN1Ym1pdHRlZCBmb3IgbWVyZ2luZy4gIFlvdSBtYXkgYWxzbyB3YW50IHRv
IGNvbnNpZGVyDQo+ID4gY29vcGVyYXRpbmcNCj4gPiB3aXRoIHRoZSBtYWludGFpbmVyIG9mIHRo
ZSBjb25mbGljdGluZyB0cmVlIHRvIG1pbmltaXNlIGFueQ0KPiA+IHBhcnRpY3VsYXJseQ0KPiA+
IGNvbXBsZXggY29uZmxpY3RzLg0KPiA+IA0KPiA+IEl0IGFsc28gbG9va3MgbGlrZSB0aGVyZSBp
cyBhIGJ1ZyBpbiB0aGF0IHJpc2MtdiB0cmVlIHBhdGNoOg0KPiA+IG1lbV9zdGFydA0KPiA+IGlz
IHVzZWQgdW5pbml0aWFsaXNlZCBpbiBzZXR1cF9ib290bWVtKCkuDQo+ID4gLS0gDQo+ID4gQ2hl
ZXJzLA0KPiA+IFN0ZXBoZW4gUm90aHdlbGwNCj4gPiANCj4gPiBkaWZmIC0tY2MgYXJjaC9yaXNj
di9tbS9pbml0LmMNCj4gPiBpbmRleCA4MTJhNDhjOTFhOTUsYmM3MmJiNmI1ZmUwLi4wMDAwMDAw
MDAwMDANCj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYw0KPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jDQo+ID4gQEBAIC0xNTIsMjAgLTE0MSwyNSArMTUyLDIwIEBAQCBkaXNhYmxl
DQo+ID4gICB9DQo+ID4gICAjZW5kaWYgLyogQ09ORklHX0JMS19ERVZfSU5JVFJEICovDQo+ID4g
ICANCj4gPiAgLXN0YXRpYyBwaHlzX2FkZHJfdCBkdGJfZWFybHlfcGEgX19pbml0ZGF0YTsNCj4g
PiAgLQ0KPiA+ICAgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQ0KPiA+ICAgew0KPiA+
IC0gCXN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZzsNCj4gPiAtIAlwaHlzX2FkZHJfdCBtZW1f
c3RhcnQsIGVuZCA9IDA7DQo+ID4gIC0JcGh5c19hZGRyX3QgbWVtX3NpemUgPSAwOw0KPiA+ICAt
CXBoeXNfYWRkcl90IHRvdGFsX21lbSA9IDA7DQo+ID4gKyAJcGh5c19hZGRyX3QgbWVtX3N0YXJ0
LCBzdGFydCwgZW5kID0gMDsNCj4gPiAgIAlwaHlzX2FkZHJfdCB2bWxpbnV4X2VuZCA9IF9fcGFf
c3ltYm9sKCZfZW5kKTsNCj4gPiAgIAlwaHlzX2FkZHJfdCB2bWxpbnV4X3N0YXJ0ID0gX19wYV9z
eW1ib2woJl9zdGFydCk7DQo+ID4gKyAJdTY0IGk7DQo+ID4gICANCj4gPiAgIAkvKiBGaW5kIHRo
ZSBtZW1vcnkgcmVnaW9uIGNvbnRhaW5pbmcgdGhlIGtlcm5lbCAqLw0KPiA+IC0gCWZvcl9lYWNo
X21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7DQo+ID4gLSAJCWVuZCA9IHJlZy0+YmFzZSArIHJlZy0+
c2l6ZTsNCj4gPiArIAlmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJnN0YXJ0LCAmZW5kKSB7DQo+ID4g
KyAJCXBoeXNfYWRkcl90IHNpemUgPSBlbmQgLSBzdGFydDsNCj4gPiAgLQkJaWYgKCF0b3RhbF9t
ZW0pDQo+ID4gICsJCWlmICghbWVtX3N0YXJ0KQ0KPiA+IC0gCQkJbWVtX3N0YXJ0ID0gcmVnLT5i
YXNlOw0KPiA+IC0gCQlpZiAocmVnLT5iYXNlIDw9IHZtbGludXhfc3RhcnQgJiYgdm1saW51eF9l
bmQgPD0gZW5kKQ0KPiA+IC0gCQkJQlVHX09OKHJlZy0+c2l6ZSA9PSAwKTsNCj4gPiArIAkJCW1l
bV9zdGFydCA9IHN0YXJ0Ow0KPiA+ICsgCQlpZiAoc3RhcnQgPD0gdm1saW51eF9zdGFydCAmJiB2
bWxpbnV4X2VuZCA8PSBlbmQpDQo+ID4gKyAJCQlCVUdfT04oc2l6ZSA9PSAwKTsNCj4gPiAgLQkJ
dG90YWxfbWVtID0gdG90YWxfbWVtICsgc2l6ZTsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAgIAkv
Kg0KPiA+IEBAQCAtNTQyLDE4IC00NTUsMTEgKzUzMywxOCBAQEAgc3RhdGljIHZvaWQgX19pbml0
DQo+ID4gc2V0dXBfdm1fZmluYWwodm9pZA0KPiA+ICAgew0KPiA+ICAgCXVpbnRwdHJfdCB2YSwg
bWFwX3NpemU7DQo+ID4gICAJcGh5c19hZGRyX3QgcGEsIHN0YXJ0LCBlbmQ7DQo+ID4gLSAJc3Ry
dWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOw0KPiA+ICsgCXU2NCBpOw0KPiA+ICAgDQo+ID4gIC0J
LyogU2V0IG1tdV9lbmFibGVkIGZsYWcgKi8NCj4gPiAgLQltbXVfZW5hYmxlZCA9IHRydWU7DQo+
ID4gIC0NCj4gPiAgKwkvKioNCj4gPiAgKwkgKiBNTVUgaXMgZW5hYmxlZCBhdCB0aGlzIHBvaW50
LiBCdXQgcGFnZSB0YWJsZSBzZXR1cCBpcyBub3QNCj4gPiBjb21wbGV0ZSB5ZXQuDQo+ID4gICsJ
ICogZml4bWFwIHBhZ2UgdGFibGUgYWxsb2MgZnVuY3Rpb25zIHNob3VsZCBiZSB1c2VkIGF0IHRo
aXMNCj4gPiBwb2ludA0KPiA+ICArCSAqLw0KPiA+ICArCXB0X29wcy5hbGxvY19wdGUgPSBhbGxv
Y19wdGVfZml4bWFwOw0KPiA+ICArCXB0X29wcy5nZXRfcHRlX3ZpcnQgPSBnZXRfcHRlX3ZpcnRf
Zml4bWFwOw0KPiA+ICArI2lmbmRlZiBfX1BBR0VUQUJMRV9QTURfRk9MREVEDQo+ID4gICsJcHRf
b3BzLmFsbG9jX3BtZCA9IGFsbG9jX3BtZF9maXhtYXA7DQo+ID4gICsJcHRfb3BzLmdldF9wbWRf
dmlydCA9IGdldF9wbWRfdmlydF9maXhtYXA7DQo+ID4gICsjZW5kaWYNCj4gPiAgIAkvKiBTZXR1
cCBzd2FwcGVyIFBHRCBmb3IgZml4bWFwICovDQo+ID4gICAJY3JlYXRlX3BnZF9tYXBwaW5nKHN3
YXBwZXJfcGdfZGlyLCBGSVhBRERSX1NUQVJULA0KPiA+ICAgCQkJICAgX19wYV9zeW1ib2woZml4
bWFwX3BnZF9uZXh0KSwNCj4gDQo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuICBHaXZl
biB0aGF0IHRoaXMgaXMgdGhlIHRpcCBvZiBteSBmb3ItDQo+IG5leHQgSSdtDQo+IGp1c3QgZ29p
bmcgdG8gZHJvcCBpdCwgd2UnbGwgc29ydCBvdXQgdGhlIGJ1ZyBhbmQgdGhlIGNvbmZsaWN0Lg0K
DQpUaGFua3MuIEkgd2lsbCByZWJhc2Ugb24gdG9wIG9mIG5leHQgYWZ0ZXIgZml4aW5nIHRoZSBi
dWcgYW5kIHJlc2VuZC4NCg0KLS0gDQpSZWdhcmRzLA0KQXRpc2gNCg==
