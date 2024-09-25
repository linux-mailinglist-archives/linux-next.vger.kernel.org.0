Return-Path: <linux-next+bounces-3967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A98A9866B5
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 21:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87421F24C88
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 19:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF81F3A1BA;
	Wed, 25 Sep 2024 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="Hsy9z3zD"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF51219E0;
	Wed, 25 Sep 2024 19:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727291733; cv=none; b=o8W5SMuzO6DOISwGVsTRwPXSZVSAoxdD6RSlLLI85tfH6UDr9E1Bujp0WNep00J8akp3DZe2AktmW8x+1NdN5qrSTZvI/70Yzpe/UVnpy5BbUOWHY697oA3d+mBr3HVxYn5JX9vJRrQAVVftYZ/AepnOGQhLYB4s20HEbTDT7AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727291733; c=relaxed/simple;
	bh=C1OmoBXqJ67UcxbNfdrP+Y4HHhyF6o/lJp44waSGKkE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zf3BjeY80iHMG+urDxzWfN8M1yx3uw7c3IIX37BlPMNffEf1sC82TlIydaHx8EiAvwPqH9ie4nKWHtAqPNg7R7yJL3Q03w8/v651zQEmYfehp5M95rpgFHZ1ORXIS8gI2jK7tS/ML4MkGcNSgUJHdgZw2uQW0Jpd3LDVgebARqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=Hsy9z3zD; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727291727; x=1727896527; i=spasswolf@web.de;
	bh=YLx3JywVR9hDPbwv6E+58VAcGrN7Fy5JyoLdwEIiNqw=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Hsy9z3zDClF1/D/4IAqQ7Mi0RVEOdYE9rMKDKyKezv9PJ8Z7h7yjcgwvMJvXRrHr
	 zjXtxeUyy8yDLpLfLoCtI1YsMNXk6OFovIN2eU2pHnRIt3amaA2JgMEZLs39LmSJO
	 QEwo1o27i4P6d96+/wBsPAPMmkOyssTS+K38ZRRz6YhJucOG2IbW0GqGtUifexRG+
	 FO6gvRBnSoaEgm4niXh40rrXQrU7nqeYDFcaK7adHRFzDnWZKgbLI8fJRtq/9C3al
	 MPZj9aaD7AUtipFcxJtvJGoUt8Ed0wtOT+nalSoWj/g31H0oRQpLbSeBFGxigVHF8
	 dOFWXHsXW7OFgSzIhQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MvKbd-1s35Ly237J-00surM; Wed, 25
 Sep 2024 21:15:27 +0200
Message-ID: <a48564f002b31cb1a8db7680729aac91bc3d3b6b.camel@web.de>
Subject: Re: hung tasks on shutdown in linux-next-202409{20,23,24,25}
From: Bert Karwatzki <spasswolf@web.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, spasswolf@web.de
Date: Wed, 25 Sep 2024 21:15:27 +0200
In-Reply-To: <2024092503-banshee-reoccupy-93d1@gregkh>
References: <20240925114002.3380-1-spasswolf@web.de>
			 <2024092503-banshee-reoccupy-93d1@gregkh>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.0-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iGwryk7L2xKR4XUC26mi5GjGbCWT3inQBi6wQMzWggRBu+c8YMw
 4WKfUgFaBNWUEUkDBdUOwjpa8WghjWuTSMsWLHu+G41/lTvt1zAZRF5YNGk7bDKM8zAR/2y
 J87NKOBTB1OVH1kUgaaO91Ss7yu71QJ67O5q235siGRXj15vAA5X3hrQDIGI4qXJPnzXRLC
 3wND6szN86upvABfLVIDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cLi0tN1OEmg=;45cBUNzM0uDAJPvWxyPitfnqgZc
 uW33XUdZmp5ObA5/tqii+uo+8j1JVxnLU46WjSGyq42n9QBgxagCUc/taTjxAFZB1kL1CWhr8
 UIQgNACI3nsjb1T1Gx0pjR1rt7h/Ns6oa0OSbsES+rLi7OOALCJ5N72+tz1WU7GzNrxs9PUf7
 k0zryNiXFQryfW0PlBqzmoZhJQvxYq36enOL04a2aCU+cfemKzoRVO6JEqBC6f6Y7H022YOVa
 G+8BK/ZDhW4MXbiookTkhND+2UC3nxvq6L4Fx5oPPBnOURWAQMmZcknVtNHqN6NtukoBzgndi
 aaLK3475MlyL7r7JDsyW7+mKAE24K3eKHjYeM7AM0rK+XXW3eXqN4DubtCGmmJKqks8v3GmrF
 6tUfwKJxgFUmos5dNZ2LQBhb6lSD2aBVTwyPTNIFQXPNnXcCZQpIPkRXyMzeepp76g6ocaS0A
 pHu3pINxiN7rnP+ww6LPA8MgI0Q6P7poUQDUlDnrOiyjqIjBfBzuAwF3bRhwPVusQOpZir+ZQ
 wRQrMcSLssijKVZDSnovNMAyNE730l2pdXoQf6oWC4kwtSla6UFWBc8Hg/67FMjpvipUcBS/D
 xHx0OXjT44Xt9Zdnm4jzBgky8+N6RFphkJLjyRXxhjZ2G9tzQ+q/q0BNqZtzjkO8TtSaEzWNj
 LwMsL2v3bpVg8ARqsn8eKG2ZbAog6yRbj/IojAOdm0jUKnd/BvqCxDFEk7rPsbjw8PzzjGuk0
 U/DG3AP+U9QoTCMFz0I/YpRoRdBJXqFPnw/oUX74h8/9OIxh1i6tYgXkDHTHZsB7dm3p9mV2t
 qd+0PRwIqR19NgBoI2rB3CtQ==

Am Mittwoch, dem 25.09.2024 um 14:09 +0200 schrieb Greg Kroah-Hartman:
>
>
> Thanks for the report, I _just_ reverted all of these in my branch due
> to another report just like this.  I'll be glad to take them back after
> -rc1 if these issues can be worked out.
>
> So the next linux-next release should be good, OR if you could pull my
> driver-core.git driver-core-next branch to verify the revert worked for
> you, that would be great.
>
> thanks,
>
> greg k-h

The situation is a little more complicated: Your branch (driver-core-next)=
 works
fine(I just retested 10 reboot=C2=A0cycles with=C2=A0driver-core-next, com=
mit 4f2c346e6216
as HEAD). The problems only occur when your branch is merged into linux-ne=
xt.=C2=A0
I had the suspicion that the bug is locking related and recompiled next-20=
240925
with CONFIG_LOCKDEP=3Dy.

These are the lock debugging option I used:

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
CONFIG_PROVE_LOCKING=3Dy
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=3Dy
CONFIG_DEBUG_SPINLOCK=3Dy
CONFIG_DEBUG_MUTEXES=3Dy
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
CONFIG_DEBUG_RWSEMS=3Dy
CONFIG_DEBUG_LOCK_ALLOC=3Dy
CONFIG_LOCKDEP=3Dy
CONFIG_LOCKDEP_BITS=3D15
CONFIG_LOCKDEP_CHAINS_BITS=3D16
CONFIG_LOCKDEP_STACK_TRACE_BITS=3D19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=3D14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=3D12
# CONFIG_DEBUG_LOCKDEP is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

With these .config options the bug becomes harder to trigger, but after 11
reboots
I finally got a screen=C2=A0flooded with messages of the following type:

2 locks held by kworker/u64:251/3047
#0: ffff9fdf80d39548 ((wq_completion)async){+.+.}-{0:0}, at
process_one_work+0x4a4/0x580
#1: ffffb54b11307e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, at
process_one_work+0x1c7/0x580


Bert Karwatzki


