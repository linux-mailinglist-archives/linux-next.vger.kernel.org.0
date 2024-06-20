Return-Path: <linux-next+bounces-2612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83EC910B4B
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 18:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3A7628883C
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 16:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5BC1B29AB;
	Thu, 20 Jun 2024 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="d9ABL+ei"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371631B1511;
	Thu, 20 Jun 2024 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=72.21.196.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899678; cv=none; b=Qtu7dheu895y69RirQjWO38DxabIMy6RHLgcnzjQ0w4uIo2/x0puA9DIN5pXp/HXYctQXb3Q8/eokFRclgih/j7UHUej4U4hK4owp/ry13ZENsvPaIpIT0MK1yFyy/zirrKuUhW0euUeqtnn2NUIPnjs8Fv83fG2EPJ+jsBVZvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899678; c=relaxed/simple;
	bh=vMXo+8er/KnPPGbK0OQOgR3Y4wbJNNQMeqCWRXZVaPU=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kl3xxxvRBHWMLpmzqO9+IKAsEqsI8KPYB336CAIOKES9e5t5G8js7qa49GVKVNBSyA+tBC6bZMGJ1N78anhmnnr7duDfudNPykol1ANIy85qeVh2HPYY0dGHXFxzPgXcuymKnYdpKIEQlOC/wvxUKoDPOZBiv+qVor3qeeCOfrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=d9ABL+ei; arc=none smtp.client-ip=72.21.196.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1718899677; x=1750435677;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=vMXo+8er/KnPPGbK0OQOgR3Y4wbJNNQMeqCWRXZVaPU=;
  b=d9ABL+eioUt5w6c4Rs8EHUgsNkRt1WkPmuTz06vBtfulDLYXNUAa/aAu
   WvoDiC1nHOfTa/ld276dJxGudYFvI7j8IsAdCIl4I9sJEZu4jxWuiTpTh
   uwdWwkyti3og7f3xoKW7QfS9lg3Ya4udkP02xhDSHi4RB++A34XlfOBVZ
   c=;
X-IronPort-AV: E=Sophos;i="6.08,252,1712620800"; 
   d="scan'208";a="408980017"
Subject: Re: linux-next: manual merge of the memblock tree with the origin tree
Thread-Topic: linux-next: manual merge of the memblock tree with the origin tree
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 16:07:53 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.43.254:4102]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.23.209:2525] with esmtp (Farcaster)
 id db4fc33e-7e1c-4db1-aaf1-d1d67f363403; Thu, 20 Jun 2024 16:07:52 +0000 (UTC)
X-Farcaster-Flow-ID: db4fc33e-7e1c-4db1-aaf1-d1d67f363403
Received: from EX19D014EUC003.ant.amazon.com (10.252.51.184) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 20 Jun 2024 16:07:45 +0000
Received: from EX19D014EUC004.ant.amazon.com (10.252.51.182) by
 EX19D014EUC003.ant.amazon.com (10.252.51.184) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 20 Jun 2024 16:07:45 +0000
Received: from EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41]) by
 EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41%3]) with mapi id
 15.02.1258.034; Thu, 20 Jun 2024 16:07:45 +0000
From: "Gowans, James" <jgowans@amazon.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "rppt@kernel.org"
	<rppt@kernel.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Thread-Index: AQHawypHT4hIOONPdEuIzJZkPab/U7HQ0aEA
Date: Thu, 20 Jun 2024 16:07:45 +0000
Message-ID: <eb58b1b2f84444acde3f9e25219fa40c73c499f8.camel@amazon.com>
References: <ZnRQv-EVf2LQ1Cjv@sirena.org.uk>
In-Reply-To: <ZnRQv-EVf2LQ1Cjv@sirena.org.uk>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <2574A97B080BF14B8E1870213DB416C5@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgTWFyaywNCg0KT24gVGh1LCAyMDI0LTA2LTIwIGF0IDE2OjU0ICswMTAwLCBNYXJrIEJyb3du
IHdyb3RlOg0KPiBIaSBhbGwsDQo+IA0KPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2YgdGhl
IG1lbWJsb2NrIHRyZWUgZ290IGEgY29uZmxpY3QgaW46DQo+IA0KPiAgIG1tL21lbWJsb2NrLmMN
Cj4gDQo+IGJldHdlZW4gY29tbWl0Og0KPiANCj4gICBlMGVlYzI0ZTJlMTk5ICgibWVtYmxvY2s6
IG1ha2UgbWVtYmxvY2tfc2V0X25vZGUoKSBhbHNvIHdhcm4gYWJvdXQgdXNlIG9mIE1BWF9OVU1O
T0RFUyIpDQo+IA0KPiBmcm9tIHRoZSBvcmlnaW4gdHJlZSBhbmQgY29tbWl0Og0KPiANCj4gICA5
NGZmNDZkZTRhNzM4ICgibWVtYmxvY2s6IE1vdmUgbGF0ZSBhbGxvYyB3YXJuaW5nIGRvd24gdG8g
cGh5cyBhbGxvYyIpDQo+IA0KPiBmcm9tIHRoZSBtZW1ibG9jayB0cmVlLg0KPiANCj4gSSBmaXhl
ZCBpdCB1cCAoc2VlIGJlbG93KSBhbmQgY2FuIGNhcnJ5IHRoZSBmaXggYXMgbmVjZXNzYXJ5LiBU
aGlzDQo+IGlzIG5vdyBmaXhlZCBhcyBmYXIgYXMgbGludXgtbmV4dCBpcyBjb25jZXJuZWQsIGJ1
dCBhbnkgbm9uIHRyaXZpYWwNCj4gY29uZmxpY3RzIHNob3VsZCBiZSBtZW50aW9uZWQgdG8geW91
ciB1cHN0cmVhbSBtYWludGFpbmVyIHdoZW4geW91ciB0cmVlDQo+IGlzIHN1Ym1pdHRlZCBmb3Ig
bWVyZ2luZy4gIFlvdSBtYXkgYWxzbyB3YW50IHRvIGNvbnNpZGVyIGNvb3BlcmF0aW5nDQo+IHdp
dGggdGhlIG1haW50YWluZXIgb2YgdGhlIGNvbmZsaWN0aW5nIHRyZWUgdG8gbWluaW1pc2UgYW55
IHBhcnRpY3VsYXJseQ0KPiBjb21wbGV4IGNvbmZsaWN0cy4NCj4gDQo+IGRpZmYgLS1jYyBtbS9t
ZW1ibG9jay5jDQo+IGluZGV4IGU4MWZiNjhmN2Y4ODgsNjkyZGM1NTFjMGZkZS4uMDAwMDAwMDAw
MDAwMA0KPiAtLS0gYS9tbS9tZW1ibG9jay5jDQo+ICsrKyBiL21tL21lbWJsb2NrLmMNCj4gQEBA
IC0xNDQxLDYgLTE0NDYsMjAgKzE0MzksOSBAQEAgcGh5c19hZGRyX3QgX19pbml0IG1lbWJsb2Nr
X2FsbG9jX3JhbmdlDQo+ICAgCWVudW0gbWVtYmxvY2tfZmxhZ3MgZmxhZ3MgPSBjaG9vc2VfbWVt
YmxvY2tfZmxhZ3MoKTsNCj4gICAJcGh5c19hZGRyX3QgZm91bmQ7DQo+ICAgDQo+ICsgCWlmIChX
QVJOX09OQ0UobmlkID09IE1BWF9OVU1OT0RFUywgIlVzYWdlIG9mIE1BWF9OVU1OT0RFUyBpcyBk
ZXByZWNhdGVkLiBVc2UgTlVNQV9OT19OT0RFIGluc3RlYWRcbiIpKQ0KPiArIAkJbmlkID0gTlVN
QV9OT19OT0RFOw0KPiArIA0KPiAgLQkvKg0KPiAgLQkgKiBEZXRlY3QgYW55IGFjY2lkZW50YWwg
dXNlIG9mIHRoZXNlIEFQSXMgYWZ0ZXIgc2xhYiBpcyByZWFkeSwgYXMgYXQNCj4gIC0JICogdGhp
cyBtb21lbnQgbWVtYmxvY2sgbWF5IGJlIGRlaW5pdGlhbGl6ZWQgYWxyZWFkeSBhbmQgaXRzDQo+
ICAtCSAqIGludGVybmFsIGRhdGEgbWF5IGJlIGRlc3Ryb3llZCAoYWZ0ZXIgZXhlY3V0aW9uIG9m
IG1lbWJsb2NrX2ZyZWVfYWxsKQ0KPiAgLQkgKi8NCj4gIC0JaWYgKFdBUk5fT05fT05DRShzbGFi
X2lzX2F2YWlsYWJsZSgpKSkgew0KPiAgLQkJdm9pZCAqdmFkZHIgPSBremFsbG9jX25vZGUoc2l6
ZSwgR0ZQX05PV0FJVCwgbmlkKTsNCj4gIC0NCj4gIC0JCXJldHVybiB2YWRkciA/IHZpcnRfdG9f
cGh5cyh2YWRkcikgOiAwOw0KPiAgLQl9DQo+ICAtDQoNClRoaXMgbG9va3MgbGlrZSB5b3UncmUg
ZGVsZXRpbmcgdGhlIGNoZWNrIGZyb20gdGhlDQptZW1ibG9ja19hbGxvY19yYW5nZSgpPyBUaGUg
aW50ZW50aW9uIG9mDQpjb21taXQgOTRmZjQ2ZGU0YTczOCAoIm1lbWJsb2NrOiBNb3ZlIGxhdGUg
YWxsb2Mgd2FybmluZyBkb3duIHRvIHBoeXMgYWxsb2MiKQ0Kd2FzIHRvICphZGQqIHRoaXMgY2hl
Y2sgaGVyZS4NCg0KRG8geW91IGhhdmUgYSBsaW5rIHdoZXJlIEkgY2FuIHNlZSB0aGUgZmluYWwg
cmVwbz8NCkknbSBub3Qgc2VlaW5nIGl0IGhlcmU6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L3RyZWUvbW0vbWVtYmxv
Y2suYw0KDQpKRw0KPiAgIAlpZiAoIWFsaWduKSB7DQo+ICAgCQkvKiBDYW4ndCB1c2UgV0FSTnMg
dGhpcyBlYXJseSBpbiBib290IG9uIHBvd2VycGMgKi8NCj4gICAJCWR1bXBfc3RhY2soKTsNCg0K

