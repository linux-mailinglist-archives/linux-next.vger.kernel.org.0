Return-Path: <linux-next+bounces-8855-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9CC38464
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 23:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80F0E3AF763
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 22:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEF12D7DDE;
	Wed,  5 Nov 2025 22:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S4sjxIiI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137221E097;
	Wed,  5 Nov 2025 22:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762383458; cv=none; b=L8AODyAXzH21rG9NazM1lgPx3kx+sVAHsjGo8tjdvL4YKaPUbcKBFfRe1Zv8TuYiW7av8C+KQGNSer4fFteJEJSQCO1GXxqus3cHFiTO6ygxO/2SyDJ/1E/421EG8XS1WQFcIP9/xAOs2/eFVgls9baB3TX8f+XUmTc6e1pTmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762383458; c=relaxed/simple;
	bh=x51yxZlocmKAau7KzNbXEWRC72v3R6X/CvktHFU2SgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hGdp+rEidYcHhAJCYhBcKi5YyD1QwPvzbdwxzxBSZHnCOzZZKxH+HXQC3d+FFtcFYrQb+p9qMWLIHz61rAdDwL92CYOnvft24q8lryA2iQnEEhIG+ZTmBAzbJpFujIIxtiQkoVGV3zRli7/+A5pBS0F78TVUgXrldMKufpNr+mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=S4sjxIiI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762383454;
	bh=631tuPGIl23yj2vuwaJdVnoz3vCH9pK1JA0ISYyDuxs=;
	h=Date:From:To:Cc:Subject:From;
	b=S4sjxIiIIxN12oxOBNGNsiQcnL+z3P/KCbakEH2IDBze724Kk4tTKGs4E3kO9WnZ6
	 gBUPtluqyiVHluhsijTVDW6xr+HrGlqWq9smCQTPvam28VDdZOLnDraQkSCQJTDnW5
	 QNJyFnjdYPBvkZkYdJPzR1xyrtjwh8POYd1CfiBEcbewoq7Wa+RpV8YiS34K6HQ66X
	 OAW8dU6aaagKfmNc0MAFbDhAvl3Yje+G5M3YXpHwURzh2ytqr66AvEtHY3y7z2rfGn
	 p1y96w/D1bl92OiocL3RuwWPzsZWJN9HW4frxxOc3uFE3xNOUe72Xcfv1cLiXiEkQ1
	 A2K49FO/zbIXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d211V3M0hz4w1h;
	Thu, 06 Nov 2025 09:57:34 +1100 (AEDT)
Date: Thu, 6 Nov 2025 09:57:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Christian Brauner <brauner@kernel.org>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>
Subject: linux-next: build failure after merge of the ntfs3 tree
Message-ID: <20251106095733.600e04ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pc0anj90vUvdQXam3kjG947";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pc0anj90vUvdQXam3kjG947
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ntfs3 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/ntfs3/super.c: In function 'ntfs_init_from_boot':
fs/ntfs3/super.c:951:9: error: ignoring return value of 'sb_min_blocksize' =
declared with attribute 'warn_unused_result' [-Werror=3Dunused-result]
  951 |         sb_min_blocksize(sb, PAGE_SIZE);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  c1b61f715e4d ("ntfs: set dummy blocksize to read boot_block when mounting=
")

Exposed by commit

  8637fa89e678 ("block: add __must_check attribute to sb_min_blocksize()")

from the vfs-brauner-fixes tree.

I have reverted that commit from the ntfs3 tree for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pc0anj90vUvdQXam3kjG947
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkL1l0ACgkQAVBC80lX
0GzeYggAgW5fhXrThmb28sNH0O/xoqyeM0/WCAgLESn3wzEfNenpcI1G/JCBu8rv
BBluxNfk1WLfB2SN5KCk4wY4SP+L44bGO4UokhZvQ9raOtsjBLhRscnxW9Iy05Wp
kSGFGexADQeJsLLN3Lmcua3Drgdl7Wcp3Znd5oxVE8VD+khMkPF+PVzOjxahi0vQ
A2UpbO2HA4TymzuxFGwSwN6kHmYziZ11of4Fex07JV044jK8lNtEEanNXIxqx5xK
QDHWlRhcNnGUEDCCxVXvuYyErN0/owKh4155ah9zI5/CHuQ8C9+7yG9AVjZk3GQK
kPsVUuxjGSA24ZWCyPGGikn3uNqHcQ==
=iA1O
-----END PGP SIGNATURE-----

--Sig_/Pc0anj90vUvdQXam3kjG947--

