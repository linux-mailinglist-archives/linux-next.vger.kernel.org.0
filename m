Return-Path: <linux-next+bounces-532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCB281C218
	for <lists+linux-next@lfdr.de>; Fri, 22 Dec 2023 00:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DEBB1C242FE
	for <lists+linux-next@lfdr.de>; Thu, 21 Dec 2023 23:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B4879491;
	Thu, 21 Dec 2023 23:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BWMu3BZe"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64181E539;
	Thu, 21 Dec 2023 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1703202491;
	bh=dPcPlZZ/3+BlR9SMPW2sPi39/Bw7K8p0ujRfhfIcXUI=;
	h=Date:From:To:Cc:Subject:From;
	b=BWMu3BZeRdtjmAb1NLBdXIl8gwclrYeNtIRzIGrvAJ5R7EFNtRj6zeDP5F0qmvSqQ
	 KGsisxbDtgcvNJnRhCmVNjXtfDZmuF2s9pWb6cbZRUwBowznFlOWitFinDVn9o7XUn
	 Fw3uanPB/tK7v5vfKYD6968QcAT18P9El68pWg1vLKJi1OVAyXwb1aMSDnzQjlAONy
	 KefovvFGhhSsUlJdJJ1yw+5djemSFjN7fI/HMMLqutQ9QPtE3AxLQGnf6ic2K7BpqC
	 HNEpCEiPcH3JDNoP2pja6vjzZnUq0eLGp7GCXNIMUvidXUoKKK3tYG38UgJDb+pjRx
	 bxM/sAeeafbjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sx6Z325SZz4wyS;
	Fri, 22 Dec 2023 10:48:11 +1100 (AEDT)
Date: Fri, 22 Dec 2023 10:48:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the kbuild tree
Message-ID: <20231222104810.32247f14@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_IuK8lgYRuUyxzeCY+jXDma";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_IuK8lgYRuUyxzeCY+jXDma
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the kbuild-fixes tree as different
commits (but the same patches):

  44028378399f ("gen_compile_commands.py: fix path resolve with symlinks in=
 it")
  888a50f6f93a ("MAINTAINERS: Add scripts/clang-tools to Kbuild section")

These are commits

  7cdb9dd97e6e ("gen_compile_commands.py: fix path resolve with symlinks in=
 it")
  e231092d19b8 ("MAINTAINERS: Add scripts/clang-tools to Kbuild section")

in the kbuild-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_IuK8lgYRuUyxzeCY+jXDma
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWEzroACgkQAVBC80lX
0Gzw5QgAosJ1R2aaccK5u3Cd+afF8luLDudddUD9N7CYC+Dkl99N4sWr7LubX1PP
/Yiy7qxbO02a4+5B/ctTjST8g5SWIcj3ai5hg2IkVS8WF+x3J2H0Ydv3QWtgbrOx
Df7bZ6gJWFicF4GkKPD9l6LLCubmSINy0e3V7zejmdxuGRT5F6jMfPZhdG76+dtL
IlcDVeXCQoz4iqAOTBPpY73OHM2yvvCQ9re018JcMYjMtzyJzEI8s/+c7JtqWhYL
IY2vgwEAOUGfmNEuTDrpOqECf4uC7KNmX3yMSjVS2iGK0L44uENImLIsc6F9/9qL
RJHzRU4VfBH4aS9B5yWOr/aRB3Oy+w==
=tKOv
-----END PGP SIGNATURE-----

--Sig_/_IuK8lgYRuUyxzeCY+jXDma--

