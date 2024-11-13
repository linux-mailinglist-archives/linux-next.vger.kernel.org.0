Return-Path: <linux-next+bounces-4768-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D239C691D
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 07:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BC88282200
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 06:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A521172777;
	Wed, 13 Nov 2024 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gz2e9H3C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F140A5680;
	Wed, 13 Nov 2024 06:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731478422; cv=none; b=Vdm2NVPpmWA+gfDeCJoq4X0WJ69bNQQGgZcbNG0y6+ru/JutZEcRCA0h4ngfD2TyMFUSzpxJUdlDyXqwmQUxIwIWHUiuKI86K8+igzCZgKefyYeQBbmI1+l+Epu1b+ZBKts2ct4AXC3rC7bKbu93F0p88UQp5prYOvXrb5FeHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731478422; c=relaxed/simple;
	bh=rOClVfa6AMLDKR6mmXEQPFcRQbiSeM6bWJSzZAwspZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jfBQiG6Fo49O1pg6tH2ffyoaorKTDnwm/mtz3a5hf5tVJFXOEnEp1RLsOz8qosXv8UhdGyQAtHn2QOIqBpz9C4RrHI4+W3fvOns0LTiqIRKARTaMbPVGfcCJ66JjSqWngo9YO7EuTat2kHxG4ko3kfKl0qoI2lQdDkytWsO2AG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gz2e9H3C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731478413;
	bh=lJn3nlEbX13becrILHNuNl0m0rbkWYnvSvku/JBogY8=;
	h=Date:From:To:Cc:Subject:From;
	b=Gz2e9H3CiUlaDlb5ej3sJ4LuhbmTAAZFPct6JYZ13qxMEa0q0A+0348psaGH14VmN
	 vIRL7FYR3L3tQr7Nqnp/lKV9AKMlu+CLYxQuGEuM145XYscVx3vv8FeO1yoqLnM509
	 eaWaCWlTBHaoGyK8CKSmQ4VhhcWxGBmJZBp75SnieUsY2GScATrK1K156pvRSCR0B1
	 LVZccnwNrHJQXaXjNmeWmRugXTLdXNr78pzUqU7tcYNRYi+IUekiDOmVN5LFb7IBNx
	 j89kvlWb6UkfdaH1sqmEAFpPNT+D0i8jm4E+kaKTZeKds32wLrdotXj+CJHuXm89cE
	 AJTXMl6br6Tnw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XpCdm43Y3z4wbR;
	Wed, 13 Nov 2024 17:13:32 +1100 (AEDT)
Date: Wed, 13 Nov 2024 17:13:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the ftrace tree
Message-ID: <20241113171334.7ac7a6a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s4N/XVkY2B8eF1klI/negdL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s4N/XVkY2B8eF1klI/negdL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  scripts/Makefile.build

between commit:

  169484ab6677 ("rust: add arch_static_branch")

from the ftrace tree and commits:

  1f9ed1725456 ("rust: start using the `#[expect(...)]` attribute")
  c95bbb59a9b2 ("rust: enable arbitrary_self_types and remove `Receiver`")
  392e34b6bc22 ("kbuild: rust: remove the `alloc` crate and `GlobalAlloc`")

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
index 38c7c2602683,2bba59e790b8..000000000000
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@@ -248,7 -248,7 +248,7 @@@ $(obj)/%.lst: $(obj)/%.c FORC
  # Compile Rust sources (.rs)
  # -----------------------------------------------------------------------=
----
 =20
- rust_allowed_features :=3D asm_const,asm_goto,new_uninit
 -rust_allowed_features :=3D arbitrary_self_types,lint_reasons
++rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint_r=
easons
 =20
  # `--out-dir` is required to avoid temporaries being created by `rustc` i=
n the
  # current working directory, which may be not accessible in the out-of-tr=
ee

--Sig_/s4N/XVkY2B8eF1klI/negdL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc0Q44ACgkQAVBC80lX
0GypFQf+NH2UDRoS1SlvRy2RFw696+1Mq6iqqktoOu3kjLWJFbTbrCTnQ/xvZvgV
VuG2Di7Nz23sUu60/kMwe7iWnDMFMTqd+ucDnXWibOo6kg7X6SpxYscfL1etXLBk
iZC6woVY53R5vDsa1r1AnjUdYCGDLipKpJUhWzx2fFpecw5n5Cf8umlMiSn3twUH
s9RFBiopckAI/mHynmEQUtYHvf5VGn6+ZnCMn8nWVSMOpodVXRPovwK80H2UbIP5
7IttiMA1HR318Dk8HwKy1srda4kNB/Z0saudg/+HtV9FOohWwfFxiaMy6Z4sWG3y
HqEL250Y7049PLPPuZH5ZvaR/RUxOg==
=sP6e
-----END PGP SIGNATURE-----

--Sig_/s4N/XVkY2B8eF1klI/negdL--

