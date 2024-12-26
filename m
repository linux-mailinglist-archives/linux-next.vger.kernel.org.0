Return-Path: <linux-next+bounces-5017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC69FCB8B
	for <lists+linux-next@lfdr.de>; Thu, 26 Dec 2024 16:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00B98162128
	for <lists+linux-next@lfdr.de>; Thu, 26 Dec 2024 15:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD76B54738;
	Thu, 26 Dec 2024 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="mhrVeMOf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785926AF5
	for <linux-next@vger.kernel.org>; Thu, 26 Dec 2024 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.95.48.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735226994; cv=none; b=Y5zA1B3eSFH1tNmU5K8Tko9eA3qrXGyDzws6GVa8urkP2yUpu4sXmNG+hIhydEJ0plEx+bKaL5v1gICtxG6SJaej9jm4pbZ4gbu3zxMdORN7fdY/93yZ9UcPMvRQAWO/8//B/wmV0zgBrxX8+mTNgIL6bZt+LCmxpKJtP4eK944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735226994; c=relaxed/simple;
	bh=zqU9BfngaBY3IvrqsXMtAyYXo/grR6QjVVjusTVr8Fw=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=isI8/OD9UiHvXfHTpnOvADqniHNJkn22Qd70S6KKEtG1ZC5dzxZDiMyxw+iEh/ZPCS8rTaT+ZEnuaufovAgGAzIVq4E+Ul8kNKmAkMuL2o6QivHadNXxK8zZ5gSqc384OBgqpdax2xfvmfPWVlgIG8hSTLA4dNG+tZ5llaigEW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=mhrVeMOf; arc=none smtp.client-ip=52.95.48.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1735226991; x=1766762991;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=zqU9BfngaBY3IvrqsXMtAyYXo/grR6QjVVjusTVr8Fw=;
  b=mhrVeMOfY4zdq/fpKm7DGLzLDoOthrxXbf59yMFbeaoAvum6g/GFUu03
   guJiQSymVi+SZWJv+SPfhMkp9misPvj8AXqYlELnPk5hx0yrsOpIs9wDJ
   YoTznNDwLgh82xC0nje+C/xH/BveBTHC/XAZJKdyeO5kID/AzRRLa/0ca
   s=;
X-IronPort-AV: E=Sophos;i="6.12,266,1728950400"; 
   d="scan'208";a="448711518"
Subject: Re: Linux-next compilation and build
Thread-Topic: Linux-next compilation and build
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 15:29:49 +0000
Received: from EX19MTAEUC002.ant.amazon.com [10.0.17.79:39598]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.13.154:2525] with esmtp (Farcaster)
 id d3339ab6-3b82-4e1e-a3b5-cc762b9205de; Thu, 26 Dec 2024 15:29:49 +0000 (UTC)
X-Farcaster-Flow-ID: d3339ab6-3b82-4e1e-a3b5-cc762b9205de
Received: from EX19D020EUC004.ant.amazon.com (10.252.51.246) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 26 Dec 2024 15:29:49 +0000
Received: from EX19D020EUC001.ant.amazon.com (10.252.51.204) by
 EX19D020EUC004.ant.amazon.com (10.252.51.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 26 Dec 2024 15:29:48 +0000
Received: from EX19D020EUC001.ant.amazon.com ([fe80::4eb3:c568:226e:434]) by
 EX19D020EUC001.ant.amazon.com ([fe80::4eb3:c568:226e:434%3]) with mapi id
 15.02.1258.039; Thu, 26 Dec 2024 15:29:48 +0000
From: "Bondarev, Alex" <alexbnd@amazon.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Thread-Index: AQHbVVX2yI1HTROjBkCpfdl+3bj6AbL0GIaA//+nAgCAAMjEAIAAxDeA
Date: Thu, 26 Dec 2024 15:29:48 +0000
Message-ID: <080CD985-138C-42CA-A46D-175FB7C694A5@amazon.com>
References: <4FF05C5D-F7C0-4212-9917-0D94DF3DCA60@contoso.com>
 <vnymur42hlcdiodh2pyoikdc5646zceiuf6sizgde4jmeqd4xi@b7xt7wuq3aaz>
 <94E577D3-046D-4E8F-96D6-593D4F7C808D@amazon.com>
 <20241224111924.14263694@canb.auug.org.au>
In-Reply-To: <20241224111924.14263694@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <F35BE82881BF4248A21A6CBE36739667@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

U3VyZSB0aGluZywgd2UnbGwgc2VlIGhvdyB3ZSBjYW4gYXV0b21hdGUgdGhpcy4NCkFueSBzcGVj
aWZpYyBmb3JtYXQgd2Ugc2hvdWxkIGFkaGVyZSB0bz8gKG9mIGNvdXJzZSB3ZSB3aWxsIGluY2x1
ZGUgdGhlIHRhZyB0aGF0IHdhcyB1c2VkIGFuZCBhcmNoaXRlY3R1cmUpLg0KDQrvu79PbiAyMDI0
LjEyLjIzLCAxODoxOSwgIlN0ZXBoZW4gUm90aHdlbGwiIDxzZnJAY2FuYi5hdXVnLm9yZy5hdSA8
bWFpbHRvOnNmckBjYW5iLmF1dWcub3JnLmF1Pj4gd3JvdGU6DQoNCg0KSGkgQWxleCwNCg0KDQpP
biBNb24sIDIzIERlYyAyMDI0IDE4OjIwOjUwICswMDAwICJCb25kYXJldiwgQWxleCIgPGFsZXhi
bmRAYW1hem9uLmNvbSA8bWFpbHRvOmFsZXhibmRAYW1hem9uLmNvbT4+IHdyb3RlOg0KPg0KPiBP
biBNb24sIERlYyAyMywgMjAyNCBhdCAwNDoxNjowM1BNICswMDAwLCBCb25kYXJldiwgQWxleCB3
cm90ZToNCj4gPiBJJ20gcGFydCBvZiBhIHRlYW0gaW4gQVdTIHRoYXQgdXNlcyB0aGUgbGludXgt
bmV4dCBicmFuY2ggd2l0aCBjYW5vbmljYWwncw0KPiA+IHBwYSB0byB0ZXN0IGZvciBidWlsZCBz
dWNjZXNzLg0KPiA+IGdpdDogZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQNCj4gPiBwcGE6IHBwYTpjYW5vbmljYWwta2VybmVs
LXRlYW0vcHBhIA0KPiANCj4gPiBBcyBhIHJlc3VsdCBvZiB0aGlzIGRhaWx5IHRlc3QgKHdlIHRy
eSB0aGUgbGF0ZXN0IGF2YWlsYWJsZSBhdCB0aW1lIG9mDQo+ID4gdGVzdGluZyksIHdlIGhhdmUg
YWxtb3N0IGltbWVkaWF0ZSBrbm93bGVkZ2Ugb2YgdGhlICJnb29kbmVzcyIgb2YgdGhlIGJyYW5j
aA0KPiA+IChpZiB0aGUgbWFjaGluZSBkb2Vzbid0IGJvb3QgYWZ0ZXIgdXBkYXRlIG9mIGlmIHRo
ZSBjb21waWxhdGlvbiBmYWlscykuIFdlDQo+ID4gYXJlIGN1cnJlbnRseSBydW5uaW5nIGJ1aWxk
IG9uIGFhcmNoNjQgYW5kIHg4Nl82NCB0eXBlcy4NCj4gPg0KPiA+IFRoZSBxdWVzdGlvbiBpcyBz
aG91bGQgd2Ugbm90aWZ5IHZpYSBhIG1haWxpbmcgbGlzdCBvciBhIHNpbmdsZSBkZXN0aW5hdGlv
bg0KPiA+IGFib3V0IHRoaXMgZmFpbHVyZT8gV2lsbCBpdCBpbXByb3ZlIHRoZSBkZXRlY3Rpb24g
dGltZSBmb3IgYSBiYWQgbWVyZ2U/IA0KDQoNClRoYW5rcyBmb3IgdGVzdGluZyENCg0KDQpOb3Rp
ZmljYXRpb25zIHNob3VsZCBiZSBzZW50IHRvIGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnIDxt
YWlsdG86bGludXgtbmV4dEB2Z2VyLmtlcm5lbC5vcmc+IGFuZCBjYydkIHRvDQpsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnIDxtYWlsdG86bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4g
YW5kIGFueSBkZXZlbG9wZXJzIG9yIG1haW50YWluZXJzIHRoYXQgeW91DQp0aGluayBtYXkgYmUg
aW52b2x2ZWQgd2l0aCB0aGUgY29kZSBjYXVzaW5nIHByb2JsZW1zLg0KDQoNCi0tIA0KQ2hlZXJz
LA0KU3RlcGhlbiBSb3Rod2VsbA0KDQoNCg0K

