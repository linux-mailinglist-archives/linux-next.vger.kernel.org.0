Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E843784A2B
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 12:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfHGKzI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 06:55:08 -0400
Received: from mail-eopbgr730078.outbound.protection.outlook.com ([40.107.73.78]:9040
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726686AbfHGKzH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Aug 2019 06:55:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENoD+yMehG25v9QSulmK8b8tpTrUBSAiH614CHYlEKR0yhv3Bd6oC1eYQS0f7YRUC4XhHKwuhG2enZUgV+hrKqg4mcRU1SRzHrPaEHFFu55I91Jg+QY79rH7Y3XS6vEnxLT/yFmnlRExzwx2qFXaooO56O0yHiwdZsAs0sPY9zX/n3qjKyX4aw2KAL5ZFQTSKPDq/0yaxvEkrgsW3E0TaID3t7AlQm4vNXDk0+YyU+2QQpnwUA8MBBXWrGusPviCCp8skrsbdDZ+vNrmH/7o3gUiO4DtsYECGyXSpYAJefYHPnj/iJrkLvgcKrdrnF1A23uxXQG5As8De2i7UVp4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EORylzvgMSTu1Kizarvs2NiqOnNmzDynNiBGI83gx4=;
 b=M9l9Xjj8yZjmgCFIBMb6XbMURXuJce5Hdy1AmpZu96Q7HTryRG0pfHH4uG6tcRxF+8UlKRKcARlLkaX+qCxEmGAA8J1sh96HlTiCt4HicrTXlj3TSBF8/Gz0iL5BxWaKuAdZkvslGnkHdfFLd+GbrTeYN7ju63Al8h9jDPftRMh8OiYXxBgRjxIUkiFREWUpHKhRkms17R099XGLCXu2hJN7JS2o4t4YRljVClXNhMm54UmE8q24+cZjffw9YqUhYUMA/YTbRvQrZTmUcOuGRAoklOvrXM2VY4SFsSu6mTuSDclcnGdeWbUqJR95Li7T6I0yAMw/lC03A561d6uNcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EORylzvgMSTu1Kizarvs2NiqOnNmzDynNiBGI83gx4=;
 b=Bf5pxvIGN1eaNia/hiOgDkcN7I5JGNxuW8dLWezw0m82zP0fXf2bENXS1iEVphdAfnsJKzYodFHEw8PRwxmD94AN2JUxI9ssdS80RHS9pifpVjXfLunJ/kwDgh4BTm0imWD9WwLqgn2iUXhIxmOEjALAUg0eTzXasoS+stsJJnY=
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1659.namprd12.prod.outlook.com (10.172.40.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 10:55:01 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 10:55:01 +0000
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
Thread-Index: AQHVTMvE140hqrZvSkOTllezqlrDj6bvREIAgAAdQoCAAB4dAIAAA9yA
Date:   Wed, 7 Aug 2019 10:55:01 +0000
Message-ID: <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
In-Reply-To: <20190807104104.GA18773@infradead.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::13)
 To DM5PR12MB1546.namprd12.prod.outlook.com (2603:10b6:4:8::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10d059da-019e-4f50-36a8-08d71b25b1e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM5PR12MB1659;
x-ms-traffictypediagnostic: DM5PR12MB1659:
x-microsoft-antispam-prvs: <DM5PR12MB1659E473D433B22B3F8EA17F83D40@DM5PR12MB1659.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(7736002)(6246003)(6506007)(86362001)(64126003)(478600001)(53936002)(102836004)(2906002)(71200400001)(25786009)(4326008)(8676002)(81156014)(256004)(8936002)(386003)(5660300002)(81166006)(14454004)(71190400001)(31686004)(68736007)(36756003)(31696002)(305945005)(6916009)(66446008)(66946007)(66556008)(65826007)(66476007)(186003)(6116002)(76176011)(99286004)(58126008)(316002)(54906003)(6436002)(6486002)(486006)(6512007)(11346002)(446003)(46003)(65806001)(65956001)(476003)(2616005)(52116002)(229853002)(64756008)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR12MB1659;H:DM5PR12MB1546.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GbgniQUfV0L1SWGCBySXlpjv2glLL7wDaOSGuoqM1Z7ah8WaNbKjVvp3mWoRIkSE1O+NgKCEAVw1bDs7N3sMUWCte4qNqIizT8Kx/UrDlNjuj8/T2Jc23LDcXueXyGfrd3lvYTFYAljVqCIlEOYaDQEAJhwuU5vxR8ixFpI7Oa1ajx82qgQtZJ3cPq46UY86XKRLyfQiuwlegrNab4wb7FkQyFS1XJ041fD22E1AS1nYqP6rqWwqBP+c5vqrqz/PegVWXpzdfo852PumIpzWNaw1tAJl03qlQO+Edoq7LKiRDK1RjDgv1A9OI1IcXYtt95JfoM7doOysWqgafKbhfiB+c/qSDQktNf1S8ezmeF1gMQqPFhRHPelm58DirA6a/1M/RcQvp1K5DRMg/FLmdHwnrBsFjTArHlQVa6sCp3w=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38B2E3E82706954B8BB64564CFF144C3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d059da-019e-4f50-36a8-08d71b25b1e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 10:55:01.2423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1659
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

QW0gMDcuMDguMTkgdW0gMTI6NDEgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gV2Vk
LCBBdWcgMDcsIDIwMTkgYXQgMDg6NTM6MjVBTSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6DQo+PiBBbSAwNy4wOC4xOSB1bSAwOTowOCBzY2hyaWViIENocmlzdG9waCBIZWxsd2lnOg0K
Pj4+IE9uIFdlZCwgQXVnIDA3LCAyMDE5IGF0IDEwOjU2OjQwQU0gKzA4MDAsIFRhbyBaaG91IHdy
b3RlOg0KPj4+PiByZWFkcS93cml0ZXEgYXJlIG5vdCBzdXBwb3J0ZWQgb24gYWxsIGFyY2hpdGVj
dHVyZXMNCj4+PiBOQUsuICBZb3UgbXVzdCBub3QgdXNlIGF0b21pY18qIG9uIF9faW9tZW0gKE1N
SU8pIG1lbW9yeS4NCj4+IFdlbGwgdGhlbiB3aGF0J3MgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhl
cmU/DQo+Pg0KPj4gRXNzZW50aWFsbHkgd3JpdGVxL3JlYWRxIGRvZXNuJ3Qgc2VlbXMgdG8gYmUg
YXZhaWxhYmxlIG9uIGFsbA0KPj4gYXJjaGl0ZWN0dXJlcyBlaXRoZXIuDQo+IHdyaXRlcS9yZWFk
cSBhcmUgcHJvdmlkZWQgd2hlbmV2ZXIgdGhlIENQVSBhY3R1YWxseSBzdXBwb3J0cyA2NC1iaXQN
Cj4gYXRvbWljIGxvYWRzIGFuZCBzdG9yZXMuDQoNCklzIHRoZXJlIGEgY29uZmlnIG9wdGlvbiB3
aGljaCB3ZSBjYW4gbWFrZSB0aGUgZHJpdmVyIGRlcGVuZCBvbj8NCg0KSSBtZWFuIHRoYXQgQVJN
IGRvZXNuJ3Qgc3VwcG9ydCA2NGJpdCBhdG9taWMgbG9hZHMgYW5kIHN0b3JlcyBvbiBNTUlPIGlz
IA0KcXVpdGUgYSBib29tZXIgZm9yIHVzLg0KDQpUb2EgZG8geW91IG9mIGhhbmQga25vdyB3aGF0
IHdlIGFjdHVhbGx5IG5lZWQgdGhlIDY0Yml0IGF0b21pYyBzdG9yZXMgDQpmb3I/IEUuZy4gd2hh
dCBpcyB0aGUgaGFyZHdhcmUgYmFja2dyb3VuZD8NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0K
PiBJZiBpdCBkb2Vzbid0IHByb3ZpZGUgdGhlbSBhdG9taWM2NCogaXMNCj4gbm90IGdvaW5nIHRv
IGJlIGF0b21pYyB2cyB0aGUgSS9PIGRldmljZSBlaXRoZXIuICBBbmQgdGhhdCBpcyBvbiB0b3AN
Cj4gb2YgdGhlIGZhY3QgdGhhdCBmb3IgdmFyaW91cyBhcmNoaXRlY3R1cmVzIHlvdSBjYW4ndCBz
aW1wbHkgdXNlDQo+IHBsYWluIGxvYWRzIGFuZCBzdG9yZXMgb24gTU1JTyBtZW1vcnkgdG8gc3Rh
cnQgd2l0aCwgd2hpY2ggaXMgd2h5DQo+IHdlIGhhdmUgdGhlIHNwZWNpYWwgYWNjZXNzb3JzIGFu
ZCB0aGUgX19pb21lbSBhbm5vdGF0aW9uLg0KDQo=
