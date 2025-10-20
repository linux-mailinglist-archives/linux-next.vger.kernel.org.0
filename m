Return-Path: <linux-next+bounces-8637-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D0BEEECB
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 02:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A37164E17FD
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 00:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BC828E5;
	Mon, 20 Oct 2025 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HNTVivU6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543B48F40;
	Mon, 20 Oct 2025 00:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760918866; cv=none; b=DqfHuU3uG/ek+Q2HRh8Vy6rDrstGZooo1JD82BBH7kV98r4Sy0p6xt48vfaCwOsHMxKQRg521mAXa1Kgd2aAnW0nn7jVBFmkUzQZgNDRSFfTYiIhzLQlHKanvbkR0Wb5HQ7REixXu1b2/Ckm0orlh1JxeLMIXesQAesgXueRET4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760918866; c=relaxed/simple;
	bh=7757hFLmfs1eUjpHwbfvEqjbGCpElPRXNm+VdQ9zrlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HSLmoyxtzViVN7cygx6Ox2CRMdKP36H7O/ZR7Fz9kD9WIxAkiIV33S0m2dIAR/erQJ2IuswSpZbHE47rBcwlAJVoWqdJIXyACuT/6e2uJrckSd6a2ywNcPI2wLiU5X/hvUhJ/rIaVW40Y4nspGPoHSbVJ6km0/S8gy8LHfWHZTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HNTVivU6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760918861;
	bh=HDzk9vebfEsRyA2C/HsZNPBRsdMlwCiqqbK8Z0ywOAc=;
	h=Date:From:To:Cc:Subject:From;
	b=HNTVivU6epRb5eK4clqI/i8w7YGHEyHeRfM19gC6/gT6rSSQyy0X7akFsEKyKGewk
	 GvpvMppVIubrEWdd61w1N/nXSB9wIRnZKqlt5oo5UlWfz7H723JxsmissKKnfK8NeA
	 vDFKGoE+Ol0P1yG3vZ3idWQNsdtou8WXb5JPVG9Qkb45Axa+HlCMJjNij2Ns+Ke1hH
	 F4RLNPHH/5ysKbaSowy6rDv6/toHv08n1f/PBSqSYm6RjCuDwGZY9pScbQcsfjbMo7
	 UZ/eyk0JlwD5Q/de80IQ7dj3hppkZ9NX6JQ122Lbi6zFL+Eac5BLoyzySgwG6cKHyt
	 od+yIn3C+cDcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqbNC2kr2z4w2J;
	Mon, 20 Oct 2025 11:07:39 +1100 (AEDT)
Date: Mon, 20 Oct 2025 11:07:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Elena Reshetova
 <elena.reshetova@intel.com>, "Naveen N Rao (AMD)" <naveen@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20251020110738.4e53c34a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YMLJJi826km_DzMakT56p0a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YMLJJi826km_DzMakT56p0a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commit:

  6ffdb49101f0 ("x86/cpufeatures: Add X86_FEATURE_SGX_EUPDATESVN feature fl=
ag")

from the tip tree and commit:

  5d0316e25def ("x86/cpufeatures: Add X86_FEATURE_X2AVIC_EXT")

from the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/cpufeatures.h
index 592909dbe0a8,7129eb44adad..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -502,7 -500,7 +503,8 @@@
  #define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-u=
serspace, see VMSCAPE bug */
  #define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring C=
ounters */
  #define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instruction=
s */
 -#define X86_FEATURE_X2AVIC_EXT		(21*32+17) /* AMD SVM x2AVIC support for =
4k vCPUs */
 +#define X86_FEATURE_SGX_EUPDATESVN	(21*32+17) /* Support for ENCLS[EUPDAT=
ESVN] instruction */
++#define X86_FEATURE_X2AVIC_EXT		(21*32+18) /* AMD SVM x2AVIC support for =
4k vCPUs */
 =20
  /*
   * BUG word(s)

--Sig_/YMLJJi826km_DzMakT56p0a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1fUoACgkQAVBC80lX
0GzIJQgAlle30wZrJz+o/iT7IKaBMsqI2xdRStaWYw+o4iFLRo+lkhv3UCiIWfk6
L/Mbf68Of1Wctvgm2DUaK+/ugdUaCyI5eHyPUvLxNkljwH8XD4IzY9X9E2qgoWUZ
Ve/Xx9ui5oSILTV6eTXv/7YUuvovhKR9qvp5+gv45fMnv9ihx8l4uUL9AIb295Dp
bDchh3rVDM0nUvBPbPXHG/uY4KdKQH7+LmGcaWR9MHTHQE1GReoLm3B07X0Tic0d
h5Au36GVtr1sge3076klMcHhPx6DodmIcSm4ZvfQd74ApNLwKO5ztBmhr58jdmw8
7Vt5hpAAj6FFZwMHsoJpwo3hT2fW/w==
=bVyY
-----END PGP SIGNATURE-----

--Sig_/YMLJJi826km_DzMakT56p0a--

