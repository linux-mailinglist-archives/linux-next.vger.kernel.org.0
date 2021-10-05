Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75787421CC9
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 05:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhJEDMj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 23:12:39 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:3232 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229659AbhJEDMh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 23:12:37 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194KwK2Y004130;
        Mon, 4 Oct 2021 20:10:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=te8vefhy8UVpM+qjoZ1eUPKKiezM/fwuWtikVlzDypI=;
 b=ky3OooHjbmldzsMEFHDDtmMmq/jFJIHIUz8HHURaAUGtn3DPnMglcIUC43VJisUUAo2T
 GCUdTGJ5pw/KuEyDoJJff2lyoXVrV5frHISTQAcRoWfgs8TIO19/4ukOawZFU1asVkWW
 S3+EgY+xd7fOndTCzuGChrfggu8FW1s0spA= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 3bg333ux71-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 04 Oct 2021 20:10:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 4 Oct 2021 20:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WahnNPkF3CfuHc5PHqsQZkw78hGt7IwK5rHEhoQNAjKRDJJwPPNUcNpZD0tdOIJ9wpULZ+px62MGDI2LLJYr77WJSVhT4qUkMpQSOJxeS5ndsYJCMaM6086pjjAN2SqNAcgmdIr3E7X0W38RGLa42edkueXYMNRmWul+LsUpWf8JyRtp63x3N7lD/t+w/LgiljX+wFwOdgn8te6CzSu6wrbx0l7s0iUZO3kKje4GGU2kdOn9ZFHhmZkOiPV3w30ievBaObuTdPkrqtjK0U5dBSFSe+TYr2hBo6O5UXDYBJnWxQ2MEMSOCJ10Cl8sKX+NC2odt7RwVLHwVpPYDxce4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te8vefhy8UVpM+qjoZ1eUPKKiezM/fwuWtikVlzDypI=;
 b=itPQuPhyjVWTm7XraeyNwSxwAjkZGSdJq6NLXwokHuHva2yztv2xO0CrUGSDAiroAI67mBE/JGq8+3O2zLEv/+jQG6x7keOFjLUaX5UUaJ9XV1pbbBgaZwSajruBgExuSc6bX5QBdOlJspfBhPue8wyYpeszyU5nqRhL3f5lAPPSsfricbm4raHrj+XHiKcuMzRpUV91N91SFsmEKAt8S0+F4zXT/0XKjlrX+e8iKfJj9uZB0+PRFuQDrA6BzJEZNnHvCuQOgM7RnxTYbh/yZdo1xMrucL4viAb+px3A9xTt5J455jasaEjREeDFkVfZ32sz9wra3RyUw0Vrgk7Wxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from CH2PR15MB3672.namprd15.prod.outlook.com (2603:10b6:610:5::14)
 by CH2PR15MB3560.namprd15.prod.outlook.com (2603:10b6:610:f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 03:10:43 +0000
Received: from CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::1d18:6e02:3723:cd2a]) by CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::1d18:6e02:3723:cd2a%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 03:10:43 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
        "squashfs-devel@lists.sourceforge.net" 
        <squashfs-devel@lists.sourceforge.net>,
        "linux-f2fs-devel@lists.sourceforge.net" 
        <linux-f2fs-devel@lists.sourceforge.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Kernel Team <Kernel-team@fb.com>, Chris Mason <clm@fb.com>,
        Petr Malat <oss@malat.biz>, Yann Collet <cyan@fb.com>,
        Christoph Hellwig <hch@infradead.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Sterba <dsterba@suse.cz>,
        "Oleksandr Natalenko" <oleksandr@natalenko.name>,
        Felix Handte <felixh@fb.com>,
        "Eric Biggers" <ebiggers@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Paul Jones" <paul@pauljones.id.au>,
        Tom Seewald <tseewald@gmail.com>
Subject: Re: [GIT PULL][v12] zstd changes for linux-next
Thread-Topic: [GIT PULL][v12] zstd changes for linux-next
Thread-Index: AQHXuYpmReFLKZ4iPE6r0O7TLtSZr6vDrd2AgAAMNwA=
Date:   Tue, 5 Oct 2021 03:10:43 +0000
Message-ID: <05728E7C-B0D4-4478-B262-800107AC065D@fb.com>
References: <20211005014118.3164585-1-nickrterrell@gmail.com>
 <20211005132659.6774f10b@canb.auug.org.au>
In-Reply-To: <20211005132659.6774f10b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84f40b0b-03bf-431c-b011-08d987adb7ee
x-ms-traffictypediagnostic: CH2PR15MB3560:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR15MB35601F3620DF1E6C4057088DABAF9@CH2PR15MB3560.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J0h5QiHb7DecAFkA2Gga6GYBtFjG2dF9j1Szy9LbSrHbFILDrGA415xWzvM1K5m+HzmRf6o+NaC5huRlwEEleJbN1Q6+ZJoQ0FFQje+N5AlpCoKJWTqUWy1fzz3SgBtvnKJIquGYZA2UXsPPQSA0B2ZmILid+2CmgmgBJEH72w7vWlSxXtAOFqZ8bB8dn9EKiU3mjvJ7nrBPmPlyz3pg0BY/QWoYJDd2tSgX84rbT27pqDU6/EsIojU0BUhwUCoShaqaFstW4KgncKXZGn1uILsRfcDKQtTFxs7fU6NYMGdkH+eFS26rQ2J5njhrAIyotmHSWuMHIdEdpihyJExszNK5MUlfzksKU9dwZlOE0tw3MEOMkdSfr1hlQ2VA+kVHlONj87b4TQ15Km62TKiipixFyCrQzNwqq7h0fPaYwsfYg4l8oeo15NPh4bvkqcXxMMoaO1I9qlGZ1XiBF6fHAgm03zCNYYWvDdYr15phgEyAhtSAcPuSVxkmB9YgorNBVVmwjYYyefzH0nlVo3e9rUe1DQqz0ldtRj68vFiVvQ4MOwYGDO6tsQvQo4e59zAcGOXuWpd3k2ELeU43hw67KecRaJpiOY6heEdOMKijndLJvZm46VxgS+48j8a9ZKtxa+jUSBuVVjJhCrHoeQ3oDiA7vZJaaDLt4yjdwNRZ4C/H5hMBYqcXmp4ExKFEnqWxVyBAoFgRgNa9je9HgR5UP7ZKi9BW8a55LE8H/5C3Vn45plG+skWgKJ5Hmk04LTYSnYDw11Ema9mf2twAujyslXondUvpJjnGAaHdoKeORc4Jy7rr2ha831qFTmMaRFzAplNP/8MK5v7SogIyV/V7oA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR15MB3672.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(4326008)(186003)(38070700005)(6506007)(54906003)(36756003)(71200400001)(2616005)(5660300002)(7416002)(966005)(26005)(83380400001)(508600001)(6512007)(33656002)(8676002)(122000001)(8936002)(38100700002)(66946007)(76116006)(66476007)(91956017)(66446008)(6486002)(2906002)(6916009)(86362001)(316002)(66556008)(64756008)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmYxT2cyTXR5WDV4YVRVZGV5VGJrcVhCeEJtRGJFK2NtZkRKY2VTRDVKUU9n?=
 =?utf-8?B?bUNLU3hsdE9iVnU1WUNUeEtKWjRZY1BHc2NYSjZIUEYwTFRiZEJ2c0cxM3Zy?=
 =?utf-8?B?dXFxWXZyZ1BwTmpnSC93WGg2UDFPL3ZpbEpJMzNmOUdVVC85NEc5MlRlSVF0?=
 =?utf-8?B?K2VxSnJMbVphN2pMSGFqUW04YXlXbXdRYjdybFdsZUYvTTd0RnVoR1ZsRjJl?=
 =?utf-8?B?Nzgyb3d3UUc2SHJTZTV1WEd0QW04bDJKaXZQQUFWekRGb2xNUkUrRnZ3WjMv?=
 =?utf-8?B?WHJYcU55ODZPYmw3RmlCZ1dwWmZEdk5wRnBQbGcvejZNSUtqZzU4ZTNqRDBP?=
 =?utf-8?B?TE4ySVJNTU84N0VXWTBweXJCVUo2K212cTlQU3RoUkZsWU1kcXhRNVhzMGJu?=
 =?utf-8?B?bTl2Vk1nZEFJbnNPbGVrQXY2SFUzSGhzL0ZHY1NwREkwdVR0bHlwWVp2THVU?=
 =?utf-8?B?QjdCb212b0JWSi9HSjU1WlB3Smc4Mlo1SUxxNlIyaWdUektTMU9GN2tIWk1Q?=
 =?utf-8?B?MFpuQnhjNTRqYXVYUmVtc2U2UTRjaTJHRTBRdzdXb3ZnclNCaEtYekVaRVFF?=
 =?utf-8?B?alhFOTl0K3llQ1c5YllZU3dhUWh5L0UyMDN3Qk5xUkluVW1XaThIUis1eHQw?=
 =?utf-8?B?S2tRUFRTNUVmeVBCTldFUUxZeWErZTJhZTg1YzFodmdtZDEzQUhhRTBsRUQv?=
 =?utf-8?B?STIzd01SbkpFUWdPQWNVRHpyb3htOUhBcmRtWG9MSThjLzFhSWRuMDNWcjBD?=
 =?utf-8?B?TmJ4UTI1VjczdU1YVUxvYWsxQWV4MzFTTEZ4NU5YRTl4NmNpeHQwQzRDSE1k?=
 =?utf-8?B?b2MrWXdrT3czaEMybDVNWDAydDdvd3RhUVFlMmRjNkJ5bmUyWFM3aEE1U0JC?=
 =?utf-8?B?UGFsRERiMDZHNnlRalR6Vjh4NFlZcDYvK0JIMm5KbjBWQ2l5STNzOCswQkY4?=
 =?utf-8?B?cm1PS0F5WjRIUWI2WGdYb1ZKNTVlUTBwQXBHSWlGcWxVV1Q2bmtrbTA3UENs?=
 =?utf-8?B?WVZwb0RMeGRXMjdSb2VBb2VQOGNJcTZkZHFBaHRzbDdEY3VubzBmbDBmb25L?=
 =?utf-8?B?dXV5VmR0TENwWTBJUHp3MVFmZm9JbGtpeWdBR21PeXBsN29wKzUwVmovVmFY?=
 =?utf-8?B?RnV4d011WWptL3RpQ2M1bVdidHVOSW1QRTJBMGtCVVpWR29zaUJwTUhSaity?=
 =?utf-8?B?RmplYzVRbWdlYTBrellrek13RmwrbGJXNHpsRTFTZnVYVm1oTXkzeGdVNkdH?=
 =?utf-8?B?c1lsTHFiSHp2VDVZYmpGZG5kRi9sSXo2WC93b0NiSjRvTEJDcFQxN2xaVHZ3?=
 =?utf-8?B?QTFHbDJTN3B6ekRPUWN1SEhyZVBxbmFaT2h3NzZ2VXRtQzdnQksyeWpBNUo3?=
 =?utf-8?B?bWN3alo2RGFCQStRREZZcFlLZXZjbzVLdVdSNklOVmprdGdzY0gzRGs4MlNC?=
 =?utf-8?B?OWNKNDV1anhXeU9MakJ2dzVsd3VHRWxUWnFhTWJVNHlyU2x5NW15Z3VtSEk4?=
 =?utf-8?B?bE9HbTlKTzB6NkZldTRkbmdVWitRbzd3V0V3NUkvdjd2RlIxYWNWd0xvMm8z?=
 =?utf-8?B?cmVrTGVYQ3VEQ0p1K215dWRGZEVmRVZpdWpRMUNhQnZlR0p2Qnp4dEszSEpW?=
 =?utf-8?B?T0Y3OElXMHVLQ1ZpZjdoZytmUGlKWTV0Y0xIT0E5K0F3bWptUHhpWVY4VTJ3?=
 =?utf-8?B?eE5CVEdkempqcDNsZG05S3NmM2tUanlnc2habE8zZGN3dnRmWklPU2wxT3lz?=
 =?utf-8?Q?pXmofM0faywouLYkdaNJYDwUbjhVjuCwANayBTs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D5C2DF70EFD034FBC14835C5E7CC368@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR15MB3672.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f40b0b-03bf-431c-b011-08d987adb7ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2021 03:10:43.2372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3O5u9KXcqv9xE+gE07cPo8DOdixPPAYXttsGFQtA4q8n0x7PaAxDIZ12Vl5f+oe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR15MB3560
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: _hxy3K63S23NZ_bCJgtOSBHDLz7kXLEr
X-Proofpoint-ORIG-GUID: _hxy3K63S23NZ_bCJgtOSBHDLz7kXLEr
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110050016
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCj4gT24gT2N0IDQsIDIwMjEsIGF0IDc6MjYgUE0sIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBj
YW5iLmF1dWcub3JnLmF1PiB3cm90ZToNCj4gDQo+IEhpIE5pY2ssDQo+IA0KPiBPbiBNb24sICA0
IE9jdCAyMDIxIDE4OjQxOjE4IC0wNzAwIE5pY2sgVGVycmVsbCA8bmlja3J0ZXJyZWxsQGdtYWls
LmNvbT4gd3JvdGU6DQo+PiANCj4+IEZyb206IE5pY2sgVGVycmVsbCA8dGVycmVsbG5AZmIuY29t
Pg0KPj4gDQo+PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGEyNTAwNmE3NzM0
OGJhMDZjN2JjOTY1MjBkMzMxY2Q5ZGQzNzA3MTU6DQo+PiANCj4+ICBBZGQgbGludXgtbmV4dCBz
cGVjaWZpYyBmaWxlcyBmb3IgMjAyMTEwMDEgKDIwMjEtMTAtMDEgMTc6MDc6MzcgKzEwMDApDQo+
PiANCj4+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPj4gDQo+PiAg
Z2l0QGdpdGh1Yi5jb206dGVycmVsbG4vbGludXguZ2l0IHRhZ3MvdjEyLXpzdGQtMS40LjEwDQo+
PiANCj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA1MjEwY2EzM2IwOWJlZDVlMDlm
NzJlOWI0NmEzMjIwZjY0NTk3ZjhjOg0KPj4gDQo+PiAgTUFJTlRBSU5FUlM6IEFkZCBtYWludGFp
bmVyIGVudHJ5IGZvciB6c3RkICgyMDIxLTEwLTA0IDE4OjE0OjQyIC0wNzAwKQ0KPj4gDQo+PiBJ
IHdvdWxkIGxpa2UgdG8gbWVyZ2UgdGhpcyBwdWxsIHJlcXVlc3QgaW50byBsaW51eC1uZXh0IHRv
IGJha2UsIGFuZCB0aGVuIHN1Ym1pdA0KPj4gdGhlIFBSIHRvIExpbnV4IGluIHRoZSA1LjE2IG1l
cmdlIHdpbmRvdy4gSWYgeW91IGhhdmUgYmVlbiBhIHBhcnQgb2YgdGhlDQo+PiBkaXNjdXNzaW9u
LCBhcmUgYSBtYWludGFpbmVyIG9mIGEgY2FsbGVyIG9mIHpzdGQsIHRlc3RlZCB0aGlzIGNvZGUs
IG9yIG90aGVyd2lzZQ0KPj4gYmVlbiBpbnZvbHZlZCwgdGhhbmsgeW91ISBBbmQgY291bGQgeW91
IHBsZWFzZSByZXNwb25kIGJlbG93IHdpdGggYW4gYXBwcm9waWF0ZQ0KPj4gdGFnLCBzbyBJIGNh
biBjb2xsZWN0IHN1cHBvcnQgZm9yIHRoZSBQUg0KPiANCj4gU29ycnksIGJ1dCB5b3UgY2FuJ3Qg
YmFzZSBhIGJyYW5jaCBvbiBsaW51eC1uZXh0IGl0c2VsZiAoc2luY2UNCj4gbGludXgtbmV4dCAt
IGFuZCBtYW55IG9mIHRoZSB0cmVlcyBpdCBtZXJnZXMgLSByZWJhc2VzIGV2ZXJ5IGRheSkuICBJ
Zg0KPiB5b3Ugd2FudCBhIGJyYW5jaCBpbmNsdWRlZCBpbiBsaW51eC1uZXh0LCBpdCBuZWVkcyB0
byBiZSBiYXNlZCBvbiBzb21lDQo+IHN0YWJsZSB0cmVlL2JyYW5jaCwgYWxtb3N0IGFsd2F5cyBM
aW51cyBUb3J2YWxkJ3MgdHJlZS4NCj4gDQo+IEFsc28sIHdoYXQgSSBuZWVkIGlzIGEgYnJhbmNo
IHRoYXQgSSBjYW4gZmV0Y2ggZXZlcnkgZGF5IChzbyBpdHMgbmFtZQ0KPiBtdXN0IG5vdCBjaGFu
Z2UpIGFuZCBhbGwgeW91IGRvIGlzIHVwZGF0ZSB0aGF0IGJyYW5jaCB0byBhbnkgbmV3ZXINCj4g
dmVyc2lvbiBpZi93aGVuIHlvdSBhcmUgc2F0aXNmaWVkIHRoYXQgaXQgaXMgcmVhZHkgZm9yIG1l
cmdpbmcuDQoNClRoYW5rcyBmb3IgdGhlIGhlbHAhIEFuZCBzb3JyeSBmb3IgdGhlIG1pc3Rha2Us
IHRoaXMgaXMgbXkgZmlyc3QgdGltZSBzdWJtaXR0aW5nIGENCmJyYW5jaCBmb3IgbGludXgtbmV4
dC4gSeKAmWxsIGNyZWF0ZSBhIG5ldyBicmFuY2ggYHpzdGQtMS40LjEwYCBhbmQgcmViYXNlIG9u
IHRvcCBvZg0KdjUuMTUtcmM0LiBUaGVuIHJlc3VibWl0IHRoZSByZXF1ZXN0Lg0KDQo+IEFsc28s
IEkgd291bGQgbGlrZSBhIGdpdCBVUkwgdGhhdCBkb2VzIG5vdCByZXF1aXJlIGEgZ2l0aHViIGFj
Y291bnQgLi4uDQoNClN1cmUsIGRvZXMgdGhlIFVSTCBodHRwczovL2dpdGh1Yi5jb20vdGVycmVs
bG4vbGludXguZ2l0IHdvcmsgZm9yIHlvdT8NCg0KQmVzdCwNCk5pY2sgVGVycmVsbA0K
