Return-Path: <linux-next+bounces-7499-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8BBB027A3
	for <lists+linux-next@lfdr.de>; Sat, 12 Jul 2025 01:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BECE1CA7E57
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 23:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B33223323;
	Fri, 11 Jul 2025 23:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="Kw+WCuTV"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1A178F29;
	Fri, 11 Jul 2025 23:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752276492; cv=none; b=aHSc1WeRphaaT/mY4hJug0P4RRcPEtfd3wW9TtIUREKsiYSSdx1ZL/Aca6TXEVS2Aw6y/Qr9c2DkQOrRGnEOCQfOQvAFIC2UEFQgJStm/8S2WQPBjdfFYYtWIz5NUxA+VV+iHb1OD/Ep1rFGUR+6gS80QqZ5P0vZc35RAHxne08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752276492; c=relaxed/simple;
	bh=ezv84HK6NwO+u9ivLBOk9dRiooUBXGb+56H/5bkmEDM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XtJYRCBO1Kwda6oKXxWhPEYmONLe0aqJhcf056pVFq1AqbmdvsU8nroVNWA2I+UpZiIpIHXmgLRryJXxfwyJhU4JsBFcBq/VHeDc6W4OFRuDl2cOh3mqV6A6XIUKOVEtww/9nRjo8oKj9uBhd1c937Mwz+xtG5EoYgUenHOSl48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=Kw+WCuTV; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752276462; x=1752881262; i=spasswolf@web.de;
	bh=o6SaQoxZAgBhUi62Dz5rXp6jQE7b6I7cozEGJEeUERo=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Kw+WCuTVBKCtzCreG2rRhycUtRRjX9C0/HjhhTrzQ9EUR7R0ZCshv/1PeMX9LKVp
	 nECCw9YGjQji4jjw/tq6vEcaZQ2/o7eb7bA3Ob4buFHV0SGf+4pDKOfel9vPBO6nI
	 hs8qw5PJMr54ym6PB+lDba13B8KsOI/CarmifW/0RnsDbTVznsPBVac6S4ux5LBVa
	 TTWi8MMrv/p2l78uO4Oh1Qua/d3/lgF48Bl6bVv1wstbF3Nt8nYF3l6v+HHTlhz+c
	 Tv4Ht6T/FACpxhyYkrOfLPqWWaWSiniaI1XYgWCvWiqB9/gE9y+4HeiomxvtuSZtT
	 fG0RmtR2+W6l82M75A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFayq-1uR1sp2aa6-006Kru; Sat, 12
 Jul 2025 01:27:41 +0200
Message-ID: <21da96d766d92735e5fe022f54d686df8bdfc32d.camel@web.de>
Subject: Re: commit 3284e4adca9b causes hang on boot with CONFIG_PREEMPT_RT=y
From: Bert Karwatzki <spasswolf@web.de>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, ankur.a.arora@oracle.com, 
	bobo.shaobowang@huawei.com, boqun.feng@gmail.com, frederic@kernel.org, 
	joel@joelfernandes.org, neeraj.upadhyay@kernel.org, paulmck@kernel.org, 
	rcu@vger.kernel.org, urezki@gmail.com, wangxiongfeng2@huawei.com, 
	xiexiuqi@huawei.com, xiqi2@huawei.com, spasswolf@web.de
Date: Sat, 12 Jul 2025 01:27:37 +0200
In-Reply-To: <862fa11d-0f9a-4193-91d1-ea930d2d334f@nvidia.com>
References: <20250711230042.3468-1-spasswolf@web.de>
	 <862fa11d-0f9a-4193-91d1-ea930d2d334f@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jMEAIvEfKA672rFQgzl/sIUIuuh2lXuZ5UEY6cBH4Up/2RywE1y
 3cEynfg/GMRmknGgugvVqJV7FXNRzeHYj7kr+79FwLGamVoSR23dCbS2zaona6oSTgpPg01
 jO7u6Gd8US/X7dDNyEA9SCDhLUEG2SMRe5row8cTKEL4fx0Dx/9DVhEOvZd99TpGiURwiSG
 R3uMcx+qBJPAnRWxTlXVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EnwNCCe803U=;g/8XPT4CbVP8Da0tAiw1LUyPlOi
 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

Am Freitag, dem 11.07.2025 um 19:06 -0400 schrieb Joel Fernandes:
>=20
> On 7/11/2025 7:00 PM, Bert Karwatzki wrote:
> > When booting linux next-20250711 (with CONFIG_PREEMPT_RT=3Dy) on my MS=
I Alpha 15=20
> > Laptop running debian sid amd64 the boot process hangs with the last=
=20
> > messages displayed on screen being:
> >=20
> > fbcon: amdgpudrmfb (fb0) is primary device
> > Console: switching to colour frame buffer device
> > amdgpu: 0000:08:00.0: [drm]fb0: admgpudrmfb frame buffer device
> >=20
> > after some time (about 60s) this error messages appears (hand copied
> > from screen, not entirely accurate)
> >=20
> > rcu_preempt self detected stall
> >=20
> > with call trace
> > run_irq_workd
> > smpboot_thread_fn
> > kthread
> > ? kthreads_online_cpu
> > ? kthreads_online_cpu
> > ret_from_fork
> > ? kthreads_online_cpu
> > ret_from_fork
> >=20
> > This only occurs when compiling with CONFIG_PREEMPT_RT=3Dy.
> > I bisected this and found the first bad commit to be
> >=20
> > 3284e4adca9b ("rcu: Fix rcu_read_unlock() deadloop due to IRQ work")
>=20
> This commit is still using old code which was fixed in the last day.
>=20
> Here is the new commit:
> https://web.git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git/commit=
/?h=3Dnext&id=3D2e154d164418e1eaadbf5dc58cbf19e7be8fdc67
>=20
> Thanks!
>=20
>  - Joel

I already found the new commit, it works!

Bert Karwatzki

