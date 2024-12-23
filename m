Return-Path: <linux-next+bounces-5015-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4D49FB3EF
	for <lists+linux-next@lfdr.de>; Mon, 23 Dec 2024 19:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 109D01884894
	for <lists+linux-next@lfdr.de>; Mon, 23 Dec 2024 18:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AE11B6D0F;
	Mon, 23 Dec 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="trYNMzeY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE471B6CFE
	for <linux-next@vger.kernel.org>; Mon, 23 Dec 2024 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734978056; cv=none; b=SDaKqsnFqDR6wNfqQB7/WafxrPbbO6rdYhAMRqjmGjtlHCG9cs0nMDzpv7SGh/HZNt9Aq6itwPcLlmKKX3ey6z2B5XiH0hwEkioSVNgspAjHkfSJkLp+jojJLKmFu4vWN74apnHhnb5veV7e5CiZu5bKXBVW3VCWHMoSy1PvJXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734978056; c=relaxed/simple;
	bh=K6J4d5ngY0Re+Va71naisGKZmu/ojKnCHowNHiIL+g4=;
	h=Subject:From:To:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IV085BHW37Ds+6+ngUUlS58SA9mFICAtxiW6DPWwh5+HEOopHMYxPI/uu7CjZyW+acbVsJELUIoWuxqsO4Td++lwyQsTAz31dW5JRXXuAZpn++ESuiQum0pVJxa8mytaCjko8XxSSCplFHPfD3kl3Al4yo8+5Zqu/y9JT8RngoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=trYNMzeY; arc=none smtp.client-ip=52.119.213.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1734978055; x=1766514055;
  h=from:to:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=K6J4d5ngY0Re+Va71naisGKZmu/ojKnCHowNHiIL+g4=;
  b=trYNMzeYe2GmBJZCEZB2xjfhx130K2CSYpuXfE+N9ijBLeOTb7RTv1gY
   rLZ5JUg3Jo9In3Bk9RayCy2C02GegwDZbATUF9AJiJvGsfMuiRlm/KGRw
   MU7Cl/S2W+IGBtnoAusq7NVztwFo3ndlG1yxTbTocjlt8jOoRS9wyopJa
   Q=;
X-IronPort-AV: E=Sophos;i="6.12,257,1728950400"; 
   d="scan'208";a="683606424"
Subject: FW: Linux-next compilation and build
Thread-Topic: Linux-next compilation and build
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:20:52 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:44487]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.2.146:2525] with esmtp (Farcaster)
 id 23fccc43-e4e6-4728-ac19-edebf17c5f87; Mon, 23 Dec 2024 18:20:51 +0000 (UTC)
X-Farcaster-Flow-ID: 23fccc43-e4e6-4728-ac19-edebf17c5f87
Received: from EX19D020EUC001.ant.amazon.com (10.252.51.204) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 23 Dec 2024 18:20:51 +0000
Received: from EX19D020EUC001.ant.amazon.com (10.252.51.204) by
 EX19D020EUC001.ant.amazon.com (10.252.51.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 23 Dec 2024 18:20:50 +0000
Received: from EX19D020EUC001.ant.amazon.com ([fe80::4eb3:c568:226e:434]) by
 EX19D020EUC001.ant.amazon.com ([fe80::4eb3:c568:226e:434%3]) with mapi id
 15.02.1258.039; Mon, 23 Dec 2024 18:20:50 +0000
From: "Bondarev, Alex" <alexbnd@amazon.com>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Thread-Index: AQHbVVX2yI1HTROjBkCpfdl+3bj6AbL0GIaA//+nAgA=
Date: Mon, 23 Dec 2024 18:20:50 +0000
Message-ID: <94E577D3-046D-4E8F-96D6-593D4F7C808D@amazon.com>
References: <4FF05C5D-F7C0-4212-9917-0D94DF3DCA60@contoso.com>
 <vnymur42hlcdiodh2pyoikdc5646zceiuf6sizgde4jmeqd4xi@b7xt7wuq3aaz>
In-Reply-To: <vnymur42hlcdiodh2pyoikdc5646zceiuf6sizgde4jmeqd4xi@b7xt7wuq3aaz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC1CE0DB48B22D4FA1579D4899DB1353@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Rm9yd2FyZGluZyB0aGUgb3JpZ2luYWwgbWVzc2FnZSBhcyBwZXIgdGhlIHN1Z2dlc3Rpb24uDQoN
Cg0K77u/T24gMjAyNC4xMi4yMywgMTE6MzksICJLb25zdGFudGluIFJ5YWJpdHNldiIgPGtvbnN0
YW50aW5AbGludXhmb3VuZGF0aW9uLm9yZyA8bWFpbHRvOmtvbnN0YW50aW5AbGludXhmb3VuZGF0
aW9uLm9yZz4gPG1haWx0bzprb25zdGFudGluQGxpbnV4Zm91bmRhdGlvbi5vcmcgPG1haWx0bzpr
b25zdGFudGluQGxpbnV4Zm91bmRhdGlvbi5vcmc+Pj4gd3JvdGU6DQoNCg0KDQoNCkNBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29u
ZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoNCg0KDQoNCg0K
DQoNCg0KDQoNCg0KDQpPbiBNb24sIERlYyAyMywgMjAyNCBhdCAwNDoxNjowM1BNICswMDAwLCBC
b25kYXJldiwgQWxleCB3cm90ZToNCj4gSSdtIHBhcnQgb2YgYSB0ZWFtIGluIEFXUyB0aGF0IHVz
ZXMgdGhlIGxpbnV4LW5leHQgYnJhbmNoIHdpdGggY2Fub25pY2FsJ3MNCj4gcHBhIHRvIHRlc3Qg
Zm9yIGJ1aWxkIHN1Y2Nlc3MuDQo+IGdpdDogZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQNCj4gcHBhOiBwcGE6Y2Fub25pY2Fs
LWtlcm5lbC10ZWFtL3BwYQ0KDQoNCg0KDQo+IEFzIGEgcmVzdWx0IG9mIHRoaXMgZGFpbHkgdGVz
dCAod2UgdHJ5IHRoZSBsYXRlc3QgYXZhaWxhYmxlIGF0IHRpbWUgb2YNCj4gdGVzdGluZyksIHdl
IGhhdmUgYWxtb3N0IGltbWVkaWF0ZSBrbm93bGVkZ2Ugb2YgdGhlICJnb29kbmVzcyIgb2YgdGhl
IGJyYW5jaA0KPiAoaWYgdGhlIG1hY2hpbmUgZG9lc24ndCBib290IGFmdGVyIHVwZGF0ZSBvZiBp
ZiB0aGUgY29tcGlsYXRpb24gZmFpbHMpLiBXZQ0KPiBhcmUgY3VycmVudGx5IHJ1bm5pbmcgYnVp
bGQgb24gYWFyY2g2NCBhbmQgeDg2XzY0IHR5cGVzLg0KPg0KPiBUaGUgcXVlc3Rpb24gaXMgc2hv
dWxkIHdlIG5vdGlmeSB2aWEgYSBtYWlsaW5nIGxpc3Qgb3IgYSBzaW5nbGUgZGVzdGluYXRpb24N
Cj4gYWJvdXQgdGhpcyBmYWlsdXJlPyBXaWxsIGl0IGltcHJvdmUgdGhlIGRldGVjdGlvbiB0aW1l
IGZvciBhIGJhZCBtZXJnZT8NCg0KDQoNCg0KSGVsbG86DQoNCg0KDQoNClRoZSBoZWxwZGVzayBp
c24ndCBxdWl0ZSB0aGUgcmlnaHQgcGxhY2UgdG8gYW5zd2VyIHRoaXMgcXVlc3Rpb24sIGFzIEkg
Y2Fubm90DQpzcGVhayBmb3IgdGhlIGxpbnV4LW5leHQgdGVhbS4gSSBzdWdnZXN0IHlvdSBzZW5k
IHRoZSBtZXNzYWdlIHRvIHRoZQ0KbGludXgtbmV4dEB2Z2VyLmtlcm5lbC5vcmcgPG1haWx0bzps
aW51eC1uZXh0QHZnZXIua2VybmVsLm9yZz4gPG1haWx0bzpsaW51eC1uZXh0QHZnZXIua2VybmVs
Lm9yZyA8bWFpbHRvOmxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPj4gbGlzdCAoeW91IGRvbid0
IG5lZWQgdG8gc3Vic2NyaWJlIHRvIHNlbmQgbWFpbA0KdGhlcmUpLiBUaGV5IHdpbGwgYmUgYWJs
ZSB0byBmb2xsb3cgdXAgd2l0aCBzdWdnZXN0aW9ucy4NCg0KDQoNCg0KQmVzdCB3aXNoZXMsDQot
Sw0KDQoNCg0KDQoNCg0KDQo=

