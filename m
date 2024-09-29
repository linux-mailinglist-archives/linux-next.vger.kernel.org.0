Return-Path: <linux-next+bounces-4001-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 469479894EA
	for <lists+linux-next@lfdr.de>; Sun, 29 Sep 2024 12:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F251EB23372
	for <lists+linux-next@lfdr.de>; Sun, 29 Sep 2024 10:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F0A155A24;
	Sun, 29 Sep 2024 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="wk1Ntn52"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32443D96D;
	Sun, 29 Sep 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727607233; cv=none; b=sMlMGLfHYiS6ujvR2ws+6+5TVoF6RZyy2eGeBGwBWzGP3bB2of3jzUaaM+cyicD8DX2fWUgDTGxe9CTDsYNEMgfMspxUif5Sxia6+8eXrfrzKkVlCk//LiH0H1Dff8a/Suom3Nlq9SDzyXxiVStaL7uwb90FihuPW6Dbl65gyXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727607233; c=relaxed/simple;
	bh=nFGNgpMuxNd8OSXIMpogKXIDtTfNuTnKkJcCgtNGNfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CK2PPIwzbYCjmmnbafVllGYhQAU+I0oXprd0A5JFebYdeA2QIK2uCziT65DcauEZPxjhSb7lD1UF7beOiyCFQwW8c/BMCNJL4h9U5/AuHLRVnMaENkIt114tyoaWnu6yrfIEx1EHVFXtLeepLzM0mQ0KxokoGNT6NSoTCmMDpZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=wk1Ntn52; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727607211; x=1728212011; i=spasswolf@web.de;
	bh=zPqD4XDiMUpUzzVnrJEh84YjVSQx4bMEZ+tyr+9GxXE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wk1Ntn52tMv92uJ+uLoLEfbdK9GI54LgEFQjkVWg6wg9hqCAToWzefn8qdRqulDS
	 40FRXiuozoWdpn3CZB3r8NZx1sSIah7xFvRg8VTiZcme7tCZgZdOAaUq1/HLPkOww
	 YLPbRMkG00Xjp0yO/jtP9HcuBKKpXeNQ+R+ob45AlF05vf0QSLXRKDCXSCsfmnmze
	 aAItaC4eq6x3NJpcTjRp89Kt9Z49erjpuCc0Q8FJhfDJywIDFHZruPB7SVbGf7wGH
	 yr2a/yOQ6vUxh2PmoY7RSUmoaqv5Jl3XHeq1VLmMAe0f3Wbiz03oJLabPhacjGnqk
	 1e7uEd1YUeIEkOzlWw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MidHZ-1sIlWH3hOp-00gDfe; Sun, 29 Sep 2024 12:53:30 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: Re: hung tasks on shutdown in linux-next-202409{20,23,24,25}
Date: Sun, 29 Sep 2024 12:53:28 +0200
Message-ID: <20240929105329.4797-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: 9cc0310c-1fbd-4bfc-aad7-f092583bd81b@gmail.com
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jUOg5oDYPI5456PVoD+NDEPMW0yVJwgINi3KUma+cCCtHnuww1w
 lLrSV3M/X1mqaLIKoLrzJPRsIdEzIF/krsm9rtyVI8Xg+E20nFwS5ynv+8fu5MdPvTiuewo
 f5qMJU1i2wWTCEP0C029XMq3kX6HbuEMvf7HBmhEstnYRI5pJChiX/5GirkaAmv+KqBD39q
 5Xs/d59gupQUnaq2Pzx7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WnFflAfl0l0=;cBU2blgcJUlICd5WOY8CQsT5XVJ
 xyUU4Ns/CqD8qnBf93/gP1FL8Nnot9/tM6m+WcdEC4OVagn7W2poHjKL2Vza61+KmYwhInfWb
 MQprr68ckMbm8KhY26DsVwxbXsYIMZEijby5BLjAnaJz+2ldG4HIPh1CjtvA2yI1fujh1aiL6
 XnTv13nEBDiCJx/JdO8SOsdGjgV4xs+sEp0pe+MuBVXtGcMVvoCvzYP5njPLmVwhPrPEgXGqY
 WjkSz3qWr8Yct+ZG96UBdxc4GNxUorsvkbzwgHdmDuTMq++TAGZOMR5YxjX+EJY6Jplm6CcP/
 krzfyOite4P1hUkqeHLgWR2Nazq7g+NFnWv7BEnwM//Dv8m1s3P4ZO7477gHl5y8Sqf6y6HyY
 i4gSD1t77rqgSe7PN9WSwYWtHKS5DmD+iGb43zPIw7zaPlmMgDF7rCstlBZNFRsvqTqVMGs7t
 8O+c/hyS8JgY6m6ZDrod8bxTADpsgAs/tVulMAHbFI3irKMAbGrpDRN31oTFLjOSjjU9JQNvg
 cXlG38cZigfDVAFbC8fotlCdWJzjnlpRG0qu1uwimm6rINOua89XpJK2PvYabqpnLSa3owm5Y
 WmQhsjLEg2PHGuyZl9OKY4WE1tkhYJHesES5i0QdYhXHdqKTiyrIFrk5xOFeWm3TVT51RLZL1
 8lLvTdUiLmaUA+pvgrYY5gqqohvSrOBlGlo3Cn2/arLFYPT9nTg5F7f588y++Kd4MyraQ2YuX
 qJvwLwhcGRcNeQiz7rHZkKJ0dqda1tFfGTAffHfZqTTH/bIM57Hh3nETyey9uIRVrYKnNDCGq
 vXDeYrv99HehiDIsZOCcLs3A==

Summary: The introduction of async reboot in commit 8064952c6504
("driver core: shut down devices asynchronously") leads to frequent hangs =
on
shutdown even after commit 4f2c346e6216 ("driver core: fix async device sh=
utdown hang")
is introduced.

I did some further experimenting (and lots of reboots ...) and found out t=
hat
the bug is preemption related, for me it only occurs when using CONFIG_PRE=
EMPT=3Dy
or CONFIG_PREEMPT_RT=3Dy. When using CONFIG_PREEMPT_NONE=3Dy or
CONFIG_PREEMPT_VOLUNTARY=3Dy everything works fine.

Test results (linux-next-20240925):
PREEMPT_NONE		20 reboots, no fail
PREEMPT_VOLUNTARY	20 reboots, no fail
PREEMPT			3 reboots, 4th reboot failed
PREEMPT_RT		2 reboots, 3rd reboot failed

The behaviour can be improved by increasing the number of min_active items
in the async workqueue:

diff --git a/kernel/async.c b/kernel/async.c
index 4c3e6a44595f..83e9267c61e7 100644
=2D-- a/kernel/async.c
+++ b/kernel/async.c
@@ -358,5 +358,5 @@ void __init async_init(void)
 	 */
 	async_wq =3D alloc_workqueue("async", WQ_UNBOUND, 0);
 	BUG_ON(!async_wq);
-	workqueue_set_min_active(async_wq, WQ_DFL_ACTIVE);
+	workqueue_set_min_active(async_wq, WQ_UNBOUND_MAX_ACTIVE);
 }

With this I took 11 reboots to get a hang.
I tried increasing WQ_MAX_ACTIVE, too:

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 59c2695e12e7..314f554b45df 100644
=2D-- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -412,7 +412,7 @@ enum wq_flags {
 };

 enum wq_consts {
-	WQ_MAX_ACTIVE		=3D 512,	  /* I like 512, better ideas? */
+	WQ_MAX_ACTIVE		=3D 1024,	  /* 1024 for async shutdown with preempt{full,=
rt}*/
 	WQ_UNBOUND_MAX_ACTIVE	=3D WQ_MAX_ACTIVE,
 	WQ_DFL_ACTIVE		=3D WQ_MAX_ACTIVE / 2,

With this (and the first patch) I can get 20 clean reboots even when using=
 CONFIG_PREEMPT=3Dy.
I have not yet tested CONFIG_PREEMPT_RT=3Dy with this.

Edit: Fixed In-Reply-To:

Bert Karwatzki

