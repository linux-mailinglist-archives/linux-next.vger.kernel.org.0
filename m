Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14F1D84C49
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 15:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387981AbfHGNDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 09:03:45 -0400
Received: from mail-eopbgr780073.outbound.protection.outlook.com ([40.107.78.73]:21632
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387476AbfHGNDm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 09:03:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmTfZKjRV7zn55ctbiVj1DWjofMow68CvEoYer8K2mXmfhzaat0rFFk4WVTDfPRxbUq0Ll+LcmNa9x14+KT0sfhEMupUW+BUSS4icRZjZ11M9doGrAsEmlvRTHFwJ9rzyCPzt3+3CQECOpqd8bfMt0i5qCyGXDpEhCJaQcyySTKlu3cN1ZuvzDR51YLoeD/RIaDdbyltoO8NuKlF6bBXy7lyxxua52PnhIKGJUK2M4gzAe/HxJ/WSrnw5pdbnjy+dBYRUKVBMOwfQlyLX/hUzffvVN43PDukhOuYc/E0RKWb9wkCxynqgQPc6ISVHfOdmXYo5TG/eTnexrGD+PSddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2XtwSZInIso1Lu1ApmcV8ZoHr/M/pfw5F332XjUE+0=;
 b=S7Ymr90ApaqkKBMxwsOqnORAZMz2VA5P12UiN2KHM+jhXmE91jwK+KXmfUwp4AytRzNIHv1KUIz0Ul4r87p3ScRVXl6mihAxsXc6mEwZUXSRsPsC4TCzeCiexwuQaic+uAZQwJF9XTJ1IMJQfe83e5W4CLxAvgA0NpJsqynvh9kZc6ZnB9b+WlLr+LWhd5L+EdkBi74iwaY0oD9O+M3FWPf3Mv9tJ8DHcIrvKSD2R5u11tfNQRS3o8VNSNNqSZvhJImzydJXihd/6KQH6xAklk+Ct0qdqE1/Pr85H15xf0J5dPTu4ZkSia70PNnaS4rNEsPU+3gD2nsB/v/bXomzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2XtwSZInIso1Lu1ApmcV8ZoHr/M/pfw5F332XjUE+0=;
 b=HWhjbpo+fc0OefqyDFMOK/ZLKEzSnMWoGW4IvFO9mYOkGou70tWZyy29KXHFZ2XD8zOI6VcmDMEc8YtvzDcOHz+ZGL+Uuk76DHgzUx2nx8W6L1Xi1S0AU3+7bK6I6Et0lPgqfvHX9lsSD1qwwf8n+nngEMWSXMz5/tncyawqK4Q=
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1532.namprd12.prod.outlook.com (10.172.35.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 7 Aug 2019 13:03:00 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 13:03:00 +0000
From:   "Koenig, Christian" <Christian.Koenig@amd.com>
To:     Christoph Hellwig <hch@infradead.org>
CC:     "Zhou1, Tao" <Tao.Zhou1@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>,
        "Li, Dennis" <Dennis.Li@amd.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-build-reports@lists.linaro.org" 
        <kernel-build-reports@lists.linaro.org>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Thread-Topic: [PATCH] drm/amdgpu: replace readq/writeq with atomic64
 operations
Thread-Index: AQHVTMvE140hqrZvSkOTllezqlrDj6bvREIAgAAdQoCAAB4dAIAAA9yAgAAjKYCAAACbgA==
Date:   Wed, 7 Aug 2019 13:03:00 +0000
Message-ID: <c613ca25-4443-f275-ea8d-6d55af10ac77@amd.com>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
 <20190807130043.GA6023@infradead.org>
In-Reply-To: <20190807130043.GA6023@infradead.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::31) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d52bfc9-9f3c-4fd2-f9a5-08d71b379304
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DM5PR12MB1532;
x-ms-traffictypediagnostic: DM5PR12MB1532:
x-microsoft-antispam-prvs: <DM5PR12MB1532FC2449104408BF32B6A183D40@DM5PR12MB1532.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(199004)(189003)(486006)(256004)(2906002)(6116002)(6506007)(81156014)(186003)(81166006)(65826007)(64126003)(7736002)(8936002)(71200400001)(36756003)(71190400001)(8676002)(305945005)(476003)(46003)(11346002)(446003)(14454004)(2616005)(31686004)(4326008)(478600001)(66476007)(65956001)(25786009)(102836004)(58126008)(54906003)(66556008)(64756008)(66446008)(53936002)(6246003)(6916009)(386003)(6436002)(5660300002)(86362001)(99286004)(31696002)(68736007)(6486002)(316002)(76176011)(6512007)(229853002)(52116002)(66946007)(65806001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1532;H:DM5PR12MB1546.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zHbxM2ddq0XAWqKFvzaWjAjiqKTGgz2BVi/gb5lhsnzoAVvLjR/80gKcmBWqEg2jj5g51b9tmwbfOPBcQWfj0uDBNETa9cvdIIL6vM/sQmEvXl0vxjPW+7fx0C9pzri0RoYNFAemDa/YiSPfLUQrHTY1r5PjDUg6MnQ+5LA7pg9nQVesaHFmf4p6SkiRMMn24PSoQIyVTErWH5dl5u9+qpkFFMW2v+Yp2waV27XGjJAAuxpaLKcuAuZnjqO6Ls1BhXs/xTxI3dehG12dmGD/iVWFhXdfxorY0dQi3np4jH0JXC0lQGwhi34eAW7IMcAKmVRsjIWpt+fL4zBUiqd1VYheLyNCjx5xWOPozZ7SuSLISGuGKivkATwOLgMlBYfAklh69PL+tCJ4lycu0dZzfRb9ljNfl3sWoEgVwfOtPv4=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94B9D56BFBAC0F478C55FC9E5310D657@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d52bfc9-9f3c-4fd2-f9a5-08d71b379304
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 13:03:00.2201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

QW0gMDcuMDguMTkgdW0gMTU6MDAgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gV2Vk
LCBBdWcgMDcsIDIwMTkgYXQgMTA6NTU6MDFBTSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6DQo+Pj4+IEVzc2VudGlhbGx5IHdyaXRlcS9yZWFkcSBkb2Vzbid0IHNlZW1zIHRvIGJlIGF2
YWlsYWJsZSBvbiBhbGwNCj4+Pj4gYXJjaGl0ZWN0dXJlcyBlaXRoZXIuDQo+Pj4gd3JpdGVxL3Jl
YWRxIGFyZSBwcm92aWRlZCB3aGVuZXZlciB0aGUgQ1BVIGFjdHVhbGx5IHN1cHBvcnRzIDY0LWJp
dA0KPj4+IGF0b21pYyBsb2FkcyBhbmQgc3RvcmVzLg0KPj4gSXMgdGhlcmUgYSBjb25maWcgb3B0
aW9uIHdoaWNoIHdlIGNhbiBtYWtlIHRoZSBkcml2ZXIgZGVwZW5kIG9uPw0KPj4NCj4+IEkgbWVh
biB0aGF0IEFSTSBkb2Vzbid0IHN1cHBvcnQgNjRiaXQgYXRvbWljIGxvYWRzIGFuZCBzdG9yZXMg
b24gTU1JTyBpcw0KPj4gcXVpdGUgYSBib29tZXIgZm9yIHVzLg0KPiBUaGUgbW9kZWwgaXMgdG8g
Y2hlYWNrIGlmIHJlYWRxL3dyaXRlcSBhcmUgZGVmaW5lZCwgYW5kIGlmIG5vdCB0bw0KPiBpbmNs
dWRlIHRoZSBvbmUgb2YgaW8tNjQtbm9uYXRvbWljLWhpLWxvLmggb3IgaW8tNjQtbm9uYXRvbWlj
LWxvLWhpLmguDQo+IFRoZSByZWFzb24gZm9yIHRoYXQgaXMgdGhhdCBoYXJkd2FyZSBpcyBzdXBw
b3NlZCB0byBiZSBhYmxlIHRvIGRlYWwgd2l0aA0KPiB0d28gMzItYml0IHdyaXRlcywgYnV0IGl0
IGRlcGVuZHMgb24gdGhlIGhhcmR3YXJlIGlmIHRoZSBsb3dlciBvciB1cHBlcg0KPiBoYWxmIGlz
IHdoYXQgY29tbWl0cyB0aGUgd3JpdGUuDQoNClJlYWQsIGJ1dCBhcyBJIHVuZGVyc3Rvb2QgVGFv
IGNoYW5nZSB0aGlzIGlzIG5vdCB0aGUgY2FzZSBoZXJlLiANCk90aGVyd2lzZSB3ZSB3b3VsZCBq
dXN0IHVzZSBvdXIgV1JFRzMyL1JSRUczMiBtYWNyb3MgaW4gdGhlIGRyaXZlci4NCg0KVGFvLCBw
bGVhc2UgZXhwbGFpbiB3aHkgZXhhY3RseSB3ZSBuZWVkIHRoZSBXUkVHNjQvUlJFRzY0IGNoYW5n
ZSB3aGljaCANCmNhdXNlZCB0aGlzLg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gVGhlIG9ubHkgMzIt
Yml0IHBsYXRmb3JtIHRoYXQgY2xhaW1zIHN1cHBvcnQgZm9yIHJlYWRxL3dyaXRlcSBpcyBzaCwN
Cj4gYW5kIEkgaGF2ZSBkb3VidHMgaWYgdGhhdCBhY3R1YWxseSB3b3JrcyBhcyBleHBlY3RlZC4N
Cg0K
