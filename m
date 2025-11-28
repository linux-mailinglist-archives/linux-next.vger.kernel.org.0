Return-Path: <linux-next+bounces-9255-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC72C90DEE
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 06:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CE0E94E24B4
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 05:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B172F19CD03;
	Fri, 28 Nov 2025 05:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LI/I3Z/8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908253A1CD;
	Fri, 28 Nov 2025 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764306509; cv=none; b=AXdMEluFJOAsyeU9Aqy+K6+l5mb+dqhboxV886fstXRZE7ddfA2iM/NeWL9MhUflkK+aNDuf4C9KFVN0bxb1i8T0M5jz2OYFNHseHf5pfMk3dCyMSyJrMZbKTXD8jRHETxSYYpMe7yhAqM5SiujAO6E4k5xFKoz1Y4YGa81lfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764306509; c=relaxed/simple;
	bh=No0ZL5wxANs+rLXZbCDzgx1Rzyt3ksR93T2Y9ifZJng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTCGFcQOr7TTm1Qq66Mr9lTKrITBBvd/eOoGuJnsx8GDR/eYrnZHhqrQjALn/XnTHgWMvbG5S7swvlldsGiHgPVKE2o9V6wJPP0w/WQXeeTODmOpFB5ZUXfMrqO4C162n9trs29mXn2FbVkcW6rPMzPEDsxPqfrmt85hSsFY70o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LI/I3Z/8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764306502;
	bh=WIqgOtRXLvpgqOtb8yoXu24ckMX9C2k7O21iwl3zap0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LI/I3Z/8qRXq8Q2+hXReLz13QxNaZSWPj8Xcf0zo/owkGGq8CsMLLDDMKAhZa4Gzf
	 QtCBlPMUR2ya6zZFhH7wY20+hLpUkuIQb0VJ6a+84hNFsEj/DwRslyff5TcURI2HQM
	 rxb3XK1vl1PDwL3SfC+4SJUTcKhE/ZT07dCiFG6OfEoxplow8xnT/MbGEtpyTrGNRW
	 h3NaDJtSDavVtIJ63q2SbSofZRQPQjoPHIjmTZvj74I2fsE+TPTgC1T6ZGfh2alNM7
	 0wfZDEp3DXFzXO7C2/n9Nf4U3ZtjEvf3fUxc5cbFqsI5XV5XKG2KIg6YlmYIb1MKWo
	 K2WcKbHot1jxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dHhC422ysz4w9q;
	Fri, 28 Nov 2025 16:08:16 +1100 (AEDT)
Date: Fri, 28 Nov 2025 16:08:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, Nathan Chancellor
 <nathan@kernel.org>, Waiman Long <longman@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Will Deacon <will@kernel.org>, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] locking/mutex: Initialize mutex::magic even when
 LOCKDEP=n
Message-ID: <20251128160815.64709af7@canb.auug.org.au>
In-Reply-To: <20251125145425.68319-1-boqun.feng@gmail.com>
References: <aSDoquGlA55Ge100@tardis.local>
	<20251125145425.68319-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/88vDjrnQtYd_uM7U=caUchx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/88vDjrnQtYd_uM7U=caUchx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Nov 2025 06:54:21 -0800 Boqun Feng <boqun.feng@gmail.com> wrote:
>
> When DEBUG_MUTEXES=3Dy and LOCKDEP=3Dn, mutex_lock() still checks on
> ->magic, hence debug_mutex_init() should be called in =20
> mutex_init_generic() as well. While we are at it, decouple LOCKDEP
> logic from debug_mutex_init(), because in this way debug_mutex_init()
> only needs one parameter, and we now have mutex_init_lockep() for
> LOCKDEP=3Dy scenarios.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20251117202214.4f710f02@canb.auug.or=
g.au/
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/lkml/20251121215819.GA1374726@ax162/
> Fixes: 3572e2edc7b6 ("locking/mutex: Redo __mutex_init()")
> Reviewed-by: Waiman Long <longman@redhat.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> Peter,
>=20
> Feel free to fold it into commit 3572e2edc7b6 ("locking/mutex: Redo
> __mutex_init()"), just resend it properly so it won't fall off your
> radar ;-)
>=20
>  kernel/locking/mutex-debug.c | 10 +---------
>  kernel/locking/mutex.c       |  8 +++++++-
>  kernel/locking/mutex.h       |  5 ++---
>  3 files changed, 10 insertions(+), 13 deletions(-)

Any chance if this being applied?  I am still seeing the boot warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/88vDjrnQtYd_uM7U=caUchx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkpLj8ACgkQAVBC80lX
0GyseQgAiiUR2FB7mx/6geJEtKr5eR6HO4uZ6L4b8BiLGdfJhzGkVuKIkN5kICQE
ywF2dpe9DuFBTcSvqwAbu283I4szN6WbL/HbChygGktRtQvydJbB7RzvhJVLfWxh
GVfkMwbhyv78wAd7aPPiVOF2l/Roerx4bjM8zGGNG8In3n8il+IlrX2ra4WgEPrW
agynJY9jtB/DSnsVT9BOWdNd7BZE3lT+YPOQCnq5P/kafeif6uqas5W6/AGRD24N
FdVzpRGn3DJdK0MPyDZkBOdXfhE5+5bntkUxt+fBxCgU6UoQrINgXrUxsDv+6lJt
2qIS9LM/pEJ+rcICsD8UPJVeg9E8Tw==
=XhNa
-----END PGP SIGNATURE-----

--Sig_/88vDjrnQtYd_uM7U=caUchx--

