Return-Path: <linux-next+bounces-7143-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A6DAD796F
	for <lists+linux-next@lfdr.de>; Thu, 12 Jun 2025 19:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 174271894941
	for <lists+linux-next@lfdr.de>; Thu, 12 Jun 2025 17:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0702BDC3D;
	Thu, 12 Jun 2025 17:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="RpQH8GAS"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5542E29DB97;
	Thu, 12 Jun 2025 17:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749750928; cv=none; b=Bygin/VCZPI5mseJoaz3UND/n/laSSaKpMoWR693bp4jhGOu6MAojQrC74FTLYdgxDkyH4L9TBMvkE7gC12K1DKKgxasU6Q6KluyDHSxKJ/lxaMEjYdYOu1zUrAzwZvbfyZUqk/z/MW0uUBdAkMdjH5N/zT1fePFFezaRJqFcXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749750928; c=relaxed/simple;
	bh=U14epDudFR2T/XBBsRZuwpcksaEexz7yCA93a0AxNLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HU+o+NO3yaQOFgGvzJyKAYKduk8P0si7HIhU6lqgobBy0rWqhghsRTS7uHDusEu+W8bXr9bJT1SpnZ5Tohr4DpZd8qAicBoYX5x9fcM0t3Ek/K/atZQ0PbaUFUmFipJHuAnCJDnvBa78reTv0czKlVwFza+E5RKrKPQT4s3kiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=RpQH8GAS; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1749750918; x=1750355718; i=spasswolf@web.de;
	bh=iSk6/OoQ6wLcS1kYB8t5xUlwZCaMp8afhUK7G888awM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RpQH8GASgLMweyn8b8seICdK8ZR2zvM6vuCXDIqa1IKW5Xir9loe7jUAaCL0mmsv
	 7DGixNodpJsmcdjMcfyyWAaCaNAW7Z/Aw/rz7s42nXIBKUD7b731rHsF786N0LI4w
	 v95NHt2/v4Upb1O8sr+5G3MwHzHlHgU4EfGfvBVgri8Lc/QUl5D+Nmrb6nbJrd3PS
	 gLlzdBOqezPxsa92n8h76IUguCbTV9G42uCi9gMPKQdOnWUmJyWAuEt4eQ8qI96Ul
	 M5NEvC91FUN5MhQ6iaTAPJdQZsn28kv54tGHM588BB8KgyycEwr5nj0STfrr+rN12
	 LAW6cRrPl4ufmHMKRw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1M6pYS-1uSVyN2pp8-00FAVO; Thu, 12 Jun 2025 19:55:17 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Joel Granados <joel.granados@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Waiman Long <longman@redhat.com>,
	Kees Cook <kees@kernel.org>
Subject: register_syctl_init error in linux-next-20250612
Date: Thu, 12 Jun 2025 19:55:13 +0200
Message-ID: <20250612175515.3251-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bLy5k+D/8avNeAwN3RnZG8nBNOul+2jBGHhjG1BoT1Xu+db9623
 luN18MXhKtof4WJNgbf6K1YlzlgBUKUKD/MCqhMUN9ZoD7ngumVp372fMakII+YyhCQjP7d
 U+a63RZQ4Zm/LZ/i804HFUWZOfRab2eS5UUmiJ3EOAkoPmZLhieY+QIBSBh0Mw7kPzH3QC1
 5dd1U9dT4vqjsdWlRhD1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gU+LjsyFAr4=;C5h7OHfKOyrBGpDM+qRAxgpoLC0
 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

When starting evolution (gnome email client) on my debian sid with
linux-next-20250612 I get the following error message on the terminal
emulator (the Gtk messages also occur  when):

Gtk-Message: 13:34:49.069: Failed to load module "colorreload-gtk-module"
Gtk-Message: 13:34:49.070: Failed to load module "window-decorations-gtk-m=
odule"
Gtk-Message: 13:34:51.012: Failed to load module "colorreload-gtk-module"
Gtk-Message: 13:34:51.013: Failed to load module "window-decorations-gtk-m=
odule"
bwrap: Can't read /proc/sys/kernel/overflowuid: No such file or directory

** (org.gnome.Evolution:3327): ERROR **: 13:34:51.245: Failed to fully lau=
nch dbus-proxy: Der Kindprozess wurde mit Status 1 beendet
Trace/Breakpoint ausgel=C3=B6st

and the following message in dmesg:

[  305.600587] [      T3327] traps: evolution[3327] trap int3 ip:7f64442d3=
ab7 sp:7ffc9f4e94d0 error:0 in libglib-2.0.so.0.8400.2[66ab7,7f644428c000+=
a1000]

I bisected this to commit cf47285025e6 ("locking/rtmutex: Move max_lock_de=
pth
into rtmutex.c"). The absence of /proc/sys/kernel/overflow{uid,gid} seems =
to be the related
to the start failure, in affected kernel version the files are absent whil=
e they're present
when evolution starts normally.

Also when booting next-20250612 I get this error message regarding max_loc=
k_depth and
rtmutex_sysctl_table:

[    0.234399] [         T1] sysctl duplicate entry: /kernel/max_lock_dept=
h
[    0.234402] [         T1] failed when register_sysctl_sz rtmutex_sysctl=
_table to kernel
[    0.234405] [         T1] sysctl duplicate entry: /kernel/max_lock_dept=
h
[    0.234407] [         T1] failed when register_sysctl_sz rtmutex_sysctl=
_table to kernel

Reverting commit cf47285025e6 in next-20250612 fixes the both the "sysctl =
duplicate
entry" issue and the missing overflow{gid,uid} files and evolution starts =
normally again.

As there were conflicts when reverting, here the revert patch for next-202=
50612
to illustrate conflict resolution:

diff --git a/include/linux/rtmutex.h b/include/linux/rtmutex.h
index dc9a51cda97c..7d049883a08a 100644
=2D-- a/include/linux/rtmutex.h
+++ b/include/linux/rtmutex.h
@@ -18,6 +18,8 @@
 #include <linux/rbtree_types.h>
 #include <linux/spinlock_types_raw.h>
=20
+extern int max_lock_depth; /* for sysctl */
+
 struct rt_mutex_base {
 	raw_spinlock_t		wait_lock;
 	struct rb_root_cached   waiters;
diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 705a0e0fd72a..c80902eacd79 100644
=2D-- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -29,29 +29,6 @@
 #include "rtmutex_common.h"
 #include "lock_events.h"
=20
-/*
- * Max number of times we'll walk the boosting chain:
- */
-static int max_lock_depth =3D 1024;
-
-static const struct ctl_table rtmutex_sysctl_table[] =3D {
-	{
-		.procname	=3D "max_lock_depth",
-		.data		=3D &max_lock_depth,
-		.maxlen		=3D sizeof(int),
-		.mode		=3D 0644,
-		.proc_handler	=3D proc_dointvec,
-	},
-};
-
-static int __init init_rtmutex_sysctl(void)
-{
-	register_sysctl_init("kernel", rtmutex_sysctl_table);
-	return 0;
-}
-
-subsys_initcall(init_rtmutex_sysctl);
-
 #ifndef WW_RT
 # define build_ww_mutex()	(false)
 # define ww_container_of(rtm)	NULL
diff --git a/kernel/locking/rtmutex_api.c b/kernel/locking/rtmutex_api.c
index 9e00ea0e5cfa..2d933528a0fa 100644
=2D-- a/kernel/locking/rtmutex_api.c
+++ b/kernel/locking/rtmutex_api.c
@@ -8,6 +8,11 @@
 #define RT_MUTEX_BUILD_MUTEX
 #include "rtmutex.c"
=20
+/*
+ * Max number of times we'll walk the boosting chain:
+ */
+int max_lock_depth =3D 1024;
+
 /*
  * Debug aware fast / slowpath lock,trylock,unlock
  *
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 0716c7df7243..82af6e6f5dbb 100644
=2D-- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -23,6 +23,14 @@
 #include <linux/uaccess.h>
 #include <asm/processor.h>
=20
+#ifdef CONFIG_X86
+#include <asm/nmi.h>
+#include <asm/io.h>
+#endif
+#ifdef CONFIG_RT_MUTEXES
+#include <linux/rtmutex.h>
+#endif
+
 /* shared constants to be used in various sysctls */
 const int sysctl_vals[] =3D { 0, 1, 2, 3, 4, 100, 200, 1000, 3000, INT_MA=
X, 65535, -1 };
 EXPORT_SYMBOL(sysctl_vals);
@@ -1525,6 +1533,15 @@ static const struct ctl_table kern_table[] =3D {
 		.proc_handler	=3D proc_dointvec,
 	},
 #endif
+#ifdef CONFIG_RT_MUTEXES
+	{
+		.procname	=3D "max_lock_depth",
+		.data		=3D &max_lock_depth,
+		.maxlen		=3D sizeof(int),
+		.mode		=3D 0644,
+		.proc_handler	=3D proc_dointvec,
+	},
+#endif
 };
=20
 int __init sysctl_init_bases(void)


Bert Karwatzki

