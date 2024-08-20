Return-Path: <linux-next+bounces-3360-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB77957BF6
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 05:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 176471F23A76
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 03:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEDD4D8CC;
	Tue, 20 Aug 2024 03:41:50 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mta22.hihonor.com (mta22.honor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC34C618;
	Tue, 20 Aug 2024 03:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724125310; cv=none; b=tbQs7EZd0VenvCqla2nkkLSXs/I6sdsq7yNmIQKGY1Lzl4MnQ6OQBhfKryZhHcEb8QmQ/6BD3otb+gx+zQfxue6UQBppt92UEjb6/8JAD4/rl2bG9B7eSUHKHiGWHAhDHzY1Yr5SLVf5M6kKYcK8hUVhdpJ72wUaaFkp8EgKlYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724125310; c=relaxed/simple;
	bh=+NKPnHArmrMH5TSbooq20XeeTEXdpz3vPx0uEwuR7xw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OqBqxv+7rrN2QCcB1ZYZ0nPQmiiktA9/q+BtjD9EBRpUrIHqQsAzjYVd+0n9qzIkrWw+q17zv2XiukreHLVt//KFzKR6gC5gvMakUs5txZzzNLGzeTlbvYYJl2cP0Nvf4bfMJ3JKVoW57BWxBCCWJSfe04SnOxNVOCFkQzlvtR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w012.hihonor.com (unknown [10.68.27.189])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4WnwF96fthzYl1Fm;
	Tue, 20 Aug 2024 11:39:25 +0800 (CST)
Received: from a006.hihonor.com (10.68.23.242) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 11:41:45 +0800
Received: from a007.hihonor.com (10.68.22.31) by a006.hihonor.com
 (10.68.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 11:41:45 +0800
Received: from a007.hihonor.com ([fe80::4407:dd67:71d7:ea82]) by
 a007.hihonor.com ([fe80::4407:dd67:71d7:ea82%10]) with mapi id
 15.02.1544.011; Tue, 20 Aug 2024 11:41:45 +0800
From: gaoxu <gaoxu2@honor.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IGxpbnV4LW5leHQ6IFNpZ25lZC1vZmYtYnkgbWlz?=
 =?utf-8?Q?sing_for_commit_in_the_mm_tree?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBsaW51eC1uZXh0OiBTaWduZWQtb2ZmLWJ5IG1pc3NpbmcgZm9y?=
 =?utf-8?Q?_commit_in_the_mm_tree?=
Thread-Index: AQHa8bp8XrklAbKU0UC0hV42PTSzP7It83BwgADUR4CAAJRcoIAAIcHg
Date: Tue, 20 Aug 2024 03:41:45 +0000
Message-ID: <e85bad8d463e4f529cabfc24292f47aa@honor.com>
References: <20240819080327.171fabbe@canb.auug.org.au>
	<8097d6e2573246f089906db6633e7958@honor.com>
 <20240819173357.425eef9ab459dd02f8d051d4@linux-foundation.org>
 <5cc94991f4a14d56a6c9a19ec42a94cd@honor.com>
In-Reply-To: <5cc94991f4a14d56a6c9a19ec42a94cd@honor.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
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

PiA+DQo+ID4gT24gTW9uLCAxOSBBdWcgMjAyNCAwMzo1NjowNCArMDAwMCBnYW94dSA8Z2FveHUy
QGhvbm9yLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gSGkgYWxsLA0KPiA+ID4g
Pg0KPiA+ID4gPiBDb21taXQNCj4gPiA+ID4NCj4gPiA+ID4gICBjY2JiMDdiMmEzYTcgKCJtbTog
YWRkIGxhenlmcmVlIGZvbGlvIHRvIGxydSB0YWlsIikNCj4gPiA+ID4NCj4gPiA+ID4gaXMgbWlz
c2luZyBhIFNpZ25lZC1vZmYtYnkgZnJvbSBpdHMgYXV0aG9yLg0KPiA+ID4gPg0KPiA+ID4gPiBB
Y3R1YWxseSB0aGUgQXV0aG9yIGlzICJnYW94dSA8Z2FveHUyQGhvbm9yLmNvbT4iIHdoaWxlIHRo
ZQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5IGlzICJnYW8geHUgPGdhb3h1MkBoaWhvbm9yLmNvbT4i
Lg0KPiA+ID4gSSBhcG9sb2dpemUgZm9yIHRoZSBtaXN0YWtlLiBBcmUgdGhlcmUgYW55IHJlbWVk
aWFsIG1lYXN1cmVzPw0KPiA+ID4gSSB3aWxsIGJlIG1vcmUgY2FyZWZ1bCBuZXh0IHRpbWUuDQo+
ID4NCj4gPiBXZWxsLCB3aGljaCBhZGRyZXNzIHNob3VsZCB3ZSB1c2U/DQo+IFVzZSBnYW94dSA8
Z2FveHUyQGhvbm9yLmNvbT4NCk91ciBjb21wYW55IGhhcyByZWNlbnRseSBsYXVuY2hlZCBhIG5l
dyBkb21haW4gbmFtZTpob25vci5jb20sIHdoaWxlIHRoZSBvcmlnaW5hbCBkb21haW4gbmFtZTpo
aWhvbm9yLmNvbSB3aWxsIGFsc28gY29udGludWUgdG8gYmUgbWFpbnRhaW5lZC4NClRoZXJlZm9y
ZSwgdGhlIElUIGRlcGFydG1lbnQgcmVjb21tZW5kcyB1c2luZyBnYW94dTJAaG9ub3IuY29tLiAg
SG93ZXZlciwgaWYgY29udGludWUgdG8gdXNlIGdhb3h1MkBoaWhvbm9yLmNvbSwgaXQgd2lsbCBh
bHNvIHdvcmsgZm9yIGNvbW11bmljYXRpb24uDQpTbywgcmVjb21tZW5kcyB1c2UgZ2FveHUgPGdh
b3h1MkBob25vci5jb20+LCAgSG93ZXZlciB1c2luZyBnYW8geHUgPGdhb3h1MkBoaWhvbm9yLmNv
bT4gaXMgYWxzbyBmaW5lLg0K

