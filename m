Return-Path: <linux-next+bounces-8631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8721FBEEC5E
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 22:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 452144E1893
	for <lists+linux-next@lfdr.de>; Sun, 19 Oct 2025 20:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401301FAC42;
	Sun, 19 Oct 2025 20:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LVb/j5tM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7644134AB;
	Sun, 19 Oct 2025 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760907070; cv=none; b=J/LDUIYT9vm36M414G/Zqssr//wdhjFVLLaC3VVX0y0cZ/e9sX/1VxTygArm0/5+8HYgthLmx/jVryGAhBxMLyPE6MJOKh+WJKX+jjeCmfUhsUpiN9hw//z7g3AViyDg1wp+MwvJgwTXjy2xzxNETj51KCWk+4+cUHgJ4E/1Xqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760907070; c=relaxed/simple;
	bh=e+ycHJrSXOWSKqdJGwStSaPzQOX4aZArnXveIuqTw7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g00IDkPc4jeu78s3hzub1WLiwjrvxg1gHIWIgcabFujoiWGPRBAVuKkVS074Ndaci9Tpmy53oY/nUVy+N1fAcPiBpH0DAYod+bOMvXH9RYohA/fm89R520EQhjj5ht/AYHE2UAN/t7c9OejhDhC08g0RFYcG7t8G5seVuiWsn28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LVb/j5tM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760907063;
	bh=K1sonkuE6H+HiP4XKyUVb9axSMAgtt0i/eN+74WUWhc=;
	h=Date:From:To:Cc:Subject:From;
	b=LVb/j5tMnYFp45G4lK1qLS+jSEt5nT6ga/KIeoG+2JFFmDt/Vjvna2F2sl6cVtUQj
	 htHjiUJ9jQK9doK8jTWvAl/ySzi4nEGyjBqbHVbUTnFhnRquHd7xP0rS5zNJFyaHMr
	 NrR4VZg+4yW4yfkNcqsS15bcm+H0HyMmh55h5vvLkFAokuIlsUFEtbm3l5WQD9uCrz
	 pGX/cXZquf+qmZWAh3mDTsoZiby4i/Tav5g2d/UmZ6S737GGnv0hrp0QiNmwpH/I2v
	 QttiKtCDNOo+ZG/mICHu6heR7/ohzWazUsD3ETKCjVgmeMXobUO7kjJ8hzN9fl8rLB
	 9phlwKTdnRStQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqW1M4w9yz4wBJ;
	Mon, 20 Oct 2025 07:51:03 +1100 (AEDT)
Date: Mon, 20 Oct 2025 07:51:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the kvm-arm tree
Message-ID: <20251020075102.4f6df4fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VeN6j4Em=UZ/81+zKd1AiGM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VeN6j4Em=UZ/81+zKd1AiGM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  34f46fecfe96 ("KVM: arm64: selftests: Track width of timer counter as "in=
t", not "uint64_t"")
  0c5bc849fd76 ("KVM: arm64: selftests: Test effective value of HCR_EL2.AMO=
")
  fcaa3f59fda3 ("KVM: arm64: Use the in-context stage-1 in __kvm_find_s1_de=
sc_le
  5bd5d7d43a92 ("KVM: arm64: nv: Don't advance PC when pending an SVE excep=
tion")
  eea94a0ea55d ("KVM: arm64: nv: Don't treat ZCR_EL2 as a 'mapped' register=
")

these are commits

  cb49b7b8622e ("KVM: arm64: selftests: Track width of timer counter as "in=
t", not "uint64_t"")
  890c608b4d5e ("KVM: arm64: selftests: Test effective value of HCR_EL2.AMO=
")
  a46c09b382ee ("KVM: arm64: Use the in-context stage-1 in __kvm_find_s1_de=
sc_level()")
  9a1950f97741 ("KVM: arm64: nv: Don't advance PC when pending an SVE excep=
tion")
  ed25dcfbc432 ("KVM: arm64: nv: Don't treat ZCR_EL2 as a 'mapped' register=
")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/VeN6j4Em=UZ/81+zKd1AiGM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1TzYACgkQAVBC80lX
0GxaTQgAhVe2tCu6BMYD1q+mKa2+fUHHEuWWd2QlArvXGeBT/w1p6f/Klfr9xZ8K
YXJnI2T5S9lmM8ffkmwD5izINjVtFehWi5ko4rLBtRlVt9Ic3pzvUIvbS8jcfS8u
lxf9Z0Lf75Il5/Po4VPsVEcSq1DLjUmuzYhuytwIC1Mh782auNfVsyrrS4dJRJ8n
fwgJYp/oHaiW5uTTd2dGpGtQwnlbPaDfBSudzUpaY3MwSLpdKt4aowxr9I6zOrPA
DFgFroj3g8Lm96oUSh3G2/pEo1J3eOYeeS+5qvKK/Pr13dLlEZIjrjKln4qKz2fF
fDiV1g9YFZSoN3QWhkt85ESBr2KRbA==
=67jM
-----END PGP SIGNATURE-----

--Sig_/VeN6j4Em=UZ/81+zKd1AiGM--

