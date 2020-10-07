Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC1A286A91
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 23:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728731AbgJGV6d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Oct 2020 17:58:33 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:38816 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728575AbgJGV6c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Oct 2020 17:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1602107914; x=1633643914;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MbGUCJZJY+aew7YujBhkG4+hr6Kfwg8OlLqhV21w+Xw=;
  b=Q0dO5nnLk/Pp1ghQZYJ7RodRLslvnAmXONlq+PPCQ7N88hdQKL5CKIb3
   SUtfBbLqnM4OPISFjk19Eg/gGDrV7cVyu4k96dteHcVcyORNpm02fa/vm
   bj5xUMEQiCWXWTzC1WVQl1XvF32yfxmglpxpZ6oX48+h+/7XDFnTb//rD
   eWqQQsXJ19WuzfWYwKIOQdpzPiXveX7g9LpZ42xZNgr4bFcd/TTuTG0+1
   35uSqtLJMwpYuBQ7VhBe9zUtNaZxaB2OPhNLGs6Z1VVcZdXOhMHKKH1s2
   S/73R5cRRXRe97bpyWN8YNOKtUt7gOyxEfoFYNPF0pAWtrU7friGQ0ePV
   Q==;
IronPort-SDR: z9202qHySXoqoJjEU689GcK28ozWayoIDcaoMvZMNIURrFfsnsjR+pBuEY9SmlaxHWrKET7dHu
 hXviQnVj/WqNdcJcdcHTe74e27dI6M47DggCn6xSYUXTUKf0egjLYw3G6edYGsv9/lAy+0ttOk
 0pS87uGwmWeUXW1AXFU8/JL8fme/JU4yoDSrgnF6m1FkK0LA7T6XljVfQwC/FNROF2hq28xVsu
 NDfZ3C6mYTBUEGmIEQgu2d7L26y4RdiChwqXp6/jviumotqOUGq+pstA6L0339UIPt+3cMGL5s
 3yY=
X-IronPort-AV: E=Sophos;i="5.77,348,1596470400"; 
   d="scan'208";a="252739513"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
  by ob1.hgst.iphmx.com with ESMTP; 08 Oct 2020 05:58:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAK6CzdFvPM2+MVnIu+U8f4T04857AauHJ9wIqp9NuRy4gNeElBJ813R8yJG4sJz8mcikSxxkOKFDPZaeIk1kDdYH87R/tvylMUldsO3MPD+Iduya2AuYDtZ4qLBjv7ZOgo6lIPvtCI0ssSA4Zycb1glkMLOasLqA98BdGgFJZ9wXOa3c396lcVCMwaVD3tUxaTtNcogCwrZPXxd+RPOSaQPkrnYWFDQ3BFkTh6v86awq+oELazi05/ezRe29hENvGz3s1Kxinv2cocsd1jF5ogdOCKUAoGj6SeaNh4DiGNjUhmDV9mmGgp7HelbFwaY6+C23NjZjbSICtMaayvQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbGUCJZJY+aew7YujBhkG4+hr6Kfwg8OlLqhV21w+Xw=;
 b=eGrcszaAmfF3YsOx3yjTHguMRX+luUaD/fUFc1WfOhKd827w8lX9jbioit3xGgmm5N0JgzsfdtCf/9jR/iPTwSAxu9ZNoa2xP4aSp4xavWiTRdLqud0v235l1g2nQd3qEbp0QWgusfZZHhkhybAdoQo5uFoqUrQMrOuMzeS9WnYymj56GUe1yv5biuiY9B04A/wp/kRzf49JUD9BDHb86na3YuIgnc7gAMtrkGjFRnGD9hHS1RaaRkaHazXEkbGB0cwGBB6SvHFnDLsihqIztnb6n2OdR28OtJD1zsiATJOT6f1G2+SKfyFen1Nnh51vjcC5doGB4LfxVmsbIBzZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbGUCJZJY+aew7YujBhkG4+hr6Kfwg8OlLqhV21w+Xw=;
 b=mvRESvmN2Syk1DPGz830kCl97K/YtewkXCcn3LkXmQ699Yf2cyYS5j8PjT+P2nHg7opfeYj42fhhnevo/YnYv/UAjFebga6C4pjDZZzfW95cNaJfXKXRubhbtUxljRWcok8A+TDKAYOYATFo5ptw6wFlqfdj5WI+TGalvNECe1E=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB5912.namprd04.prod.outlook.com (2603:10b6:a03:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.21; Wed, 7 Oct
 2020 21:58:29 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::f122:ad41:aebe:6785]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::f122:ad41:aebe:6785%3]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 21:58:29 +0000
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
Thread-Index: AQHWm8zzrn4huwEHWkqnYHWvYEDohamLjf+AgAAEegCAAR/mAA==
Date:   Wed, 7 Oct 2020 21:58:29 +0000
Message-ID: <155cc11225c7f76593ffb0793089a1f06c9db26d.camel@wdc.com>
References: <mhng-2d15c259-f5ff-4bab-92eb-b5f0eb2f4bd6@palmerdabbelt-glaptop1>
         <944718b60797f69628110db590dd0e6d350fc600.camel@wdc.com>
In-Reply-To: <944718b60797f69628110db590dd0e6d350fc600.camel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 26df4d2b-2be8-4c40-fee9-08d86b0c200a
x-ms-traffictypediagnostic: BYAPR04MB5912:
x-microsoft-antispam-prvs: <BYAPR04MB591250EF7D25DBF043C1DBB2FA0A0@BYAPR04MB5912.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IqvK/0ZJ1DyhfkshtYFSBgLAZggsMcWWJbQtP32HqI8wAkRtM+8B1tGRouErOqOp9Z/Sq5pl/feF6EQjSRx0rI/xRr6Lz1OTYOCnzUEJl/TAQABUYsiIqJMZ0OeCcPkk5jCEjH6J9/lPo2jUqciAlttikiPh+8D8e6PqsoEB99UUu0kbhHAh1/7DDk0XxYCHzhnM6TdmgdoDKUJQo61SgkAj6V6rspzlNj03e9tvaS42CwODBtubGePdL4Zq8bi8iYAty4RW3rxxAEV2wjww4cCVaMHY4tklCs/2dUhRyz5VQWoFiVltYgd2MQwcJF6S
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6724.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(2906002)(66446008)(64756008)(86362001)(66476007)(76116006)(66556008)(66946007)(6486002)(6512007)(83380400001)(36756003)(4326008)(316002)(2616005)(478600001)(5660300002)(71200400001)(8936002)(8676002)(54906003)(110136005)(26005)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 6jyNjdx7gr7Xd8RKfcfiGVmfoa6El0WJQcc2akcxJxoUX2SBmwScGLBEXsFyXm1IfluZUSyo3c/m9jW6zXQMJMjWLlCfaUQr4rIRxz964SZ95gn4Acxo4azmWRd6l/mPEc12Em/WYzLL601ls0x3PFaywDYgKrfyDhwzq4gHFpf+FpXBKw2/+9hRZHC1qtpn9A+0oxst4rMpcDJ+XP37HJRcmNDcEqQbs1Uja6xByiHbmjaKNQQ5l311AWHndR25NRhhy4NBbeE5zDMxFiVBLLJZy7tMRHmAmG1fzXWL3UCZ3RVOjf7n89sOPTyqIufPVeNJDm6q/Kne8qJ+BG2+3Mi4M6je5cwK2+v5ET9gl+kLPjM2fVHDwDjfpEYTR/vHDVZWFuTYZ2lC0vJyNRNmKjvrGTDrEG4efhQznQhS0ApG2+p7+3cnCTWXJUQYAOrdEC6G2JtdrTWLK48IcWc8pchjVQS/AQ/k6vpRtBcgzrwsZbS4qVpvvMmS5rcxxy8N95EZVvzWH8Yj/34jReKoGtOgcvEJHO6ltKfcwBQhmjcGOwI7LnMRM9cIt1XjqyfddB3B/NcHwJRiSUvvrAmPd3owZcKvdIj8T+SPzW4ILyoEJeLyLGcWXbOymSb/QXThJRcz9dtQIvXUtklT5GwiSg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4F0870183C7BD4A94C34DC75BD8B489@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26df4d2b-2be8-4c40-fee9-08d86b0c200a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 21:58:29.2454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDmO/jelE1jhF+6Df2sRaFsFCskQD/sQ8BU+eRxOnOPMuyp46lyPb13wr/XKLvnhfCzipY7UPWb+isBmsWCkjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5912
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVHVlLCAyMDIwLTEwLTA2IGF0IDIxOjQ4IC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToNCj4g
T24gVHVlLCAyMDIwLTEwLTA2IGF0IDIxOjMyIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToN
Cj4gPiBPbiBUdWUsIDA2IE9jdCAyMDIwIDAzOjM5OjA2IFBEVCAoLTA3MDApLCBTdGVwaGVuIFJv
dGh3ZWxsIHdyb3RlOg0KPiA+ID4gSGkgYWxsLA0KPiA+ID4gDQo+ID4gPiBUb2RheSdzIGxpbnV4
LW5leHQgbWVyZ2Ugb2YgdGhlIGFrcG0tY3VycmVudCB0cmVlIGdvdCBhIGNvbmZsaWN0DQo+ID4g
PiBpbjoNCj4gPiA+IA0KPiA+ID4gICBhcmNoL3Jpc2N2L21tL2luaXQuYw0KPiA+ID4gDQo+ID4g
PiBiZXR3ZWVuIGNvbW1pdDoNCj4gPiA+IA0KPiA+ID4gICBjMjljMzhmYTJhOGIgKCJSSVNDLVY6
IFJlbW92ZSBhbnkgbWVtYmxvY2sgcmVwcmVzZW50aW5nDQo+ID4gPiB1bnVzYWJsZQ0KPiA+ID4g
bWVtb3J5IGFyZWEiKQ0KPiA+ID4gDQo+ID4gPiBmcm9tIHRoZSByaXNjLXYgdHJlZSBhbmQgY29t
bWl0czoNCj4gPiA+IA0KPiA+ID4gICAzNTIwZWViNzkxNDIgKCJhcmNoLCBkcml2ZXJzOiByZXBs
YWNlIGZvcl9lYWNoX21lbWJvY2soKSB3aXRoDQo+ID4gPiBmb3JfZWFjaF9tZW1fcmFuZ2UoKSIp
DQo+ID4gPiANCj4gPiA+IGZyb20gdGhlIGFrcG0tY3VycmVudCB0cmVlLg0KPiA+ID4gDQo+ID4g
PiBJIGZpeGVkIGl0IHVwIChzZWUgYmVsb3cpIGFuZCBjYW4gY2FycnkgdGhlIGZpeCBhcyBuZWNl
c3NhcnkuDQo+ID4gPiBUaGlzDQo+ID4gPiBpcyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5l
eHQgaXMgY29uY2VybmVkLCBidXQgYW55IG5vbg0KPiA+ID4gdHJpdmlhbA0KPiA+ID4gY29uZmxp
Y3RzIHNob3VsZCBiZSBtZW50aW9uZWQgdG8geW91ciB1cHN0cmVhbSBtYWludGFpbmVyIHdoZW4N
Cj4gPiA+IHlvdXINCj4gPiA+IHRyZWUNCj4gPiA+IGlzIHN1Ym1pdHRlZCBmb3IgbWVyZ2luZy4g
IFlvdSBtYXkgYWxzbyB3YW50IHRvIGNvbnNpZGVyDQo+ID4gPiBjb29wZXJhdGluZw0KPiA+ID4g
d2l0aCB0aGUgbWFpbnRhaW5lciBvZiB0aGUgY29uZmxpY3RpbmcgdHJlZSB0byBtaW5pbWlzZSBh
bnkNCj4gPiA+IHBhcnRpY3VsYXJseQ0KPiA+ID4gY29tcGxleCBjb25mbGljdHMuDQo+ID4gPiAN
Cj4gPiA+IEl0IGFsc28gbG9va3MgbGlrZSB0aGVyZSBpcyBhIGJ1ZyBpbiB0aGF0IHJpc2MtdiB0
cmVlIHBhdGNoOg0KPiA+ID4gbWVtX3N0YXJ0DQo+ID4gPiBpcyB1c2VkIHVuaW5pdGlhbGlzZWQg
aW4gc2V0dXBfYm9vdG1lbSgpLg0KPiA+ID4gLS0gDQo+ID4gPiBDaGVlcnMsDQo+ID4gPiBTdGVw
aGVuIFJvdGh3ZWxsDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1jYyBhcmNoL3Jpc2N2L21tL2luaXQu
Yw0KPiA+ID4gaW5kZXggODEyYTQ4YzkxYTk1LGJjNzJiYjZiNWZlMC4uMDAwMDAwMDAwMDAwDQo+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYw0KPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9t
bS9pbml0LmMNCj4gPiA+IEBAQCAtMTUyLDIwIC0xNDEsMjUgKzE1MiwyMCBAQEAgZGlzYWJsZQ0K
PiA+ID4gICB9DQo+ID4gPiAgICNlbmRpZiAvKiBDT05GSUdfQkxLX0RFVl9JTklUUkQgKi8NCj4g
PiA+ICAgDQo+ID4gPiAgLXN0YXRpYyBwaHlzX2FkZHJfdCBkdGJfZWFybHlfcGEgX19pbml0ZGF0
YTsNCj4gPiA+ICAtDQo+ID4gPiAgIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkNCj4g
PiA+ICAgew0KPiA+ID4gLSAJc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVnOw0KPiA+ID4gLSAJ
cGh5c19hZGRyX3QgbWVtX3N0YXJ0LCBlbmQgPSAwOw0KPiA+ID4gIC0JcGh5c19hZGRyX3QgbWVt
X3NpemUgPSAwOw0KPiA+ID4gIC0JcGh5c19hZGRyX3QgdG90YWxfbWVtID0gMDsNCj4gPiA+ICsg
CXBoeXNfYWRkcl90IG1lbV9zdGFydCwgc3RhcnQsIGVuZCA9IDA7DQo+ID4gPiAgIAlwaHlzX2Fk
ZHJfdCB2bWxpbnV4X2VuZCA9IF9fcGFfc3ltYm9sKCZfZW5kKTsNCj4gPiA+ICAgCXBoeXNfYWRk
cl90IHZtbGludXhfc3RhcnQgPSBfX3BhX3N5bWJvbCgmX3N0YXJ0KTsNCj4gPiA+ICsgCXU2NCBp
Ow0KPiA+ID4gICANCj4gPiA+ICAgCS8qIEZpbmQgdGhlIG1lbW9yeSByZWdpb24gY29udGFpbmlu
ZyB0aGUga2VybmVsICovDQo+ID4gPiAtIAlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykg
ew0KPiA+ID4gLSAJCWVuZCA9IHJlZy0+YmFzZSArIHJlZy0+c2l6ZTsNCj4gPiA+ICsgCWZvcl9l
YWNoX21lbV9yYW5nZShpLCAmc3RhcnQsICZlbmQpIHsNCj4gPiA+ICsgCQlwaHlzX2FkZHJfdCBz
aXplID0gZW5kIC0gc3RhcnQ7DQo+ID4gPiAgLQkJaWYgKCF0b3RhbF9tZW0pDQo+ID4gPiAgKwkJ
aWYgKCFtZW1fc3RhcnQpDQo+ID4gPiAtIAkJCW1lbV9zdGFydCA9IHJlZy0+YmFzZTsNCj4gPiA+
IC0gCQlpZiAocmVnLT5iYXNlIDw9IHZtbGludXhfc3RhcnQgJiYgdm1saW51eF9lbmQNCj4gPiA+
IDw9IGVuZCkNCj4gPiA+IC0gCQkJQlVHX09OKHJlZy0+c2l6ZSA9PSAwKTsNCj4gPiA+ICsgCQkJ
bWVtX3N0YXJ0ID0gc3RhcnQ7DQo+ID4gPiArIAkJaWYgKHN0YXJ0IDw9IHZtbGludXhfc3RhcnQg
JiYgdm1saW51eF9lbmQgPD0NCj4gPiA+IGVuZCkNCj4gPiA+ICsgCQkJQlVHX09OKHNpemUgPT0g
MCk7DQo+ID4gPiAgLQkJdG90YWxfbWVtID0gdG90YWxfbWVtICsgc2l6ZTsNCj4gPiA+ICAgCX0N
Cj4gPiA+ICAgDQo+ID4gPiAgIAkvKg0KPiA+ID4gQEBAIC01NDIsMTggLTQ1NSwxMSArNTMzLDE4
IEBAQCBzdGF0aWMgdm9pZCBfX2luaXQNCj4gPiA+IHNldHVwX3ZtX2ZpbmFsKHZvaWQNCj4gPiA+
ICAgew0KPiA+ID4gICAJdWludHB0cl90IHZhLCBtYXBfc2l6ZTsNCj4gPiA+ICAgCXBoeXNfYWRk
cl90IHBhLCBzdGFydCwgZW5kOw0KPiA+ID4gLSAJc3RydWN0IG1lbWJsb2NrX3JlZ2lvbiAqcmVn
Ow0KPiA+ID4gKyAJdTY0IGk7DQo+ID4gPiAgIA0KPiA+ID4gIC0JLyogU2V0IG1tdV9lbmFibGVk
IGZsYWcgKi8NCj4gPiA+ICAtCW1tdV9lbmFibGVkID0gdHJ1ZTsNCj4gPiA+ICAtDQo+ID4gPiAg
KwkvKioNCj4gPiA+ICArCSAqIE1NVSBpcyBlbmFibGVkIGF0IHRoaXMgcG9pbnQuIEJ1dCBwYWdl
IHRhYmxlIHNldHVwDQo+ID4gPiBpcyBub3QNCj4gPiA+IGNvbXBsZXRlIHlldC4NCj4gPiA+ICAr
CSAqIGZpeG1hcCBwYWdlIHRhYmxlIGFsbG9jIGZ1bmN0aW9ucyBzaG91bGQgYmUgdXNlZCBhdA0K
PiA+ID4gdGhpcw0KPiA+ID4gcG9pbnQNCj4gPiA+ICArCSAqLw0KPiA+ID4gICsJcHRfb3BzLmFs
bG9jX3B0ZSA9IGFsbG9jX3B0ZV9maXhtYXA7DQo+ID4gPiAgKwlwdF9vcHMuZ2V0X3B0ZV92aXJ0
ID0gZ2V0X3B0ZV92aXJ0X2ZpeG1hcDsNCj4gPiA+ICArI2lmbmRlZiBfX1BBR0VUQUJMRV9QTURf
Rk9MREVEDQo+ID4gPiAgKwlwdF9vcHMuYWxsb2NfcG1kID0gYWxsb2NfcG1kX2ZpeG1hcDsNCj4g
PiA+ICArCXB0X29wcy5nZXRfcG1kX3ZpcnQgPSBnZXRfcG1kX3ZpcnRfZml4bWFwOw0KPiA+ID4g
ICsjZW5kaWYNCj4gPiA+ICAgCS8qIFNldHVwIHN3YXBwZXIgUEdEIGZvciBmaXhtYXAgKi8NCj4g
PiA+ICAgCWNyZWF0ZV9wZ2RfbWFwcGluZyhzd2FwcGVyX3BnX2RpciwgRklYQUREUl9TVEFSVCwN
Cj4gPiA+ICAgCQkJICAgX19wYV9zeW1ib2woZml4bWFwX3BnZF9uZXh0KSwNCj4gPiANCj4gPiBU
aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiAgR2l2ZW4gdGhhdCB0aGlzIGlzIHRoZSB0aXAg
b2YgbXkNCj4gPiBmb3ItDQo+ID4gbmV4dCBJJ20NCj4gPiBqdXN0IGdvaW5nIHRvIGRyb3AgaXQs
IHdlJ2xsIHNvcnQgb3V0IHRoZSBidWcgYW5kIHRoZSBjb25mbGljdC4NCj4gDQo+IFRoYW5rcy4g
SSB3aWxsIHJlYmFzZSBvbiB0b3Agb2YgbmV4dCBhZnRlciBmaXhpbmcgdGhlIGJ1ZyBhbmQgcmVz
ZW5kLg0KPiANCg0KRG9uZS4gSSBoYXZlIHJlYmFzZWQgdGhlIG1lbWJsb2NrIHBhdGNoKGMyOWMz
OGZhMmE4YikgYW5kIHNlbnQgaXQgdG8NCnRoZSBtYWlsaW5nIGxpc3QuDQoNClNvbWUgb2YgdGhl
IG90aGVyIGNvbmZsaWN0cyBhcmUgZHVlIHRvIHRoZSBwYXRjaGVzIGluIFVFRkkgc2VyaWVzLiBB
cw0KdGhlIHNlcmllcyBpcyBnb2luZyB0aHJvdWdoIG11bHRpcGxlIHNoYXJlZCB0cmVlLCBJIGFt
IG5vdCBzdXJlIHdoYXQgaXMNCnRoZSBiZXN0IGNvdXJzZSBvZiBhY3Rpb24uDQoNCkkgYWxzbyBu
b3RpY2VkIHRoYXQgbGludXgtbmV4dC9tYXN0ZXIgaGFzIGFuIG9sZGVyIHZlcnNpb24gb2YgVUVG
SQ0KcGF0Y2hlcyB3aGlsZSBmb3ItbmV4dCBpbiByaXNjdiB0cmVlIGhhcyB0aGUgbGF0ZXN0IHZl
cnNpb24uIA0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBuZWVkIHRvIHJlc2VuZCB0aGUgVUVG
SSBzZXJpZXMuDQoNCi0tIA0KUmVnYXJkcywNCkF0aXNoDQo=
