Return-Path: <linux-next+bounces-4000-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBA99894E5
	for <lists+linux-next@lfdr.de>; Sun, 29 Sep 2024 12:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD771C216D9
	for <lists+linux-next@lfdr.de>; Sun, 29 Sep 2024 10:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E55155758;
	Sun, 29 Sep 2024 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="RBea93zc"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E73113A878;
	Sun, 29 Sep 2024 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727607137; cv=none; b=aKz7QW4VrmOCpYFdQlHBHKBLE1/036Le3xLIW55rzag9znO+08O2YJ9vs5aMQEaAhGWV+HFqnzL1jHvB2Y/nmofuO6oafx3bmWkkMk8v8irLXPSApGLXZhWRSCX/NcqcgXInz0q65U5ZqKkQHckgSW3EVBfNszqYybF0cQi266k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727607137; c=relaxed/simple;
	bh=4BRtjCRGp684InRlV/U6psQPIrCQ6r/tFD9/beFGKms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UA1MfbxvPAEwskqrigUsybwNty07ZPmqCV9oxRFh1Fez/xbcLi+O9xhPgg0rX3KsziUq/pV3N9wOIdtk6TznwlQ0C/L9VANoiVD+IMXlVtAwa4d7/K8KSxp8Oan6W2AWrhg4sZAwzNJaWWhEJ4dm5npt9zE54t2+CZLdr76LXa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=RBea93zc; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727607125; x=1728211925; i=spasswolf@web.de;
	bh=NmZLWbTDZJNUVnhfU8fTIqYMpr3T9IL5wlFnyipE6NQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RBea93zcaPqQf7z/VaxCRRrrSgqueZzLvPbYnZ1+qu82g5pLS0xQte3Uw+Q7a5xH
	 aQzpcF015Vw4QRVoHSnq93w4fl230tWcPLDj8u0WRgL1MU2arTbUpECVb82sscLdC
	 2oP+MIr/ZU5JzZdz9Ga3djjfeBuzI1vE3i2QdOcbCsfaeCA7f6sdOw3jRqpgkhXMn
	 8v2Mi5OzJRd+RAzX2urDa2A0t6zo0TJszGNZvh/rtsLEOW9cpe/g015YA+6Xq+wiD
	 3Xsi7WLMApUnVbWwnbHCT+R6/2h/aEuoLC1OAkAsosxLzSqi1U4dj3eUOkFD898Bs
	 kGqx5VPh2x7gxk82TA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MKuOP-1sby8W2qhZ-00KgEB; Sun, 29 Sep 2024 12:52:05 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: Re: hung tasks on shutdown in linux-next-202409{20,23,24,25}
Date: Sun, 29 Sep 2024 12:52:02 +0200
Message-ID: <20240929105203.4637-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: a48564f002b31cb1a8db7680729aac91bc3d3b6b.camel@web.de
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J18rp0AQM8aEAfmV3wuzsfqyTxK0cjWSW/mat2zUS0M1KbI0u0I
 V3QxOBx9vMmP6rKS3PKBDkEgHOo4QEoV2Y7l7IlMKZA7IyEPtkQ5vfsJexxescaRB45SCJ/
 outjNUa+343LkCSi8KiRkYYCiiTd8wlZl6H47PaqDKDvnynCI4PVWijLc0w6p1nRcoihUZG
 oPleK6BHwPiwwaDw6ymLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tng0qsbpqpo=;XRRC02Ev5d2+p43nIMcPJiOUKkq
 /j2nqeNp5obFxnptDSRRJcMiO95P2Rid+v2QmabKi6YYCIkT1pRjKk6BsTiF/Avr69k5nwXAw
 tCT6CjtmoDtYo1ucHUx7Osjmjsi7GnHc1U04T8QVAon9e5SCdDCRL+TqPy72Ptq5SQhsQW+pi
 izUG2lhalu+MznVcK8LHXJTblj1OklhWAft1+f3Z9kDZWK1Im5cgKihUtLcd8c+bjexY4y1EF
 FU3ML23Nxt/vPLAPCN3G7cviQSbZDQRNNxX1Jyd4jFl9IZKL34CPK0FtDHl7sK9oVrLFmCuJe
 EMOb7k9nyMci+5jJ08zPGuFuLWNvHeVTenkTKYsNqWH5jgFY9HzIQlq5wRMIQU2ulFJj95DDd
 MsSVH0qCJcDhJ6/Xvhz/gAUUZPWOK2ucaESvQgSaer149G7V5+o15KRYCjLARyJHg6x/n8ree
 IhErUkKawQuLCiDwcNx+wOAE53UK/ywgNudqTDZOHrF2n3o7BgYcBZTufuT4pFvj8jusKaSQ2
 sz7jx0tnIzzjamZwEd17NQauX/T2iMMkcoGlTkZ8HGEDT2HuedkRdv7Uo/vGHiM3TvFoKX98x
 tKVky6zSPpQsGU2oRqHMyP4iIfqCRYWbUrSwG+ACuU2kVuMHiHjFKm6AmnhoqU/p6pzpdaQWu
 cMyIDxkjemnUlCfB+kBUPx78Qyp0gTMYidljRaPBdE/zjjSfK8xBOZtC9OwF8SPrE4qX4VCGf
 HJRVp0cR02ximBQ9efjDpkYpbZUzC/MYjcNmmzB9nnycPoor2kODhKGGeLi0aOCs7+teTf4kT
 nubrnmWLiFC6Ktk5u6IQ3g/Q==

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

Bert Karwatzki

