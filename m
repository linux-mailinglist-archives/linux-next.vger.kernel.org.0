Return-Path: <linux-next+bounces-6368-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B319A99866
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 21:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 971287B0283
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 19:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17098280CCE;
	Wed, 23 Apr 2025 19:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="jIBYjMpi"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABD10957;
	Wed, 23 Apr 2025 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745436035; cv=none; b=ggpXKNHnaxzNCDo7+IiuGSt8rVHi5xN00vw9lIRvwb/mz+9XSeOJ4WiBgbjqdstQaiwj94RZkoYGX484Vb9rKP3rtW/DLBhHS2uFPuGGVevIG4B+gSCQVZLrTaNOzAk1ItwY6NAauHPgJQ+uhYWE7+a9zwwYPdq3u3pT8fftZH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745436035; c=relaxed/simple;
	bh=gTMatlRkeIJAdciV8G5m7ctZGHu8gdgFKO5teC1udVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rtsX8YTBbmMuGiL99Ds9i2XVwLuCVM5qOdedmvICKdsa5Tu15Cr+2hQfd0XHW/fnkZVhWoY+FEJjpYRU4QZG7h84wUS5ydF/B6cD6T/3oGkIwDNoAG4RGJzSCaqGZTYbXBd9kxyjBGMHimzvv7bJBPWAHcG5UF7iVuHOFy+Yf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=jIBYjMpi; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745435999; x=1746040799; i=spasswolf@web.de;
	bh=AbaLgaM/ROvfjaR+PvK7MMe9R8WDBsSkfPEpKjzMD14=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jIBYjMpic4qvPNIgKbG+DETxTOCFDQWrz96LRVjTugnEAd0UEXYavak9ZijSrXS5
	 v1GX/qUblE0a/u9KS1hCJ6qUqgXkOIiXRp5WVigyYACQDmsz0trfwK0VcFXkNORh6
	 sSQBoCerY3543LmHmrKzZrRGo7CTCV5DN4Kk7y1eyjmEYpTiYxjnPxycokGXWvFpu
	 McLvku7mCxHVvJbs/E/wAq3rydg8JGIwvcKdgIPSEBsdMWpkYRYB9Gv3OvfTTnxZ0
	 mzImG6WVhxSqBwHpGn3afUN5jBq+GZsInrFYbOEnQbBigNA5X0ur9+HXWqTw0eF01
	 lYpmMJGoGiX95iviDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MGxMP-1uL5uH3XNr-00BELx; Wed, 23
 Apr 2025 21:19:58 +0200
Message-ID: <1509f29e04b3d1ac899981e0adaad98bbc0ee61a.camel@web.de>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
From: Bert Karwatzki <spasswolf@web.de>
To: paulmck@kernel.org, "Aithal, Srikanth" <sraithal@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuniyuki Iwashima	
 <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek	
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness	
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 	linux-kernel@vger.kernel.org, Linux-Next Mailing List	
 <linux-next@vger.kernel.org>, spasswolf@web.de
Date: Wed, 23 Apr 2025 21:19:56 +0200
In-Reply-To: <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
References: <20250423115409.3425-1-spasswolf@web.de>
	 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
	 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
	 <5a4a3d0d-a2e1-4fd3-acd2-3ae12a2ac7b0@amd.com>
	 <82ff38fc-b295-472c-bde5-bd96f0d144fb@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xIpc5Pug37qumJcIyC4aSXXTrNn+Lis/sWlNXP7vkpoSmsdZhAA
 nH/VvYkNo7ZIYg8OJb8pIO+XBAQYVYyrxv/FIBDjsP4FHuTLbYkscLdyNFs46XugIxbiyva
 CU9nZ0p21JtmWDif7hGCA/uZR66+rVhBYLcLDHGO/8Bs2nSjZpItdkn8uuAK2BtuFjUX6sE
 bSh464QJDjqkS/mJOmjZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CPF8FkX9WLI=;UUGASl3W5ccpPPijtjb37cftyxh
 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
 Q==

Am Mittwoch, dem 23.04.2025 um 11:07 -0700 schrieb Paul E. McKenney:
> On Wed, Apr 23, 2025 at 08:49:08PM +0530, Aithal, Srikanth wrote:
> > On 4/23/2025 7:48 PM, Paul E. McKenney wrote:
> > > On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> > > > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > > > Since linux next-20250422 booting fails on my MSI Alpha 15 Lapto=
p runnning
> > > > > debian sid. When booting kernel message appear on screen but no =
messages from
> > > > > init (systemd). There are also no logs written even thought emer=
gency sync
> > > > > via magic sysrq works (a message is printed on screen), presumab=
ly because
> > > > > / is not mounted. I bisected this (from 6.15-rc3 to next-2025042=
2) and found
> > > > > commit dd4cf8c9e1f4 as the first bad commit.
> > > > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> > > >=20
> > > >=20
> > > > Hello,
> > > >=20
> > > > On AMD platform as well boot failed starting next-20250422, bisect=
ing the
> > > > issue led me to same commit dd4cf8c9e1f4. I have attached kernel c=
onfig and
> > > > logs.
> > >=20
> > > Thank you all for the bisection and the report!
> > >=20
> > > Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
> > > Force re-initialization when rate-limiting re-enabled"):
> > >=20
> > > 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting=
")
> > >=20
> > > Then please apply the patch shown below, and let me know what happen=
s?
> > > (Yes, I should have split that commit up...)
> > >=20
> > > 							Thanx, Paul
> > >=20
> > > --------------------------------------------------------------------=
=2D---
> > >=20
> > > diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> > > index 04f16b8e24575..13ed636642270 100644
> > > --- a/lib/ratelimit.c
> > > +++ b/lib/ratelimit.c
> > > @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const=
 char *func)
> > >   	unsigned long flags;
> > >   	int ret;
> > > -	if (!interval || !burst)
> > > +	if (interval <=3D 0 || burst <=3D 0)
> > >   		return 1;
> > >   	/*
> >=20
> >=20
> > I applied above patch on top of 13fa70e052dd ("ratelimit: Allow zero -=
>burst
> > to disable ratelimiting") [linux-20250423]. This is fixing the boot is=
sue.
> >=20
> > Tested-by: Srikanth Aithal <sraithal@amd.com>
>=20
> Thank you both, and to Bert for intuiting the correct -next commit!
>=20
> Could you please try the next increment, which is this patch, again
> on top of 24ff89c63355 ("ratelimit: Allow zero ->burst to > disable
> ratelimiting")?
>=20
> In the meantime, I will expose the version you two just tested to
> -next.
>=20
> 							Thanx, Paul
>=20
> ------------------------------------------------------------------------
>=20
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 04f16b8e24575..8f6c54f719ef2 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -35,8 +35,10 @@ int ___ratelimit(struct ratelimit_state *rs, const ch=
ar *func)
>  	unsigned long flags;
>  	int ret;
> =20
> -	if (!interval || !burst)
> +	if (interval <=3D 0 || burst <=3D 0) {
> +		ret =3D burst > 0;
>  		return 1;
> +	}
> =20
>  	/*
>  	 * If we contend on this state's lock then just check if

If you set "ret =3D burst > 0", but "return 1" this will make no differenc=
e
(except in the case of a major compiler bug, probably), as I wrote in my o=
ther
email which overlapped yours, this fixes the issue in next-20250422:

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index b5c727e976d2..fc28f6cf8269 100644
=2D-- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -40,7 +40,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char =
*func)
         * interval says never limit.
         */
        if (interval <=3D 0 || burst <=3D 0) {
-               ret =3D burst > 0;
+               ret =3D 1;
                if (!(READ_ONCE(rs->flags) & RATELIMIT_INITIALIZED) ||
                    !raw_spin_trylock_irqsave(&rs->lock, flags))
                        return ret;

Bert Karwatzki


