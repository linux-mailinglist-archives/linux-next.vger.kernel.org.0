Return-Path: <linux-next+bounces-2346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBF48C7F89
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 03:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96BBDB22276
	for <lists+linux-next@lfdr.de>; Fri, 17 May 2024 01:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A40F1C3D;
	Fri, 17 May 2024 01:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ii3boDjS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD831C32;
	Fri, 17 May 2024 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715909443; cv=none; b=lA2cXcv64GW7xPqRhnV2KXTR7XrJRLss4lN6YPSVQokYsg2nrijhqPjQpGPjDLgiWTbnXe8c/6NM9K5eTYoyOMHg1HLwkdKn+BbGF7I6hnH04XdhooI/LtIaRx4ImHYZ1CWyuHhVkRVg2Wpm3zj1SiFp4g1SRsQDSD6XzHrAgAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715909443; c=relaxed/simple;
	bh=kqjrdijFeAZ22pbjuQJ10fMPLgeVuG4Mm8I5at6+H0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zw8DrCalCYiNTEEVA6ClIik1tL5JIww08TNGswDDoD6zV7cTVaHknNWZk4MKenpN835ayCYCBBA4zSjCR7i0IF8k11pWJnK6fl9bBHGLvxOCxMrxBSozJXRxMIFdYLOgLj4VYaksqaqFqOrx281/G0V0VnKhn57mECUxt0I1Q6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ii3boDjS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715909437;
	bh=gnoWvDn7FRC/YoZdc8y7W/Uj1F6woTCT5nDimx/r8yc=;
	h=Date:From:To:Cc:Subject:From;
	b=ii3boDjSiB5Pv/R0qT5i8xwNa2EB+eJR/TH4UCQorbug4vy8e+eSpG0yPADiQbFEt
	 q0ActbpEPImkUbadOz4hjl2neUaiLgBxHpGu9Tr60G/oZ2zczaYrkZ13l+y2bn8GjF
	 5foAoFQcihywqDP37bpR+yEzUP/CHl4yrFdh1z7DvIoggqKIHrRJcyroy6ZYYP6YHQ
	 SXBJ2g27CbEbHIxpV8/+A5K3ONDEmAsllS+pcdtgPNao8+/8cLD0tX7uLl71gUJLqg
	 GBJodNXEzI0tJvkWqSWAcVXqdLkoGLN/v3CgO+n97cMSrx1doKBwMJYoFn67/ewQ9N
	 cLMLzRVssgbew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VgTtM4WnLz4wc8;
	Fri, 17 May 2024 11:30:35 +1000 (AEST)
Date: Fri, 17 May 2024 11:30:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Borislav Petkov <bp@suse.de>,
 Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Message-ID: <20240517113031.27f233a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kq6kwh+O+jes1HMMvVJ.Ad4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kq6kwh+O+jes1HMMvVJ.Ad4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/boot/Makefile

between commit:

  7f7f6f7ad654 ("Makefile: remove redundant tool coverage variables")

from the kbuild tree and commit:

  dd0716c2b877 ("x86/boot: Add a fallthrough annotation")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/boot/Makefile
index 1cf24ff6acac,343aef6d752f..000000000000
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@@ -56,6 -69,9 +56,7 @@@ KBUILD_CFLAGS	:=3D $(REALMODE_CFLAGS) -D_
  KBUILD_AFLAGS	:=3D $(KBUILD_CFLAGS) -D__ASSEMBLY__
  KBUILD_CFLAGS	+=3D $(call cc-option,-fmacro-prefix-map=3D$(srctree)/=3D)
  KBUILD_CFLAGS	+=3D -fno-asynchronous-unwind-tables
+ KBUILD_CFLAGS	+=3D $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 -GCOV_PROFILE :=3D n
 -UBSAN_SANITIZE :=3D n
 =20
  $(obj)/bzImage: asflags-y  :=3D $(SVGA_MODE)
 =20

--Sig_/Kq6kwh+O+jes1HMMvVJ.Ad4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZGszgACgkQAVBC80lX
0GxzJwgAl05C0jMr+C0bSL5PWLdKAU/EAQK4/puC005sP3kaVlhC0Q2RJRjNqLgO
l1aTujovKR4xpuyGzTjEerxleVFZuy3AgwEODTh1SM4GfXApRldA8NJPbESpM1yZ
oyLcd5S5Iam8UES4NKOc0ZdgHam68KqZ+raK0ZHnQoTrWyBUtGl1eVVtlsBoP+BV
fG7Tuq51MNpkYSMS97hrSafP5x+cB3vvmQfVWJ/XlGR6SwM54/WNbXJEp7Rp5Xeg
lB4YvW7n8uvwtbzyvxlWUv0qi3MH4yzC3j8C8ce90SeliHMXLIX1jXaCLE5h0BA9
kQd50GKJ98nJOovM9lPt7u1jBfEAtQ==
=YAzs
-----END PGP SIGNATURE-----

--Sig_/Kq6kwh+O+jes1HMMvVJ.Ad4--

