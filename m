Return-Path: <linux-next+bounces-2951-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2AF92F33C
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 02:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648301C21A17
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 00:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22387E6;
	Fri, 12 Jul 2024 00:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rvy+kcQV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B759624;
	Fri, 12 Jul 2024 00:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720745839; cv=none; b=MSdaoLra02gDMwHFPGtxJS9PMDgw2Gw+wdae7Sg/UaOIlBDTi+/x6Jr9bkPWxjqPFzF8oYdbY337GsFSIKk/cOewxV7IsJ5LMOC7DzEaDj55NcK2HXJKxo6ngyvSm9Wfi2e4WYgRF1rpXR5TW3RjsdlpaKJ/Q3p5Y/3TEEnY7Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720745839; c=relaxed/simple;
	bh=U2bAOt1W66eAxteJghWvR44r4jK4aDwG92qcp4rk1i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A/9FAQkl+dpn92HQ6wY27OI5VP8rzPqbJglNaNJP8uiib9k02aIu5p5lCTQ59y4OApNv7MCLMNKgbyfNfH3DBac1hyeXwjoCXpmefH0dNbWcX5Ng5Igz3LYPTynXgebs6wbnstAFuyYOl6j7I5/UW5CR3nlnEkRTaif0rHl2xCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rvy+kcQV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720745833;
	bh=9Kf7DD34N3dwuxseRFATP05MMW0vhMYUA9Opt+rdtyg=;
	h=Date:From:To:Cc:Subject:From;
	b=rvy+kcQV7lDSQ5iRtbm7KmWgMIC5jG4G8CDdFDSR6PxG0QVSSNjmqrAjsvjNcSrAU
	 K2ifxpYkQVu+KOz5c9pgv95WlxCiwlcE0q7J8XbHQYa6aN6O9aRB0OwyWj+u0P8MZa
	 5WCzyOkkcyYMvtbIzyRz/MjetquoIHVOTya6pvT9S5Lw/NhHg64XUBXbewEXnal4pF
	 5iIO2opT6XEMcxbGzn9S1V5dzG8zKNSLXnSFUz0ZMFzPy+2eN7dH8gWwSra1e0y3Nc
	 vBHNgKq4nR2ruPSxilGXKm0TtdXWySZ8qeLwn90hBqzuUsn/VdemqOHu3MxHseMf+u
	 hwtJbnzIJgSnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKtV057q2z4w2R;
	Fri, 12 Jul 2024 10:57:12 +1000 (AEST)
Date: Fri, 12 Jul 2024 10:57:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bcachefs tree with the
 mm-nonmm-stable tree
Message-ID: <20240712105711.6dc900a2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bKn5dGb3pUW3EPmav7TweJD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bKn5dGb3pUW3EPmav7TweJD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got a conflict in:

  fs/bcachefs/clock.c

between commit:

  1fcce6b8a768 ("bcachefs: remove heap-related macros and switch to generic=
 min_heap")

from the mm-nonmm-stable tree and commit:

  54fb2dad4aae ("bcachefs: Convert clock code to u64s")

from the bcachefs tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/clock.c
index b50d7cd6fbde,df3763c18c0e..000000000000
--- a/fs/bcachefs/clock.c
+++ b/fs/bcachefs/clock.c
@@@ -24,22 -15,15 +24,20 @@@ static inline void io_timer_swp(void *l
 =20
  void bch2_io_timer_add(struct io_clock *clock, struct io_timer *timer)
  {
- 	size_t i;
 +	const struct min_heap_callbacks callbacks =3D {
 +		.less =3D io_timer_cmp,
 +		.swp =3D io_timer_swp,
 +	};
 +
  	spin_lock(&clock->timer_lock);
 =20
- 	if (time_after_eq((unsigned long) atomic64_read(&clock->now),
- 			  timer->expire)) {
+ 	if (time_after_eq64((u64) atomic64_read(&clock->now), timer->expire)) {
  		spin_unlock(&clock->timer_lock);
  		timer->fn(timer);
  		return;
  	}
 =20
- 	for (i =3D 0; i < clock->timers.nr; i++)
 -	for (size_t i =3D 0; i < clock->timers.used; i++)
++	for (int i =3D 0; i < clock->timers.nr; i++)
  		if (clock->timers.data[i] =3D=3D timer)
  			goto out;
 =20
@@@ -50,17 -34,11 +48,16 @@@ out
 =20
  void bch2_io_timer_del(struct io_clock *clock, struct io_timer *timer)
  {
- 	size_t i;
 +	const struct min_heap_callbacks callbacks =3D {
 +		.less =3D io_timer_cmp,
 +		.swp =3D io_timer_swp,
 +	};
 +
  	spin_lock(&clock->timer_lock);
 =20
- 	for (i =3D 0; i < clock->timers.nr; i++)
 -	for (size_t i =3D 0; i < clock->timers.used; i++)
++	for (int i =3D 0; i < clock->timers.nr; i++)
  		if (clock->timers.data[i] =3D=3D timer) {
 -			heap_del(&clock->timers, i, io_timer_cmp, NULL);
 +			min_heap_del(&clock->timers, i, &callbacks, NULL);
  			break;
  		}
 =20
@@@ -144,21 -120,13 +139,20 @@@ void bch2_kthread_io_clock_wait(struct=20
  	bch2_io_timer_del(clock, &wait.io_timer);
  }
 =20
- static struct io_timer *get_expired_timer(struct io_clock *clock,
- 					  unsigned long now)
+ static struct io_timer *get_expired_timer(struct io_clock *clock, u64 now)
  {
  	struct io_timer *ret =3D NULL;
 +	const struct min_heap_callbacks callbacks =3D {
 +		.less =3D io_timer_cmp,
 +		.swp =3D io_timer_swp,
 +	};
 +
 +	if (clock->timers.nr &&
- 	    time_after_eq(now, clock->timers.data[0]->expire)) {
++	    time_after_eq64(now, clock->timers.data[0]->expire)) {
 +		ret =3D *min_heap_peek(&clock->timers);
 +		min_heap_pop(&clock->timers, &callbacks, NULL);
 +	}
 =20
 -	if (clock->timers.used &&
 -	    time_after_eq64(now, clock->timers.data[0]->expire))
 -		heap_pop(&clock->timers, ret, io_timer_cmp, NULL);
  	return ret;
  }
 =20
@@@ -175,17 -143,18 +169,18 @@@ void __bch2_increment_clock(struct io_c
 =20
  void bch2_io_timers_to_text(struct printbuf *out, struct io_clock *clock)
  {
- 	unsigned long now;
- 	unsigned i;
-=20
  	out->atomic++;
  	spin_lock(&clock->timer_lock);
- 	now =3D atomic64_read(&clock->now);
+ 	u64 now =3D atomic64_read(&clock->now);
 =20
- 	for (i =3D 0; i < clock->timers.nr; i++)
- 		prt_printf(out, "%ps:\t%li\n",
+ 	printbuf_tabstop_push(out, 40);
+ 	prt_printf(out, "current time:\t%llu\n", now);
+=20
 -	for (unsigned i =3D 0; i < clock->timers.used; i++)
++	for (int i =3D 0; i < clock->timers.nr; i++)
+ 		prt_printf(out, "%ps %ps:\t%llu\n",
  		       clock->timers.data[i]->fn,
- 		       clock->timers.data[i]->expire - now);
+ 		       clock->timers.data[i]->fn2,
+ 		       clock->timers.data[i]->expire);
  	spin_unlock(&clock->timer_lock);
  	--out->atomic;
  }

--Sig_/bKn5dGb3pUW3EPmav7TweJD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQf2cACgkQAVBC80lX
0GzHLAgAniXIRMJwFLD6jClStqTb83BAVtz05lCJ0cTvRyzgN/lYWNVeZtzWPYmu
sQo0a44HIBm9scdQkA33NadcvQJvne6EnXZkEKz8/T1p2A66vgRF2t6Z/8Ozldn9
m1iLUlqekHEN2ue5U3To8hucLTzxFBpCMpPYBd5g0as1SFjMQDXx+aw261wrH194
zmjSyy1JsGzV9xTThYZBgr/SvjVgu4SPCCH3u6TWugOMLdDTkp/ENPsfzEd6Vyf1
p56LNuLxtJb6bH3psqkf8XyWUmGfIDw+5Yaw+yHkNtXyHM7P+dhCHptiZSH5x9J5
fo15+52A4illH5QA/5M4eSNCHhBgew==
=0M7L
-----END PGP SIGNATURE-----

--Sig_/bKn5dGb3pUW3EPmav7TweJD--

