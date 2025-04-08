Return-Path: <linux-next+bounces-6178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D378A7F232
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 03:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49E2D7A1EEB
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 01:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4952825F7AB;
	Tue,  8 Apr 2025 01:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qqZhBD3B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26F2253B4F;
	Tue,  8 Apr 2025 01:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075718; cv=none; b=rUp4QRLVxi7iPb5Jg2Tm0Gl5Qw0i68i0Qk6IeMPiz5kt46i4AEKwtfKorrje8Hw26Ldp+NHGVDXSZtWEB8Jx4VvkuN/MeU95lxCeeXQlOlkXIgUwjPtIbzxm+5XJDa9+a0KS8H7/dBRG3XaVfksuY/ZbOeOyo8noxJBL+jcijX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075718; c=relaxed/simple;
	bh=jNTmGj4j/69Ay4D+LHlStPY7yMbZrmFBLS/TaOxeyyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Zlr8OArDlZ676q1wUJJR9dA4E2lgi/SOK0cBEoGbcfR65yPsIS/GFe1ZHpKDOO2GsAhIxY3PZ55K50VSwiOdEN19Y1F3SF09w5RKGjqtcXjVeGQbiAdiW7lb4ufDyQltqR3uYtHWW46fVmkq2RcRRx+PJkN7NR4xHsgddiKr+0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qqZhBD3B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744075711;
	bh=lhLEo3ogXzJIf0DGYlm0frT0roLHlbZYjddZSbnTWjw=;
	h=Date:From:To:Cc:Subject:From;
	b=qqZhBD3BtEv39ruVUSvsFAL8LqNl/tbJHw5OitiecohWVVUhpouPSzUglU3WhFEeK
	 KEaoZsGj+LD091J0ZsD57dhweYgxD5RLDBfuORKZSDwMwDOaszDiUjqtZeul8nDB+l
	 KOFwl120N6I4mouFyzkPglr25sls6pcgDe1CWzEuZu0fTmPrM7jBB5beh8Tr4RJT2R
	 gersbmHeJVLX+K+yBVgCGozdCUzJ5U7ULdXew5IgnsTN347ToA4CK5TIftP+EXz7Ah
	 GsOWVjCKYgDpbWVpcsjkx2ap53UcHs+Fge/8SJbx8VJesTbC+T7CBFyPWzMmQOAX9v
	 2ZicI7vhic49A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWpPV5CM1z4x7G;
	Tue,  8 Apr 2025 11:28:30 +1000 (AEST)
Date: Tue, 8 Apr 2025 11:28:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ingo Molnar <mingo@kernel.org>, Linux Crypto List
 <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uros Bizjak <ubizjak@gmail.com>
Subject: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <20250408112830.4769244e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ijV3LBWOd6bicp2bAgmVnhn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ijV3LBWOd6bicp2bAgmVnhn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/Kconfig.assembler

between commits:

  984f835009d6 ("crypto: x86 - Remove CONFIG_AS_SHA1_NI")
  d032a27e8fe9 ("crypto: x86 - Remove CONFIG_AS_SHA256_NI")

from the crypto tree and commit:

  a72d55dc3bd6 ("x86/idle: Remove CONFIG_AS_TPAUSE")

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

diff --cc arch/x86/Kconfig.assembler
index 4d06fd3c8dfe,fa8858546d5e..000000000000
--- a/arch/x86/Kconfig.assembler
+++ b/arch/x86/Kconfig.assembler
@@@ -6,11 -6,16 +6,6 @@@ config AS_AVX51
  	help
  	  Supported by binutils >=3D 2.25 and LLVM integrated assembler
 =20
- config AS_TPAUSE
- 	def_bool $(as-instr,tpause %ecx)
 -config AS_SHA1_NI
 -	def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
--	help
- 	  Supported by binutils >=3D 2.31.1 and LLVM integrated assembler >=3D V7
 -	  Supported by binutils >=3D 2.24 and LLVM integrated assembler
 -
 -config AS_SHA256_NI
 -	def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
 -	help
 -	  Supported by binutils >=3D 2.24 and LLVM integrated assembler
--
  config AS_GFNI
  	def_bool $(as-instr,vgf2p8mulb %xmm0$(comma)%xmm1$(comma)%xmm2)
  	help

--Sig_/ijV3LBWOd6bicp2bAgmVnhn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0e74ACgkQAVBC80lX
0Gwq7Qf/QFlc1VffDgR4C6UmPIv+B+DugfKoB+B7080A2n0y4/d7nCGyQqGof3RN
uTm5cOZ2COdTgWq/7vNi1AyRrQ710YHauqqOsODe6OnulDvfD8lm0Qdz6ywLEDl7
SlmvTe3jn7DaFL6c3iSBwFaxQuS9n/ctBSB17cfTbHZbuYt9ISJpUFq1+8b6fuya
pGPPWdRDDUeX75Y3J3nUigwQSQppUTFCJr1YEWWAqaXgQgaSykKHRA66gWKUaMgX
+4RBp0KNiEpZbtOXcsfPo0N8AnIOXLA9gir2DMLqhEQL6mMqUZudXqclqcHhymQC
qXxQiniWR9gS8ueTEP091Gomc5BFMw==
=vIOQ
-----END PGP SIGNATURE-----

--Sig_/ijV3LBWOd6bicp2bAgmVnhn--

