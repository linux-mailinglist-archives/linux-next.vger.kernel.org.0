Return-Path: <linux-next+bounces-1645-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3187C93D
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 08:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 042AD1F22108
	for <lists+linux-next@lfdr.de>; Fri, 15 Mar 2024 07:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1DEE14003;
	Fri, 15 Mar 2024 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csgroup.eu header.i=@csgroup.eu header.b="ZwopQutE"
X-Original-To: linux-next@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020002.outbound.protection.outlook.com [52.101.167.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7813FE0;
	Fri, 15 Mar 2024 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710488010; cv=fail; b=FzUP01N6UB8+ann2o9XaUaJLVwL2NFsNapSFKY4Y+T6cX26C2Ih2reIl0ivfD94pZMBV1Z7umiBQPUKDEpNU/cpltRtMy9fP45iVkNHZSa7p31PWq1FftgcYqb9A2qdD+rd/woMrMXRviPlTyMTfxxlDJeuGsQLlncIjBo+C958=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710488010; c=relaxed/simple;
	bh=t0HTCu5InQWl9hNgYoO8PV4WAwyYM21K4zq58T9E7bE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j6pinuIuSwYxDiFOj12KxDYI3ItOlwMMWU8wzZlwn+T8NfD69f9yHGwf4O3fjT25Q8wGpz7B9rRORd4SqvjIhyddwuwOUsyNwjq50XyMCxrGSZovpAgwCoS/amJ+I05fzUaD6OIUgJCu2GIWS3bXXISEZ6DYEYB07K/OQ52f2AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; dkim=pass (2048-bit key) header.d=csgroup.eu header.i=@csgroup.eu header.b=ZwopQutE; arc=fail smtp.client-ip=52.101.167.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UopogR/eS92Qb2v8SX6UOBAk0yDX8Cpdhhn1ezOGAB8II9hKN55ut0rex80ZKrlfWbDLuthy/I0eeHDVvGP+UF6Dbq44ei8g/9sHSKIHwIAiWV6gFG9kwpzlMxfBP7amchl2xhdrnZaQLeNWUl6+7D9C3hWUiF6qNQGTaJh9+n4MxQOB6KpYcqpruGwRQG7CRwbWK4SXldqUNMGBPsb2jofMtKhwCui1XZFgD93HlLdzcavzBTNlGrERSkPgUxhEIJliYX4HEagmOR1RhuRO+a0mqwU1mlQ/O0ugwJ83Kb3h8d4u/G1Hb52mi7CR+E7pc+TIXxh+xvb6eIwkT6yu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0HTCu5InQWl9hNgYoO8PV4WAwyYM21K4zq58T9E7bE=;
 b=B7/GJI8KrHksyzD00TVtzXc6jpEgdc/bEPZlRE4gi466ua1uOLo1HhB25AqKgTppiblHcyoQOMBkzgpQpjrlZ3WQFtTApF1Y4M3Pu6/H2NP7KxuWa1efL/hnz7UXqZOYhwYyW5YxIQUVfdOSkbxGWhxbniHUJQ83MOYm9NHZTeX9h/UYfQ/tdP9eg1OZjwYtoLnlZ27SZY169SiFtVpHjgxFKtQM0/aV/kRK4eHmjQ+4I9821OUzRUQPNlqk/ujwudmQNBZaMQRqCaMvHjviZOswtNpDcssTCHPM0olUNVEPHcG8N4e+/YC2LPMrVLxUasZfAkCpBjErQ/WZlSN1/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0HTCu5InQWl9hNgYoO8PV4WAwyYM21K4zq58T9E7bE=;
 b=ZwopQutECK70pNw29whvYUp3U3IIDsf9e7ar+K87iHrGDdbz8er5DvpF28hMbJTQ4TBzSMuXWrnE3u9h3gy/DIf547U/a3C/QCHEvlHOJZhyzWapkRrLRggajiBIfraDpk5dVrrAAxDEMHL4npBegP7d8dmE8ITXWwamrx9yQ5KFzrxS6RLZ8esqJ1HceWegCyC6v83/lAiY2LDvyTzdP7F+GjNGWOog89H3vTiRVhDe1Zvd95hQi9YJSGVceN5vJAadwe/+EXFgkvHEjA1SpokREU7Edj3XE+XgXAaKg3g+x801/1EV0zpS//E+Kyb4qfyK49g/Swn1MB8NltwyKg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1785.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 07:33:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7386.020; Fri, 15 Mar 2024
 07:33:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell
	<sfr@canb.auug.org.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Andrew
 Morton <akpm@linux-foundation.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the mm-stable
 tree
Thread-Topic: linux-next: manual merge of the powerpc tree with the mm-stable
 tree
Thread-Index: AQHaapxMrE4L4YEhoUCBGbOO3qGDF7Eg3nCAgBeidwA=
Date: Fri, 15 Mar 2024 07:33:25 +0000
Message-ID: <61110d70-7b18-40a2-b3d2-6c267ab18096@csgroup.eu>
References: <20240229101721.58569685@canb.auug.org.au>
 <87ttlrg4hm.fsf@mail.lhotse>
In-Reply-To: <87ttlrg4hm.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1785:EE_
x-ms-office365-filtering-correlation-id: c4a99b6b-5664-468b-e01a-08dc44c23369
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 srYJ0KcPZ/8LfjbG59aM7SJrjnuDsHpxmRNQWD2kFQQEhVQv4loXXwGtE/YjUJzADssabAJmb98W1iHvt8a1o03z+VzOj+ahZLr7k1EbrqYRd5wBdbBLAAFYsJMsuGu7LiF7l5OCwFlX0fjNCc/7FU2e6EHXKVxlg7cxGlRkDQHtosRrhC8peOcCHqT3itV18CEPbxZonijd/jbwxhf1pNxIouMSiE8LH7BKW72DaVuhsDl19ZtJG0OHYmtTlAG6yKoLVcsU7IfKhw/TdJLsFOZlgQLX+p2+/cvJ/1+RDVroJN5d/t1csYZxUlceQyOpwAVmMFOrr/ErnIEgHAiduxYjTe1HeLZqw3JpOxUYFZbA2s1kThEooYEk5xR93zCiwQSMos0nK31goEOUIsqOrM+We3sUPb9KFfH/PM49HBkWw0COtJ01v5L+I8wZjKQ+n4aVNH2kKDZ371JOYAGmu0oRkbFjr4sWcP20MIrAL/PQN0IyAcuYd/A7sGtZ3r0V9H/gnxEvKpzs91BwQZTSObHsAwiNKJT3NZKGKPnKCeYH6IoBircpApnUTgejSySh7EKRioaZAn4SvNvZFpqccXpIZXUMOsJKlsI+I4K/n3+IvZt9V5eXM4W9dminNjrv7k97XcN7KlerCSdDwr6RsHzMWeJdssxUE8+t/F7zI1ZQ/2jw3iXN2eC2e6G3UhPQ1mH5bnp7jrNtMV2i5GyqTXHYXQdow47DYci2n63v5jc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?by9Zc0p0ME9sYjZZUlBWLyt1aDhkRmZPbCtQeUJUOExHVUo4aDZYTC9BanZ4?=
 =?utf-8?B?REVLMGs1ZWt3WCtCWUx6VFVkNitRRzdaV09PVXJhd0VYOTlCMEViaXR3Vzhu?=
 =?utf-8?B?OURBcEZUd1ZON1dLb3prK3dIbUdFbHBhUnN1YnhwZzlnZVZCTTZ4Y3RDRFEr?=
 =?utf-8?B?N3FXVE1Va0lkNkZkbkorUFZuajQxb24vTmN0dkJPdnFuRFdKbGVUclVTNUh0?=
 =?utf-8?B?eGJ3bGNySGZkYzA4bGlrTXVXcER2MWtVQy9jQnNOaXZwcWQvNnUrTldYMjJn?=
 =?utf-8?B?S2ptUjZEMTNPNHF0UTVFNnhFcDVPTGZmd1NGV3NKSHMzQVI3aTJ6eS82ZGw3?=
 =?utf-8?B?UWlmYXMxQktFRSttV2hMdlFlaEdHYnV6aktnQm5yaVRtOWlRaC9Sc01kbHdO?=
 =?utf-8?B?WkFKNU9FV2dPV0l6R2w0M0YzNzRIODBVQ0pyd2ZGYy81ZXUzQklwQ0F1SlN4?=
 =?utf-8?B?Y2wyejM2MnNJdmtCaVg0R1IxZDJreVRjSnNvMytPYzlHRk1ocEZ1TXd4VEk1?=
 =?utf-8?B?cjN1YTVROVZydnAxUEtCSWVUNzNkVWZRcHBFSm5NOUZGYlUxUGJQblhVVGlv?=
 =?utf-8?B?bnNqRk1EcmtNM0JRQmgxc0F2ZjArVGxQUTR3TlRJT3hYU3kvWk9STTFWcGxZ?=
 =?utf-8?B?SnJVRll0SFpQbjZTc0Y3TUJ6NGxLV0NqNTZRQUYvSlRuZkxUaTZBMWczQWkr?=
 =?utf-8?B?eWQzNXhhbGlQSnd2YlQ5UjdjejU5SGgxaEhqcW1ydHg5Tld6eE1CSHFRMllV?=
 =?utf-8?B?NEVmRC9Ic04zUVlRcHV0WXJUQ2VJTXF1VHhRbGJyY1JGWTNDNTR1MXcvSi8x?=
 =?utf-8?B?SENRU0E2QlJpajI5M2ttTVF2cWFDOVFJazlrbG9HazBMU3B2czVBQXM0ZUNV?=
 =?utf-8?B?bHRTZ3U1VjZqdFVmMEp5T0VmajQ1bzV0b0lHYWdQWVd4UWFhK3VXVitadmM4?=
 =?utf-8?B?Q0MzK1hLbU04bGpRU2lDdzlWNjFzZGRncEFjd0ZWRFliMzdRQktuWnozU1Qr?=
 =?utf-8?B?a2x1bDRNVEpMS1o1cUsrY1pzRXZjZkR6cVlKenpjVk5kVCtIVHhITlVCZWtm?=
 =?utf-8?B?ZTN0SEFQWTdURHFGUGxPelBuME1RNlQzQlByWHlPamI5bXRqR0YwZlY5UjhU?=
 =?utf-8?B?MDVLdjNnODdDVDIyMVd2WUxtcytoR1RoaEtta3FsQVJTQ0phQWUrZVM1L2ZG?=
 =?utf-8?B?WHljZlUxemVnRHlJWlhQUE9mRGE0SUk2cDluVUIzUzhvREk1eFJNYzNaMk1M?=
 =?utf-8?B?SlZpWnFyakJTQXZFT3RKYko2U1RVRXl6TVB5SC9NNGlQSjVsRlAxWk1nUUg5?=
 =?utf-8?B?aG1hT3lvN29aWWNMN3FHY2dQNjhqY2Zad09jTk5yMC9XajZqUFJPcnM3K3Bu?=
 =?utf-8?B?SHhBS3VwNWgzcmdqTEV4b2QwSkhTT3pzRVp3KzZ0b2twYXJGcXE3YXk2K3NB?=
 =?utf-8?B?ZVJvTEwzemtjWGVVdlJVMXBTSkhRaFlJNVBZekhZT0RoQndDK09pQUdwY1ow?=
 =?utf-8?B?TkhZNWt5bUtuRlhoUnJTVGRiV1JEdHhjeGlxTkVxampwT3paRU1FMDBhRkZC?=
 =?utf-8?B?VGFYLzNjWUVVbWtUbGVOWjFxdUYyRnVnemxIUlFZc2MvZEMvczNTQ1RleWls?=
 =?utf-8?B?WUNHbDFtVWhPaTZkeEFRWUhvMFA3MkZwT1IzVG1SS0oybzdoaUFvWkE2Rkpv?=
 =?utf-8?B?dEQ3L1psaGNtTlJ5Sy9pbERrdGxqeGRCYUFCMlRYdlVIdTdxQnYxVldjdjFw?=
 =?utf-8?B?VzMzTkIzUkx4WWtCSmZmRUQvWnpTYzA1bGUwRWg2ZXJUenhYZWZFZGFXQW1a?=
 =?utf-8?B?NUZHK00ycnpzaDZLOUliczZmdHNWKzJhZzkzN0xmTFZkVTE5U3NVdGU0L1Ix?=
 =?utf-8?B?SlN3U2M4WWJZVmZvK1MzSnJ6NFNla3NnK3phMW9iY2pON09QaldzMnUwQkNi?=
 =?utf-8?B?ZTVzbStYRGFtZ2dTek1VV2pxc0xMZjZWM1ZtUVRiV0xMWkh2SnZaOWtNUmdE?=
 =?utf-8?B?WGxycVhRa0RXWXYrWlUvR0d4SzcrWm1VS1RGTXovSHp6U3lQN1kzMnB4QnYr?=
 =?utf-8?B?dEJmaE1tSno4TjBMeUU0ZlJlK3FxVzZFRC9JMTVRemIrZU44TllMK0NKMENh?=
 =?utf-8?B?Q0xhWHMrdDVYZklNVGR6UnYrS01kZXU1cml6ZlhFclB5dUN0RTFzNkgxQnMv?=
 =?utf-8?B?QjhFaTR1Z2c4NXh2OFV1WGc1UXpCK3puL3ZZNm1la2tjMGpycFlBUW9iMktm?=
 =?utf-8?B?cUwwcXFoaE1vTUoyeEV0RTBRQkp3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A60B07BE4F40D4196907C29C7AE5075@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a99b6b-5664-468b-e01a-08dc44c23369
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 07:33:25.6418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BcuvpXPCJj/1b9pXwCuzYtMFTRBS5Nwgz0BwSFoMwBnfSgj6SmwRxAB7bcuAudDzsOYExjlO85gOg26OoypxKKdHWLDHYOobHePvoPPbfls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1785

DQoNCkxlIDI5LzAyLzIwMjQgw6AgMDc6MzcsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdyaXRlczoNCj4+IEhp
IGFsbCwNCj4+DQo+PiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhlIHBvd2VycGMgdHJl
ZSBnb3QgYSBjb25mbGljdCBpbjoNCj4+DQo+PiAgICBhcmNoL3Bvd2VycGMvbW0vcGd0YWJsZV8z
Mi5jDQo+Pg0KPj4gYmV0d2VlbiBjb21taXQ6DQo+Pg0KPj4gICAgYTVlODEzMWEwMzI5ICgiYXJt
NjQsIHBvd2VycGMsIHJpc2N2LCBzMzkwLCB4ODY6IHB0ZHVtcDogcmVmYWN0b3IgQ09ORklHX0RF
QlVHX1dYIikNCj4+DQo+PiBmcm9tIHRoZSBtbS1zdGFibGUgdHJlZSBhbmQgY29tbWl0Og0KPj4N
Cj4+ICAgIDhmMTdiZDJmNDE5NiAoInBvd2VycGM6IEhhbmRsZSBlcnJvciBpbiBtYXJrX3JvZGF0
YV9ybygpIGFuZCBtYXJrX2luaXRtZW1fbngoKSIpDQo+Pg0KPj4gZnJvbSB0aGUgcG93ZXJwYyB0
cmVlLg0KPiANCj4gVGhhbmtzLiBUaGF0J3MgYSBmYWlybHkgdWdseSBjb25mbGljdC4NCj4gDQo+
IE1heWJlIEknbGwgZHJvcCB0aGF0IHBhdGNoIHVudGlsIHRoZSBnZW5lcmljIGNoYW5nZSBoYXMg
Z29uZSBpbi4NCj4gDQoNClRoZSBjaGFuZ2UgaXMgbm93IGluIGxpbnVzIHRyZWUuDQoNCkNocmlz
dG9waGUNCg==

