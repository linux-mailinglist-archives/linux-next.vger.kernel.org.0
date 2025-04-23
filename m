Return-Path: <linux-next+bounces-6366-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F111A99773
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 20:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93079460D0B
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 18:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30D028B4F3;
	Wed, 23 Apr 2025 18:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="jRBHzFfh"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91041EEA47;
	Wed, 23 Apr 2025 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431462; cv=none; b=OdezWySEhRW5Lm/9eiZ6KaKS28Q4LIyVW1SrXnf/Kw8Jeo8aY7oIXdohwewRGYbx9PtyIlquXdD4zbvA8sJDBKI8Flss575rrSuNsMUYQ6/ToDYX9ZgXFtfiyQfMkIoi0edkmyxPYK+8OmqpZ7ObeTJspom99UIp09jiRlEfVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431462; c=relaxed/simple;
	bh=wfRl/RypUO8ceS575eXPKl5GQ37HGwrZDH0Qoyc1jGk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llZ0vWxzYSo4wN3juvfuJ3fBM0a228igJpjpoHfdGv57qNU5x0EH0q+uDjsygm1Y5Lk/0G4N5+DQiAW0D1SlJceslD6T0u+sK7GCbo8/q0H+laC6k4RQVhgrR0E9oSkqNjy6yJWazFT8GJ6MT3FTi9O81Or27h1z53AzxaAbDc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=jRBHzFfh; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745431441; x=1746036241; i=spasswolf@web.de;
	bh=Ea+/RW3vPQxraf3vrcIKOoD9pjeBatxejp9QgYT3zKE=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jRBHzFfhHwBQwA95MYsP1xWA+RPWdCwp1BBieNr3d2QnffTRHHS7a/0OCwETFyQk
	 U4Nk3m6qqkrtjoXoJIJyMPqAIdkYTQIWM+B+5FHZiq/bYlaKyi1806aPs6ZoGhUgL
	 bhKqwEtOpPX+4OodxpcypCZinlo5olkRaoycVCsWuAKJEMzZOY4ANaO8qj22YheX8
	 TjWyxeVFcR7o4fxG3LowqyMaeFFNliYjmMG2m9MDCFd6aNUZ7u5XF+aJNxIJa6YPi
	 GXif5gfX8D53sVoW+NQj8uJpoqFIZ3KZx909zLIgud/nJcO6k8bNx9j3fWHVJOts+
	 zx7iySrtXC87jVI4ZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMpCg-1uQQK50aZw-00QJCZ; Wed, 23
 Apr 2025 20:04:01 +0200
Message-ID: <395d9ed9cf1ab427f6b71645f4c732737981c547.camel@web.de>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
From: Bert Karwatzki <spasswolf@web.de>
To: paulmck@kernel.org, "Aithal, Srikanth" <sraithal@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuniyuki Iwashima	
 <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek	
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness	
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 	linux-kernel@vger.kernel.org, Linux-Next Mailing List	
 <linux-next@vger.kernel.org>, spasswolf@web.de
Date: Wed, 23 Apr 2025 20:03:58 +0200
In-Reply-To: <fe8ff6a7943b8438de2daa237e20a940cb6a86e8.camel@web.de>
References: <20250423115409.3425-1-spasswolf@web.de>
		 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
		 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
	 <fe8ff6a7943b8438de2daa237e20a940cb6a86e8.camel@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:04SdokCtARSie/l+U/5sm7eBPUjwidSdLxaADDcOL8Lon2sLq2h
 VOgOar5qj/eHxs7Y0ELTcUyyodLLDLrZ1ALYmyZ7DvRoFBcuAB1DnJWqJeHz2WnbPt8as8r
 FjxHhN+RjuJDee0WEo6xxZXAPBZZ7a39eS1dqD9Q4SGJRS4IFPSD8GEtIdxd/3QhqQs6Spa
 7avpc+4fGC50h8Auh/5Vg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:orZLkKIEuEM=;4J2q8bP648as3jodY6cdWT7Hurp
 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
 Q==

Am Mittwoch, dem 23.04.2025 um 16:59 +0200 schrieb Bert Karwatzki:
> Am Mittwoch, dem 23.04.2025 um 07:18 -0700 schrieb Paul E. McKenney:
> > On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> > > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop =
runnning
> > > > debian sid. When booting kernel message appear on screen but no me=
ssages from
> > > > init (systemd). There are also no logs written even thought emerge=
ncy sync
> > > > via magic sysrq works (a message is printed on screen), presumably=
 because
> > > > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422)=
 and found
> > > > commit dd4cf8c9e1f4 as the first bad commit.
> > > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> > >=20
> > >=20
> > > Hello,
> > >=20
> > > On AMD platform as well boot failed starting next-20250422, bisectin=
g the
> > > issue led me to same commit dd4cf8c9e1f4. I have attached kernel con=
fig and
> > > logs.
> >=20
> > Thank you all for the bisection and the report!
> >=20
> > Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
> > Force re-initialization when rate-limiting re-enabled"):
> >=20
> > 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")
>=20
> The predecessor commit is 24ff89c63355 ("ratelimit: Allow zero ->burst t=
o
> disable ratelimiting") in linux-next.
>=20
> >=20
> > Then please apply the patch shown below, and let me know what happens?
> > (Yes, I should have split that commit up...)
> >=20
> > 							Thanx, Paul
> >=20
> > ----------------------------------------------------------------------=
=2D-
> >=20
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index 04f16b8e24575..13ed636642270 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const c=
har *func)
> >  	unsigned long flags;
> >  	int ret;
> > =20
> > -	if (!interval || !burst)
> > +	if (interval <=3D 0 || burst <=3D 0)
> >  		return 1;
> > =20
> >  	/*
>=20
> The patch applied on top of 24ff89c63355 ("ratelimit: Allow zero ->burst=
 to
> disable ratelimiting") works fine.
>=20
> Bert Karwatzki

The problem seems to be the burst =3D=3D 0 case, this patch fixes the issu=
e in
next-20250422:

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index b5c727e976d2..cb7810655027 100644
=2D-- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -40,7 +40,8 @@ int ___ratelimit(struct ratelimit_state *rs, const char =
*func)
         * interval says never limit.
         */
        if (interval <=3D 0 || burst <=3D 0) {
-               ret =3D burst > 0;
+               //ret =3D burst > 0;
+               ret =3D 1;
                if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
                    !raw_spin_trylock_irqsave(&rs->lock, flags))
                        return ret;


Bert Karwatzki

