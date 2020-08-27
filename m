Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77BA5254B71
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 19:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgH0RDB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 13:03:01 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:58129 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgH0RDA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 13:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1598547780; x=1630083780;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wUqDHESY1EXiGILUSPR2P76f1epYLVvzDVeOwt4mPpo=;
  b=BqHekvwDHiiQxL7JGavZ+uxoqWon8qGHNsV5XxgziRakuEF5mexVBQOC
   heXgDiECu1zjciXWPyzq16EJ0r0+MkyrHXkQHuFx3BX0YiVUqLpqJJdYf
   BYajYn9cdUctmQfEWSh6YchR0kVVH/gBQRQ8uZIrnuzKez2CBmkQnug/l
   SOxeq8wwVZl/Xnn+9GNNnwPo0lGNHysR1R2bqaMty1TtJtW1hTcH7GZ9g
   zLC7oaptYJbjCjuFT74Tuyuf96ARbd2vAMWnqOwI71XdcNpxBvLM5i9pn
   mDMCqN/EkSzThFGg1WIaKSnZY1gw4pkdFlQMkfN+XngkSrM2Al2PYruKn
   g==;
IronPort-SDR: Ebjg1QJznRB9bXbF64MUFGMCtE7Pgua56/r3j9AzxAsogx/EY25vKfKLlQT2+TsuKtePS+8EOy
 mG+ifa/ywHeb4C2SXf1My3P16LNwEMobObWI33zb9E9nhQpOoS7FESpxuL0X6xF19AMaaVG9JK
 qKelMDfCqSMxJz5pW2ax7FLr/B3+qFWTaNZnuqnDtfF36M83vbrGKLtLQik8uTNsX6h+/BqaEf
 l46X/HoYzf85Q0V8Hr2Ab5PXJCQYgw0mp6wZdF+BFD1uqXJgleGSv2ZUQk3hKF5l7rwoRt3P9J
 lrQ=
X-IronPort-AV: E=Sophos;i="5.76,360,1592841600"; 
   d="scan'208";a="255495118"
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
  by ob1.hgst.iphmx.com with ESMTP; 28 Aug 2020 01:02:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKDxLpdxbmMMoW43HQajpEQB03JFB6yOLeBIV2DhxIyCTeeVVWMv1QNdV6CId5IJIBczTRf1II5kkD7Lcxpd4INyBT/awNXAuCwvWqPFDh+kbCUfHAU+OuWzxd+ImyanWMWFeGG+EoL+AGmAnISArrefGYokAvQGkBVTJCuYq/K2xqTrapigfO1VrgAjlcDc40p2VWE7enTOZTPkzQjxFiAu5Rv6nHzkjL5EhwjOfAuhLRU8/2Pu3nkflc9p+PJZOFDAhhBuumKOwxBXggk/AfpUbmbXj+vAvrmK6z3XfSbeFFY3W5dkbHKWTdXpurOrFe+9qZ/wklBxDj42ck8xYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUqDHESY1EXiGILUSPR2P76f1epYLVvzDVeOwt4mPpo=;
 b=AEqhjfgPdDueMgcZAoEtxsKkxXHlWN9q6UvunaGvVd5FCk00S6flbGeQAO0Qh98PfZEvd/+HpfwuHNJepM0AEa4769oEA0KaoPxCPKFCua1NZjurTPjbHxvDL/dX1UTVi0OWPRhAQm6qUdFHJPXs8m3oU9mqi1dWIxkljHTtzBnTd2ckkbSlNn2NK5a/8tzBn7FvMi87jB28g+e7qIFv1UJMEgASfOPs3EhYtwHysItU88wS8KRiHKBbIZaM0ilHoB1YkaJtawu3t8XnX9Wv0WIAnVvbJY3HPcCK5fD3Q5pYGYXazCgRzG3EmUjIlBCDIgWrSHxTSBSFtVXzWBInvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wUqDHESY1EXiGILUSPR2P76f1epYLVvzDVeOwt4mPpo=;
 b=VJ0183kvSwqsJF1HfUuxYGce0UBpQhdY7JEi4FtzSMNzKdJH6LqZ81qX2f1aM93xZGtMyBi84zxNjkANN1PX5sgyQDdlqLtIx1VMP3/B9JXxF2rZ8pAKkQX4vJ8Rj/v6PlDJXlmY111EGEW5K5bi7k/KSQMF0ulWH5iskZpKbb8=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BY5PR04MB6660.namprd04.prod.outlook.com (2603:10b6:a03:22f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 17:02:57 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::90f3:1abd:2ec8:a91a]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::90f3:1abd:2ec8:a91a%9]) with mapi id 15.20.3305.032; Thu, 27 Aug 2020
 17:02:57 +0000
From:   Atish Patra <Atish.Patra@wdc.com>
To:     "anders.roxell@linaro.org" <anders.roxell@linaro.org>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "anup@brainfault.org" <anup@brainfault.org>,
        "palmerdabbelt@google.com" <palmerdabbelt@google.com>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Aug 27
Thread-Topic: linux-next: Tree for Aug 27
Thread-Index: AQHWfE1Yj2P22Mz/AkKfhFk5GQUfaqlMLo0A
Date:   Thu, 27 Aug 2020 17:02:57 +0000
Message-ID: <fa8a133517704eff9b0f2369c1b7b5bbc8517916.camel@wdc.com>
References: <20200827151105.73c75040@canb.auug.org.au>
         <CADYN=9L8znDFuPOiXzoR_vm+FXYkVR-D5yOf9hwPuG1FyAqDSw@mail.gmail.com>
In-Reply-To: <CADYN=9L8znDFuPOiXzoR_vm+FXYkVR-D5yOf9hwPuG1FyAqDSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [98.248.240.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f086d844-db84-4a1c-03ad-08d84aab0c03
x-ms-traffictypediagnostic: BY5PR04MB6660:
x-microsoft-antispam-prvs: <BY5PR04MB66601225F218D0DEC06DEBB1FA550@BY5PR04MB6660.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fH0yaR9piKTenidoWfLDUxk86K1QDAjBL4i/wwh5eNrzngFIRBmWEgwN8wQ3cOk09mXWAL+Bjx/vEMdNQ0QjgMIFwNKagKtVws4EI8it+GJ+sm20GVYpgUWdAXLc12Uu6uuG35Qym6eyLOJT/J182uu7t8nZJQtvFvArO4fwBTzzZaj+R3UCQ1PHx2USnZ6rjnNx1oTd8qlZf79NpfQRAuACJw0YnI1pVelQqlfivkW5vCSy4IEnV6xMFsL9RGbnYLj0byqPc2VIW6y3Z9bfZ3ClUma3d5zEP+cFazt2czH/IGnRIq/KoXXcWjkNkHDf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR04MB6724.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(6506007)(316002)(4326008)(110136005)(478600001)(36756003)(6512007)(54906003)(8676002)(8936002)(5660300002)(2906002)(2616005)(186003)(26005)(83380400001)(86362001)(66446008)(66946007)(71200400001)(76116006)(6486002)(64756008)(66556008)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: c+DlBj6MrZL3maPl3Yx46IWkbRi3iPphYXuGdT7+c5bqHCct3+G6twuItPgS1v5ym4B7xZaQEEhs06CzhA2z9gckocH4HrOA/jnCIQmidpcE4jn+VHiKSnu4Lt6VC3d90/BxdFMv3M8Ig8nMPwhpCgstnAowva3wUpLnpqk0Gr6Yq1Oa7udE1uSrvBiwq6e0njr5Dam21u/XJS5WUFoALHTi5qJYHqVPdFAmhUNQxY0+JLSm/oA8t3AH97vDczuLfSt0dEs93BQXmZIyyj301s6vLFqA1uX8oza1JBhm9Z0LiXB0/KAbeld8NyJCQWvDbACrSa9VHZoReClMdOTGP1sODVSwBs79KsRPlT+POTIRoFmihvVrpi3RzpPwQ6pxJoObMKuQjOnGkVMtxLUwOXH2wytCRabY7vAYUYYvg3LI07yPjVfH4/n0lnURFJmCVn6yFDyc+E9F8hmLEAGCGR0ONUCsto2UTliEk7DTf8oulQ3YCFhBYZydOVs4pp7zwJICZAnRTyBNDa3IXD2Kv7Cb+oexTBAHYycqzMf8TKpQz06njV46kaPvG7HgQErW/pxQih+nzHT+CGYzs9dd0W3Q5iTxlZAgOn5T3+GFy6lRRVErUDyaTPqmBLjXFoEOZXeyPsyAEUmxGeVNfiAu9g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C7858922A7EABD49AE008AE9E836915A@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f086d844-db84-4a1c-03ad-08d84aab0c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 17:02:57.3247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sFy64y2hLtnEqQ2booN3vncYXUBkYehXmMfVDlUcWnj/ADX6Rj5UHTaBduPHe/rcjx0pmL4BYvFjmcjXvqh6ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6660
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVGh1LCAyMDIwLTA4LTI3IGF0IDEwOjM3ICswMjAwLCBBbmRlcnMgUm94ZWxsIHdyb3RlOg0K
PiBPbiBUaHUsIDI3IEF1ZyAyMDIwIGF0IDA3OjExLCBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2Fu
Yi5hdXVnLm9yZy5hdT4NCj4gd3JvdGU6DQo+ID4gSGkgYWxsLA0KPiA+IA0KPiA+IE5ld3M6ICBU
aGVyZSB3aWxsIGJlIG5vIGxpbnV4LW5leHQgcmVsZWFzZXMgbmV4dCBNb25kYXkgb3IgVHVlc2Rh
eS4NCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIDIwMjAwODI2Og0KPiA+IA0KPiA+IFRoZSBuZXQt
bmV4dCB0cmVlIGdhaW5lZCBhIGNvbmZsaWN0IGFnYWluc3QgdGhlIG5ldCB0cmVlLg0KPiA+IA0K
PiA+IE5vbi1tZXJnZSBjb21taXRzIChyZWxhdGl2ZSB0byBMaW51cycgdHJlZSk6IDI5MDENCj4g
PiAgMzQyOSBmaWxlcyBjaGFuZ2VkLCAxMDA0OTYgaW5zZXJ0aW9ucygrKSwgMzcwODEgZGVsZXRp
b25zKC0pDQo+ID4gDQo+IA0KPiBJIGJ1aWx0IHJpc2N2IG9uIHRvZGF5cyB0YWcgYW5kIEkgc2Vl
IHRoaXMgZXJyb3I6DQo+IC4uL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmM6IEluIGZ1bmN0aW9u
IOKAmHNldHVwX2FyY2jigJk6DQo+IC4uL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmM6NzQ6Mjog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mDQo+IGZ1bmN0aW9uIOKAmGVhcmx5X2lvcmVt
YXBfc2V0dXDigJk7IGRpZCB5b3UgbWVhbiDigJhlYXJseV9tZW10ZXN04oCZPw0KPiBbLVdlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0NCj4gICBlYXJseV9pb3JlbWFwX3NldHVw
KCk7DQo+ICAgXn5+fn5+fn5+fn5+fn5+fn5+fg0KPiAgIGVhcmx5X21lbXRlc3QNCj4gY2MxOiBz
b21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzDQo+IA0KPiBJIHRoaW5rIGl0cyBk
dWUgdG8gY29tbWl0IDNkMTA5YjBlMDk0OSAoIlJJU0MtVjogQWRkIGVhcmx5IGlvcmVtYXANCj4g
c3VwcG9ydCIpDQo+IA0KDQpZZXMuIEZvciBzb21lIHJlYXNvbiwgSSBuZXZlciBnZXQgdGhpcyB3
aXRoIHRoZSBVRUZJIHN1cHBvcnQgc2VyaWVzDQphcHBsaWVkIG9uIHRvcCA1LjktcmMyIGluIG15
IHRyZWUuIEJ1dCBJIGdldCB0aGlzIGVycm9yIHdpdGggbGludXgtbmV4dCANCnRyZWUuDQoNCj4g
SXQgYnVpbGRzIHdpdGggdGhpcyBmaXg6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMNCj4gaW5kZXggNWFiMTg1
MTMwY2FlLi40MWVmOTZkMGQ5N2EgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Nl
dHVwLmMNCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYw0KPiBAQCAtMTksNiArMTks
NyBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4L3NtcC5oPg0KPiANCj4gICNpbmNsdWRlIDxhc20vY3B1
X29wcy5oPg0KPiArI2luY2x1ZGUgPGFzbS9lYXJseV9pb3JlbWFwLmg+DQo+ICAjaW5jbHVkZSA8
YXNtL3NldHVwLmg+DQo+ICAjaW5jbHVkZSA8YXNtL3NlY3Rpb25zLmg+DQo+ICAjaW5jbHVkZSA8
YXNtL3NiaS5oPg0KPiANCj4gDQoNClRoaXMgZml4IHNvbHZlcyB0aGUgcHJvYmxlbS4gVGhhbmtz
Lg0KQHBhbG1lcjogRG8geW91IHdhbnQgbWUgdG8gdXBkYXRlIHRoZSBwYXRjaCBhbmQgc2VuZCB2
NyA/DQoNCg0KPiBDaGVlcnMsDQo+IEFuZGVycw0KDQotLSANClJlZ2FyZHMsDQpBdGlzaA0K
