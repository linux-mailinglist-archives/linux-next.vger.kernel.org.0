Return-Path: <linux-next+bounces-2616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F3391103B
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 20:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C69F01C24275
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 18:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF141BB69E;
	Thu, 20 Jun 2024 17:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="ei8QAsh0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com [52.119.213.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F4F1BA090;
	Thu, 20 Jun 2024 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906353; cv=none; b=K0FKVKaVLAwdhwBgtr9dWvgAN8Cp2G6K/DmVrkAs2/MF3Ot1J8MTv4zgidzts+fzRttI2FkleghLhD4hJaDTdHun1dhzI41CL4AjlzN5e2tcf5HK3oY8B/VluUtqtylxgjtF1FcBgTQPtESwgQ5L4qbfcwvER1FPcTGyRdv7uLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906353; c=relaxed/simple;
	bh=7SWkegubJpAX6MYXk8YsehLNWGmKMMWRlgPICBLrNQc=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CYBG7WvPh0lgsnVWhhMG0elz1qIvl+25PeDyP4Oemb6hoVkBYO7nVEcXv18s8BThONVTwmzKpLpQvL9jbQjO0D90Oogr0F49cil+m8UL+WmWQX9M1VZLlC6si/Q1T2lghWksisISzZagjE8IxB5T40EXWUGLeN2nRusSkSg5Ldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=ei8QAsh0; arc=none smtp.client-ip=52.119.213.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1718906351; x=1750442351;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=7SWkegubJpAX6MYXk8YsehLNWGmKMMWRlgPICBLrNQc=;
  b=ei8QAsh0i213J7+bFN0oCyDVuX19F13Q2TzfWYhdEs4ynaCi405Q9lUp
   9MSvZZTfIUdkiNaOxrUlB+x2MLd1vviD/1Qr25u3q92VENp5irRKZEQyf
   oPGz8dbVglbU0Tt4CMJFUnK1Zi5n8PoLzi2Bw6sGtxUY4lsL3TNyPXBE0
   w=;
X-IronPort-AV: E=Sophos;i="6.08,252,1712620800"; 
   d="scan'208";a="6216262"
Subject: Re: linux-next: manual merge of the memblock tree with the origin tree
Thread-Topic: linux-next: manual merge of the memblock tree with the origin tree
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 17:59:07 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.17.79:8811]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.44.46:2525] with esmtp (Farcaster)
 id f9f0cc6a-34f6-443a-82bd-b8edf14f83a0; Thu, 20 Jun 2024 17:59:05 +0000 (UTC)
X-Farcaster-Flow-ID: f9f0cc6a-34f6-443a-82bd-b8edf14f83a0
Received: from EX19D014EUC003.ant.amazon.com (10.252.51.184) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 20 Jun 2024 17:59:05 +0000
Received: from EX19D014EUC004.ant.amazon.com (10.252.51.182) by
 EX19D014EUC003.ant.amazon.com (10.252.51.184) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 20 Jun 2024 17:59:05 +0000
Received: from EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41]) by
 EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41%3]) with mapi id
 15.02.1258.034; Thu, 20 Jun 2024 17:59:05 +0000
From: "Gowans, James" <jgowans@amazon.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Thread-Index: AQHawypHT4hIOONPdEuIzJZkPab/U7HQ0aEAgAABrICAAB1rgA==
Date: Thu, 20 Jun 2024 17:59:05 +0000
Message-ID: <e6f1bf73d13060635520c70df269c0b390352f37.camel@amazon.com>
References: <ZnRQv-EVf2LQ1Cjv@sirena.org.uk>
	 <eb58b1b2f84444acde3f9e25219fa40c73c499f8.camel@amazon.com>
	 <db13f2b7-88da-42db-85ed-d78cdd5f6c62@sirena.org.uk>
In-Reply-To: <db13f2b7-88da-42db-85ed-d78cdd5f6c62@sirena.org.uk>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DA72AF9A986854FB958FFF9D57956DA@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVGh1LCAyMDI0LTA2LTIwIGF0IDE3OjEzICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBUaHUsIEp1biAyMCwgMjAyNCBhdCAwNDowNzo0NVBNICswMDAwLCBHb3dhbnMsIEphbWVzIHdy
b3RlOg0KPiA+IE9uIFRodSwgMjAyNC0wNi0yMCBhdCAxNjo1NCArMDEwMCwgTWFyayBCcm93biB3
cm90ZToNCj4gDQo+ID4gPiArIAlpZiAoV0FSTl9PTkNFKG5pZCA9PSBNQVhfTlVNTk9ERVMsICJV
c2FnZSBvZiBNQVhfTlVNTk9ERVMgaXMgZGVwcmVjYXRlZC4gVXNlIE5VTUFfTk9fTk9ERSBpbnN0
ZWFkXG4iKSkNCj4gPiA+ICsgCQluaWQgPSBOVU1BX05PX05PREU7DQo+ID4gPiArIA0KPiA+ID4g
IC0JLyoNCj4gPiA+ICAtCSAqIERldGVjdCBhbnkgYWNjaWRlbnRhbCB1c2Ugb2YgdGhlc2UgQVBJ
cyBhZnRlciBzbGFiIGlzIHJlYWR5LCBhcyBhdA0KPiA+ID4gIC0JICogdGhpcyBtb21lbnQgbWVt
YmxvY2sgbWF5IGJlIGRlaW5pdGlhbGl6ZWQgYWxyZWFkeSBhbmQgaXRzDQo+ID4gPiAgLQkgKiBp
bnRlcm5hbCBkYXRhIG1heSBiZSBkZXN0cm95ZWQgKGFmdGVyIGV4ZWN1dGlvbiBvZiBtZW1ibG9j
a19mcmVlX2FsbCkNCj4gPiA+ICAtCSAqLw0KPiANCj4gPiBUaGlzIGxvb2tzIGxpa2UgeW91J3Jl
IGRlbGV0aW5nIHRoZSBjaGVjayBmcm9tIHRoZQ0KPiA+IG1lbWJsb2NrX2FsbG9jX3JhbmdlKCk/
IFRoZSBpbnRlbnRpb24gb2YNCj4gPiBjb21taXQgOTRmZjQ2ZGU0YTczOCAoIm1lbWJsb2NrOiBN
b3ZlIGxhdGUgYWxsb2Mgd2FybmluZyBkb3duIHRvIHBoeXMgYWxsb2MiKQ0KPiA+IHdhcyB0byAq
YWRkKiB0aGlzIGNoZWNrIGhlcmUuDQo+IA0KPiBIdWgsIGdpdCBzaG93ZWQgdGhlIGFkZC9hZGQg
Y29uZmxpY3Qgd2VpcmRseSB0aGVuIChpdCBsb29rZWQgbGlrZSBhbg0KPiBhZGQvcmVtb3ZlKSBh
bmQgSSB3YXNuJ3QgcGF5aW5nIGVub3VnaCBhdHRlbnRpb24uICBTb3JyeSBhYm91dCB0aGF0Lg0K
PiANCj4gPiBEbyB5b3UgaGF2ZSBhIGxpbmsgd2hlcmUgSSBjYW4gc2VlIHRoZSBmaW5hbCByZXBv
Pw0KPiA+IEknbSBub3Qgc2VlaW5nIGl0IGhlcmU6DQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL21tL21l
bWJsb2NrLmMNCj4gDQo+IFRoZSBtZXJnZSBpcyBzdGlsbCBydW5uaW5nLCBpdCdsbCBhcHBlYXIg
d2hlbmV2ZXIgLW5leHQgaXMgcmVsZWFzZWQNCj4gdG9kYXkuDQoNCkxvb2tpbmcgYXQgdG9kYXkn
cyAtbmV4dDoNCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL21tL21lbWJsb2NrLmM/aD1uZXh0LTIwMjQwNjIw
I24xNDM0DQpJIHRoaW5rIHRoaXMgY2hlY2sgZGlkIGluZGVlZCBhY2NpZGVudGFsbHkgZ2V0IGRl
bGV0ZWQgaW4gdGhlIG1lcmdlLg0KDQpXZSdyZSBleHBlY3RpbmcgdGhlIGRpZmYgaW4gdGhpcyBj
b21taXQgdG8gYmUgcHJlc2VudDoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0L21tL21lbWJsb2NrLmM/aD1u
ZXh0LTIwMjQwNjIwJmlkPTk0ZmY0NmRlNGE3MzhlNzkxNmI2OGFiNWNjMGIwMzgwNzI5ZjAyYWYN
Cg0KLi4uIGJ1dCB0aGUgbWVyZ2UgY29tbWl0IGFwcGVhcnMgdG8gaGF2ZSB0aGUgZGVsZXRpbmcg
cGFydCBidXQgbm90IHRoZQ0KYWRkaW5nIHBhcnQ6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC9tbS9tZW1i
bG9jay5jP2g9bmV4dC0yMDI0MDYyMCZpZD00Mjc4MWJmOWVmODVkM2QyNTllYzM0NWYzYzRlNmE1
YThiOGFkZDY0DQoNCkNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLCBidXQgaXQgbG9va3MgbGlrZSB0
aGUgaWYgc3RhdGVtZW50IG9ubHkgZ290DQpkZWxldGVkIGFuZCBub3QgbW92ZWQsIHNvIHRoaXMg
d291bGQgbmVlZCB0byBiZSByZS13b3JrZWQuDQoNCkpHDQo=

