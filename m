Return-Path: <linux-next+bounces-6098-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67293A75E75
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 07:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95D301889DA5
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 05:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7233C47B;
	Mon, 31 Mar 2025 05:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IX1P461y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9534F15E97;
	Mon, 31 Mar 2025 05:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743397655; cv=none; b=tvkqAzF82IAWQpHB/buOhtm5Zjhbag9hDYLXPt0gM0j0f+vHBl8AbID83wq5FSwq6iwdDGaFzZC77fBu6opJkwTtO/8EmMVFI/oU2eDhelcaw3DhnuZR3uN6ZOId19JZ1kWiYkmdfgHECujXD1Cc47GIZm/CcfnfuNqzA2Nc6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743397655; c=relaxed/simple;
	bh=ncroEBpu+vvdfMRSvghJt4pJdB3LsYAwhSrNEfRTN2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HeT6C+bc8cMiZSH6Lakdg9tIYsd3sIBgCvZ+hdoEJQCMJB6Fn6HD0qMi4VZ9TnXGWVExPEBaeb6zVg/dC7VmQ/78r/d2CKpjn1/lWWBhoBen7o04ZahdIIdxPjvITz6SBrwZvSQxRAZ4Eu5yok5iTnPW6c7vzK7SchcwDJVofeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IX1P461y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743397648;
	bh=KmftMZx2hqlOnz3wKa7STgeJ2px3zI3iNbWmzzQ7VxU=;
	h=Date:From:To:Cc:Subject:From;
	b=IX1P461yiVBwRs6weA2u0TBPpoeoTtm0yGFbViLpi4o6Eu5+b0WpVUhFBtxJbVLtr
	 a7DOo2Z3hP+jZJ9fOspsuxZC1+fCL9xIVguxvrwiIqy02lMV2V1YlWCr5GbkLxenNu
	 CTsLqazePMGMaS7YO/sLq6NDMamtMIBBRJcVJ0cymVRouCvfPO91UKPE2fPhmpK1T2
	 8y/tnZ2AYrNLDfljJXvDaaQGPVCzrZIhLm4Su4pQw8188cJ8npQbSrquuxaiwVbmbE
	 A8cctjRODYNIXh41kucQ1TeCtqcwlGfgslocHd5VOD6MlISoM+9nKt4EQkRpKYdun3
	 9jseI9QE5HTFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQzdq1ktqz4x0L;
	Mon, 31 Mar 2025 16:07:27 +1100 (AEDT)
Date: Mon, 31 Mar 2025 16:07:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, WANG Rui <wangrui@loongson.cn>
Subject: linux-next: manual merge of the rust tree with the loongarch tree
Message-ID: <20250331160726.4e3d93dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/69IFeVACd.ro440qngajif3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/69IFeVACd.ro440qngajif3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/Makefile

between commit:

  13c23cb4ed09 ("rust: Fix enabling Rust and building with GCC for LoongArc=
h")

from the loongarch tree and commit:

  6b2dab17d6fa ("rust: pass correct target to bindgen on Usermode Linux")

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

diff --cc rust/Makefile
index 1750affda774,b9cc810764e9..000000000000
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -251,8 -274,7 +279,9 @@@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-
  # Derived from `scripts/Makefile.clang`.
  BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
 +BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
 +BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
+ BINDGEN_TARGET_um	:=3D $(BINDGEN_TARGET_$(SUBARCH))
  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
 =20
  # All warnings are inhibited since GCC builds are very experimental,

--Sig_/69IFeVACd.ro440qngajif3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfqIw4ACgkQAVBC80lX
0GzOCwf/TGX7TUUM+IAPTXp2CQk56pTqFYAhaogo87NQb83lKyknkg1UPvFh1hfO
q1KgzYzejC0+XWDqjQ1VLh1mwyj/bH3wbW0Ruz7xJzO4OG517QJXtEu5H5Zpc4bD
FUm1YrluLj5hw1cBj25j9VoQ5zU7uMftTkqUpE4V+voh/HlSSkXM/aWPIZ/d3/Nc
MSRraJogIRYw/UJqSMe6kPFzaxJR3UUaw4JuG0wlpqHzjrdWG5bBphpIZIW10I9U
90usr18eSzZ9rA3pOvJkkt+k5y+P7PXheHBpL2H7jiE/Rgw6YSplDBk9yPBraOF7
C0wYgYZ4SHjVT5qkEXy2eFAELkhA3g==
=nSGj
-----END PGP SIGNATURE-----

--Sig_/69IFeVACd.ro440qngajif3--

