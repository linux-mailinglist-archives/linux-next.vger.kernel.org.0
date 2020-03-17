Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A16831885D2
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 14:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgCQNdU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 09:33:20 -0400
Received: from mail-dm6nam10on2111.outbound.protection.outlook.com ([40.107.93.111]:29921
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726148AbgCQNdU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 09:33:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwRKlx4YaP8bUo4OvGj+uKQ1WMYGK2b4ild/VUULUoxx19rt7d+DBiQZCRPjH+pNhoc9gG4yrdLJ70pp24BwMrbbZe4SMIfrQmuX/dF1h/0ffglLo05NhzYXmghvIyrjXuwv6Y/aD7EZvYKwFDNtNCasbpgEI0rHl5Px//ZEXM4O2p6fviDMOL7bq9qgJCKIe6OrE+LIs7MSP7q1q3AN/MfX0+SbYz3tZvywTGK333ghFVP7trPF+8D4qeB5q2+1YD4K/1GXOMOKTHVNQwj3XwmVYFah8N/flMXNxN8sUEReanCHsF3E7+JRKw+PlY/ND9TZeULSVw5JX2kFB6Rtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxVsLOim+eXOKOOh9X4yJX0Is0ZNpv8/LCVY/fNWGG0=;
 b=abA/svMx1/N9Z8q44rHoBfjYSmNRUmg7CbFJmM+TeB2w4xeg6WENiY/iysno50wChnXqcgl1Qq3oZT2E/jlZMuXjPdPkmLGIEOF912uDN6UZPdcfJTwwVg3ydeb7cES7Zp4CbYdFPB1C1wTf9vTEQdvN9jWxHrTK4EZzTorwEnr18widt1DlP8A9PludmxPtKtB5PPbRrnzIhBYu7niHh/G09qnOtyAYTOjwcd7qRTdvjGuW/bAS163yi6Y/Bwznvy0GBHU1K6FxYCr2AiMBzKLM/ccW6QeW27KXcsZkH3I6eVzn/sDPOdOYcGQ6duUSkRbpGSCHFIKOqO78TyT+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxVsLOim+eXOKOOh9X4yJX0Is0ZNpv8/LCVY/fNWGG0=;
 b=Ew+tdsK6UaTh+yYr8l2ceSyOrlnS0hImDASBn57rHpaJGO/oquGUw+YTNOct/f6blqC9G6VxQVxYYZVJqSgx18ToNXY4/NGsmkZEdc+irho/ihji6wVvhufRij9iI9QpIfHPNqxnfx0z+FBBeo/I+OQdmax1dEBTQtW+728+mOA=
Received: from CH2PR13MB3398.namprd13.prod.outlook.com (2603:10b6:610:2a::33)
 by CH2PR13MB3655.namprd13.prod.outlook.com (2603:10b6:610:95::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.7; Tue, 17 Mar
 2020 13:33:16 +0000
Received: from CH2PR13MB3398.namprd13.prod.outlook.com
 ([fe80::9570:c1b8:9eb3:1c36]) by CH2PR13MB3398.namprd13.prod.outlook.com
 ([fe80::9570:c1b8:9eb3:1c36%7]) with mapi id 15.20.2835.013; Tue, 17 Mar 2020
 13:33:16 +0000
From:   Trond Myklebust <trondmy@hammerspace.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "paul@paul-moore.com" <paul@paul-moore.com>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "smayhew@redhat.com" <smayhew@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the selinux tree with the nfs tree
Thread-Topic: linux-next: manual merge of the selinux tree with the nfs tree
Thread-Index: AQHV/GCdCTUQjWouDEyc7fMKz7N8wg==
Date:   Tue, 17 Mar 2020 13:33:16 +0000
Message-ID: <bb623275e936c026cc425904e6c1cee0cbe85f28.camel@hammerspace.com>
References: <20200317133117.4569cc6a@canb.auug.org.au>
In-Reply-To: <20200317133117.4569cc6a@canb.auug.org.au>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=trondmy@hammerspace.com; 
x-originating-ip: [68.40.189.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90c51648-656f-467d-94af-08d7ca77bff9
x-ms-traffictypediagnostic: CH2PR13MB3655:
x-microsoft-antispam-prvs: <CH2PR13MB3655DD91A962CE40540A1609B8F60@CH2PR13MB3655.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39830400003)(136003)(346002)(396003)(366004)(199004)(8676002)(66946007)(81166006)(81156014)(8936002)(64756008)(66446008)(66556008)(66476007)(5660300002)(2616005)(86362001)(26005)(110136005)(316002)(54906003)(6506007)(186003)(36756003)(2906002)(6486002)(4326008)(6512007)(478600001)(76116006)(71200400001)(91956017);DIR:OUT;SFP:1102;SCL:1;SRVR:CH2PR13MB3655;H:CH2PR13MB3398.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: hammerspace.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kV5mkboaHhmvW7QdFOv2UdP0OmWMocYJDwN9ENYJeWciQJm3ovTLx+DK6/XGCDttIijQOuatOynJHsbItLbUXEQhkRlOuLeA0OJTRzS/zAuBOEr8yBtwCUrJ0fZwcfOH3sTVmSrB/OBchfBGaSUypnKoULgEZoB9FzzBT6BlJKQ1NUnI/m+bsGgwaElKq3cA6SweQdsLtFcVotOP7OJboldjueK6OMRv7DPOCA4tXoyeu2BbTqRc4p5dtw6/nFT5bvQnRCrZdokE3csCLpJYru/Csz1wm9r5prtUrAesfzx5FVlzCv81qmLah+G/vomF0Go9FP+KiMmWl36JRUufaPQ+cnx+qqFd+UQBPAj0td23qUaOgIiWxjxlDld5NCbklSxSt9oH6SPbyVa1Lwrk7HI5osKzLytwETE8gVbxcNSzTYvSCqDdzwStuvjpNzkR
x-ms-exchange-antispam-messagedata: zUn7vv5Wi0aVQ/KEBDFanL3sMTWUayAI3ELRXtuamuyu5BXsX9q6U32Qq6zIaCRkvSS0Zw/ETXFyjlHHvsfeIK3c1D8yE9Ji1ka1ZTJbHKVe39yUjSCan6P+kq49qmy1udMhrk7iS8r4sgjAabJg1w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B93B199992A0AD479D9989211F55065C@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c51648-656f-467d-94af-08d7ca77bff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 13:33:16.4139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7AZxR3JsLO+AMj7G50J4c0kaGfZupvsroI+xqJpqHMJ6n8hyiVmb6vj8drpEx+hQ3hygtZgVjTmX9Y/jNJcLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3655
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVHVlLCAyMDIwLTAzLTE3IGF0IDEzOjMxICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3Rl
Og0KPiBIaSBhbGwsDQo+IA0KPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhlIHNlbGlu
dXggdHJlZSBnb3QgYSBjb25mbGljdCBpbjoNCj4gDQo+ICAgZnMvbmZzL2dldHJvb3QuYw0KPiAN
Cj4gYmV0d2VlbiBjb21taXQ6DQo+IA0KPiAgIGU4MjEzZmZjMmFlYyAoIk5GUzogRW5zdXJlIHNl
Y3VyaXR5IGxhYmVsIGlzIHNldCBmb3Igcm9vdCBpbm9kZSIpDQo+IA0KPiBmcm9tIHRoZSBuZnMg
dHJlZSBhbmQgY29tbWl0Og0KPiANCj4gICAyOGQ0ZDBlMTZmMDkgKCJXaGVuIHVzaW5nIE5GU3Y0
LjIsIHRoZSBzZWN1cml0eSBsYWJlbCBmb3IgdGhlIHJvb3QNCj4gaW5vZGUgc2hvdWxkIGJlIHNl
dCB2aWEgYSBjYWxsIHRvIG5mc19zZXRzZWN1cml0eSgpIGR1cmluZyB0aGUgbW91bnQNCj4gcHJv
Y2Vzcywgb3RoZXJ3aXNlIHRoZSBpbm9kZSB3aWxsIGFwcGVhciBhcyB1bmxhYmVsZWQgZm9yIHVw
IHRvDQo+IGFjZGlybWluIHNlY29uZHMuICBDdXJyZW50bHkgdGhlIGxhYmVsIGZvciB0aGUgcm9v
dCBpbm9kZSBpcw0KPiBhbGxvY2F0ZWQsIHJldHJpZXZlZCwgYW5kIGZyZWVkIGVudGlyZWx5IHdp
dGluDQo+IG5mczRfcHJvY19nZXRfcm9vdCgpLiIpDQo+IA0KPiBmcm9tIHRoZSBzZWxpbnV4IHRy
ZWUuDQo+IA0KPiBUaGVzZSBhcmUgYmFzaWNhbGx5IHRoZSBzYW1lIHBhdGNoIHdpdGggc2xpZ2h0
IGZvcm1hdHRpbmcNCj4gZGlmZmVyZW5jZXMuDQo+IA0KPiBJIGZpeGVkIGl0IHVwIChJIHVzZWQg
dGhlIGxhdHRlcikgYW5kIGNhbiBjYXJyeSB0aGUgZml4IGFzIG5lY2Vzc2FyeS4NCj4gVGhpcyBp
cyBub3cgZml4ZWQgYXMgZmFyIGFzIGxpbnV4LW5leHQgaXMgY29uY2VybmVkLCBidXQgYW55IG5v
bg0KPiB0cml2aWFsDQo+IGNvbmZsaWN0cyBzaG91bGQgYmUgbWVudGlvbmVkIHRvIHlvdXIgdXBz
dHJlYW0gbWFpbnRhaW5lciB3aGVuIHlvdXINCj4gdHJlZQ0KPiBpcyBzdWJtaXR0ZWQgZm9yIG1l
cmdpbmcuICBZb3UgbWF5IGFsc28gd2FudCB0byBjb25zaWRlciBjb29wZXJhdGluZw0KPiB3aXRo
IHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb25mbGljdGluZyB0cmVlIHRvIG1pbmltaXNlIGFueQ0K
PiBwYXJ0aWN1bGFybHkNCj4gY29tcGxleCBjb25mbGljdHMuDQo+IA0KT0suLi4gV2h5IGlzIHRo
aXMgYmVpbmcgcHVzaGVkIHRocm91Z2ggdGhlIHNlbGludXggdHJlZT8gV2FzIHRoYXQgeW91cg0K
aW50ZW50aW9uIFNjb3R0PyBHaXZlbiB0aGF0IGl0IGRpZG4ndCB0b3VjaCBhbnl0aGluZyBvdXRz
aWRlIE5GUyBhbmQNCmhhZCBiZWVuIGFja2VkIGJ5IHRoZSBTZWxpbnV4IGZvbGtzLCBidXQgaGFk
IG5vdCBiZWVuIGFja2VkIGJ5IHRoZSBORlMNCm1haW50YWluZXJzLCBJIHdhcyBhc3N1bWluZyBp
dCB3YXMgd2FpdGluZyB0byBiZSBhcHBsaWVkIGhlcmUuDQoNCi0tIA0KVHJvbmQgTXlrbGVidXN0
DQpMaW51eCBORlMgY2xpZW50IG1haW50YWluZXIsIEhhbW1lcnNwYWNlDQp0cm9uZC5teWtsZWJ1
c3RAaGFtbWVyc3BhY2UuY29tDQoNCg0K
