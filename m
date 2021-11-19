Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB7C4576A5
	for <lists+linux-next@lfdr.de>; Fri, 19 Nov 2021 19:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhKSSsw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Nov 2021 13:48:52 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:57516 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230399AbhKSSsw (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Nov 2021 13:48:52 -0500
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJHMW2c011984
        for <linux-next@vger.kernel.org>; Fri, 19 Nov 2021 10:45:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=jMaBJzZk6PtqPpmftinUd4nqa2Y1dgJqZGzFz5eTPIY=;
 b=c+JN1JWNCIOTnSWSghfLrNek3nQXlC3UB/n61H7ddDO7k8JdkzFcmnVno+j7mc6oc8O4
 sjnGC3nYy6oscyX7cDXUs6uFnK/maijEUpn5TDk+6K9kKFMec1LcQLdBRP1SAOAZGxbe
 zPfPT6NEAe0TyUPE4FwnOu/sPaqZi5+e9DQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 3ce5e14x36-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 19 Nov 2021 10:45:49 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 19 Nov 2021 10:45:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P57oTxRy2VfvJn3OxTU69hIC5LbLIpMAIAltNyO/Dw9svLlmylemnXsQHtBHhlo+8kLKRqQXE7O1QIOARwDsp/tfrE1gDDs8qOenQYKn7Bl2QWGBBpVEsmeQbbOKkMYEuPpcziyt69twEcqy4I9g4aSHkX5iWkARlbBoqX70gguidyeRyk8g9tfupsjsk099friiMBJrlNopzQcwn7PAYTlNrWmgjzFjUoKBEi9ZCjl+ejTjjGs/1Z6XWXlNLiLJPx5am4NmvMncsJxYJhPKwfWBAuirjYtNax1Uk9N60RjBXXPqbEAkDUE6BaRp/8IIMuvc4WsyHk6p0NtOB9VqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMaBJzZk6PtqPpmftinUd4nqa2Y1dgJqZGzFz5eTPIY=;
 b=KO8dvzY3KiGKL+LkpKvdjXbAe0FPR5irgeUNvGFaF9BssokpDlZ/YFsudDo7HIzj6q8wyo3+wzmv99DUvO8El/b0sPB/5Hn80ovrtMhL1/18gRSeGbUn5t/JjxsodL6Vech44KygQ+8PKHjzuJqEmu8gKeQTwU/1dLrOL190/qGyG7JGp7fuO6xtrG1kUX5MfXGOb94l1Nd1xjnk4Dutq9fK7ltWCuTuuabb4BOgf0M94B9Wimc+Z8wL9zf20tpuYeocYN8lswEl1wEUHf8kd6mmui7+gM93iI6V0bXtGIS7hQpjzZK4uwi5Wg6hujjeVASXxzIc2cSp/zcWcNBBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BY5PR15MB3715.namprd15.prod.outlook.com (2603:10b6:a03:1fe::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 18:45:47 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4%6]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 18:45:47 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Zstd linux-next branches
Thread-Topic: Zstd linux-next branches
Thread-Index: AQHX3XWqQC1h8kFtL0aBS6rXKZEZ8Q==
Date:   Fri, 19 Nov 2021 18:45:47 +0000
Message-ID: <024447A0-35EE-4E8F-819A-675328A7A96C@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 213144b7-ad7b-4b15-e4c0-08d9ab8ccd28
x-ms-traffictypediagnostic: BY5PR15MB3715:
x-microsoft-antispam-prvs: <BY5PR15MB37150254CB6FF0684EF4D596AB9C9@BY5PR15MB3715.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k/O80V7MiUlQxYxXMI8ozT2ytFya7q5Uqq9MGapgDyMW+BemdtZESN6lftSeaGSeU8DnCQb/UhlJX6xYGcsKsv7huxmYeufgrZYv0KYI6PYV99flWBtyMrBK5ZOcsAV08lQhnQ1SHx8IMotZ3cuyIDxPSGc7bxlrsMDqQj+BN1jGISN9oae7NDOyqdq74ac0WdOAB1x24bYXmXYH1x6+SqylAPw3F7nOt+zz6MiXzC0fCIFqOif0oz/0zk1JTRO5s+laDIFHhJKMP0IMWYC/mS/gMVEvbXI8vlocnxBpf7wnIyoAZQ5wC1hgUwtkKjbaMD5xBgPE1ce6wuPPQEEvP27hoaxMerowLwl60Nr4gj3yy3EOAvz0KxXBcYIo7JKTgc5kwHDTYjxvHoeWzRIGHamE0qXT39e5l2OCkx276P/E7QWClpGOHGQCBaLduYFhc9FBnftP5Ppx84xTNAM23q/82ciMrjbE7qqMhfOVbRDWdiBlA6V5dviiqRcw1wlE1Tz3ramTMN9JkchUlK9bWY8DhP/2xxD3bslCKvEdZ8Fsas7+wrLa6vjChjgGL99+Rsl3oYNgK7i+ILGq+gooxUlHHuccfomG8Qy7Os4epLHxCq3HsgHwVhb4KdyakVglP24EhkWY8HE7MPRYKSmriO+wFunUftIJ6/t8PE/ZagicwfZzstkVBgYn8uClpbi+4Wyuc5BstCyv9NMtk2m9SMtJFmuUXVAk9uDL6/EM+/Gr0fwvnAzPxcMyvG+DpvpM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(6486002)(4326008)(86362001)(5660300002)(64756008)(33656002)(38100700002)(2906002)(3480700007)(6512007)(91956017)(66446008)(66476007)(66556008)(71200400001)(8676002)(186003)(6506007)(66946007)(76116006)(36756003)(2616005)(8936002)(4744005)(508600001)(316002)(6916009)(38070700005)(122000001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzZLaTRpeU9aMnQxekJzQk9MT2E2ZUJTRzVEWUNYeTh6STVaQysvNGhZdWtB?=
 =?utf-8?B?RjVWRFRud3VZL1ZFcmxEZFJnaGR0d3Zra1ViUXhqcDlMUzZyMnppampsemlh?=
 =?utf-8?B?V0VqSld3dmh2d2ZhY1VVTDdnS0MxOWxGRW9GZzRITUhBdmQzSy9OQzdCNTVQ?=
 =?utf-8?B?clFKQ2t5Tzl4ck1QM05tUkN4aHAzUER1d2hrWkgrcWJEcjFkRXB2ZWhyS1dD?=
 =?utf-8?B?c2NTbkkxcmRYTy9Kb0Z3TGZ0MHcvZEN3UmlyR2hYemZPcmFCZkRBaDNEWXkz?=
 =?utf-8?B?bDcvbFY5T1BRZ3ZpTlA5cjFaZnUyOER1NXhmOGhEMEdaR0tYTGFVbFlqNDVk?=
 =?utf-8?B?S2kvcUNQc3gvMlM1MTREaVhDOEc5ZE5heDZ2ODZjU2E3SW5neHVlWHhZNS9p?=
 =?utf-8?B?V0YrazJwNEVZQkVHUXBJaC9tREFqaENESkNscHNKS1ZFY0IrVnJrU24yQytR?=
 =?utf-8?B?RVcwZGd1Z0VPTzdVNHBVU0FxU0tYV1dGMUtUS2gvaGJYQ0FldG5BKzdpVCsz?=
 =?utf-8?B?bzA3dFZ2NXdoRUxTY25IZjZ0NlhvWXhxcjNQb3VGNm5YVEYrbGZrVnk0ODNm?=
 =?utf-8?B?dWl3bVpZaGUvcTBEWWpRWFYrclRvM3Z1eXdaeEthb1NpNnk4NklxUlY4NGha?=
 =?utf-8?B?VXM5azJwdHEwZFpDUWg1NnoxNHJVU3pEKzdtOVBITDlxcGp4OWk2SjR6MkxJ?=
 =?utf-8?B?bWpZeEJCbUg3VzRSSGhYZlR0ODllNnYyMFV6TkNla1N1TWRpUSsrTTM1VlZQ?=
 =?utf-8?B?dkFGMFA4eXFFTjloYkJ2eXp2ZjNPeHQrN2c2MGtpSk8yazN1U1V5dVkwc1ht?=
 =?utf-8?B?ZEZmZDR3NHF1SUJyKzc1Wk9DMytVYXNOcU4zZDVobkFqL1NRbG5ta3JmWmYr?=
 =?utf-8?B?ZmNiM29NOGJocnBMTnZPYjJ0ODMzMHJ0MG5ZZS93WmRMekpRWW1DeVN2ZGdV?=
 =?utf-8?B?RFZxM2hIYjJ5dm1uc08rdVpxOVZXenpTeklFOHgrWENRMEREVGg0ZVBmc2s4?=
 =?utf-8?B?cEtNb3FreEZqZWhmOFJxWE5TOGZ6OTRGbWpGR3lQT3RQb1M2ZHEvdTlvQUZR?=
 =?utf-8?B?cXAzMnJaS011UUFpMTdmY1ZvaE1QQ1p1c1ltT2xmb2cvdUx5TVpYTTBuNHBo?=
 =?utf-8?B?Mmk3K0FqdmpNY29taVlZUzF2d2U2QllURHYvUjZNUlgyaU9jb0wwQjE4dDhK?=
 =?utf-8?B?U0Z2OGh6Z1dVTVdHaE5QMVVtdmJHT3BoZ05iUW9RZFM3ZkxINHMrWSs5UFAv?=
 =?utf-8?B?SG1PbFZ2VFVlVE9xcVVDUTIwMmg1UHpjay9vL0FIQW9yMTZQTDZkZTdsUzRE?=
 =?utf-8?B?NE0zaWhKYm45cXpsQ29LVFg0VENyRGFQZWw0Mm1hL0dWSkZXQUN5dXRmYjJ3?=
 =?utf-8?B?UC9qUW9aUDg5UFdBUkVvdHh2OVR5a3ZNcWNNNEJiOTdHalhZUnZuL0dpTE9y?=
 =?utf-8?B?WVBrZ1NjUkpkc2NjMktBdTdsOTRPTkpiOWk0elBQTmlteXVZVVhJaUJZVjZY?=
 =?utf-8?B?QkRsMEZ5MUs5M0xLSVNuZlNyWkc4c2t1UEQrLy9BbnluemkxaTdtTlRpYkIx?=
 =?utf-8?B?N0hWb0pUZ243d3RuVkh2V0RseFdKUDltRTB5KysxQUd3U21tU01mUUhLZnE2?=
 =?utf-8?B?Mm5PQkVCb3Z5YXI4T1AwbVdOUDJXcnVRcGpZQzhpWk5oWXZLR3h1dEY2bDNv?=
 =?utf-8?B?cXNzcHMxZlJmSUpsTWJXMGZhQ3RLV2h4ZlAzY0RGRmd0WHhnOXZYcGpPUkxo?=
 =?utf-8?B?TXRkVjgvOWRDT1oxUWt3ZHZMUmRsQ2EzRithMklSQ0x5RXRTMXFDZlZ2NVhn?=
 =?utf-8?B?aVU3dVFTemVaWUp6NFRwOVRtNm9yZEpMd2NidlAzQmg2Y2Jhc1pvVkFueU9Q?=
 =?utf-8?B?YUQ2SEZYRkpZcDBTdVZkQUFiU00yWHVlK0lvSTVjZFI5Y3g5UmxwNjlCOHZK?=
 =?utf-8?B?aWFNM0E4R3g3eDI0RklRTkRRWS9NMG5Tak80a2NzdzgveWFTZlp4LzgwL2hm?=
 =?utf-8?B?RW90VHlLUTZmNnczUk5UbzBHSC9ub1UwMHJUbHJEV1JqTVhjakxBWTJTN1VV?=
 =?utf-8?B?Mjk2OTRZd0xUK0kvYkNkZk9Pdmw2WkViT3Y5SUhndGJ5b0xuL2dVcEdTRnNy?=
 =?utf-8?B?ZkEwT28xbzRobXU0L3ZzYUpnQ2JJZEhnOVFncExmMkVvajZaWjIyMHRyMWUy?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4A95E560B47694BB3DB4D2EA84A187D@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213144b7-ad7b-4b15-e4c0-08d9ab8ccd28
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 18:45:47.3637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cs1Bk6A5RaJApPG4AEhzlKzGOSm3kZcdo0pLErimJOBFOLri5/+dtEERCiuvzc12
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3715
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: V1TD_06qk-OWShvHh5C_jwZFHqvCHn2G
X-Proofpoint-GUID: V1TD_06qk-OWShvHh5C_jwZFHqvCHn2G
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_14,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=564 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190100
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KV291bGQgeW91IHBsZWFzZSBhZGQgdGhlc2UgYnJhbmNoZXMgdG8gbGlu
dXgtbmV4dDoNCg0KICBnaXQ6Ly9naXRodWIuY29tL3RlcnJlbGxuL2xpbnV4LmdpdCB6c3RkLW5l
eHQNCiAgZ2l0Oi8vZ2l0aHViLmNvbS90ZXJyZWxsbi9saW51eC5naXQgenN0ZC1saW51cw0KDQpB
bmQgcmVtb3ZlIHRoaXMgYnJhbmNoOg0KDQogIGdpdDovL2dpdGh1Yi5jb20vdGVycmVsbG4vbGlu
dXguZ2l0IHpzdGQtMS40LjEwDQoNCkFzIEnigJl2ZSBiZWNvbWUgbW9yZSBmYW1pbGlhciB3aXRo
IHRoZSBsaW51eCB3b3JrZmxvdywgSeKAmXZlDQp1bmRlcnN0b29kIG15IG1pc3Rha2UgaW4gbmFt
aW5nIHRoZSBicmFuY2ggenN0ZC0xLjQuMTAuDQoNCkkga25vdyB0aGF0IHlvdSBwb2ludGVkIGl0
IG91dCB0byBtZSBoZXJlOg0KDQo+IFRoYXQgc291bmQgZ29vZCAob3IgeW91IGNvdWxkIGp1c3Qg
Y2FsbCB0aGUgYnJhbmNoIHpzdGQtbmV4dCAtIHVubGVzcw0KPiB0aGlzIGlzIGEgc2hvcnQgdGVy
bSB0cmVlIHRvIGp1c3QgZG8gdGhlIHVwZGF0ZSBhbmQgbm90IG9uZ29pbmcgd29yayBvbg0KPiB6
c3RkIGluIHRoZSBrZXJuZWw/KS4NCg0KQnV0LCB1bmZvcnR1bmF0ZWx5IEkgbWlzc2VkIHRoYXQg
ZW1haWwgdW50aWwgYWZ0ZXIgdGhlIHpzdGQtMS40LjEwDQpicmFuY2ggd2FzIGFkZGVkLiBTb3Jy
eSBmb3IgYWRkaW5nIG1vcmUgd29yayBmb3IgeW91IQ0KDQpBbHNvLCBJIHRoaW5rIEnigJltIGFz
a2luZyBmb3IgdGhlIHJpZ2h0IHRoaW5nIGhlcmUsIGJ1dCBpZiB5b3UgdGhpbmsNCndoYXQgSeKA
mW0gYXNraW5nIGZvciBkb2VzbuKAmXQgbWFrZSBzZW5zZSwgcGxlYXNlIGxldCBtZSBrbm93IQ0K
DQpUaGFua3MsDQpOaWNrIFRlcnJlbGw=
