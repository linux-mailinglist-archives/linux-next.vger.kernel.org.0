Return-Path: <linux-next+bounces-9448-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F28CC98C1
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 22:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80EBC3011B32
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 21:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521A03093D1;
	Wed, 17 Dec 2025 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XFEPIkng"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2D274FD3;
	Wed, 17 Dec 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766005587; cv=none; b=bsq1raSUKJFWwi10IZF7RiUmelI1zbPpZXhYXzxsEE2jrwqraIcZv3m8fSc28AuG4HNqjoGO1Q2UKihhVRMCA0tMUFmGcDk71DM/0dLbMWZJlnBIJtJEN8ZyR7TTE6ooHuw8qNRkQsVziEUeP9mpdpdOETwWiWFjCI0Ls+WkGro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766005587; c=relaxed/simple;
	bh=3R/Ppo+CWmLEoeE4yj1pi1svYkaPa9aVgxENvjF8Mw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UM13YmDLu7LsAA8/kNaMIypabOsTSZJpw1Bp1UQvgkxmB+84FK7A4NPSRZyY8EMYlM2aqj+pFm3qRZNBArqGetplYGEBmhF3Du6p2trMrjF5r75cKZQ7vze1MnF1JMDKgd9AIuPhis/tAsr33AaBsrXgVI7lQpp7aZvaB5Xhovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XFEPIkng; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766005580;
	bh=4e6qfyQUfexepA3mnQqRKDxCCmoXp4HRzpDLQinwmME=;
	h=Date:From:To:Cc:Subject:From;
	b=XFEPIkngsPCRtUxvYCpaP7MjAjdXNTy2UgI0a/u2UNNatP1BWV8Eu4UzY26GsxJP5
	 w4EExf0Lf2xKg4uLdimk5P8/uhEx4LFZQypoggQ/VprmakxZ2CzofsQ+4wOawddNwG
	 fCi0pIw/TQrwpwLyDVuYsDsfzQGrg16EE1Tp2m+shSp/r0JtmmzJqlYcDSDoLw7WWi
	 ey5b8Z8HYhfaELnf2KBvwlftlsAwssH3/sSPMi69smLgNJeI+FQe86pYVOiMu/RECt
	 kujC5DdTOfSNvlkUv12VDg0pNfVkghAPoKCPz81o9bN61CdfSAH8sIDomaFtxVxqwE
	 9IBBF1hzX8m4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWmYl3sDNz4wBJ;
	Thu, 18 Dec 2025 08:06:19 +1100 (AEDT)
Date: Thu, 18 Dec 2025 08:06:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, <linux-xfs@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <20251218080618.2e214d02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/484kIumJ4yaWBLDABjtIQeR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/484kIumJ4yaWBLDABjtIQeR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8dc15b7a6e59 ("xfs: fix XFS_ERRTAG_FORCE_ZERO_RANGE for zoned file system=
")

Fixes tag

  Fixes: ea9989668081 ("xfs: error tag to force zeroing on debug kernels")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 66d78a11479c ("xfs: error tag to force zeroing on debug kernels")

--=20
Cheers,
Stephen Rothwell

--Sig_/484kIumJ4yaWBLDABjtIQeR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDG0oACgkQAVBC80lX
0GzMogf+LNkgB4SD0BST1SUWl8csVFJs1bT0J/J6Nsh5zghMaTDsGVq/Vnh1555I
oHDgXC8Ih350PCsnIXlqJs6n/6vDtXhA2uWKkjvUVfSOjRw7w0jX0gjH+zc8HSwK
r7peQRLHUBY4BEZrCfW7IGqgPPnFJVf2qoQy9SGPslqcMxL5z/z8UnM7ibo7yDba
EQDEzI8q5lmsTJibUVJMYsTWSHoNv7gEeWmtsW6pyCdR9hzL3tZSg5xK9yp1ez8E
e4AHzLc/gWd4qaQpza/uV1z+3Hp4qS4sAMZUa+F3cHlFFyPNGX/ZzbxhHHNSVsIY
WmlDlgze6gLsV82r8Mnc+uFCxkMrag==
=B4+3
-----END PGP SIGNATURE-----

--Sig_/484kIumJ4yaWBLDABjtIQeR--

