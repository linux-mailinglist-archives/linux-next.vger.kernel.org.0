Return-Path: <linux-next+bounces-6376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81752A9ADD3
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 14:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2292179B41
	for <lists+linux-next@lfdr.de>; Thu, 24 Apr 2025 12:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F305718E1F;
	Thu, 24 Apr 2025 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="L8T1inur"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429BE2701AA;
	Thu, 24 Apr 2025 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498788; cv=none; b=Ky0+j/CHm5Om7ZnfII/CuvMYjN9Uf0fGHuNtM7wPMhk7Mn37U9qBFID2EwLG3NdAksOzLKFpMucfmMHvvCOuKjPYnUagJmww3L33RwQAvqOQ4Ohwz5MIFaGBGpEqhSaUgHE3J5xcsFrTGKT3586IlUEh3FAqpvnvG17Esnr+o5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498788; c=relaxed/simple;
	bh=SV71McFLR3/q24LwmhA6o1kdByo8/yAGkaHUJ0deRzI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eqE6H7ehlsDeensYpGCinX08AWfPvgTZWFKsxPJ9BGil8E6Aomg2AxVUQSDv3AhNzYmDFx45WUY388vb0i5GwJLGAd9F4gliJrVNwxwV6GEfhURqJK+bfNGUXk+fNGlTm+yXfcSsqgPbAL5QX8M+QOZkPGzJWwQ574c2GOvetzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=L8T1inur; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745498779; x=1746103579; i=spasswolf@web.de;
	bh=/nLFTmsDUPGT4keVPQPENNEVGBMqCYfptX2y9YFG8W0=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=L8T1inurl59bjgL7K96BRx9d6Jzb2gZabPIe7nChoej8R2gu2jkRMUm5NL43Kh7F
	 0y9MXMfHmdOEkV9uo6kifMHQS87bB+GjHLcMbu1ajn8R6cpRR/8cWwGtK1j57oe8C
	 b0IJkHayw6PRvYdPaVOnf8Sjjdr4i3pykwjZfcNhmZURyNgRoICPBj6I68qNzXEMC
	 0cbgqso9A7e89qCJ7dfNS4hP/vRMOAPGYTEv6Ln25oPt116RTzXj7eirmFtJSDV/T
	 9Hj4b8oE8GRsLfBNuIOYDjdqJOHQXrzMA4NRLNYcFsBYYuE2mY5Ii3c5dM1+k2Qov
	 alVvxSzthwwiJ++Ueg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mmyr7-1uqrbI3G23-00qaT1; Thu, 24
 Apr 2025 14:40:27 +0200
Message-ID: <0b5a918ba68e9e696329ed9894d7d93d2d71cc6e.camel@web.de>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
From: Bert Karwatzki <spasswolf@web.de>
To: paulmck@kernel.org
Cc: "Aithal, Srikanth" <sraithal@amd.com>, Andrew Morton	
 <akpm@linux-foundation.org>, Kuniyuki Iwashima <kuniyu@amazon.com>, Mateusz
 Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>,  John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, 	linux-kernel@vger.kernel.org,
 Linux-Next Mailing List	 <linux-next@vger.kernel.org>, spasswolf@web.de
Date: Thu, 24 Apr 2025 14:40:25 +0200
In-Reply-To: <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>
References: <20250423115409.3425-1-spasswolf@web.de>
	 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
	 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
	 <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
	 <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
	 <1509f29e04b3d1ac899981e0adaad98bbc0ee61a.camel@web.de>
	 <8ded350c-fc05-4bc2-aff2-33b440f6e2d6@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fmy+AFPBWkRgl76vR9WHk1dfGE3ClcMD8ZYMBhXWND1TR6NGFuk
 IdRMhBOBER+RUSsSXcUKxGfaAGQfJ23X4Dbu+3g/+O+RRqehJDABREVqo/R7upysCLG9CN4
 VKsiQjA1hL+ap26oarEGuD1wiuMS7/trHkR8bEBY0t/MqBDTAeWuZTdsajym4kBYIeJk1Kh
 IENl2VJmgYecuhy6CW9TA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WFl5iyvZsUg=;vkINmuxNrxgO9B/HAKUkRmomV+1
 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
 /ymA3+Av8FP+Y=

Am Mittwoch, dem 23.04.2025 um 12:56 -0700 schrieb Paul E. McKenney:
> On Wed, Apr 23, 2025 at 09:19:56PM +0200, Bert Karwatzki wrote:
> > Am Mittwoch, dem 23.04.2025 um 11:07 -0700 schrieb Paul E. McKenney:
> > > On Wed, Apr 23, 2025 at 08:49:08PM +0530, Aithal, Srikanth wrote:
> > > > On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
> > > > > On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote=
:
> > > > > > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > > > > > Since linux next-20250422 booting fails on my MSI Alpha 15 L=
aptop runnning
> > > > > > > debian sid. When booting kernel message appear on screen but=
 no messages from
> > > > > > > init (systemd). There are also no logs written even thought =
emergency sync
> > > > > > > via magic sysrq works (a message is printed on screen), pres=
umably because
> > > > > > > / is not mounted. I bisected this (from 6.15-rc3 to next-202=
50422) and found
> > > > > > > commit dd4cf8c9e1f4 as the first bad commit.
> > > > > > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the iss=
ue.
> > > > > >=20
> > > > > >=20
> > > > > > Hello,
> > > > > >=20
> > > > > > On AMD platform as well boot failed starting next-20250422, bi=
secting the
> > > > > > issue led me to same commit dd4cf8c9e1f4. I have attached kern=
el config and
> > > > > > logs.
> > > > >=20
> > > > > Thank you all for the bisection and the report!
> > > > >=20
> > > > > Please check out the predecessor of commit dd4cf8c9e1f4 ("rateli=
mit:
> > > > > Force re-initialization when rate-limiting re-enabled"):
> > > > >=20
> > > > > 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimi=
ting")
> > > > >=20
> > > > > Then please apply the patch shown below, and let me know what ha=
ppens?
> > > > > (Yes, I should have split that commit up...)
> > > > >=20
> > > > > 							Thanx, Paul
> > > > >=20
> > > > > ----------------------------------------------------------------=
=2D-------
> > > > >=20
> > > > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > > > index 04f16b8e24575..13ed636642270 100644
> > > > > --- a/lib/ratelimit.c
> > > > > +++ b/lib/ratelimit.c
> > > > > @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, c=
onst char *func)
> > > > >   	unsigned long flags;
> > > > >   	int ret;
> > > > > -	if (!interval || !burst)
> > > > > +	if (interval <=3D 0 || burst <=3D 0)
> > > > >   		return 1;
> > > > >   	/*
> > > >=20
> > > >=20
> > > > I applied above patch on top of 13fa70e052dd ("ratelimit: Allow ze=
ro ->burst
> > > > to disable ratelimiting") [linux-20250423]. This is fixing the boo=
t issue.
> > > >=20
> > > > Tested-by: Srikanth Aithal <sraithal@amd.com>
> > >=20
> > > Thank you both, and to Bert for intuiting the correct -next commit!
> > >=20
> > > Could you please try the next increment, which is this patch, again
> > > on top of 24ff89c63355 ("ratelimit: Allow zero ->burst to > disable
> > > ratelimiting")?
> > >=20
> > > In the meantime, I will expose the version you two just tested to
> > > -next.
> > >=20
> > > 							Thanx, Paul
> > >=20
> > > --------------------------------------------------------------------=
=2D---
> > >=20
> > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > index 04f16b8e24575..8f6c54f719ef2 100644
> > > --- a/lib/ratelimit.c
> > > +++ b/lib/ratelimit.c
> > > @@ -35,8 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, cons=
t char *func)
> > >  	unsigned long flags;
> > >  	int ret;
> > > =20
> > > -	if (!interval || !burst)
> > > +	if (interval <=3D 0 || burst <=3D 0) {
> > > +		ret =3D burst > 0;
> > >  		return 1;
> > > +	}
> > > =20
> > >  	/*
> > >  	 * If we contend on this state's lock then just check if
> >=20
> > If you set "ret =3D burst > 0", but "return 1" this will make no diffe=
rence
> > (except in the case of a major compiler bug, probably), as I wrote in =
my other
> > email which overlapped yours, this fixes the issue in next-20250422:
> >=20
> > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > index b5c727e976d2..fc28f6cf8269 100644
> > --- a/lib/ratelimit.c
> > +++ b/lib/ratelimit.c
> > @@ -40,7 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const c=
har *func)
> >          * interval says never limit.
> >          */
> >         if (interval <=3D 0 || burst <=3D 0) {
> > -               ret =3D burst > 0;
> > +               ret =3D 1;
> >                 if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
> >                     !raw_spin_trylock_irqsave(&rs->lock, flags))
> >                         return ret;
>=20
> You are quite right, your patch does fix the issue that you three say.
> Unfortunately, it prevents someone from completely suppressing output
> by setting burst to zero.  Could you please try the patch below?
>=20
> 							Thanx, Paul
>=20
> ------------------------------------------------------------------------
>=20
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 04f16b8e24575..d6531e5c6ec4e 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -35,8 +35,8 @@ int ___ratelimit(struct ratelimit_state *rs, const cha=
r *func)
>  	unsigned long flags;
>  	int ret;
> =20
> -	if (!interval || !burst)
> -		return 1;
> +	if (interval <=3D 0 || burst <=3D 0)
> +		return interval =3D=3D 0 || burst > 0;
> =20
>  	/*
>  	 * If we contend on this state's lock then just check if

This patch will make no difference for me as I've monitored every call to
___ratelimit() with "printk(KERN_INFO "%s: interval =3D %d burst =3D %d\n"=
,
__func__, interval, burst)" and at least for me burst =3D=3D 0 is always a=
companied
by intervall =3D=3D 0.

Bert Karwatzki

