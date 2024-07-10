Return-Path: <linux-next+bounces-2930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EF892DC12
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 00:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF8A41C21946
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 22:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5523B143740;
	Wed, 10 Jul 2024 22:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nnndY/6K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C913C685;
	Wed, 10 Jul 2024 22:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720651695; cv=none; b=Nm4gMkFR7GLEWTRPaUyAeX1II27qyVG37Tk+5gtvFgcpzL8+oLn/8cR7H8oY1zNQGu+HnYqzvj0ezDe5DuMQaPiu/Z7RKh1tt24wgZu+EzkAbPmQEhKu5TSTedZOt3cMDZvjbkEzkOfszGdERJlDcqGsFy/SQgFNkcTxWbiGrsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720651695; c=relaxed/simple;
	bh=ZwRZ9T+ny9FLr9iRjlmtnO3aUgLmZasjulBVjqa09yo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZbBzsOX5FIV4F4+BlFBlxPyi9UB+Hrz7ScKHIRZVlV7zPc7E/BXmp/zJ1z1Eq4VKXnjs+1YGkVYVZrGhwONnqQeNEOfupoVFvpmjs9QaGlUgrOLDF0UWv006IdHzXrzZqJVsrVK06+q4hMH3lR7H0WSxfmwXEk4nhLyzEjnT1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nnndY/6K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720651687;
	bh=dBd2p7ewCVsTTw6KyILQHbyJ8DuRnxEzBUYVRMp3hvQ=;
	h=Date:From:To:Cc:Subject:From;
	b=nnndY/6Kd4jDg+mlK04NEatdUPWpCFLJmsXxkBXDTRCXTLwvto3guOptbY+6iNDXT
	 KsqNGUS3ixHbRsVvQJCUpN7vhvlJ3PpBedjFVW7s1Md2XPmR9qtUEtcQ6jv5H5lfFr
	 GwdoZXZqBBXC1a51YmafhvNUF8fUOHET5SwE6U5tg6xT8X+qop8Q5VklYABdyHCCqD
	 8uf988qj51FJuKCJ721X6EWA6BenMyLaRVyDhvwrwi0iOFtCsfCabezI1sx4BlQIr+
	 3SBTAUfYshHxo+Ml8o4GjtjBbfxJOXDYi/wWuQFtNoQLR24z2PDywBT0OpPUdQPE3w
	 1knnNehpeCQMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKCgV4P9Yz4wbr;
	Thu, 11 Jul 2024 08:48:06 +1000 (AEST)
Date: Thu, 11 Jul 2024 08:48:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-nonmm-stable tree with Linus'
 tree
Message-ID: <20240711084805.369c466d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L7aFdTSMij7EAzS/7qyY4Kk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L7aFdTSMij7EAzS/7qyY4Kk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-nonmm-stable tree got a conflict in:

  fs/bcachefs/clock.c

between commit:

  a2d23f3d916b ("bcachefs: io clock: run timer fns under clock lock")

from Linus' tree and commit:

  1fcce6b8a768 ("bcachefs: remove heap-related macros and switch to generic=
 min_heap")

from the mm-nonmm-stable tree.

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
index 0f40b585ce2b,18fab9c44b1b..000000000000
--- a/fs/bcachefs/clock.c
+++ b/fs/bcachefs/clock.c
@@@ -131,10 -148,21 +148,17 @@@ static struct io_timer *get_expired_tim
  					  unsigned long now)
  {
  	struct io_timer *ret =3D NULL;
+ 	const struct min_heap_callbacks callbacks =3D {
+ 		.less =3D io_timer_cmp,
+ 		.swp =3D io_timer_swp,
+ 	};
+=20
 -	spin_lock(&clock->timer_lock);
 -
+ 	if (clock->timers.nr &&
+ 	    time_after_eq(now, clock->timers.data[0]->expire)) {
+ 		ret =3D *min_heap_peek(&clock->timers);
+ 		min_heap_pop(&clock->timers, &callbacks, NULL);
+ 	}
 =20
- 	if (clock->timers.used &&
- 	    time_after_eq(now, clock->timers.data[0]->expire))
- 		heap_pop(&clock->timers, ret, io_timer_cmp, NULL);
 -	spin_unlock(&clock->timer_lock);
 -
  	return ret;
  }
 =20

--Sig_/L7aFdTSMij7EAzS/7qyY4Kk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaPD6UACgkQAVBC80lX
0GwH+gf8Cr+ObchiSi0z8+Di0PbGq8MGRDzQSV2xOymAd4k5VVNY6ZelP58smsFD
HjLXRn5/KsZO2oSReAnBCaUftGNruBRW5NQdXvjx7sruThGpaL/rHd41G7NAtE1h
yPzAokR7PyyFeJ3y9VNeBiWHPnuFGqopvtC4rPpdy0TVcGfRlbJ7nWr7q8cgni1I
LuzB/AwQu1l/ouYZiN+v64yv3jr01rnf8MR8UtoedIu9AKkIiS99evi8e1dtzZYq
DMY1kjcQ9KR3bWllQDZomoTCtcdEMh+N3eWUqW/ptmQ/psy22G3u/sWowH4J5B1X
EnU6a5GVckJo3OZ6V0mFQk5askLv1Q==
=odBE
-----END PGP SIGNATURE-----

--Sig_/L7aFdTSMij7EAzS/7qyY4Kk--

