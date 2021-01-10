Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A432F0892
	for <lists+linux-next@lfdr.de>; Sun, 10 Jan 2021 18:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbhAJROf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Jan 2021 12:14:35 -0500
Received: from mail-mw2nam12on2126.outbound.protection.outlook.com ([40.107.244.126]:15521
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726228AbhAJROd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Jan 2021 12:14:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H36L7qw0B9QkYG+y/S+HtJyTAo31qVXW+uIU73sqzpRaUE03Ldhpoem+cfigUFDwtBsQzxx67NDe1LKYea+yN3cl0YUfDhPF9pNrCVVZI1Eb35BNoEBzBqAoQENpjfSiZ9Nt7WkPYWBcGZkV4WOnXMZrmJO8zCc29cmMQQADrnugy1JmVVTSUbkJXDF8LTesHdGGjG7rcgJakBF9touRtFKBWgc5HeWKsGmjPcXPtUNRcgig9JsyULiJKDh6ErJYeV6lnCOeT9l+VtEe8GEIhcso0JobDlyPSwgQ7RczYy7B7/5IlvIduVcEDrtnEG9v1Vrl8V3Czsv8o3W22KCyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPOGkkdD3SJ2GbC6VQwCDWqXVbZc9H6rcvD3mHLSWnA=;
 b=aFlCca5Zj2Vz1gBtpWsFS9inpQYQ0s0zFfnCx5s979w80koWUTtww4cIwr6DI0abFyl7IWtjAHSuShXp4K1uydVOLAaxWOPvHgnlay1eA4hNS0J0JhVRnBXNKZ651290YYLoXCylRrNqIfdDqvBAs958IvL7UlxpyLI2/uKEgVCUufItl5+7wS6y1J07ZhFGjPkLGZAnPOTbTq4fa5eEGUSokBLeoVZpZPm5tHT/Af/AyqLxuCZFEnyrhX6/QIiibARgV8c+5epuY12Rjnx6pw2lnofb9ezGJxbuT+bi50vtu549Z72QDChRcypPDDuANNpuce/v9/MPTRRQiW8Y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPOGkkdD3SJ2GbC6VQwCDWqXVbZc9H6rcvD3mHLSWnA=;
 b=gugSI0JZcxn2b3PC4yXRpDqsbgtU4TwKxH6vG5R5VuN1KTNT6nsulZ1u0COj5sGyFz+ezl1GKyVyTYQll38IgbLvgPzkZJ1eBqeL62JrI4SBlkJtlkvtm1WIUMJ23htRVRz2Q90MYSD5aqNoXQMH+ZBJc6+mv9OAUUS5e+OO8tc=
Received: from CH2PR13MB3525.namprd13.prod.outlook.com (2603:10b6:610:21::29)
 by CH2PR13MB3304.namprd13.prod.outlook.com (2603:10b6:610:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.5; Sun, 10 Jan
 2021 17:13:40 +0000
Received: from CH2PR13MB3525.namprd13.prod.outlook.com
 ([fe80::f9a6:6c23:4015:b7fc]) by CH2PR13MB3525.namprd13.prod.outlook.com
 ([fe80::f9a6:6c23:4015:b7fc%6]) with mapi id 15.20.3763.004; Sun, 10 Jan 2021
 17:13:40 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC:     "smayhew@redhat.com" <smayhew@redhat.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the nfs tree
Thread-Topic: linux-next: Fixes tag needs some work in the nfs tree
Thread-Index: AQHW53Pw0Lw7nA6QIUq8eHb3YDAZZQ==
Date:   Sun, 10 Jan 2021 17:13:39 +0000
Message-ID: <2aa7f20d90445148c790d304379cdb55d95f4686.camel@hammerspace.com>
References: <20210110131423.0dedfd93@canb.auug.org.au>
In-Reply-To: <20210110131423.0dedfd93@canb.auug.org.au>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=hammerspace.com;
x-originating-ip: [68.36.133.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d9bd94d-bec1-4380-664b-08d8b58b1358
x-ms-traffictypediagnostic: CH2PR13MB3304:
x-microsoft-antispam-prvs: <CH2PR13MB3304BD325E87D393B547B23EB8AC0@CH2PR13MB3304.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RIOS7TDvR9YkVtvCHVmTCKNAHflsWiz9xvgaQRbQHBMPxvOm3rBodTu043BYSPMXD3GDEfcoE31fRTQpko/oYQ/h01sMyxpxXs2v+Rh7ZzXTTqf2hjuYtoMVsyvWBmqL+MmEzr7KrLIHIdbIJ0eTH2g49q95I8QCppveI7ezLq+rBGSZzwwwLc33TYOizNmbBRN+ppI0TvXGdrlwjxvvPm/riWMd/LgUdfKB8UqZWEesRIOPkK+YaHHQxOBTKlrOftLn5vkxNTfVpJkRuZH1rkT8Bmnt1XDS1OKWUd/lOcHgrLv/Oc858xGPT/q3Ppg3UaZZ7ay1WqcpyViG1lS8MUhhBE4Jvra4FiSVXX7Iqlq0yBhiLB5O3rbQ+6bBm9YVOOYyHoOkDIKEyAfYugyNWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR13MB3525.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(376002)(136003)(396003)(346002)(66556008)(8936002)(64756008)(66446008)(66476007)(76116006)(26005)(6506007)(6512007)(6486002)(54906003)(66946007)(83380400001)(6916009)(478600001)(2616005)(8676002)(316002)(86362001)(2906002)(5660300002)(4326008)(71200400001)(186003)(36756003)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SC9tQXhOWHQ5K3VZaVpScjgwQ1R5eHBPbHFjaHJrRjRBUStDNzNKeUExNEpn?=
 =?utf-8?B?SGc2TmdZRWdBNjVZbHZkTjE0QVdBS3BzL3YyMENEN3NOdHN1RTVCMktXWlVU?=
 =?utf-8?B?RTJXdFF1MCtzakpqYXZPTDV2bnIySTB5QytYUHdkWjU1ZTluQ0pNK1N0U0RC?=
 =?utf-8?B?aXlBckNsejdTWFI1YUJ6cU5ZZTVDTFdTZXkyMmlUOHpOL0ZuMUlmSEtyQ1ZD?=
 =?utf-8?B?cjhBQjhVV1VnUkp2eGVoN1RodTZJZ3pSN3BwYjgwVDhNRDk5QjM5VWhvRE5X?=
 =?utf-8?B?RWwraEdzcm5nUDc0UUpsUUJ3VnFFL1E0ZnRoSzZSam5XR1RiT0lBSWUrbXVX?=
 =?utf-8?B?YURUM0wyYURHMHNxL1BjaElOUXh2a1VPRTQ3VldRd1ZHRXpHVlFxc09SZ2d3?=
 =?utf-8?B?d3h2MEY4WTRtTEh3L3NRRkxMWTRDVHRJbmFNZjFPOHRrUVc5ZE84dmM4MDFi?=
 =?utf-8?B?RmFrUk9IWHRNN29IZk0vcXhMQlRVWkN2ejcxaXAzS2VzNGJZcG1hWC95dCts?=
 =?utf-8?B?NS8yVm9WZzFiOWRMOVMzU3ZQNG83ZmJDdjRmSnVNaE9pTEZZVUxwOHc1enlI?=
 =?utf-8?B?eHI2YWZ3SE9wV1d4alhYRWRxOERxWmhIQkhJSy9SSVlUc2lXbGd6SGJqMWFR?=
 =?utf-8?B?SmNkU1VQTEVUQ1p2ZVhGK0R6M1FHUWxUOFFieDVJMGs3ckpRc2tjc3FEWUxD?=
 =?utf-8?B?RHNwTy9tSUY0OEViaWtUSkNHWkRJejZWMTBBampFclUwaHdFK0g2Qlg3TkdL?=
 =?utf-8?B?QVB6dlNhS1RYZ3Y1bXAyTnJrUDlXLzd0UUlmNGZFNnlXa3hkM01vdFZHaklo?=
 =?utf-8?B?Z1QrZis1bm9vWGd2T1BQVndUaWZwS0Jiczdqam93UTRPT0gxWHBTdk4rc2ZS?=
 =?utf-8?B?SE51ZXdxTHhTYzRKZ3lVUnVER2FWKzA1TGFWWkFCd2g2VmdNc0YzV0pkc1hI?=
 =?utf-8?B?cDFPUFFVYktyd1dmMEUybnF5NjNJZ0ZWQUoxSUNaRUVtZXBTQU5TZDh1NDhJ?=
 =?utf-8?B?Z0M2a2VFZmFvd1Yyd3VlY3JnWlZqV0wyeDc0c280WFRCZlJnaWdjRm1rUlUy?=
 =?utf-8?B?SmRlSHdRZW5GVEY2cGxIRThtTTV6SHVFbHdOVWZqb2pIY09EeDdMTDJoSEpo?=
 =?utf-8?B?OUUwdEFZcGYzbDAzZ005QmpvcGpTNGJScE1sZ2JkK1B4OHRTb1J6VFNyRTJq?=
 =?utf-8?B?MEVCUjNFalJpakh6ZmE5YlFaNG81N3E0OFZyRmc4MEpJZHNPOHh5OGNNNE90?=
 =?utf-8?B?bDdBNnhCbFBNazNvZEVrMkxBMFJTUW1wZ1E2OEpObGJBeHVmMnQrZUFIQ0I3?=
 =?utf-8?Q?/sxVe6e8Lz8cuzo4wjE6DHDEi/e68j1PHJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A6E070CC0584546A6C6B02071B5C133@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR13MB3525.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9bd94d-bec1-4380-664b-08d8b58b1358
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2021 17:13:40.0328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tml8UIPviKs86pADeXzyrvUDfC+GcEDLOzxs8vJ2oso8LJCi8E13tRc94P+XZPQ47aG6TTUAhGI1GNKbQ45NKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3304
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgU3RlcGhlbiwNCg0KT24gU3VuLCAyMDIxLTAxLTEwIGF0IDEzOjE0ICsxMTAwLCBTdGVwaGVu
IFJvdGh3ZWxsIHdyb3RlOg0KPiBIaSBhbGwsDQo+IA0KPiBJbiBjb21taXQNCj4gDQo+IMKgIDJj
YzhhY2E5ZDU0NyAoIk5GUzogQWRqdXN0IGZzX2NvbnRleHQgZXJyb3IgbG9nZ2luZyIpDQo+IA0K
PiBGaXhlcyB0YWcNCj4gDQo+IMKgIEZpeGVzOiBGaXhlczogY2U4ODY2ZjA5MTNmICgiTkZTOiBB
dHRhY2ggc3VwcGxlbWVudGFyeSBlcnJvcg0KPiBpbmZvcm1hdGlvbiB0byBmc19jb250ZXh0LiIp
DQo+IA0KPiBoYXMgdGhlc2UgcHJvYmxlbShzKToNCj4gDQo+IMKgIC0gTm8gU0hBMSByZWNvZ25p
c2VkDQo+IA0KPiBTZWUgZHVwbGljYXRlICJGaXhlczogIiA6LSgNCj4gDQoNClNvcnJ5LCB0aGF0
IHdhcyBteSBmYXVsdC4gSSBhZGRlZCB0aGUgJ0ZpeGVzJyB0YWcgd2hlbiBJIGFwcGxpZWQgdGhl
DQpwYXRjaC4gYW5kIGZhaWxlZCB0byBub3RpY2UgdGhlIGNvcHktcGFzdGUgZXJyb3IuDQpJJ2xs
IGZpeCB1cCB0aGUgY29tbWl0IGNoYW5nZWxvZy4NCg0KLS0gDQpUcm9uZCBNeWtsZWJ1c3QNCkxp
bnV4IE5GUyBjbGllbnQgbWFpbnRhaW5lciwgSGFtbWVyc3BhY2UNCnRyb25kLm15a2xlYnVzdEBo
YW1tZXJzcGFjZS5jb20NCg0KDQo=
