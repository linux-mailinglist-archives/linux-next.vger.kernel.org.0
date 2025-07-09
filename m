Return-Path: <linux-next+bounces-7436-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC8AFEEF2
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 18:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 480C25C0AB7
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 16:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A051C21FF24;
	Wed,  9 Jul 2025 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="JG2HV0IY"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34B91E32BE;
	Wed,  9 Jul 2025 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752079250; cv=none; b=Ohzzi9OVwIxVLQrd5Rjbkk+NooTQkNPx+CL6r+OXhY6MW5jRDMntlRsgSbVWcZVO1GoP2SQnoLUU4izgk13HelUBYssMjap2hTRPqCJWKLftfFjq3n9fW24KWT5tZz2J4yy/p3UUZgeLEYYXcQZZmf8WTt51FwyzbGLBtsX5aMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752079250; c=relaxed/simple;
	bh=7r6RNC92pTWhgccVhFB8ztYRkQ0IZ13I5DJTnX+3Skc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nk9QPUawG7dqSXEdpAtGQcvYwPpBv/me5RBwRVyKgr9xMm9pTIp2a/M2MTRThEDne1cB42bTff1gJv3rh9IGn9075eWwBp+Lg3eYN0pyrzh3ubkzSfU0nFobLcshDN4+05dOuxO0HaDcRn9QBgrLm+/9efPvE3rdkJ5pehKPs4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=JG2HV0IY; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752079217; x=1752684017; i=spasswolf@web.de;
	bh=acorGdwrivYOrNa8emyt/vNlTPPzuzWZ92rLDgjDz00=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JG2HV0IYVwEcJH2+vuGoeiwmNnDKcc3m8xN7brCudoFObSdUzrXYVFxTiA3EpWVT
	 Xh90jtQJhmouipx0CyawVb8KjPo9olfm+xeSa0V/5F0T617snTdqwFd/pmtkovwXj
	 +1MHcruZOd3pqDimn1An6AIjdXhMwkf5feUj7R0F9cpkGDg6hrhJzczKDBGAyCrEd
	 XSzn7wOw+oeQ1wWjZwSWOS+I/g8IaCmf+0fuqCUcUdIlXoQ/Dvqs5jy/5N6yKZ3WY
	 jLkexgiDPU6QG3EwzKUfKL0wAVnZvpO8zv0skxfHmMyv7PyiKMxofPvZzPEIn3Ivs
	 BwjWTboNh7yTgCno5A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7xaR-1umPkR2MZn-00qqES; Wed, 09
 Jul 2025 18:40:16 +0200
Message-ID: <5222dd9170d60b2ae93e24ce5d103c44cc1e36ea.camel@web.de>
Subject: Re: CONFIG_DEVMEM=y breaks gettimeofday in next-20250708
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Thomas
 Gleixner	 <tglx@linutronix.de>, spasswolf@web.de
Date: Wed, 09 Jul 2025 18:40:15 +0200
In-Reply-To: <20250709150929-7198f921-5b85-461a-acc1-ccc04e9adbab@linutronix.de>
References: <20250701-vdso-auxclock-v1-6-df7d9f87b9b8@linutronix.de>
	 <20250709124216.3011-1-spasswolf@web.de>
	 <20250709150929-7198f921-5b85-461a-acc1-ccc04e9adbab@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LRUCica14rnjwQi3ccJDnfNh+Oi67b8+gqM2L0T96nGSRX2H7hk
 d1Q1Fx/9L0VzCVQdMLJzYU7N/4nkNdd/h3ynZIjq3K6rID7+HjH9hpgVEWapKK7eH8HKUJJ
 SNmTBJRMhJ7VrNxH5SsMaHh75IXg0tAx0IFeRLkemKZiIocaoTX+C+InrjWv5EZAbpWC6Mj
 jrQReJWzi/ruWM3IWza2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PlZp/GoHIGg=;oxW5ucQV2sTX4ASO7DX/pVvvWw2
 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

Am Mittwoch, dem 09.07.2025 um 15:17 +0200 schrieb Thomas Wei=C3=9Fschuh:
> Hi Bert,
>=20
> On Wed, Jul 09, 2025 at 02:42:15PM +0200, Bert Karwatzki wrote:
> > Recently I found that my RAM has an error (memtest86+ reproducibly rep=
orts
> > a failing address) (this error may lead to random crashes every few da=
ys).=20
> > To further investigate the issue I tried using memtester which needs a=
ccess=20
> > to /dev/mem and so I recompiled linux next-20250708 with CONFIG_DEMEM=
=3Dy=20
> > and found a strange and unusual side effect:
> >=20
> > a) the time displayed by xfce is stuck at 1.1.1970 01:00 (UTC + 1)
> > b) most certificates in firefox-esr fail to work due to the date being=
 1.1.1970=20
> > (this includes www.google.de, www.duckduckgo.com, wikipedia and youtub=
e and many more)
> > c) some certificates in firefox-esr still work (kernel.org, xkcd.com, =
www.spiegel.de)
> > d) the shell built-in time (and also /usr/bin/time) fail to work, e.g.
> > $ time sleep 5
> > real	0m0,000s
> > user	0m0,000s
> > sys	0m0,002s
> > (even though it actually take 5 seconds for this)
> > e) date still works correctly, e.g.
> > $ date
> > Mi 9. Jul 11:51:20 CEST 2025
> > f) This example program=20
> >=20
> > #include <stdlib.h>
> > #include <stdio.h>
> > #include <sys/time.h>
> >=20
> > int main()
> > {
> > 	int ret;
> > 	struct timeval tv;
> > 	struct timezone tz;
> >=20
> > 	ret =3D gettimeofday(&tv, &tz);
> > 	printf("gettimeofday returns ret =3D %d, tv.tv_sec =3D %lu tv.tv_usec=
 =3D %lu\n", ret, tv.tv_sec, tv.tv_usec);
> >=20
> > 	return 0;
> > }
> >=20
> > gives the following output on affected versions:
> >=20
> > $
> > gettimeofday returns ret =3D 0, tv.tv_sec =3D 0 tv.tv_usec =3D 0
>=20
> Thanks for the report. Can you try the fix posted by Marek [0]?
> It looks like the same issue where the vDSO fastpath is unavailable on y=
our
> hardware but I broke the check for it.

Yes, this fixes the issue for me.

> If it is the same issue it still leaves the question why the fastpath is
> broken by CONFIG_DEVMEM. Can you describe your setup a bit?
> Are there any entries in dmesg about the tsc or the clocksource subsyste=
m?
=20
I use a MSI Alpha 15 B5EEK/MS-158L amd64 laptop (AMD Ryzen 7 5800H) runnin=
g debian sid. When booting=C2=A0
without "tsc=3Dunstable" I get this message in dmesg (this is from next-20=
250708 with CONFIG_DEVMEM=3Dy):

[    C7] clocksource: timekeeping watchdog on CPU7: Marking clocksource 't=
sc' as unstable because the skew is too large:
[    C7] clocksource:                       'hpet' wd_nsec: 495997815 wd_n=
ow: 36f24f3 wd_last: 302c799 mask: ffffffff
[    C7] clocksource:                       'tsc' cs_nsec: 497721239 cs_no=
w: 1ea2752100 cs_last: 1e43b3e700 mask: ffffffffffffffff
[    C7] clocksource:                       Clocksource 'tsc' skewed 17234=
24 ns (1 ms) over watchdog 'hpet' interval of 495997815 ns (495 ms)
[    C7] clocksource:                       'hpet' (not 'tsc') is current =
clocksource.
[    C7] tsc: Marking TSC unstable due to clocksource watchdog
[  T233] TSC found unstable after boot, most likely due to broken BIOS. Us=
e 'tsc=3Dunstable'.
[  T233] sched_clock: Marking unstable (4040049255, 1223348)<-(4058551237,=
 -15591933)

I usually boot with "tsc=3Dunstable" but the issue occurs there, too. I ca=
n't say yet why
this only occurs with CONFIG_DEVMEM=3Dy.


Bert Karwatzki

