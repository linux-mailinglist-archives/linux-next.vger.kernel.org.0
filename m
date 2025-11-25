Return-Path: <linux-next+bounces-9217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01187C87611
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 23:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B577B4E6C7C
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 22:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E7D1DF75B;
	Tue, 25 Nov 2025 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kIHrQiZa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B212EDD72;
	Tue, 25 Nov 2025 22:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110726; cv=none; b=pGn3EwRAACtAyXDU8mwWK/tSTpeDA244Aqo2VqsmehMb+UjfjP8tIFgibLrOwwBdFCKjiujstABpq2f+vZydotIel10zYoaS1H0D5oT2SaOjKREvFCVJm5NNEua4Kp73lmEjpawopFVQbKmjg1ahU7JoelelEIU92VYoEhH2sCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110726; c=relaxed/simple;
	bh=J9PBdVp5Wv4X3H+2Y+oPsgds+PErgXBsT5eKYhjg3fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pimWHbYTfhfEq5K3Ie7pq3p9x7lGb+j6HWYJqHQS0tQXbLxcxbB2x5V2/yI2ts4kDSEM8jO9H7TyfAu4bSz360hzWGRBp+ME7Tdjj6Lh+7I6NXgA6OAVUQ/hvJ+OFzfazCVAJCJsGO6fxWihKdLgGeQsGFKSQpDFGCwYvdRRx78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kIHrQiZa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764110715;
	bh=eksKHdOuLUxEaSCZSa3Yy26LV0Sk/VcK0aODv8ehgYo=;
	h=Date:From:To:Cc:Subject:From;
	b=kIHrQiZanUsmzChCYawVsUgciFwE5e/p1WqtnwXukSWhS4w2zSZ+O9bPkZK8m57yA
	 nuzu4dHKilgEhb/nKaJCekMjgaZigWa7zM7jgJvSdoaKlv+DnLj6y2ISJa0+/qzkJ5
	 HIokRsaItbWjPtzFRqq6/Yx/3tF+3n4Z4kDJzZUQOZOYdja7NAQh95sUHZKTsSC/T7
	 xVItKYouK3Fl3Fb6vRyPTHKPbfZY8AkIbXdkb48+iOvveHMtynxe44hf12BT+bbVqq
	 vhBrXC/w8Y5A20L8Kax7RWcwQ7j3o76cgsxnByLHp6b3kAtLwuKZctMGSeAKxAODjh
	 hlKdhHKgkz0xQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGHp11Z6qz4w1g;
	Wed, 26 Nov 2025 09:45:13 +1100 (AEDT)
Date: Wed, 26 Nov 2025 09:45:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Drew Fustini
 <dfustini@oss.tenstorrent.com>, Himanshu Chauhan
 <hchauhan@ventanamicro.com>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Paul
 Walmsley <pjw@kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the risc-v tree with the arm-soc tree
Message-ID: <20251126094511.07bdf834@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.XwE.T2DMYxV6T2GESnyxjg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.XwE.T2DMYxV6T2GESnyxjg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  MAINTAINERS

between commit:

  4de28f1edcfb ("dt-bindings: riscv: Add Tenstorrent Blackhole compatible")

from the arm-soc tree and commits:

  e0ce62cfe3a9 ("drivers: firmware: add riscv SSE support")
  832fd6c2e55c ("MAINTAINERS: refer to intended files in RISC-V SSE DRIVER")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index aacd4a754dab,6fa1048c248a..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -22247,15 -22195,14 +22254,23 @@@ F:	arch/riscv/boot/dts/spacemit
  N:	spacemit
  K:	spacemit
 =20
+ RISC-V SSE DRIVER
+ M:	Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
+ R:	Himanshu Chauhan <himanshu@thechauhan.dev>
+ L:	linux-riscv@lists.infradead.org
+ S:	Maintained
+ F:	drivers/firmware/riscv/riscv_sbi_sse.c
+ F:	include/linux/riscv_sbi_sse.h
+=20
 +RISC-V TENSTORRENT SoC SUPPORT
 +M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 +M:	Joel Stanley <jms@oss.tenstorrent.com>
 +L:	linux-riscv@lists.infradead.org
 +S:	Maintained
 +T:	git https://github.com/tenstorrent/linux.git
 +F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 +F:	arch/riscv/boot/dts/tenstorrent/
 +
  RISC-V THEAD SoC SUPPORT
  M:	Drew Fustini <fustini@kernel.org>
  M:	Guo Ren <guoren@kernel.org>

--Sig_/.XwE.T2DMYxV6T2GESnyxjg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkmMXcACgkQAVBC80lX
0GzpGQgAhK/qILso2Esrem1e40pmdu5h8IUjXCSlwm9rK5r73iC7GVdk1g5LPZBR
NBRKPeF/eLkMGEIP/mb2pqa0ibSs/ST+41cLJl5OA7FMgWkBPLBfq+lXRKrArsft
t8QcF1zSQkhN0tRJ5IkWFpcac/i05mw33nQx8u60ee6gK6Wc2MyqxiG5icw47lfH
DLy5kNfs28CcQDdtm1xTtvp3AZfXVHgYaESvA4T0bC7niKSiqKMaKrDO3PH3N/G1
He6nu3KV63skp2uHbNnqmjhkMfOLKWEvNseCix9tZO90jjV2PLZFAsLVRDIQxrwa
wdXTxX/IQ7hs0UUiqnUAJFDppfvSiA==
=+TU5
-----END PGP SIGNATURE-----

--Sig_/.XwE.T2DMYxV6T2GESnyxjg--

