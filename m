Return-Path: <linux-next+bounces-3359-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B8957AEB
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 03:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0C04B229DB
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 01:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D40817BB7;
	Tue, 20 Aug 2024 01:26:31 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mta22.hihonor.com (mta22.hihonor.com [81.70.192.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206C9B657;
	Tue, 20 Aug 2024 01:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.192.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724117191; cv=none; b=RRJvktJhTMFW0FbUx9ABp+PpqLGwK0JSenQLepv3G6UnN81WPgM+2vXDE6HVkBbJ4dQq+uJcWvh/MDx7p5yjrR89zbgfAeLK7flRriI5gykCZO+XRhRR8PkkQpRQcgFZhyTzQGtRX+P8qOL9m9zr8A+8w7cLsZU75YkpYBUL8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724117191; c=relaxed/simple;
	bh=Krr41LuZEs1S9h0U8XOYIzISY+b+qqiu7By+RBRoZA0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VJbV/W1oQKS+YBuKE3F8ksNQAdQJnGwTV/uH46+AtJLF2dOvatkVi2UMDFcgHPf18Re1P2rX0Tga+0y6XRYJsXaXTSiAUUuEXg+3espfl1mnQvONQFk22H4tRquecX+in17SzTuW6x6Jqe+E6Xv4tkR5PMS6cw26+QuJUIKm5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.192.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w003.hihonor.com (unknown [10.68.17.88])
	by mta22.hihonor.com (SkyGuard) with ESMTPS id 4WnsDw3BbjzYlDgx;
	Tue, 20 Aug 2024 09:24:00 +0800 (CST)
Received: from a006.hihonor.com (10.68.23.242) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 09:26:20 +0800
Received: from a007.hihonor.com (10.68.22.31) by a006.hihonor.com
 (10.68.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 09:26:19 +0800
Received: from a007.hihonor.com ([fe80::4407:dd67:71d7:ea82]) by
 a007.hihonor.com ([fe80::4407:dd67:71d7:ea82%10]) with mapi id
 15.02.1544.011; Tue, 20 Aug 2024 09:26:19 +0800
From: gaoxu <gaoxu2@honor.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IGxpbnV4LW5leHQ6IFNpZ25lZC1vZmYtYnkgbWlz?=
 =?utf-8?Q?sing_for_commit_in_the_mm_tree?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBsaW51eC1uZXh0OiBTaWduZWQtb2ZmLWJ5IG1pc3NpbmcgZm9y?=
 =?utf-8?Q?_commit_in_the_mm_tree?=
Thread-Index: AQHa8bp8XrklAbKU0UC0hV42PTSzP7It83BwgADUR4CAAJRcoA==
Date: Tue, 20 Aug 2024 01:26:19 +0000
Message-ID: <5cc94991f4a14d56a6c9a19ec42a94cd@honor.com>
References: <20240819080327.171fabbe@canb.auug.org.au>
	<8097d6e2573246f089906db6633e7958@honor.com>
 <20240819173357.425eef9ab459dd02f8d051d4@linux-foundation.org>
In-Reply-To: <20240819173357.425eef9ab459dd02f8d051d4@linux-foundation.org>
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

PiANCj4gT24gTW9uLCAxOSBBdWcgMjAyNCAwMzo1NjowNCArMDAwMCBnYW94dSA8Z2FveHUyQGhv
bm9yLmNvbT4gd3JvdGU6DQo+IA0KPiA+ID4NCj4gPiA+IEhpIGFsbCwNCj4gPiA+DQo+ID4gPiBD
b21taXQNCj4gPiA+DQo+ID4gPiAgIGNjYmIwN2IyYTNhNyAoIm1tOiBhZGQgbGF6eWZyZWUgZm9s
aW8gdG8gbHJ1IHRhaWwiKQ0KPiA+ID4NCj4gPiA+IGlzIG1pc3NpbmcgYSBTaWduZWQtb2ZmLWJ5
IGZyb20gaXRzIGF1dGhvci4NCj4gPiA+DQo+ID4gPiBBY3R1YWxseSB0aGUgQXV0aG9yIGlzICJn
YW94dSA8Z2FveHUyQGhvbm9yLmNvbT4iIHdoaWxlIHRoZQ0KPiA+ID4gU2lnbmVkLW9mZi1ieSBp
cyAiZ2FvIHh1IDxnYW94dTJAaGlob25vci5jb20+Ii4NCj4gPiBJIGFwb2xvZ2l6ZSBmb3IgdGhl
IG1pc3Rha2UuIEFyZSB0aGVyZSBhbnkgcmVtZWRpYWwgbWVhc3VyZXM/DQo+ID4gSSB3aWxsIGJl
IG1vcmUgY2FyZWZ1bCBuZXh0IHRpbWUuDQo+IA0KPiBXZWxsLCB3aGljaCBhZGRyZXNzIHNob3Vs
ZCB3ZSB1c2U/DQpVc2UgZ2FveHUgPGdhb3h1MkBob25vci5jb20+DQo=

