Return-Path: <linux-next+bounces-3351-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D557956281
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 06:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D697BB20ABE
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 04:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E694A156F3B;
	Mon, 19 Aug 2024 04:13:43 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mta21.hihonor.com (mta21.hihonor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09AC156C78;
	Mon, 19 Aug 2024 04:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724040823; cv=none; b=fOP7UhdoEC9kiOpoPe9+QF88QquVdihZRGpZRvqKF+jVMR4hvG/XRL3Qq4OrUI+a1R5e5es4wXwZfF2KUbx6Fda1Onf5a8hjJ5GzCx1bIe1KvTZs7Sj05yeICGCDAJUmG1Tf9tpfqobi0uyi4hhFg2TML+lsNebtygK9DWwU1gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724040823; c=relaxed/simple;
	bh=9Oe9BA1mg4AVxYuorM7s06/H1iF9GOzrXUG9sCTw0c8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WEOmRhyLaIwsNX+aZpD+U3vFB+r1jMn2/NcwoA1n9zttDdgzzQ7HqSKIcwmqYMBQrlclM6Sh+FVDY0IGAzPGY8De8fSZh6bBHa9fwtYOM5ZfjxA6jXm+uHYmXaZbcHVi2sRDxj4AgtlpBI3ZHzb+hD14kDTgEz6chVPCp5dqxsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w013.hihonor.com (unknown [10.68.26.19])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4WnJdK3CztzYrVFk;
	Mon, 19 Aug 2024 11:54:45 +0800 (CST)
Received: from a009.hihonor.com (10.68.30.244) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Aug
 2024 11:56:04 +0800
Received: from a007.hihonor.com (10.68.22.31) by a009.hihonor.com
 (10.68.30.244) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 Aug
 2024 11:56:04 +0800
Received: from a007.hihonor.com ([fe80::4407:dd67:71d7:ea82]) by
 a007.hihonor.com ([fe80::4407:dd67:71d7:ea82%10]) with mapi id
 15.02.1544.011; Mon, 19 Aug 2024 11:56:04 +0800
From: gaoxu <gaoxu2@honor.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
	<akpm@linux-foundation.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: =?utf-8?B?5Zue5aSNOiBsaW51eC1uZXh0OiBTaWduZWQtb2ZmLWJ5IG1pc3NpbmcgZm9y?=
 =?utf-8?Q?_commit_in_the_mm_tree?=
Thread-Topic: linux-next: Signed-off-by missing for commit in the mm tree
Thread-Index: AQHa8bp8XrklAbKU0UC0hV42PTSzP7It83Bw
Date: Mon, 19 Aug 2024 03:56:04 +0000
Message-ID: <8097d6e2573246f089906db6633e7958@honor.com>
References: <20240819080327.171fabbe@canb.auug.org.au>
In-Reply-To: <20240819080327.171fabbe@canb.auug.org.au>
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

PiANCj4gSGkgYWxsLA0KPiANCj4gQ29tbWl0DQo+IA0KPiAgIGNjYmIwN2IyYTNhNyAoIm1tOiBh
ZGQgbGF6eWZyZWUgZm9saW8gdG8gbHJ1IHRhaWwiKQ0KPiANCj4gaXMgbWlzc2luZyBhIFNpZ25l
ZC1vZmYtYnkgZnJvbSBpdHMgYXV0aG9yLg0KPiANCj4gQWN0dWFsbHkgdGhlIEF1dGhvciBpcyAi
Z2FveHUgPGdhb3h1MkBob25vci5jb20+IiB3aGlsZSB0aGUgU2lnbmVkLW9mZi1ieQ0KPiBpcyAi
Z2FvIHh1IDxnYW94dTJAaGlob25vci5jb20+Ii4NCkkgYXBvbG9naXplIGZvciB0aGUgbWlzdGFr
ZS4gQXJlIHRoZXJlIGFueSByZW1lZGlhbCBtZWFzdXJlcz8NCkkgd2lsbCBiZSBtb3JlIGNhcmVm
dWwgbmV4dCB0aW1lLg0KPiANCj4gLS0NCj4gQ2hlZXJzLA0KPiBTdGVwaGVuIFJvdGh3ZWxsDQo=

