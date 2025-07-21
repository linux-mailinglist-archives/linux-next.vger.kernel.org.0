Return-Path: <linux-next+bounces-7644-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C800B0BB01
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 04:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFAFA3A3255
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 02:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B778B1632DF;
	Mon, 21 Jul 2025 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZAb0OIVH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5EBE6C;
	Mon, 21 Jul 2025 02:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753066246; cv=none; b=jPGN3OO1R0kQwTO5OKaNvwIAS72MjnTkv7dzH9EXUt6ovH9AKrrIPrfeR36yG6sY3vl3ms8TyY8IJ4ps7jbO/WAVM/AqVzuvBZD6ZbxzHAyDFxNmytTtWLiImUP7GhX7+zXHVUvuSzEm80OXM8mTNJkr6fO6fPxTkozJEXTQ778=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753066246; c=relaxed/simple;
	bh=92KdLajCZpHgMN16syiEmao9TtSdc+Xx8msSThxifQk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e63QNgijyiYRN6vzAuRWP1WaHfwHsQZFtm1SdwJRqOqCTRYvgVZ2FQUbtATEjKz2vPs3bFgTfW7BbNnniXjB8OTtLY2qy4mfoydxK5LtDtAqcsl/609jldsOvnEfBRWxPaNzcyVvQ5AEGwMnw6TK0Gqo39Xtbb29NjBpET01TXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZAb0OIVH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753066091;
	bh=QNKPkR2IJqZgKeF82v1S1nbLIbKYi2iW05d4A11rPKc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZAb0OIVHKhFHrxQ5QF+hV4vy/gxSCkOoSC4VlH7qLZ+ERv9B/6YXgs8MYAMJEEX3p
	 7amtT5TIxHdiI+116xwuNiEpmLkrkJawbXnLi/nQza21FmQU4DJFf08gZAO9N84s6H
	 obr2Gu5NKTT+GyxK1zMgGBs9GTZFzEBtzUEA+TpCzTX5jhUmymz6epucTUS/IFTk3f
	 OZ6NwGFEyhF+vH6HhavBpgjJkebrCnmRdnakbiwCV4+8MXUsvhG1no174ISBUZrsIf
	 6o2HpI/mgNpscddDRahQSBfupHfy4WYn1eTzxVOkB0sfUYtIM1Gdht3bGF7+YXDqtn
	 nQNy/cR/qr4kw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bllFQ0bwCz4wbb;
	Mon, 21 Jul 2025 12:48:09 +1000 (AEST)
Date: Mon, 21 Jul 2025 12:50:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250721125039.170209b4@canb.auug.org.au>
In-Reply-To: <20250716142322.3a681368@canb.auug.org.au>
References: <20250716142322.3a681368@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bJ7l2V_5C4uQGTi4426rdUR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bJ7l2V_5C4uQGTi4426rdUR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2025 14:23:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c
>=20
> between commit:
>=20
>   61ee19dedb8d ("drm/etnaviv: Protect the scheduler's pending list with i=
ts lock")
>=20
> from the origin tree and commits:
>=20
>   0a5dc1b67ef5 ("drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_=
SCHED_STAT_RESET")
>   8902c2b17a6e ("drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the =
reset")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (I used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bJ7l2V_5C4uQGTi4426rdUR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9qv8ACgkQAVBC80lX
0GyTfAgAnocNOglVpKszMsdTmlrcycE4sIklH32mbXHUmwFXT6wPM3NYShGrmbOH
T3hsIa7KaEM4Wr6SCS8VbGiqQUqawmn8D+YSXG2yqasWy8yiNlv+mkcTnHKMQhsL
xBs/E9QsaF2c5R7onm9+oYQsOCIwwcAhKKB7hSm7z3jj+vey6RGP/AbR+Dkho/TE
iNgSefonk+15op/NO/EhfvX0zWjDEeXlTse1wAyIOV1bLuxT5NSiT5NzwnyMlRqX
Fw6eARCmbFg6qm8UPY9/t5ewpsGWd8EoeXTJBkbds75KOs4Ht6wim4Rf97nhVVJq
M0LcT8Tr18FNY74NoAZ4K7ZczpjIiw==
=hkH7
-----END PGP SIGNATURE-----

--Sig_/bJ7l2V_5C4uQGTi4426rdUR--

