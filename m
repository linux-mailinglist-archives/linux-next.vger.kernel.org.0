Return-Path: <linux-next+bounces-7192-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71923AE19D6
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 13:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CEAE4A76EF
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 11:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE8228469A;
	Fri, 20 Jun 2025 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="OU0lr5+V"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2407921FF29;
	Fri, 20 Jun 2025 11:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418241; cv=none; b=Dqh7C+v5zMh96hrLjtDyHgfUBqTJVov7g8CTa0W9ATS12QdOofZAHHkvPaNWCYtK0zw+kgiVVbi9N5AhsJyrD/5JuhqIZszMQx5P+R4aOFPgjewE1MxxkpJOWGofvfd11UC8AAkVEWV4Eg5GHmUtCop67r6ildhhjxsxuGaCJTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418241; c=relaxed/simple;
	bh=ezrmbRANaPAxOlCwfhUJ3HdJyNT7XGNt6luQnaZPSZc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RbNu7kIWl1zFgHrv5D2kvTffIPZnYtomEJBgDvi7mDzWnUXaFxSkEpFmq7U22DofIysJ9pyD8M3verrdIyZdgWQntG6N18qBVdBWdYoEtOIRX8HSsWIJ5S9MNSIEzPXZI+N+WbHKm31Er1NDb1HGuwOOB98VfPT36G0efePJXQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=OU0lr5+V; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750418236; x=1751023036; i=spasswolf@web.de;
	bh=BdA9JPOK8zgDysWzUaqEhLRz3KOQ/DKUwxB+gAm31o0=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OU0lr5+VmfR7VHmDdCn4eDjixM7EqDrdAUia7BOMlplhWGK3XRCbB8VjUBDyUHnP
	 HMh/TpT27ZQhyTC5dvNVK5LfJpPlQ9SoYnYIzdrrEOj5KJoAx0pEqtoSF3DTVRBq2
	 w+UXpNZlqRapDryRdAjdax9rtdv7kD/RTFsW923hhDfARQS/vhUyXUeAIVjITxxP/
	 kHQCpKec23LpblfcZ7JBZg/nYNYGDtMjzNI/hd6+0TQb5M8zEQJU2vERfBuphbuH6
	 iUBCilBBbTs1VTpzB22huXd9OHe4A8T9NeLrZN3YGYL8EX5UlhLmKOBQXCP7aVdQ3
	 o15dbcBjSGMmXeR5vQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MUlDP-1uJSwM3wZN-00Jkio; Fri, 20
 Jun 2025 13:17:16 +0200
Message-ID: <bf583355c889ec19f908b1a95c4d6f73a32fcc8f.camel@web.de>
Subject: Re: register_syctl_init error in linux-next-20250612
From: Bert Karwatzki <spasswolf@web.de>
To: Joel Granados <joel.granados@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Waiman Long
	 <longman@redhat.com>, Kees Cook <kees@kernel.org>, spasswolf@web.de
Date: Fri, 20 Jun 2025 13:17:15 +0200
In-Reply-To: <agdzhkcb7f7w7zmcivjx6gnlilwglvd526pp3p5cgkdricwfx4@6iduwkqkerjp>
References: <20250612175515.3251-1-spasswolf@web.de>
	 <mve232hzw4tqc5rnqlacofzlygqks7uirkumfmibrnmzcmpywh@kpchyerpb4ju>
	 <3eec91e437e2b9861e069a6c63e80b2bfd7e9802.camel@web.de>
	 <agdzhkcb7f7w7zmcivjx6gnlilwglvd526pp3p5cgkdricwfx4@6iduwkqkerjp>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WbsmhXKCsQk9XcX47MRKfQcu0DS4NPNMC1W2Oe/lMYjupqAcKFr
 inJC6RVmMQpM6CGTKtljb8hRIUuYx1oM78fWS2AcC+znOXa2Y0WuJ96v3u3NHw/W4deeZ4b
 8776SY5EFw+5vMYCPR5RmYBtg34hafow6TohBKC49uDAYDxtHu21hn8R4VR8BKbFtc4F7f+
 5q89HFkmF/fyRbseX4+lA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6wUnmU93d/4=;QdEtmm0h0PrcNGhsl9+pXZHlbtP
 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
 6nx5hVdKpQ0xRMm6

Am Freitag, dem 20.06.2025 um 13:11 +0200 schrieb Joel Granados:
> On Fri, Jun 20, 2025 at 11:37:40AM +0200, Bert Karwatzki wrote:
> > Am Donnerstag, dem 19.06.2025 um 14:39 +0200 schrieb Joel Granados:
> > > On Thu, Jun 12, 2025 at 07:55:13PM +0200, Bert Karwatzki wrote:
> > > > When starting evolution (gnome email client) on my debian sid with
> > > > linux-next-20250612 I get the following error message on the termi=
nal
> > > > emulator (the Gtk messages also occur  when):
> > > >=20
> > > > Gtk-Message: 13:34:49.069: Failed to load module "colorreload-gtk-=
module"
> > > > Gtk-Message: 13:34:49.070: Failed to load module "window-decoratio=
ns-gtk-module"
> > > > Gtk-Message: 13:34:51.012: Failed to load module "colorreload-gtk-=
module"
> > > > Gtk-Message: 13:34:51.013: Failed to load module "window-decoratio=
ns-gtk-module"
> > > > bwrap: Can't read /proc/sys/kernel/overflowuid: No such file or di=
rectory
> > > >=20
> > > > ** (org.gnome.Evolution:3327): ERROR **: 13:34:51.245: Failed to f=
ully launch dbus-proxy: Der Kindprozess wurde mit Status 1 beendet
> > > > Trace/Breakpoint ausgel=C3=B6st
> > > >=20
> > > > and the following message in dmesg:
> > > >=20
> > > > [  305.600587] [      T3327] traps: evolution[3327] trap int3 ip:7=
f64442d3ab7 sp:7ffc9f4e94d0 error:0 in libglib-2.0.so.0.8400.2[66ab7,7f644=
428c000+a1000]
> > > >=20
> > > > I bisected this to commit cf47285025e6 ("locking/rtmutex: Move max=
_lock_depth
> > > > into rtmutex.c"). The absence of /proc/sys/kernel/overflow{uid,gid=
} seems to be the related
> > > > to the start failure, in affected kernel version the files are abs=
ent while they're present
> > > > when evolution starts normally.
> > > I just tested with next-20250619 and I see /proc/sys/kernel/overflow=
{uid,gid}
> > >=20
> > > >=20
> > > > Also when booting next-20250612 I get this error message regarding=
 max_lock_depth and
> > > > rtmutex_sysctl_table:
> > > >=20
> > > > [    0.234399] [         T1] sysctl duplicate entry: /kernel/max_l=
ock_depth
> > > > [    0.234402] [         T1] failed when register_sysctl_sz rtmute=
x_sysctl_table to kernel
> > > > [    0.234405] [         T1] sysctl duplicate entry: /kernel/max_l=
ock_depth
> > > > [    0.234407] [         T1] failed when register_sysctl_sz rtmute=
x_sysctl_table to kernel
> > > And I do not see these messages in my dmesg. And
> > > /proc/sys/kernel/max_lock_depth exists.
> > >=20
> > > Maybe its something that only happened with the version from the 12t=
h?
> > > Could you test again with the version from the 19?
> > >=20
> > > Best
> >=20
> > I tested next-202506{12,17,19} and sysctl-next and they all show the b=
uggy behaviour.
> > CONFIG_PREEMPT_RT=3Dy is needed for the bug to appear.
> Hey
>=20
> I have managed to reproduce, thx for the clarification.
>=20
> Did you have the chance to test with the patch that I sent?
>=20
> Best

I did not test your patch, but it seems I independently came up with the
same soulution:=20

It seems to be a compile/file include issue: kernel/locking/rtmutex.c is n=
ot compiled
via a Makefile but it's included in via #include:

$ rg "include.*rtmutex.c\>"
kernel/locking/rwsem.c
1405:#include "rtmutex.c"

kernel/locking/spinlock_rt.c
25:#include "rtmutex.c"

kernel/locking/ww_rt_mutex.c
10:#include "rtmutex.c"

kernel/locking/rtmutex_api.c
9:#include "rtmutex.c"

which in the case of PREEMPT_RT=3Dy leads to four call to init_rtmutex_sys=
ctl().

I solved this by moving the code to kernel/locking/rtmutex_api.c:

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 705a0e0fd72a..cf24eacef48d 100644
=2D-- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -34,24 +34,6 @@
*/
static int max_lock_depth =3D 1024;
-static const struct ctl_table rtmutex_sysctl_table[] =3D {
- {
- .procname =3D "max_lock_depth",
- .data =3D &max_lock_depth,
- .maxlen =3D sizeof(int),
- .mode =3D 0644,
- .proc_handler =3D proc_dointvec,
- },
-};
-
-static int __init init_rtmutex_sysctl(void)
-{
- register_sysctl_init("kernel", rtmutex_sysctl_table);
- return 0;
-}
-
-subsys_initcall(init_rtmutex_sysctl);
-
#ifndef WW_RT
# define build_ww_mutex() (false)
# define ww_container_of(rtm) NULL
diff --git a/kernel/locking/rtmutex_api.c b/kernel/locking/rtmutex_api.c
index 9e00ea0e5cfa..a133870b4519 100644
=2D-- a/kernel/locking/rtmutex_api.c
+++ b/kernel/locking/rtmutex_api.c
@@ -8,6 +8,24 @@
#define RT_MUTEX_BUILD_MUTEX
#include "rtmutex.c"
+static const struct ctl_table rtmutex_sysctl_table[] =3D {
+ {
+ .procname =3D "max_lock_depth",
+ .data =3D &max_lock_depth,
+ .maxlen =3D sizeof(int),
+ .mode =3D 0644,
+ .proc_handler =3D proc_dointvec,
+ },
+};
+
+static int __init init_rtmutex_sysctl(void)
+{
+ register_sysctl_init("kernel", rtmutex_sysctl_table);
+ return 0;
+}
+
+subsys_initcall(init_rtmutex_sysctl);
+
/*
* Debug aware fast / slowpath lock,trylock,unlock
*

I tested this patch with and without CONFIG_PREEMPT_RT=3Dy and it
works in both cases.

Bert Karwatzki


