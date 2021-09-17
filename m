Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2369E40EE73
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 02:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbhIQAtC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 20:49:02 -0400
Received: from mail-eopbgr130087.outbound.protection.outlook.com ([40.107.13.87]:62134
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232111AbhIQAtB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Sep 2021 20:49:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJg3MOSLsuX6xzIdzBLEfaJp3XCuYSmpaIV2P91phERmbUePKo/F4bY2Fguxumf6eSVl50uENpF7SBW/3Fl9oH7XjnGOGR6IqL1SC1gC4cXM6xa4JahqURk8iscqLCJYNXyhTLpELVnujKjPrGTUkzMOOI4vJhJA9DOz7bF5weH6qN9i4rlVf38AFedEJX5ZZkwp7HvF27QaYqf6Gjw2hBs0W+t40Br7jX/wwFj7BrFvHwEyUyDzhuLTuk5+QfGJP1QYLyohEMwWWY4aWab5T0gkwn1h9Nq3l7fO+fX4o7eYa27huQAhmD5eOgR2i3rNuWzmtslXvZX1dWmX1QQULQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+Jvy8gD6a2cwcLb3yMsSpR+Jej4ZBnvxyMnSN8Du3Q4=;
 b=K90rc0pZpWQ910wP8iRuyGBWj4j8ZlUTsbxqK+Cqbnyji9FudZHoRhRuf4OHL+Jbj1R4200idErxcwZZaPmPFMXkRlWUPj+OAtpmX9zO/B+56waBvz7fJ2+g+6NEUJSAnnEEcnUO1amm5toCy68owLoEh9XT3t0/a0Icn0Xwr2LZFTovuEUDvNl0AZDH6oYDssZGLHyp3WFfGJzv5IKZdim9qIScq/VXrNRcITvGp51RGPN0pvkDm5m7k2aYBRkxkIF2liLa3Wgjo7ZFsEIeHBH/FXYt+6p6KAJtTXBy5RKhibAm+7vrpbdxO4MjYuQvUmB2inMCBBRrI5MAhl87LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Jvy8gD6a2cwcLb3yMsSpR+Jej4ZBnvxyMnSN8Du3Q4=;
 b=N0f2eSsixtZ7YT50Ic+RsyK3ipcFC474Mul/qgD61qyOMWPTPB0qAg612CrkWB32T4OTHdaaBZxRIjNh1GfA2hh64JV3gJaqtN4kTX9tyR+LMzM9L5BNHfaoLH1zjjCsuYpv/G2qCVWNhklHd0Bp47MuANxzHWDpFIveq4UP+yk=
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Fri, 17 Sep
 2021 00:47:37 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::55b5:93f6:50b1:a49e]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::55b5:93f6:50b1:a49e%3]) with mapi id 15.20.4500.018; Fri, 17 Sep 2021
 00:47:37 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Abel Vesa <abel.vesa@nxp.com>
CC:     Peng Fan <peng.fan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the clk-imx tree
Thread-Topic: linux-next: build failure after merge of the clk-imx tree
Thread-Index: AQHXq095iiDR9+5sPkeMkDYfOYzeWaunXSkQ
Date:   Fri, 17 Sep 2021 00:47:36 +0000
Message-ID: <DBBPR04MB79301D1C70ED0E6FB04151DA87DD9@DBBPR04MB7930.eurprd04.prod.outlook.com>
References: <20210917090618.3a7ac4be@canb.auug.org.au>
In-Reply-To: <20210917090618.3a7ac4be@canb.auug.org.au>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4adbebd-8317-4c54-b469-08d97974be94
x-ms-traffictypediagnostic: DB6PR04MB3128:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB31284A7595999A62227C968E87DD9@DB6PR04MB3128.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J5uFPRSrB4Huw4tzzVozZaJjbTGqcn1bFPQWJ2pzRosT1m+w0y/jIPycUcugAWGiZHahKxwDeJJvnS8MilZXC9o9FGsLGmU1lFDw9xgFmspSY2fm8deqdLeHe/L25RqIJVzDzxJBxgwaA3O6EYjuX4Aed1VHBfOlNfuOL5t63B+CozFdBN06sUOEkI/SNyKS/wBBxtlV1OigZDYe3r0smZdHCjZevCImsEjIUN6TD01mJ7E3MKkPj/TqwVW8WbX/wEXAlCiQpChClzoRUtjyoh4+o6SRXEX7OZHmDucbmgJpi8aNqiUkwypjpJ+iOk5+7JyXqgyGdyFxDCdrQ7unIP5aZyv+z5GOszuZD8tSWVoiQeQyW+Elsf7RddggD5OHY//DkYEGJ0YNinl6XGKG4tkqs3gbsabxAfXJxPsbfuGLSvEHxFVve1XI+gPXdWvjpgQBkhJ/dKshxlRqs+lE0FOTDhLeh1bTlNsWlu72L0AaAX+ugREtjTru8fl8SD7P39sTDI7BULHv3CERTbmgFSubIc4QwBmsuJA/hsxIpanEAgBABS+LUWQG2mfSoNuvPGtzJjqH9l4asLeUyIAolu/HMw266P/1Y3iS1Pu9HIRzjIGmM7nRgQhA+28s8hjbichpozAjcAbrrcbB82VbD78143nRJTfDt5envtrhdzM8eypewtnb0vFxwJFA5J4Fd7usPM099IVpJkdMscV3qQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52536014)(83380400001)(316002)(86362001)(4326008)(6506007)(26005)(186003)(55016002)(2906002)(9686003)(71200400001)(122000001)(33656002)(64756008)(66476007)(7696005)(5660300002)(66556008)(66946007)(66446008)(4744005)(110136005)(6636002)(8936002)(54906003)(76116006)(38070700005)(8676002)(38100700002)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3FYd2g1blBrV3crQmtBWjg2eXo4SzJsSFhQSkJBUWo5NEhjeG1NSnlGZzI5?=
 =?utf-8?B?V01xd3NibmYwdVBnbGNJbkZGS29UZWxTWHUvcHVvMnV3VUpNTmYvbXFzRm5U?=
 =?utf-8?B?K2kveVBrcno1WnR0VWlHVkh1bVYrTjMwMzZSK2RaTUlBcVRXTGRlTndIWE5M?=
 =?utf-8?B?bXlOdUNrQUtjd0NoVXJWL1B3dnlyS0RSK1Z5WGdGK2VSZnJiaUo3aUZEdjBa?=
 =?utf-8?B?WTY0V21IQTBJUHJhbGNmdzJraW5nc0dSOVNQcGtVOWVzRFdmNjJvMkkwWit4?=
 =?utf-8?B?TzRuYmtTT2cvbUJJSG11aGZnRWZnTVpzVVV4UitYaDlKVG5EQTRyWm9DUFFY?=
 =?utf-8?B?am1CZVFwcFpXRUgxR1FOeERVVmthVng3S1hoZHBjVHZzRWd0Z3I3MFhqbm9R?=
 =?utf-8?B?OE1jZk1sVDhOSWtIYW9VamFoZmZUNDVXK3JWUytwOGlzWnErMHF0c29NRmVw?=
 =?utf-8?B?dnR4NDZEQWJ1ZzI0MGtVWUZHQy9tdHh1V3ZxWXIxQ0lnMTlaU0lpd0IvZWJS?=
 =?utf-8?B?Ui84Si9RbUtSeW0vODd1OHc2UklTaGI0OWcyY1Fyb01tMWNyUnBhMmZWdnM5?=
 =?utf-8?B?MEJLaFF0d3pGMGhkSklQODU0YWQvWG0ralZsM0FaQXJWUk9aMHhCNTBHUVd6?=
 =?utf-8?B?d1lFem4yeXVFMVU2Z2VHcVZ3cnp2ZVJLWVpJNFd6cysveVljRHBESjJCU1hP?=
 =?utf-8?B?SXBwOE5KK0ZxcUl1dS9CQk11a08wL0RPZ0puMVNuSW1BNTlDNFgrb2RmUGRF?=
 =?utf-8?B?ekZZMzIxNk1uMkJJeGx5aXdFeVIyZjl5RFEyYWJrM0MzaCtTNzZPT1Z6bmFG?=
 =?utf-8?B?cUtYUDlPbUhhOWJVTUtwd2ZkWXdHcUpsMmkwL0VwZmtsL2RTMXJzTWJJS1Yr?=
 =?utf-8?B?U2x6QjVCSERtL3RDOGNEMTBLVGhYTktsUDM0OFJxZGtONHIyZ08ybmUydC9R?=
 =?utf-8?B?TkpBcE9IQjVHSldveDdTbEtLc3IvS053b3FybWd6a05OUE0xR2drZDRXYW1t?=
 =?utf-8?B?ejJrZkZoYys3ZzJXRDR0VFYvZzFXdjdnRkFUZDdTM2xPZWxMdmpSTi9SY1Bn?=
 =?utf-8?B?ckdaOVhSQWpJYzVqbW5tbGd1Z3MrNjlXdTNTRFVndmVETDZDSlRVenhpeERP?=
 =?utf-8?B?elovVmFlMnNobndMK1ZNb0J5WTFYdC91eFhkSEU5bEJCZjRIRzljdHFxbFNK?=
 =?utf-8?B?djRvN1RmeVBTSTN2bXBXTmYzUjVmUmdkMjZBSjdkSlhvTlFjK3d4dHREVklM?=
 =?utf-8?B?ZEt2RUl2TXNBSWlIR3VnQ2NUNHp3TFoxaHdRS0ZyNWw1dUtIaFNrOXE4cHUw?=
 =?utf-8?B?RGhjS2tiWFE5WnRQdUdRTjJXeHFaOVJFNk1qZzB1SHV6czJUa2pSOGYrbUp6?=
 =?utf-8?B?d3dMSHBlTVE4SU10STNiNG5VN0xqYUZSU3FrOTZzQ3NIdjRJL0pjeGxNYW9Y?=
 =?utf-8?B?U0JDUnB5R1ZKVEdjRHdSUjVGeVRQNDVhUjA1bWVGSHY0c0tQMTBYemt1Nk80?=
 =?utf-8?B?TFoyZk1EV0lqaVdRMDI3ZFRwVGFtNzNyRlVZQko1eXlmOTk4QXgwUWtmTHhN?=
 =?utf-8?B?TFo5R0wzMHRXd3dZQTFJODMyVDVIaDl0Sk55a2crUjNMUURoOVVEM1puQUFk?=
 =?utf-8?B?VjlWWnIzU0VSVEg2b3NSSld1bzZWTnM4N1pyclExK0tQNUZ0aTB3bDVJV1Jt?=
 =?utf-8?B?MXQwSzFyQTRTdDhUS1NJTUJCOWNxaUU4d1JBMzltMDJhTlI2eXdEYk9weWdx?=
 =?utf-8?Q?DKkQe67js3PzHBcym2lXeVGyFW0H4Jnzt4FiUOL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4adbebd-8317-4c54-b469-08d97974be94
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2021 00:47:36.9413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7UfK5rvoV2HTPow13glPhu4QYkQhq4ZvEBPlnHIbuX6ZDz6lUkSturdZP5ln9Cl+qWT79jLnZ6kzD/jzV3zYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

PiBTdWJqZWN0OiBsaW51eC1uZXh0OiBidWlsZCBmYWlsdXJlIGFmdGVyIG1lcmdlIG9mIHRoZSBj
bGstaW14IHRyZWUNCj4gDQo+IEhpIGFsbCwNCj4gDQo+IEFmdGVyIG1lcmdpbmcgdGhlIGNsay1p
bXggdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkICh4ODZfNjQNCj4gYWxsbW9kY29uZmln
KSBmYWlsZWQgbGlrZSB0aGlzOg0KPiANCj4gRVJST1I6IG1vZHBvc3Q6ICJpbXhfY2xrX2h3X3Bm
ZHYyIiBbZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4dWxwLmtvXQ0KPiB1bmRlZmluZWQhDQo+IEVS
Uk9SOiBtb2Rwb3N0OiAiaW14X2Nsa19od19wbGx2NCIgW2RyaXZlcnMvY2xrL2lteC9jbGstaW14
OHVscC5rb10NCj4gdW5kZWZpbmVkIQ0KPiBFUlJPUjogbW9kcG9zdDogImlteDh1bHBfY2xrX2h3
X2NvbXBvc2l0ZSIgW2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHVscC5rb10NCj4gdW5kZWZpbmVk
IQ0KPiANCg0Kc2hvdWxkIGJlY2F1c2UgdGhhdCB0aGVzZSB0aHJlZSBmdW5jdGlvbnMgYXJlIG5v
dCBleHBvcnQgc3ltYm9sIHdoZW4gZHJpdmVyIGJ1aWxkIGFzIG1vZHVsZS4NCkkgd2lsbCBnZW5l
cmF0ZSBhIHBhdGNoIHRvIGZpeCBpdC4NCg0KVGh4IGZvciByZXBvcnRpbmcgdGhpcyBpc3N1ZS4N
Cg0KQlINCkphY2t5IEJhaQ0KDQo+IENhdXNlZCBieSBjb21taXQNCj4gDQo+ICAgODZjZTJkMzkz
ZmY3ICgiY2xrOiBpbXg6IEFkZCBjbG9jayBkcml2ZXIgZm9yIGlteDh1bHAiKQ0KPiANCj4gSSBo
YXZlIHVzZWQgdGhlIGNsay1pbXggdHJlZSBmcm9tIG5leHQtMjAyMTA5MTYgZm90IHRvZGF5Lg0K
PiANCj4gLS0NCj4gQ2hlZXJzLA0KPiBTdGVwaGVuIFJvdGh3ZWxsDQo=
