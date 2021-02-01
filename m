Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D93330A089
	for <lists+linux-next@lfdr.de>; Mon,  1 Feb 2021 04:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhBAD0T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Jan 2021 22:26:19 -0500
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:30894 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231347AbhBAD0Q (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 31 Jan 2021 22:26:16 -0500
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1113P3rf028388;
        Sun, 31 Jan 2021 19:25:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfpt0220;
 bh=UTRooE2yVUaReLBsMHO9lwNpCttQwrpTV5q9lbyxV3k=;
 b=gVfy8Bqo/hAa3ffNJk+HXgBiFpCzk2wC98kgQD3Q0Cq7Dv+96JeVOSlzQLJHVRSVQh/L
 CbO3Y5mfW/XJ3HYPXP8fmvt415AIqQO1AKzeVW2+AGAGqPO1Sd9xAvph+S/emj9QitDB
 GZ/eSywS0M/GHal4gMgswdTxFaR1i3fmQckROObXc7hhHH390cZdILpLMxojTLY/CayZ
 Pb32lh+iJl7KeG/qBhD82LnGm2IbZ0duH1luvpXYaUjRL1SYNdEjzbfCcfRnIQ6v2R+d
 Wv/Bwb2GA+F6Yd0x1TUYzDXJ3G6A72EODg272og83AbL3ra7Ayvjs3U8zOpSlkaoTLPh tg== 
Received: from dc5-exch02.marvell.com ([199.233.59.182])
        by mx0b-0016f401.pphosted.com with ESMTP id 36d7uq2kqa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Sun, 31 Jan 2021 19:25:03 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by DC5-EXCH02.marvell.com
 (10.69.176.39) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sun, 31 Jan
 2021 19:25:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by DC5-EXCH02.marvell.com (10.69.176.39) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Sun, 31 Jan 2021 19:25:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6Y64QGs4Fu2D7/SLTopiJSv2Rav7eimO1XdCsdScuBBNKigUXVFsDh1nhXiuJfeUYNMETUmsnOSePNaHJoCAP9ozLV7otfzvyuViBT4VBglpwxRqaoqVyJ9828MysmeUjlvXbv0jP10e3M9SnI4SxdLmUbvMko8IGJ1lhHib/a7bXrcZ0bFkf/qOWEdiIjq3nAqJnQkinouWUhCHReE48IQvkAvtvBGiAzrHlUAz+Ed6cW8mlZwYjM6Wgjjg+nZt77ef6ZDbBdOBFhYdgvUKYmn9iEAAbnT25PxuuXUQWV3H/ykUCZOl2ELKHRlgP5ie3sIqsnHbmRlNYL/qazrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTRooE2yVUaReLBsMHO9lwNpCttQwrpTV5q9lbyxV3k=;
 b=kwXA7CyGO/BsjZCYKoaIaDv9TxKK5AN4AKdaKSbt4StHTsKjgEvsWMZ3qWF4H2KhOWQwCOvODKrh2jFxiIb0e/gsBcMDP3baFNe2q76Rymqz9IxbXUhAhIHYIprSCt6joohTSCDZ/JqjiW4SxGIi8ps50BtudC8iaY/7GbDXUzGM2zgUGOaIRicShhBf/HbuYupF0r936EvR46VFH8gud2dQksS54ncCmBOsFhrRh0yLXYLDYULPNaEkjftnuSOy4eHclfxGZLdBCjuAbZnNmGXVWSDJeKXX8bW+gArhd6kMb54p+dGEZRxPZRAiT0j9cJW5h8Y0tmJt0YcYqDVdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTRooE2yVUaReLBsMHO9lwNpCttQwrpTV5q9lbyxV3k=;
 b=gvm+bxSxdDYG5wRNrO82ApXH2l7LznRs8gzfmX1sGVfbrgi1jIQK48ZaTpZ/BHAugLFTiFf3DYjtSQ1uoKO9KNTPXHcsajVgfEy9WXI2pHTN4+YaH36FqWiNlNHQH8D47SL4fMqY9R1TQ3kPGVLCuoBPKWG2CBOytjm1P3Ia6nk=
Received: from BYAPR18MB2791.namprd18.prod.outlook.com (2603:10b6:a03:111::21)
 by BYAPR18MB2824.namprd18.prod.outlook.com (2603:10b6:a03:110::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 1 Feb
 2021 03:24:59 +0000
Received: from BYAPR18MB2791.namprd18.prod.outlook.com
 ([fe80::b59e:ff1a:2b2:8acd]) by BYAPR18MB2791.namprd18.prod.outlook.com
 ([fe80::b59e:ff1a:2b2:8acd%5]) with mapi id 15.20.3805.026; Mon, 1 Feb 2021
 03:24:59 +0000
From:   Srujana Challa <schalla@marvell.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        kernel test robot <lkp@intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Subject: RE: [EXT] Re: [PATCH] crypto: octeontx2 - Add dependency on
 NET_VENDOR_MARVELL
Thread-Topic: [EXT] Re: [PATCH] crypto: octeontx2 - Add dependency on
 NET_VENDOR_MARVELL
Thread-Index: AQHW9kItma0ju7ccMUyH3oJnZ5BSeqo+w+Wg
Date:   Mon, 1 Feb 2021 03:24:59 +0000
Message-ID: <BYAPR18MB2791805070BA3E2E8B83CD9DA0B69@BYAPR18MB2791.namprd18.prod.outlook.com>
References: <b1397a30-0018-ac78-2a89-4fc0db1d1ec8@infradead.org>
 <20210129054856.GA20020@gondor.apana.org.au>
 <CAMuHMdWLnB3jUK=1s4bhfJDh-N2kUBuouZg8VSQe57+dL2cGpg@mail.gmail.com>
In-Reply-To: <CAMuHMdWLnB3jUK=1s4bhfJDh-N2kUBuouZg8VSQe57+dL2cGpg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=marvell.com;
x-originating-ip: [103.70.131.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a673158a-7809-43ec-b56e-08d8c660f48a
x-ms-traffictypediagnostic: BYAPR18MB2824:
x-microsoft-antispam-prvs: <BYAPR18MB282469FC841CE5F4C63EE8F1A0B69@BYAPR18MB2824.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gwd2vVqukx6xLPqE/BpariHVib7zJQXn+UM87V5xT/glfwZ9JuU/P0XStksRKVvnlO0meZyZuzj2EjEvAjSc9KWkAbFX46hB/wP4IDuCM4381qajNKwOzeS2rksiCl+gmjpzxDicGqkgE3wk9quyDfuPOtOLDwFtJYn8CRjObvI0TO82OdloLUdFOvQyLn2wqmQHl5fzOXccrTwaeULwcKM5hyY18y6gKw68sJ5A0C0Rh1AVg1M/nii9oDZjPrWkBO+URgHAIe9y6yN6IRWAIcG7iukiwFIAaZfr+wuE6CEZEzjf4cXvD/tI8PXNbLrqcD0AUokdxg0HXdm3i+GXcEYAuog11u0rN9UNWdkxYZkd5B8uo+uAzi5pO6+P46V7JuNfaYIsSrk44lDZi+FYcVPjksqqLSegshRQ9V0M91h5nYiWTMhlo+ycyPDxL/RgGX9wBUQBYH5ptzUhFDODOHc0I+P+3g6jvis7t6ptRb/pbbn86ejZDjR+dLwTBV3p/CK9ZKJ2ephFiIKEjjsdLJDqbms9BSUl5EFoQ6X2RBCFh1RbQ8uq9ZAowr+Q7M3T0W7J9DJMNCXYGq04uRdASyJn7c4jQwfiinziixIzflI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2791.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(478600001)(53546011)(9686003)(8676002)(52536014)(83380400001)(2906002)(26005)(6506007)(33656002)(19627235002)(76116006)(86362001)(4326008)(7696005)(186003)(55016002)(64756008)(71200400001)(66476007)(66556008)(966005)(6916009)(5660300002)(316002)(66946007)(8936002)(7416002)(54906003)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?V0Z3aHJlWUpqVUVuc2RhbHRlekdMTzdHZFJMbUZ1UFdBN2NSQmJ6dHB4S25K?=
 =?utf-8?B?VHhydFdFQWp0R0hRbmMwc0ZKRTlURkd3U2NiSm5zeU8xWUtETXEwdHBBdW5x?=
 =?utf-8?B?eVBwaDVEKzY4S3p0Q09YS2lkKzlVQ2trU3ArSjgrYkwwVTUweHVZK1AvZys2?=
 =?utf-8?B?cStkWitibVhhaTJSelBNaDE4aFB3Y3ZZeld1dFg2QVRWZ1hUT01od1lESi9P?=
 =?utf-8?B?a2VWekdvYzBZV0ZKVGFZL0s5RGlQRWF4ZjEwaElXM1R4c0xHQmdkRWJDSW9C?=
 =?utf-8?B?RGEzUEtKVVdrS1JKT0RFT09PaEdUOVN6akVRS3E1dVA2b29tK0hGNHRmek4y?=
 =?utf-8?B?Z0ZsT0pwdm11b1hCbmtHVC8yVTMzZGl1TXBTRUFncnplaDZpVmlTcHJERFg5?=
 =?utf-8?B?VmZEUTdnL09yZFFtVkpwYW5qdldFZ050OXdER01xUjNkdEY3d0UyQWtKeHpR?=
 =?utf-8?B?T2dVT3ZuRlVGd2IvZXVEMmNPNHViV1lkV00zeHhFcG51ZDFQc1duRUMvSWwy?=
 =?utf-8?B?clFrK3h4TVFEcUZObjBqTVZhc3l3T2R3NlhzdHBFd29rQmw5REZ1Y2R0RVRH?=
 =?utf-8?B?R3NkcWpDNVhPSHRxaEhKWG9VVTlSZ2hvZmNmSkswSC9TMDRLTi94cW1hcUNv?=
 =?utf-8?B?cXVzckhOb2ltR1dkMkF2SWcxR0NpNFR1bVoyNnI1eDVscnU4NkRsbU5tWEhs?=
 =?utf-8?B?Qk9SdkZHcktSS05JaXhsVHVZZjdNcnRBVmQxVnBVSWxVWng4d2pEYjhEd2I4?=
 =?utf-8?B?QTJIeUxBMHE5UWdlUUl0anhwL0dLU1BEMGx2eW1MRnNIRDArWGY4d0xrRGdz?=
 =?utf-8?B?amt2MmZDSE1PUFpYTmdTQkE3MS9XZW1Ma25hRUVhOWY3NjA1L0cxcnBpU1I4?=
 =?utf-8?B?d1FYbUJ0VVZHUVNPV0NMZjJXSjczWmZPd0pQNEFqT0ZQVjVwWTB2ZkRtdnF3?=
 =?utf-8?B?SlMxYUlsQ2xneGt4b25UVkg5eTdmam9zMmNkMlZaUUlFbThNcTJxWmVrVFVk?=
 =?utf-8?B?dU16dWo4R2pweFR5TUJhOGFHc2h0WlhCaFlkcmlRQTdHT1JaQ2d6UXRFSUZw?=
 =?utf-8?B?S00ycVBTSVZFeXhHUmQzRktjSFNzeTVBbnBsZnVTeVlvMnh1NkFwU251cjBL?=
 =?utf-8?B?eWRhZTVxSU82TVVGVVFzaUxJY3pGKzFVTGpOWU1aelc2ejBEVC9md081eHd2?=
 =?utf-8?B?ZjdBZkoxcmovM3huTndESVE4Z3gvU0doc3ZWOG1wTDg0Zm1NRWdxMnM3WHY5?=
 =?utf-8?B?OFdhdHN6RnNPcjdnbUFGN2E3NHhJT29ZVTduelo4d0xleDNnYWdIOWhzY0tX?=
 =?utf-8?B?UUV0d1pFVmsybGp1TllTZWF3OS9uMVhPOTlEdDgxSk0yYXFMMlVsK0ZtZzNn?=
 =?utf-8?B?ZjJqNm9sQ2dBTzVCSWt4MkFxdVcyUEtvcmZtanVmaCtSVHBYL1AyQjFSUXkx?=
 =?utf-8?Q?xe+nvnaq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2791.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a673158a-7809-43ec-b56e-08d8c660f48a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2021 03:24:59.3916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWeU6PfkIiuXYqGPOvdBw0Fy6sZsMNZdaIYhyzojC2Tx0hGl4mwIg1MAEeOQ+u2lOSN4z0ze5YK4pZ5+bC0amw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2824
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-01_02:2021-01-29,2021-02-01 signatures=0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

PiBIaSBTcnVqYW5hLA0KPiANCj4gT24gRnJpLCBKYW4gMjksIDIwMjEgYXQgNjo1MyBBTSBIZXJi
ZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFuYS5vcmcuYXU+DQo+IHdyb3RlOg0KPiA+IE9uIE1v
biwgSmFuIDI1LCAyMDIxIGF0IDA5OjQxOjEyQU0gLTA4MDAsIFJhbmR5IER1bmxhcCB3cm90ZToN
Cj4gPiA+IG9uIHg4Nl82NDoNCj4gPiA+DQo+ID4gPiBsZDogZHJpdmVycy9jcnlwdG8vbWFydmVs
bC9vY3Rlb250eDIvb3R4Ml9jcHRwZl9tYWluLm86IGluIGZ1bmN0aW9uDQo+IGBjcHRwZl9mbHJf
d3FfaGFuZGxlcic6DQo+ID4gPiBvdHgyX2NwdHBmX21haW4uYzooLnRleHQrMHgyYik6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8NCj4gYG90eDJfbWJveF9hbGxvY19tc2dfcnNwJw0KPiA+DQo+ID4g
VGhhbmtzIGZvciB0aGUgcmVwb3J0LiAgVGhlIGlzc3VlIGlzIHRoYXQgdGhlIGNyeXB0byBkcml2
ZXIgZGVwZW5kcyBvbg0KPiA+IGNvZGUgdGhhdCBzaXRzIHVuZGVyIG5ldCBzbyBpZiB0aGF0IG9w
dGlvbiBpcyBvZmYgdGhlbiB5b3UnbGwgZW5kIHVwDQo+ID4gd2l0aCB0aGVzZSBlcnJvcnMuDQo+
ID4NCj4gPiAtLS04PC0tLQ0KPiA+IFRoZSBjcnlwdG8gb2N0ZW9udHgyIGRyaXZlciBkZXBlbmRz
IG9uIHRoZSBtYm94IGNvZGUgaW4gdGhlIG5ldHdvcmsNCj4gPiB0cmVlLiAgSXQgdHJpZXMgdG8g
c2VsZWN0IHRoZSBNQk9YIEtjb25maWcgb3B0aW9uIGJ1dCB0aGF0IG9wdGlvbg0KPiA+IGl0c2Vs
ZiBkZXBlbmRzIG9uIG1hbnkgb3RoZXIgb3B0aW9ucyB3aGljaCBhcmUgbm90IHNlbGVjdGVkLCBl
LmcuLA0KPiA+IENPTkZJR19ORVRfVkVORE9SX01BUlZFTEwuICBJdCB3b3VsZCBiZSBpbmFwcHJv
cHJpYXRlIHRvIHNlbGVjdCB0aGVtDQo+ID4gYWxsIGFzIHJhbmRvbWx5IHByb21wdGluZyB0aGUg
dXNlciBmb3IgbmV0d29yayBvcHRpb25zIHdoaWNoIHdvdWxkDQo+ID4gb3Rlcmh3aXNlIGJlIGRp
c2FibGVkIGp1c3QgYmVjYXVzZSBhIGNyeXB0byBkcml2ZXIgaGFzIGJlZW4gZW5hYmxlZA0KPiA+
IG1ha2VzIG5vIHNlbnNlLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGlzIGJ5IGFkZGlu
ZyBhIGRlcGVuZGVuY3kgb24gTkVUX1ZFTkRPUl9NQVJWRUxMLg0KPiA+IFRoaXMgbWFrZXMgdGhl
IGNyeXB0byBkcml2ZXIgaW52aXNpYmxlIGlmIHRoZSBuZXR3b3JrIG9wdGlvbiBpcyBvZmYuDQo+
ID4NCj4gPiBJZiB0aGUgY3J5cHRvIGRyaXZlciBtdXN0IGJlIHZpc2libGUgZXZlbiB3aXRob3V0
IHRoZSBuZXR3b3JrIHN0YWNrDQo+ID4gdGhlbiB0aGUgc2hhcmVkIG1ib3ggY29kZSBzaG91bGQg
YmUgbW92ZWQgb3V0IG9mIGRyaXZlcnMvbmV0Lg0KPiA+DQo+ID4gUmVwb3J0ZWQtYnk6IFJhbmR5
IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPg0KPiA+IFJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gPiBGaXhlczogNWU4Y2U4MzM0NzM0ICgiY3J5
cHRvOiBtYXJ2ZWxsIC0gYWRkIE1hcnZlbGwgT2N0ZW9uVFgyIENQVC4uLiIpDQo+ID4gU2lnbmVk
LW9mZi1ieTogSGVyYmVydCBYdSA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1Pg0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL21hcnZlbGwvS2NvbmZpZw0KPiA+IGIvZHJp
dmVycy9jcnlwdG8vbWFydmVsbC9LY29uZmlnIGluZGV4IDJlZmJkNzkxODBjZS4uYTE4OGFkMWZh
ZGQzDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jcnlwdG8vbWFydmVsbC9LY29uZmln
DQo+ID4gKysrIGIvZHJpdmVycy9jcnlwdG8vbWFydmVsbC9LY29uZmlnDQo+ID4gQEAgLTQxLDYg
KzQxLDcgQEAgY29uZmlnIENSWVBUT19ERVZfT0NURU9OVFgyX0NQVA0KPiA+ICAgICAgICAgZGVw
ZW5kcyBvbiBBUk02NCB8fCBDT01QSUxFX1RFU1QNCj4gDQo+IFdoeSB0aGUgZGVwZW5kZW5jeSBv
biBBUk02ND8gUGVyaGFwcyB0aGlzIHNob3VsZCBiZSBhIGRlcGVuZGVuY3kgb24NCj4gQVJDSF9U
SFVOREVSIGluc3RlYWQ/DQpUaGlzIGRyaXZlciBkZXBlbmRzIG9uIEFSTTY0IGJlY2F1c2UgdGhl
IHNpbGljb24gaXMgQVJNNjQgYmFzZWQgYW5kIGZvcg0Kb3BlcmF0aW9ucyBsaWtlIGxtdHN0DQoo
W1BBVENIIHYxMCxuZXQtbmV4dCwxLzNdIG9jdGVvbnR4Mi1wZjogbW92ZSBsbXQgZmx1c2ggdG8g
aW5jbHVkZS9saW51eC9zb2MpDQp3ZSB1c2UgYXJtNjQgYXNzZW1ibHkgaW5zdHJ1Y3Rpb25zLg0K
DQo+IEkgc2VlIHRoaXMgZHJpdmVyIGlzIGEgUENJIGRyaXZlci4gQ2FuIHRoZSBQQ0kgZGV2aWNl
IGJlIHByZXNlbnQgb24gYSBnZW5lcmljDQo+IFBDSShlKSBleHBhbnNpb24gY2FyZCwgb3IgaXMg
aXQgYWx3YXlzIGVtYmVkZGVkIGluIGFuIE9jdGVvbiBTb0M/DQo+IA0KPiBUaGFua3MhDQo+DQpU
aGlzIFBDSSBkZXZpY2UgaXMgcHJlc2VudCBvbmx5IG9uIE9jdGVvblR4MiBTb0MgYW5kIG5vdCBh
cyBhIGluZGVwZW5kZW50DQpQQ0llIGVuZHBvaW50Lg0KICANCj4gPiAgICAgICAgIGRlcGVuZHMg
b24gUENJX01TSSAmJiA2NEJJVA0KPiA+ICAgICAgICAgZGVwZW5kcyBvbiBDUllQVE9fTElCX0FF
Uw0KPiA+ICsgICAgICAgZGVwZW5kcyBvbiBORVRfVkVORE9SX01BUlZFTEwNCj4gPiAgICAgICAg
IHNlbGVjdCBPQ1RFT05UWDJfTUJPWA0KPiA+ICAgICAgICAgc2VsZWN0IENSWVBUT19ERVZfTUFS
VkVMTA0KPiA+ICAgICAgICAgc2VsZWN0IENSWVBUT19TS0NJUEhFUg0KPiA+IC0tDQo+ID4gRW1h
aWw6IEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4gSG9tZSBQYWdlOg0K
PiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwLTNBX19n
b25kb3IuYXBhbmEub3JnLmENCj4gPiB1Xy0NCj4gN0VoZXJiZXJ0XyZkPUR3SUJhUSZjPW5Laldl
YzJiNlIwbU95UGF6N3h0ZlEmcj1GajRPb0Q1aGNLRnBBTmgNCj4gVFdkd1ENCj4gPiB6alQxSnBm
N3ZlQzUyNjNUNDdKVnBuYyZtPWRSWUdia2FmTWxtcWpONnJMWmVGWEwwek9BRFROcDZzWWttLQ0K
PiBsSFc0X2NBJg0KPiA+IHM9c2JqSThBcy1iVFRIbU5XOEpLcTAxQVAycWFEQ0FXdVZtSEFPVno3
dEVHSSZlPQ0KPiA+IFBHUCBLZXk6DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQu
Y29tL3YyL3VybD91PWh0dHAtM0FfX2dvbmRvci5hcGFuYS5vcmcuYQ0KPiA+IHVfLQ0KPiA3RWhl
cmJlcnRfcHVia2V5LnR4dCZkPUR3SUJhUSZjPW5LaldlYzJiNlIwbU95UGF6N3h0ZlEmcj1GajRP
b0QNCj4gNWhjSw0KPiA+DQo+IEZwQU5oVFdkd1F6alQxSnBmN3ZlQzUyNjNUNDdKVnBuYyZtPWRS
WUdia2FmTWxtcWpONnJMWmVGWEwwek9BDQo+IERUTnA2c1lrDQo+ID4gbS1sSFc0X2NBJnM9UXYx
TVh4eHllamtoX3FwN0xhVDB4RGlPTDFrTlJ2bzRCUDRMejFnUU1KSSZlPQ0KPiANCj4gR3J7b2V0
amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZQ0KPiB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
