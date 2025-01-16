Return-Path: <linux-next+bounces-5220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D30A13094
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 02:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 384D87A2689
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 01:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC851E487;
	Thu, 16 Jan 2025 01:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EqfPg7bq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5729A1;
	Thu, 16 Jan 2025 01:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990199; cv=none; b=cswcutiQTnpKJd/59K54CX49A8XchwRHAqF/yRl4BNEeLYs5tVmEkr5dXFWxbgbSEYZc2jX+vMLvEtKsQ+WZilQc6O80AYN2DcIRuZli0pADJkvFAtp4xaqn53DJEXi9MYlW5GyekfocgmB2ZWin5EDdJevqpgL1TPBgghb2FjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990199; c=relaxed/simple;
	bh=3oMqmAkUiPqPUvQ1sfLuYrMyHQ7v5xsONbu6lfN0Clc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EseyhRFbK9QcgAyubI3zIGzAEWO1GhhrzaRcM1/HMLrIJOcnxyRs7ALN6E5r+ItvHDMWs0UJBBwqEiSyg55VMvm5+xRbetkow8Avcg+7IAbW3C5mXR5bzx+4rNmilQoOmR4hWztqecoxCXL2pZ2CySWLIctl6aK9FffVB5Nx8Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EqfPg7bq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736990186;
	bh=JVeFAgl+oD/Ykj7BPda2LkdsPDoqnz6PrIQER/opz/U=;
	h=Date:From:To:Cc:Subject:From;
	b=EqfPg7bqZe4DyfjKZqosd4syt5GNTU+1DWvJ0KO4dQER/aDPlqFOzK+LIyASsHd2s
	 03aJ4ce/CdT9pAIlmH79Hx1uziyjqottU7Kn+zXZ6jILelu9HnN1mdehL9bSlu2w2q
	 oa13uAmHZgRFT2Rn/BY1QR5Wmq2868V82t/zSslVYUyeeVJtslvGLClsBfnuxOjo76
	 QJOjWX+3et0lEAqmGzDtxC9+7w3D2bW92FMon/hDaF4AsFa/mU7rnY81gb37rVbg1f
	 qWGjs5zaLp0YahKjcXl+47b5ffvYWwYF0zM8juyQ3IXHMxSzwmhPVNQOYfdAvWifHN
	 RAjMiDEBm99rA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYQ1Q0nd6z4xN1;
	Thu, 16 Jan 2025 12:16:26 +1100 (AEDT)
Date: Thu, 16 Jan 2025 12:16:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250116121632.43604bfd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hsSsoh12/brI/0v_2gX0BCV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hsSsoh12/brI/0v_2gX0BCV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  a560758705a6 ("mm: shmem: Use signed int for version handling in casefold=
 option")

This is commit

  99b24f3ad327 ("mm: shmem: use signed int for version handling in casefold=
 option")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hsSsoh12/brI/0v_2gX0BCV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIXfAACgkQAVBC80lX
0GzWaQf+NrLk5ot3Tc+AyU8JVbiZa0/rzMrEDZ1CBrvDZ+ZeB8sX5C5bMmLTzHK4
bM0iJrUy/oU9Tj8t6m64l9KT/nooc/KmWppnyyz9sIokvyE4gDsr1Hq5JaF5E6lw
EJhEjGXlrykBZuy/CZHP7a2VakvIvgz/fC1fnUPNLvgtW7N76mejMlHnegxD+YJv
X/PGxUAdj+7hLZk/TsZrmRQbhT1MAaUIzUD/y62axToLPu+0wHJ/HkDWXECGy/09
ySXKxokd0dQZnt1dpF61pFqexnLe3Z2lyHpEpVVHtuA7NYuMJrhoiLWi+rWlIHXn
HTK5Hl+YtjhgxruPH5uumNQsQWocEA==
=cF9S
-----END PGP SIGNATURE-----

--Sig_/hsSsoh12/brI/0v_2gX0BCV--

