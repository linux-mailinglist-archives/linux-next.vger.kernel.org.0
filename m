Return-Path: <linux-next+bounces-6131-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF88A77A4F
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 14:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8CE1884F8D
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 12:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299A01EC01F;
	Tue,  1 Apr 2025 12:02:40 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808F4690;
	Tue,  1 Apr 2025 12:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508960; cv=none; b=hspGHemoMW7vuWiEZq6erJNDtUHiezPMs0Z03wo5xxt44m34FMqoOBnFyvTUueYMR0Y3sKb9BcsxwEyVVVHxGXSmbz/ovRVHtEF5+X7btQFRbxCmXO1cuMH1C8OCi8Mthh47I5mvHddicciikAKp0sfZPiuODHgPoyO67MeEbwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508960; c=relaxed/simple;
	bh=zN7rzAwlTsbjIndHloW6wNKS4OoWbPzkahZ/ZizfTN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tv/2VqPmj1DWV6Pr3Y+SVO4qqkQfoXiQBcijJkOFKyfqsj4yqo0s5r6P45T1ng8TMtyPtL5wrJnLSg2dfRxlcJTd9ITvV46WOGunF3iNEt5Dnd3pe3T1MdXQI3iKSVfjqx2KTH4G6EljMNw+yy1Lc0SLWPBF90aJcyx8QK1y9V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZRmkB5Z53z6L6vr;
	Tue,  1 Apr 2025 19:58:58 +0800 (CST)
Received: from frapeml100005.china.huawei.com (unknown [7.182.85.132])
	by mail.maildlp.com (Postfix) with ESMTPS id 14F4214059F;
	Tue,  1 Apr 2025 20:02:36 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml100005.china.huawei.com (7.182.85.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Apr 2025 14:02:35 +0200
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Tue, 1 Apr 2025 14:02:35 +0200
From: Shiju Jose <shiju.jose@huawei.com>
To: Borislav Petkov <bp@alien8.de>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab
	<mchehab+samsung@kernel.org>, Tony Luck <tony.luck@intel.com>, "Jonathan
 Cameron" <jonathan.cameron@huawei.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the edac tree
Thread-Topic: linux-next: build warning after merge of the edac tree
Thread-Index: AQHbibWQCX91qZEQwUaDSgjPpJhSnbOOSziAgABmDoCAADbHMA==
Date: Tue, 1 Apr 2025 12:02:35 +0000
Message-ID: <b6862252ef2b476cb1c650d5abe7c04d@huawei.com>
References: <20250228185102.15842f8b@canb.auug.org.au>
 <20250401153941.517aac17@canb.auug.org.au>
 <20250401104457.GBZ-vDqbrZVOlEzhgf@fat_crate.local>
In-Reply-To: <20250401104457.GBZ-vDqbrZVOlEzhgf@fat_crate.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBh
bGllbjguZGU+DQo+U2VudDogMDEgQXByaWwgMjAyNSAxMTo0NQ0KPlRvOiBTaGlqdSBKb3NlIDxz
aGlqdS5qb3NlQGh1YXdlaS5jb20+DQo+Q2M6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1
dWcub3JnLmF1PjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiDQo+PG1jaGVoYWIrc2Ftc3VuZ0BrZXJu
ZWwub3JnPjsgVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPjsgSm9uYXRoYW4NCj5DYW1l
cm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBM
aXN0IDxsaW51eC0NCj5rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgTGludXggTmV4dCBNYWlsaW5n
IExpc3QgPGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPg0KPlN1YmplY3Q6IFJlOiBsaW51eC1u
ZXh0OiBidWlsZCB3YXJuaW5nIGFmdGVyIG1lcmdlIG9mIHRoZSBlZGFjIHRyZWUNCj4NCj5PbiBU
dWUsIEFwciAwMSwgMjAyNSBhdCAwMzozOTo0MVBNICsxMTAwLCBTdGVwaGVuIFJvdGh3ZWxsIHdy
b3RlOg0KPj4gSGkgYWxsLA0KPj4NCj4+IE9uIEZyaSwgMjggRmViIDIwMjUgMTg6NTE6MDIgKzEx
MDAgU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+d3JvdGU6DQo+PiA+
DQo+PiA+IEFmdGVyIG1lcmdpbmcgdGhlIGVkYWMgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1
aWxkIChodG1sZG9jcykNCj4+ID4gcHJvZHVjZWQgdGhpcyB3YXJuaW5nOg0KPj4gPg0KPj4gPiBE
b2N1bWVudGF0aW9uL2VkYWMvaW5kZXgucnN0OiBXQVJOSU5HOiBkb2N1bWVudCBpc24ndCBpbmNs
dWRlZCBpbg0KPj4gPiBhbnkgdG9jdHJlZQ0KPj4gPg0KPj4gPiBJbnRyb2R1Y2VkIGJ5IGNvbW1p
dA0KPj4gPg0KPj4gPiAgIGRiOTllYTVmMmMwMyAoIkVEQUM6IEFkZCBzdXBwb3J0IGZvciBFREFD
IGRldmljZSBmZWF0dXJlcw0KPj4gPiBjb250cm9sIikNCj4+DQo+PiBJIGFtIHN0aWxsIGdldHRp
bmcgdGhpcyB3YXJuaW5nLCBidXQgdGhhdCBjb21taXQgaXMgbm93IGluIExpbnVzJyB0cmVlDQo+
PiA6LSgNCj4NCj5TaGlqdSwNCj4NCj5wbGVhc2Ugc2VuZCB0aGlzOg0KPg0KPmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvYWYzZTFlMTgzYjAzNGVhODllZDY1ODJhNTM4MmU1YzNAaHVhd2VpLmNv
bQ0KPg0KPmFzIGEgcHJvcGVyIHBhdGNoLg0KDQpIaSBCb3JpcywNCg0KU3VyZS4NCg0KUGxlYXNl
IGNoZWNrIHRoZSBmaXggcGF0Y2ggc2VudC4NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWVkYWMvMjAyNTA0MDExMTU4MjMuNTczLTEtc2hpanUuam9zZUBodWF3ZWkuY29tL1QvI3UNCg0K
Pg0KPlRoeC4NCj4NCj4tLQ0KPlJlZ2FyZHMvR3J1c3MsDQo+ICAgIEJvcmlzLg0KPg0KPmh0dHBz
Oi8vcGVvcGxlLmtlcm5lbC5vcmcvdGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlDQoNClRoYW5r
cywNClNoaWp1DQo=

