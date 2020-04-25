Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D8F1B83F5
	for <lists+linux-next@lfdr.de>; Sat, 25 Apr 2020 08:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgDYGqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 25 Apr 2020 02:46:49 -0400
Received: from mail-bn8nam12on2062.outbound.protection.outlook.com ([40.107.237.62]:14304
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725837AbgDYGqt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 25 Apr 2020 02:46:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwFWTL49pkiPQyFRVB5J1oomId/2ZYkdEGrKy8GydooBKka49gClqJ1j/6cpY5O1c0fJHBAeitZufgOXTvswj/osTbcny4v/ThdXyR1Sc3OHL6r+lWdgCl+9oPvkV3aQGYBL4g3oJbI9wTdZfeqodXS9FakH8rwfthR9btbzx4gkjb1OGZFtBq8bSaM/MJcHccKnKuIXA2fQv9gtuFEvzYAD/E+CrcsrFjeWrLJZNz4Ekd7+lUQUi5KVKbMC29m3V7/waTZd/0rzEM3PwZFnMChRU8pmb0lQMA6PY/7a7WDyHXWxf7IslIDzCGSdWdnx8l+EIcKav12VPPP5kTPotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MM66oLVyjgMxHSAKWagsVqjQ1ifAuLVcIN4yHkVAHXc=;
 b=fFHaEqVJRMVVykLCezuwaPwzcw5J8lY0LSTAGoyHIxG/rHu2GVu6O21A7WHclDPT3LhORwjeCx205wDNNxYOgy0098lRlYzTCjaiYDSUwUq4qiCToY0gYX/eHThxfrpR/tBvMBGtv1J932nUJ1awLv4ZOlbARGITXKM2QOOG8yuXK0sx+qPrh/qlTq3v29LKF+5NZzBf9nzwEeJUoAQsXBEIed3buS2mvz2/Kz+vhikrm7doOS00LAiENPf2+jWyNoNSv85cDAxfHWL6RkIQoSBssJaz1EVW70TQPB/JXBHF7SpxFmm2/vohG8Ox7dA1CmbhgkjxyadInV5ofB7sag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MM66oLVyjgMxHSAKWagsVqjQ1ifAuLVcIN4yHkVAHXc=;
 b=UYBJmcld2g69ywEpNhVgT+tP+CIJo4aLNdlE+TfOEW1Zg8qq55FgSxheEx+4eMxkujLg1F+jh5Zaa60GQAZFtenm9ojRLXZzahT2ZxyRP9LJ8kBAsBjzwyghIhT41esNyr63s1MbLWH0474WxbPqlrJa9K5l4m7RZhS9hZoCsw0=
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (2603:10b6:208:c9::27)
 by MN2SPR01MB0018.namprd12.prod.outlook.com (2603:10b6:208:184::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Sat, 25 Apr
 2020 06:46:42 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::58b5:b730:f260:a425]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::58b5:b730:f260:a425%7]) with mapi id 15.20.2937.020; Sat, 25 Apr 2020
 06:46:42 +0000
From:   "Tao, Yintian" <Yintian.Tao@amd.com>
To:     coverity-bot <keescook@chromium.org>
CC:     "Koenig, Christian" <Christian.Koenig@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: gmc_v10_0_flush_gpu_tlb_pasid(): Program hangs
Thread-Topic: Coverity: gmc_v10_0_flush_gpu_tlb_pasid(): Program hangs
Thread-Index: AQHWGky5VBipUQF7c06Mlw2snaASeaiJZTHw
Date:   Sat, 25 Apr 2020 06:46:42 +0000
Message-ID: <MN2PR12MB3039B02A90B9A1D3ED38B3E8E5D10@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <202004240826.F065651@keescook>
In-Reply-To: <202004240826.F065651@keescook>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a5ff5c68-af0d-4afd-54f7-08d7e8e46a1c
x-ms-traffictypediagnostic: MN2SPR01MB0018:|MN2SPR01MB0018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2SPR01MB00182F5F9CE6FCBB9890B4B9E5D10@MN2SPR01MB0018.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0384275935
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3039.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(478600001)(86362001)(45080400002)(33656002)(8676002)(8936002)(186003)(966005)(5660300002)(4326008)(81156014)(54906003)(64756008)(6506007)(76116006)(26005)(66946007)(2906002)(316002)(66446008)(7696005)(66556008)(52536014)(9686003)(66476007)(53546011)(71200400001)(6916009)(55016002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +nWJ1vuzyHJsDyUyujUPJbmQqW7t33vL24YQUZ2nHbg6WmfPD6pZMNW5rhvQ6P+57asw6OyQ7xdC+MzDNzw0WK2xV972PQFuVBPCqb+eXOFIelRpdb77jZ+VexVgYOhEvdQW8NGUZSELS+sRpQoUaAE4kEfY0usgJ7SYNaLsjNiesjMbrtuNE944TPPdHQCf+QAzqjrqzCKhFbERa+VyePKW8yWM2b7urWhKpI+AMtqKJss4tyPO9TtqnBin0CQT2ebadLCIn8U2DjBYf57+RAeNMLlslayEDQ5Fb9awYB22ZcbyM7QXsmQ2zVElj5NDAbZlV4Pv1p9JEK14ErGAGvBbWU+Qzd9c+Wzgi1vVE7Zl+hEorm2P3hwPg9uf0WIUblw6KOWpplvlFMbjxnk2ux9c3B5DuQAd43Rdu1SKcxFfBWzXOmkSlg9LVH2tub6qiQZRLYtPyMAY/md2DaV/fNkjFhaPwCPdFP1StgqC4HgtfhgfZXqLjLVkDfgdmja91rU8Zu+/BBs4g6Bsas/p+Q==
x-ms-exchange-antispam-messagedata: zEP5YOz0ZrHCCj2Rv9WE9TXiusHaByZhwrBptSUzHAQ7OFdN17C205/FlbNxThIuYhsJqZnw4dLgYv91itAA6KlPdIDRpZeAPcvT4MFQpRciS6q/l/PNOXPPX1LJUxqscmr1LbLcQ0++RmAcNVbhRxKIcXDTLWamIRX2vTWSgx+HKJDcijMF+F6jrc0PzrjSZ+R399wVIu1/evzOW3JuBrV4PUmA4gYNeTDWbImq40JjiB4t/8Ismr7CmsRJu8op0nvRe2yVym72QKn+uSrDmQSunx4Qbvwohm7UCz+JF3EVp9z9Pdw9w7ZaeJ4GGq//K3D6xN2CDngzgCOr2uZNv46kqw2FgcDJmJnD7D8G7uGr0ONS5RiehgS0gS1EnI+WKSQaIBID2ofWzZ9eD8918mxPalAIkuDcljIszN836HMvy7ZV5viqFLuGs3iN5JJem6M1r+sVGK+zLh93SFIocADxRgjQx7VWs85HtaI/0CbSxbmMGI5s3DHya+QfzbXDr6BzsRHKeI968zUZtVuJopvc1IDRNZY38YYuWE2r9pKXx0yrX+XlwuCHLjeZIWFwpOZxMbew4IEj7LpvJHB0/7ub054u1WxRbzRRDQqh4vAULUja3ap4XmdodVvkLjgGpn6Q9xtrIRkzsy3DnCFKfm0zcZj3r9eReoIeNPsznrZ74Sq0RrtlzQZ4ykoDSxN7ujksXyiH0Lf6UMx0g2ogKvc1Rhuo/6bDmbFJwOCbOeNq3huqG7h0lgf1VnAOjwt79k1rPU4v9baypGCziKZwokTi5XiTfFAM1W77BEgUKSQ=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ff5c68-af0d-4afd-54f7-08d7e8e46a1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2020 06:46:42.5264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NE4b5I+Qp2YRZe3CyNOS0+r/gWSwMA1JtCg5GxJswOlGavBrhhe3j/A8H0/bEPGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0018
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkNCg0KVGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlLiBQbGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhl
IGNvZGUsIGhlcmUgJmtpcS0+cmluZ19sb2NrIGlzIGVxdWFsIHRvICZhZGV2LT5nZngua2lxLnJp
bmdfbG9jaw0KQmVjYXVzZSBraXEgaXMgZmV0Y2hlZCBmcm9tIGFkZXYtPmdmeC5raXEuIFRoZXNl
IHR3byBleHByZXNzaW9ucyBhcmUgZXF1aXZhbGVudC4NCg0KQmVzdCBSZWdhcmRzDQpZaW50aWFu
IFRhbw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGNvdmVyaXR5LWJvdCA8a2Vl
c2Nvb2tAY2hyb21pdW0ub3JnPiANClNlbnQ6IDIwMjDE6jTUwjI0yNUgMjM6MjYNClRvOiBUYW8s
IFlpbnRpYW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+DQpDYzogS29lbmlnLCBDaHJpc3RpYW4gPENo
cmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRl
dWNoZXJAYW1kLmNvbT47IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5j
b20+OyBsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogQ292ZXJpdHk6IGdtY192
MTBfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkKCk6IFByb2dyYW0gaGFuZ3MNCg0KSGVsbG8hDQoNClRo
aXMgaXMgYW4gZXhwZXJpbWVudGFsIHNlbWktYXV0b21hdGVkIHJlcG9ydCBhYm91dCBpc3N1ZXMg
ZGV0ZWN0ZWQgYnkgQ292ZXJpdHkgZnJvbSBhIHNjYW4gb2YgbmV4dC0yMDIwMDQyNCBhcyBwYXJ0
IG9mIHRoZSBsaW51eC1uZXh0IHNjYW4gcHJvamVjdDoNCmh0dHBzOi8vbmFtMTEuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnNjYW4uY292ZXJpdHku
Y29tJTJGcHJvamVjdHMlMkZsaW51eC1uZXh0LXdlZWtseS1zY2FuJmFtcDtkYXRhPTAyJTdDMDEl
N0NZaW50aWFuLlRhbyU0MGFtZC5jb20lN0NiNGUxNjRmZjNmMTU0MmYxNGMyMDA4ZDdlODYzZGFl
OCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcyMzMzODc4
ODY2NzgxODEmYW1wO3NkYXRhPVF5Wk84UGRHQlFGNk5yV2hYYjFZbTBhb1Foem90dUN6d1QzTTFU
d1lRZmslM0QmYW1wO3Jlc2VydmVkPTANCg0KWW91J3JlIGdldHRpbmcgdGhpcyBlbWFpbCBiZWNh
dXNlIHlvdSB3ZXJlIGFzc29jaWF0ZWQgd2l0aCB0aGUgaWRlbnRpZmllZCBsaW5lcyBvZiBjb2Rl
IChub3RlZCBiZWxvdykgdGhhdCB3ZXJlIHRvdWNoZWQgYnkgY29tbWl0czoNCg0KICBUaHUgQXBy
IDIzIDEyOjA1OjU0IDIwMjAgKzA4MDANCiAgICA4MjQ3ODg3NmVhYWMgKCJkcm0vYW1kZ3B1OiBw
cm90ZWN0IHJpbmcgb3ZlcnJ1biIpDQoNCkNvdmVyaXR5IHJlcG9ydGVkIHRoZSBmb2xsb3dpbmc6
DQoNCioqKiBDSUQgMTQ5MjcxNTogIFByb2dyYW0gaGFuZ3MgIChMT0NLKQ0KL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192MTBfMC5jOiA0MzQgaW4gZ21jX3YxMF8wX2ZsdXNoX2dwdV90
bGJfcGFzaWQoKQ0KNDI4ICAgICAJCWtpcS0+cG1mLT5raXFfaW52YWxpZGF0ZV90bGJzKHJpbmcs
DQo0MjkgICAgIAkJCQkJcGFzaWQsIGZsdXNoX3R5cGUsIGFsbF9odWIpOw0KNDMwICAgICAJCXIg
PSBhbWRncHVfZmVuY2VfZW1pdF9wb2xsaW5nKHJpbmcsICZzZXEsIE1BWF9LSVFfUkVHX1dBSVQp
Ow0KNDMxICAgICAJCWlmIChyKSB7DQo0MzIgICAgIAkJCWFtZGdwdV9yaW5nX3VuZG8ocmluZyk7
DQo0MzMgICAgIAkJCXNwaW5fdW5sb2NrKCZraXEtPnJpbmdfbG9jayk7DQp2dnYgICAgIENJRCAx
NDkyNzE1OiAgUHJvZ3JhbSBoYW5ncyAgKExPQ0spDQp2dnYgICAgIFJldHVybmluZyB3aXRob3V0
IHVubG9ja2luZyAiYWRldi0+Z2Z4LmtpcS5yaW5nX2xvY2siLg0KNDM0ICAgICAJCQlyZXR1cm4g
LUVUSU1FOw0KNDM1ICAgICAJCX0NCjQzNg0KNDM3ICAgICAJCWFtZGdwdV9yaW5nX2NvbW1pdChy
aW5nKTsNCjQzOCAgICAgCQlzcGluX3VubG9jaygmYWRldi0+Z2Z4LmtpcS5yaW5nX2xvY2spOw0K
NDM5ICAgICAJCXIgPSBhbWRncHVfZmVuY2Vfd2FpdF9wb2xsaW5nKHJpbmcsIHNlcSwgYWRldi0+
dXNlY190aW1lb3V0KTsNCg0KSWYgdGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlLCBwbGVhc2UgbGV0
IHVzIGtub3cgc28gd2UgY2FuIG1hcmsgaXQgYXMgc3VjaCwgb3IgdGVhY2ggdGhlIENvdmVyaXR5
IHJ1bGVzIHRvIGJlIHNtYXJ0ZXIuIElmIG5vdCwgcGxlYXNlIG1ha2Ugc3VyZSBmaXhlcyBnZXQg
aW50byBsaW51eC1uZXh0LiA6KSBGb3IgcGF0Y2hlcyBmaXhpbmcgdGhpcywgcGxlYXNlIGluY2x1
ZGUgdGhlc2UgbGluZXMgKGJ1dCBkb3VibGUtY2hlY2sgdGhlICJGaXhlcyIgZmlyc3QpOg0KDQpS
ZXBvcnRlZC1ieTogY292ZXJpdHktYm90IDxrZWVzY29vaytjb3Zlcml0eS1ib3RAY2hyb21pdW0u
b3JnPg0KQWRkcmVzc2VzLUNvdmVyaXR5LUlEOiAxNDkyNzE1ICgiUHJvZ3JhbSBoYW5ncyIpDQpG
aXhlczogODI0Nzg4NzZlYWFjICgiZHJtL2FtZGdwdTogcHJvdGVjdCByaW5nIG92ZXJydW4iKQ0K
DQpUaGFua3MgZm9yIHlvdXIgYXR0ZW50aW9uIQ0KDQotLQ0KQ292ZXJpdHktYm90DQo=
