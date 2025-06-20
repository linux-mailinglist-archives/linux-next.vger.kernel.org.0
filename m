Return-Path: <linux-next+bounces-7190-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD50AE184E
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 11:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E57BB3AF97D
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 09:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA65238C08;
	Fri, 20 Jun 2025 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="o2ePwVqL"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F87B522A;
	Fri, 20 Jun 2025 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413083; cv=none; b=fX++1YndR6QgbkS4qfdSGVqV5tAErPfnrbMkkAZSm/ALJJKTYHaokLXwRWZcvYlf909UpKB7Kt3j9upf6o+/yHaYf+p92bkztK5JaEeZFmUhWkQnvngSKqZ5xr95B2NDwOOLW5BbWAU68pechgCcKMzL5wwJkWyETlH1vorBBT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413083; c=relaxed/simple;
	bh=UGTRFCtYvukfgypYQTTHIOjtfEfLiL8xv+5AYN2kpyM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HYmRBIhvcVmm1JIN8YfKfhp9cxQo9G9iMLFbG1XnZdo6CFqCy4BE+upcSjJjTUCvn/UfvvlOfWVY9RSS0+lZSvGqpxIt1t/HrVdtdfBArptjJy3ua8OkfYi6j2QyrwkH7AWr31xStW81FIuTBqrWgaGSufvrORCnVanUcagBcdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=o2ePwVqL; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750413078; x=1751017878; i=spasswolf@web.de;
	bh=Nb63DP+pWIJBHwyIeZPo/HP876p33ZKn96heFPlkDDU=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=o2ePwVqLHFhxsHJ6jwBnDYXB/Zlw/WOv2YJN6ndjwfNRT6cheKKkJfwUWfP+eEAr
	 a4YrASrUFq8GhQNfk9FzmyxuLTUBH5Fp4jTamcq3741xKE78oMsHrIDr4t/wGl8ba
	 AL+AeZlBF91d9m0p9fMV7N/0/Oi2ZKKHX1P5WWL94JpD43iPGgQEPSwCs8GF6AfkU
	 A7oBA8S78E6W3mITx6YA5B3Tr0xSWlYS6JcG90pbsSltTHDXsV5xnqI4miuwvSrP9
	 dbdaoOUSRi/C1s8Sih8mXalWpKPOohcvVdezi1DCwZG1g/axdzacet1obK84vmbXm
	 I9XVbueuU9CtG9/qpg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M2Phi-1uUC5L2dIc-00H0C5; Fri, 20
 Jun 2025 11:37:41 +0200
Message-ID: <3eec91e437e2b9861e069a6c63e80b2bfd7e9802.camel@web.de>
Subject: Re: register_syctl_init error in linux-next-20250612
From: Bert Karwatzki <spasswolf@web.de>
To: Joel Granados <joel.granados@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Waiman Long
	 <longman@redhat.com>, Kees Cook <kees@kernel.org>
Date: Fri, 20 Jun 2025 11:37:40 +0200
In-Reply-To: <mve232hzw4tqc5rnqlacofzlygqks7uirkumfmibrnmzcmpywh@kpchyerpb4ju>
References: <20250612175515.3251-1-spasswolf@web.de>
	 <mve232hzw4tqc5rnqlacofzlygqks7uirkumfmibrnmzcmpywh@kpchyerpb4ju>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7e9SVxgdOBXqKEXdboQLY3txLTf/ggXXzsC8YQULWy+/7mr3oUZ
 CGtqxQ50yrgWK6tN5mdBOqTQw08mOHyoaExZclNPB5SQTKjYs/ztWzq6xDzGeCRJK//eUOt
 eDDyOYACrYXA1ftki55Aovr0JBR9emVFt7BleiNrSKAWX7eysDbWqgtPGPMjZos0BN7CU27
 VZpQxZ2oG8D+LZ7MnBwBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:c4WTCMDdZ8I=;XXVeoUIQOBSHn41AyJzOVfyINzJ
 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

Am Donnerstag, dem 19.06.2025 um 14:39 +0200 schrieb Joel Granados:
> On Thu, Jun 12, 2025 at 07:55:13PM +0200, Bert Karwatzki wrote:
> > When starting evolution (gnome email client) on my debian sid with
> > linux-next-20250612 I get the following error message on the terminal
> > emulator (the Gtk messages also occur  when):
> >=20
> > Gtk-Message: 13:34:49.069: Failed to load module "colorreload-gtk-modu=
le"
> > Gtk-Message: 13:34:49.070: Failed to load module "window-decorations-g=
tk-module"
> > Gtk-Message: 13:34:51.012: Failed to load module "colorreload-gtk-modu=
le"
> > Gtk-Message: 13:34:51.013: Failed to load module "window-decorations-g=
tk-module"
> > bwrap: Can't read /proc/sys/kernel/overflowuid: No such file or direct=
ory
> >=20
> > ** (org.gnome.Evolution:3327): ERROR **: 13:34:51.245: Failed to fully=
 launch dbus-proxy: Der Kindprozess wurde mit Status 1 beendet
> > Trace/Breakpoint ausgel=C3=B6st
> >=20
> > and the following message in dmesg:
> >=20
> > [  305.600587] [      T3327] traps: evolution[3327] trap int3 ip:7f644=
42d3ab7 sp:7ffc9f4e94d0 error:0 in libglib-2.0.so.0.8400.2[66ab7,7f644428c=
000+a1000]
> >=20
> > I bisected this to commit cf47285025e6 ("locking/rtmutex: Move max_loc=
k_depth
> > into rtmutex.c"). The absence of /proc/sys/kernel/overflow{uid,gid} se=
ems to be the related
> > to the start failure, in affected kernel version the files are absent =
while they're present
> > when evolution starts normally.
> I just tested with next-20250619 and I see /proc/sys/kernel/overflow{uid=
,gid}
>=20
> >=20
> > Also when booting next-20250612 I get this error message regarding max=
_lock_depth and
> > rtmutex_sysctl_table:
> >=20
> > [    0.234399] [         T1] sysctl duplicate entry: /kernel/max_lock_=
depth
> > [    0.234402] [         T1] failed when register_sysctl_sz rtmutex_sy=
sctl_table to kernel
> > [    0.234405] [         T1] sysctl duplicate entry: /kernel/max_lock_=
depth
> > [    0.234407] [         T1] failed when register_sysctl_sz rtmutex_sy=
sctl_table to kernel
> And I do not see these messages in my dmesg. And
> /proc/sys/kernel/max_lock_depth exists.
>=20
> Maybe its something that only happened with the version from the 12th?
> Could you test again with the version from the 19?
>=20
> Best

I tested next-202506{12,17,19} and sysctl-next and they all show the buggy=
 behaviour.
CONFIG_PREEMPT_RT=3Dy is needed for the bug to appear.

Bert Karwatzki

