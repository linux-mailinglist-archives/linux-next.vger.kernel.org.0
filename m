Return-Path: <linux-next+bounces-7649-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 540DCB0BBC6
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 06:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1A416763E
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 04:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF67980C1C;
	Mon, 21 Jul 2025 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hzR1ANrm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129E6AA7;
	Mon, 21 Jul 2025 04:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753072271; cv=none; b=jPshVKV7VvWTaGNte1q3hgJju/NKYNgO76+MTD/0p7IWU8aFTCRrLJX0VjgZk51VyJu9rVfxUw4YjCXNURyl7bTpwqBbHkP/AcdgSPc+WnQn6W8yA7K6CclptM9OxPl3offmMkeYzdTf9DiCzmA8vV03+Kf1jYIu5u0O6KoyYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753072271; c=relaxed/simple;
	bh=jVbUYd4TLV9D1JNWnHmMuN2Ni7fqjVZMzsZjfBsSTpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mK2UR4DxSAWhuIZHl7Oa5KD0+cBSAubDHojiwalOo1H17SKzPhc0+ydwBllaRBxU3iHgKClH9rwjgLhTpT2mib9IEm8bzZcW25OreUdLGj2S62H2Ib0rtMnQnQgkJXEgSUEPePydrnHT5GJNHBOflXJ0lU2H8Lbwf+3JEieN2G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hzR1ANrm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753072112;
	bh=fio+O37FoQzbotomkY1HZEqcgNyOVzbHKa9mK2Q7VGs=;
	h=Date:From:To:Cc:Subject:From;
	b=hzR1ANrmFtQpL0ZVLu9prE4rWyMVkaxXHZ4D9IyAppKSjv9R+3atKt4ypxb/0Tj9B
	 RUSulrsOo2uw6IEzzTYR8AP/vRIM50kC9Ur002mWjSjChk0xUCEqZOj7X3ZjOPUUd3
	 srpF2fbO4itkJw/1J7l2V+28UoJ969jMur/02di0S2tSLH2VFm22cRPmEXUcnyQbXF
	 CN/OLU0KZU+OKhR5Kff6JYGuTv8Ly0WKcVMPYirX+fOy0U8vLRZcXaiLXHs1BwtFum
	 v09Yh/8p/fcNRgUqMHHg5vl749Cn8XJtQKzBmfETGgVOD292PUK8EnUI1ERFIhiw4m
	 o5N3nSXfTc2fQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4blnTD3pPBz4wbb;
	Mon, 21 Jul 2025 14:28:32 +1000 (AEST)
Date: Mon, 21 Jul 2025 14:31:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein
 <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20250721143102.1ae3bef7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p=Ec.tUYkLPABdHtLE=1kF8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p=Ec.tUYkLPABdHtLE=1kF8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  scripts/Makefile.build

between commit:

  749815922677 ("rust: use `#[used(compiler)]` to fix build and `modpost` w=
ith Rust >=3D 1.89.0")

from Linus' tree and commit:

  5d840b4c4935 ("rust: list: add `impl_list_item!` examples")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/Makefile.build
index ba71b27aa363,79c40af6f399..000000000000
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@@ -309,14 -309,14 +309,15 @@@ $(obj)/%.lst: $(obj)/%.c FORC
  # The features in this list are the ones allowed for non-`rust/` code.
  #
  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
- #   - Stable since Rust 1.82.0: `feature(asm_const)`, `feature(raw_ref_op=
)`.
+ #   - Stable since Rust 1.82.0: `feature(asm_const)`,
+ #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
  #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
  #   - Expected to become stable: `feature(arbitrary_self_types)`.
 +#   - To be determined: `feature(used_with_arg)`.
  #
  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details=
 on
  # the unstable features in use.
- rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_r=
easons,raw_ref_op,used_with_arg
 -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_r=
easons,offset_of_nested,raw_ref_op
++rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_r=
easons,offset_of_nested,raw_ref_op,used_with_arg
 =20
  # `--out-dir` is required to avoid temporaries being created by `rustc` i=
n the
  # current working directory, which may be not accessible in the out-of-tr=
ee

--Sig_/p=Ec.tUYkLPABdHtLE=1kF8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9woYACgkQAVBC80lX
0GwPYggAkmz60tUdNkOQotvMx9MJo4Hjyp3GT6Jsojs+RC8ivvZVMqAfiS28c0sQ
baxC6A2EAc2ftD1xwDHtK4wdaLa4YnZBDXcsDfKqDAWMAzgEAxoazNToWnNIcS22
TZOv+MULeHgFY+y1QgWWCARu+AEZlbwtwD22NTAUjjPWw9aklQh04uubquhrcaIn
lOwL+no1bIMQtIwuSw1tnij30srvrmjfyQ5EM9vq3n1OoilPb/P3NBAwykbHot+E
DiLkOppT6f1tifgppyC/0WoeyVu4A/M/MVYIGoYUO9Kmb3DAKNJ4IuMeFPBlCEs0
O5WPW9o21QIvdKWzz40cbq0wTM6IAg==
=nfmW
-----END PGP SIGNATURE-----

--Sig_/p=Ec.tUYkLPABdHtLE=1kF8--

