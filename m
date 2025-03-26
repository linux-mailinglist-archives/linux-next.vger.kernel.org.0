Return-Path: <linux-next+bounces-6030-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63144A72755
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 00:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AA841797C2
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 23:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E301C6FE6;
	Wed, 26 Mar 2025 23:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XjXDhHSa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85EE189BB5;
	Wed, 26 Mar 2025 23:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743033061; cv=none; b=OEqYfxTWjtZxL4VOB8rbFslOgTPa3Aa+1FLtlXFVt8zq1zYGNvXORRaQwdRgeEBCAvIAQqarvPGGx+gC0MLPGGAjHdO9xsFoMkE6HG9Fmwi+zHvBPa9mjLqeMfau359rvMYDQLDUTZwtnlLVSDb4R2dbc6cdP0xh5pMOsYDwGjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743033061; c=relaxed/simple;
	bh=LFjFLk7EI3jutGZn9SV85anhYR1KmkMqpaaXthhXcnw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jzM23FD5gaWU5DSuNkYbIipGEYBDFd5UVck1QjbVKgDAohoOSRCW3aWU+bC+mA5nAdfdBRJ7dLa6FMVBFPLpMpmNlCV3yzuyYdqSxvtw6eppyA556MZfwCNCecl2ngIMsjcqdrIUaSgFLV+QmMPTEdJObwskWXQQoPD9YW432Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XjXDhHSa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743033055;
	bh=chxEaKJUxui5sGX7AwbmCsFo4QuUTFe0FxZ4czZh5So=;
	h=Date:From:To:Cc:Subject:From;
	b=XjXDhHSabG77S8WbVRnuovbD97aPnNo5fHn24zLvZ9deSuckwU87JwfQUjPCGnt5o
	 SUPp80tCekFzDQG490jXYzKV9ndIanLh/6UbHPYmrOoK5kWA1JALlrr+EqzhUpLylP
	 tFCT2bbq77M05pgzMjZYpMw99ectf3MUWtAXoW9sXrLPZrymuAJPVoMYyyA2KyitAD
	 eur4X1m86wS8ajKEQigz8auRspUmq9pA4yg5CTCwrwS1ozeaeV06/7RODDbIHc5Wti
	 J0r0Kw9lpGR4gGBjH8JavnwXgakz7s1x7fz+7S6VPxtcPyyPhUJDEuHkX+t4rI4tLL
	 kBN384biafMfg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNNpR2VD5z4x0t;
	Thu, 27 Mar 2025 10:50:54 +1100 (AEDT)
Date: Thu, 27 Mar 2025 10:50:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Russell King <linux@armlinux.org.uk>
Cc: Kees Cook <kees@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: linux-next: manual merge of the arm tree with Linus' tree
Message-ID: <20250327105053.16b23d76@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3mmpNP1TciLPnUxowvv_CuR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3mmpNP1TciLPnUxowvv_CuR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm tree got a conflict in:

  init/Kconfig

between commit:

  b688f369ae0d ("compiler_types: Introduce __nonstring_array")

from Linus' tree and commit:

  e7607f7d6d81 ("ARM: 9443/1: Require linker to support KEEP within OVERLAY=
 for DCE")

from the arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc init/Kconfig
index 18717967fc8c,fc994f5cd5db..000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -129,9 -129,11 +129,14 @@@ config CC_HAS_COUNTED_B
  	# https://github.com/llvm/llvm-project/pull/112636
  	depends on !(CC_IS_CLANG && CLANG_VERSION < 190103)
 =20
 +config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 +	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) =
=3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
 +
+ config LD_CAN_USE_KEEP_IN_OVERLAY
+ 	# ld.lld prior to 21.0.0 did not support KEEP within an overlay descript=
ion
+ 	# https://github.com/llvm/llvm-project/pull/130661
+ 	def_bool LD_IS_BFD || LLD_VERSION >=3D 210000
+=20
  config RUSTC_HAS_COERCE_POINTEE
  	def_bool RUSTC_VERSION >=3D 108400
 =20

--Sig_/3mmpNP1TciLPnUxowvv_CuR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfkkt0ACgkQAVBC80lX
0GyB5Af/R8iRmCzK14QKNvj15ndAHsKCoojdUGWdsvPZmaLszPTR70QjX8VYm/G4
39aGKoZzppWf7g1tttCCT+1KralJ10rjVKfPUn2X5sWaTbjOlTFWM5s7XF17W4Cr
wWyySisRcYveiwrbECk4fiQHUgAL0mzhu71So59k4LU++aLklVPOa03nw46wPaFs
fxWOIu6xdLbcKZDhGRHGqMMSlpbvgoesayEqxZxm3b2iRFltKpTam1wKJmQag5zP
OZMANtC66z0UyiO/ti9j5mepb5px3ippfLrLal27tNphwoxCrsgQOy7JESdhN7d3
In3wDU9qUZtaF4IOzcer/XMdT3IBjA==
=5pFa
-----END PGP SIGNATURE-----

--Sig_/3mmpNP1TciLPnUxowvv_CuR--

