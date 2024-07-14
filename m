Return-Path: <linux-next+bounces-2993-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CAC930C26
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 01:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21037B2144C
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 23:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D9A13C827;
	Sun, 14 Jul 2024 23:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tVbdRi2j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2A15C0;
	Sun, 14 Jul 2024 23:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998760; cv=none; b=JW2YM2HX++z2U08Bv15HePqtV6x/0an1jf+iZhN5AVZcLKgqaBbNTqAchLj0fH97xqhucx8ISkTl8d6b4eMx25ur5twVvkIuAbReezbTynUzlyvMujB4jKxpwZUllbs++u0zn54WuGt0yZeiNgSuD7XQyTOslWRuBM/vP7YTYfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998760; c=relaxed/simple;
	bh=+jLrjyyo4c0smyWkvjPabbGCZ5y3EDN71/8Ey1ciIlk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CPSs9yCxgUtUC0DRc962h5wnglHMMBFwPzYZk7bAA70e134fVzinG06eAoI1qeWx4A6b7nvO3V7bD0vkE/7jHsv7xkMriQVIWyHxy7yIODczxzn9V8aAthnsvGpX9iEA4lZdTb4+djCgmltt824gM0vW2WFFDs+v2pKfrWzJDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tVbdRi2j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720998756;
	bh=MJhXXOOxb5iG2c/IKqjsVUvP+tkFkr/7jopq7pLfVYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tVbdRi2jga93KyEsc04DDTQdCWA4luHJkZD1gzUPXxolt2vnzfBVE27Xtutowt4Wf
	 ixzCv27nTaxMSGT+QubvVokPmBdBfk/WBffbi7gnCbvpQPNCZbV10ORWohDUzNvpnt
	 kcFI6ttWFNmizLWAEo6YwnKm4XG7+TVpb6vNZG7U+H4HpQN1lO/BFU9oSlcX/Zz8X3
	 uB6lLcM6xINaa6b3fTg25Y9joa4kUKMaR5o7b3iBZmhwKU4fuVSm6M5U0maP+hVrc+
	 Iw2ZMEgyRpuvXTHODLdk29EheC80aQvbLKj0eqn1nyQt1Wst47LGfq4VDTLKRfbqfZ
	 mVXzM6p+PIocA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMh1v1GsMz4x3c;
	Mon, 15 Jul 2024 09:12:35 +1000 (AEST)
Date: Mon, 15 Jul 2024 09:12:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20240715091234.5e8b2701@canb.auug.org.au>
In-Reply-To: <20240612141110.3aebb166@canb.auug.org.au>
References: <20240612141110.3aebb166@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ihTLrtED/0T4xy6CeBFtCuA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ihTLrtED/0T4xy6CeBFtCuA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 12 Jun 2024 14:11:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the drm-intel tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/drm/display/drm_dp_helper.h:127: warning: Function parameter or s=
truct member 'target_rr_divider' not described in 'drm_dp_as_sdp'
>=20
> Introduced by commit
>=20
>   a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing =
AS SDP")

I am now seeing that warning after the merge of the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ihTLrtED/0T4xy6CeBFtCuA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUW2IACgkQAVBC80lX
0Gz3hAgAk/IRed1RH1ceOygvazeLlaKI8+79+lC23KbXapcEN8h3qTPeqBRYpsku
HM8DLV3KRhgiAX30q1j9C3Cdz/FO+/l/pAG6Y8vTBqwy98mssBiFYEHf9RuhjRsc
bE9GRvUS+IkI8IwfqGxbwKShW31cdr6Z4nhaR3OWNAN+W3Gry533BJkgVVCKtwua
LMXtadpZ7PKpzgZ/YCdCqCt7yJWZ85nR68OI3SBSfPuQMus6uczvuVwGqt5w+NId
MfffyLHhphOLAMh+YSHQ05RUiOnbm/nrlC8xvT+X53+pMChszp/mL/EAv9M67U+O
w5wFilSjOjnYxvbd7W81wq22BoHvoQ==
=Kh74
-----END PGP SIGNATURE-----

--Sig_/ihTLrtED/0T4xy6CeBFtCuA--

