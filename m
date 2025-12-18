Return-Path: <linux-next+bounces-9459-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DBCCA571
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 06:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8EDF3025315
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 05:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EA818DF80;
	Thu, 18 Dec 2025 05:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GxvT55jN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4003A1E61;
	Thu, 18 Dec 2025 05:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766035970; cv=none; b=rxDGoRe5A+9oJ34fTnKFt6JsX2ylkKhDof8p2KM+14lex2sB7gkxb2dfvfSGgtje9VFeT2iCzr0uNk1oGnX0dQ6tk4pivAPfpBifD+wkNsVDcVbNupMshZ2VLGrByztS+dEaGz/F7RNj3gAlmOe5gn+hkyaJCnwxD1mH9+qclx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766035970; c=relaxed/simple;
	bh=c+RqMWTy9/m7m76RMFga+8HfePBH6f3w7NbezjfYjBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GTJx2MH/2pBr22LO0PnJuUNS9v0/IDNwjbM+MXHJ7vEKHseHcbXJRhjS7GQM5dkHicYTvShm4GmZyUb+XvkprVfNwpm/XhVYJX210pxZGwDmv92BbrOfUyqxDXTEyWifj/TqtT1rJopfFRD2mHAYjPUhi9MGr1VuMyBTTSMuUWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GxvT55jN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766035964;
	bh=9z/j43Lcdzlq/66Qhjgd5mVFRe762Z8XeILFknBjCGY=;
	h=Date:From:To:Cc:Subject:From;
	b=GxvT55jN6B/G5Osep2LnhkGUJfnWA2fxErcjh8gnFAhYh2P7M3NfbuKifkasy1EpZ
	 gqUCoJGmgYXtcyb4mKSFlw22KNh7sYnf5ECzqEDJ1o1PEFiutV2D20WWIWDMl1emBo
	 MnFgDpDzeaEgxTiJPFbkgduZOHvl2nm52J4z28Q58dzJSMba9qhkdOX8Y4n0/0+04G
	 fImTmpZeGy+MieFqCgKYMfUe5+TXeD51tGXQ39R9/HK+csEYu+uHRUGpnuA0nYTQH8
	 AwldN3NvMLsjM8vpslUo8/CJSjBFndvueazJmw8TJe2WfxrdfqCpQYYdud2YIU/vP1
	 UFwmDoQ1kjS3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWzp35V13z4wDn;
	Thu, 18 Dec 2025 16:32:43 +1100 (AEDT)
Date: Thu, 18 Dec 2025 16:32:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20251218163243.3e2f9786@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A4T6oppH2JDhKWnjAzOsoPT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A4T6oppH2JDhKWnjAzOsoPT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-unstable tree as a different
commit (but the same patch):

  c0aac5975baf ("ns: pad refcount")

This is commit

  798ab742a82e ("ns: pad refcount")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/A4T6oppH2JDhKWnjAzOsoPT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDkfsACgkQAVBC80lX
0GxVFwf/c8scWd/aJwsjjgmp3ePTcMl3AU8Vudz7awBxzPZSQcAyoE86NWb2FX5a
w3Atnj1AdQPa2VQDFYKjOnnUhvjrWx2n9SaFrl+t+KEv7wwdWIAln5OZTPcmdTFJ
jo+QIlpOQHTviWBne4nr2L98IcozquVn0+uF41lpKOTAWfejFHeGRKJBVf4R0pQb
xMGJilZrkJ2PL8rKd9FtnQdd1Rnxp/ziLak/PV28kuC7w5teWYNsYbJ9dlbyTBW0
aYwTNiF+9V0YF98Z0AHjSq4fVF++WJxFzcJyEphpIlLgTu+wpLgCHdgonxys2o0o
vyEqG4999j1LLBS4F0DRTtoFtZ1FlA==
=iqKl
-----END PGP SIGNATURE-----

--Sig_/A4T6oppH2JDhKWnjAzOsoPT--

