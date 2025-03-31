Return-Path: <linux-next+bounces-6096-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C61A75D7A
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 02:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13C13A808E
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 00:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDC6944F;
	Mon, 31 Mar 2025 00:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BYeZATSF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0178F49;
	Mon, 31 Mar 2025 00:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743380859; cv=none; b=V3WpfJvRG99kO/rxrZlz7YUBpavAnrSjAOymTm75UbY0n4X/NV4xV3f3Zjjsc0HPUJxbl941Ym0DdmYcaM10EhlRzznS0dwW3E4HuEXkrF6Hh7Gcy3MOBU/DCi+XH5T5tOTx17hVNUgDPUVX9CdFt90cjK8//+fAZpqo8TQKAfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743380859; c=relaxed/simple;
	bh=yF6P4AqBn3G6o95/SaZnbreDIADWuraYaP/kJzTA4js=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gBbyaQpfeifQjoM8Y674Ogs6zC7bkMasFb2BBjWfKlEQC5urbS/UInlLJ+ANGaSqH3OrZHxvio47zKLPm5LUMkkOSQ9etdL5cwV+Unw84Ji+JUGGT/ZR+euZbvcSHY5iwCyM1m1Wg+ieGVC9Wq9iK0ZuaOLDwknBCqhQnonq/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BYeZATSF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743380854;
	bh=uyHUn2XacJyxxLRfpO7SJFlwN3tPrnUfrl9uNo/5nLQ=;
	h=Date:From:To:Cc:Subject:From;
	b=BYeZATSFZ/95q1e5euJy2TipGWvsFUhN85matOs9FsOu1Eh3eoGFHwSd75fZwcqoq
	 IK/NK+uG/MhJ+Ti7Nu6B2ZBJKir7FgdCYiwV39OwYUDm1B7rHgR++6mRvuizs8T8gI
	 jU97c/LHbEQy/IkC4OW3t8lZW49q5hj6sLW6D6vyGjnEN7FKriVl+OGvtltvVZDDlq
	 abh5hMacvQlUyEzTAOTmhE595MNopuEOstSXjPBRJF5beSBDbWyMEqV+Cfi8xCqep/
	 GUfytdr3eVocnATrWzL5YuHXKlz1I06iqcvGnppM5VsiMN6oSAK4ZVG1vpr0aB7mgL
	 tHVdrxtUAF1OA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZQsQs3G4sz4wbv;
	Mon, 31 Mar 2025 11:27:32 +1100 (AEDT)
Date: Mon, 31 Mar 2025 11:27:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>, Russell King
 <linux@armlinux.org.uk>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, WANG Rui <wangrui@loongson.cn>
Subject: linux-next: manual merge of the loongarch tree with the arm tree
Message-ID: <20250331112731.25628b0c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zLtIDAJgHMfQx.UE18hgyue";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zLtIDAJgHMfQx.UE18hgyue
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the loongarch tree got a conflict in:

  rust/Makefile

between commit:

  ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

from the arm tree and commit:

  13c23cb4ed09 ("rust: Fix enabling Rust and building with GCC for LoongArc=
h")

from the loongarch tree.

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
index 7f4b77de833f,2c57c624fe7d..000000000000
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -250,7 -247,7 +251,8 @@@ bindgen_skip_c_flags :=3D -mno-fp-ret-in-
  # Derived from `scripts/Makefile.clang`.
  BINDGEN_TARGET_x86	:=3D x86_64-linux-gnu
  BINDGEN_TARGET_arm64	:=3D aarch64-linux-gnu
 +BINDGEN_TARGET_arm	:=3D arm-linux-gnueabi
+ BINDGEN_TARGET_loongarch	:=3D loongarch64-linux-gnusf
  BINDGEN_TARGET		:=3D $(BINDGEN_TARGET_$(SRCARCH))
 =20
  # All warnings are inhibited since GCC builds are very experimental,

--Sig_/zLtIDAJgHMfQx.UE18hgyue
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfp4XMACgkQAVBC80lX
0GzS5Af9FhZ158il1F42nmy8lF3yRmnkHeLRiET+tWR1rr6Vz9YhLez61ZvCJai4
Bq2amtcZxVYY6aNMSxRn6JO78t/795tWRL1S+Cge5DybuIZJ18p+IwFWZipeq2Hf
+5bUCpJo5nnDEcwSqJFirlwYKaH4ZZFaoieVbci5a/y6tDRlT8xGxuyn9f/JDieq
smmOcH3IoJ2zubRUEm63c2peX0wFJpkD1eWyLu7LomJLQsdp4JvIFq9nJJibcFc0
xb7HLhDPO6Bo7xcKmmW5WDFsxnIC5h1BV7eriftdIKtwDASgQvkpVnS1YWPaxn1X
azE94rH201vypO5Y5ALkdHZqSUSJoA==
=KY3U
-----END PGP SIGNATURE-----

--Sig_/zLtIDAJgHMfQx.UE18hgyue--

