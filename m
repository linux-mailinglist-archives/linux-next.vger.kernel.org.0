Return-Path: <linux-next+bounces-9090-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287BC71712
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C52BC3445EE
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 23:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00036302741;
	Wed, 19 Nov 2025 23:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BEBx37vY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C494728C5B1;
	Wed, 19 Nov 2025 23:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763594971; cv=none; b=f0/q9zQUc4US19rTrXkyeZyfZJNnnwwIK9hCe7v0eQLfX/hJiH9tflvhPYXWhMx7zg7cyFNcLiA2cpSm9sdrAZQEwhB3zD9rao9TdJZSlqLoS1wVEYzKTJoqtL9bE4vJ/a+h6ce5giUvqin4cvhc/tqE2CWQiS4CKIT4JLZU3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763594971; c=relaxed/simple;
	bh=Q26kMBl8DMSmjakbRe7heqYpud8kbDok11WXnyf1K6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fTNbB/y0Gw+86T+oq5BiMatiQKIBMZIMXzmwCnt2cqFZZ3TzlJn4K89lZE4RfuB3JX/Gqd4o76yQ60SLUxGNLlTXLRZ0autkY6G5lD3vetTMtkCd3tUCvPoyNeQREFxOpL42RarHo7QtIqkjEyyDYzDK/TCzBFc9FZfITXcwVSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BEBx37vY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763594967;
	bh=+Nq0v6u21LoSwB10BMaL1lSIY4AyCafM7+g+42+UlFA=;
	h=Date:From:To:Cc:Subject:From;
	b=BEBx37vYos0cwjlME6Rf/GTZ72DbWWN2PbTTHCnTMQF7GR9XREG/IldX6lL1ESnv9
	 DhrUry8fkGX9jqArmqaQNOjlA+P0PEfSw8fxPhbtQ8gN6TJ5S5Ww9xFRhFeZCezgRN
	 OHrtFXuqun7v1qge/EW1h67xOQloP9mKkU7Dmif31GcyW8JrefbjlBlPBAMw9OUW6q
	 TGgIv3ls11UlQ+FcoaNByT5VWAxH3rivmvN9MsQPLSDz9jT67bi4gIPU/ddp7LxliC
	 Vu2/ulSC+Qg8Clb2uxWFNDOYkL6/9ibyeSdej3FekWcwm+Bb7VjFeNyc/xTBzg0XxX
	 Bu5tr9trdwtiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBd3p3k8Hz4w9Z;
	Thu, 20 Nov 2025 10:29:26 +1100 (AEDT)
Date: Thu, 20 Nov 2025 10:29:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
 Drew Fustini <fustini@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Drew Fustini
 <dfustini@oss.tenstorrent.com>, Himanshu Chauhan
 <hchauhan@ventanamicro.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the risc-v tree with the tenstorrent-dt
 tree
Message-ID: <20251120102925.57ab2fe7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OMpK2FDEr/6WtGC_m+yWhcD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OMpK2FDEr/6WtGC_m+yWhcD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  MAINTAINERS

between commits:

  4de28f1edcfb ("dt-bindings: riscv: Add Tenstorrent Blackhole compatible")
  8e88602e99a7 ("riscv: dts: Add Tenstorrent Blackhole SoC PCIe cards")

from the tenstorrent-dt tree and commit:

  5ffe60d26107 ("drivers: firmware: add riscv SSE support")

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
index 079c43e56dc6,0e3e9d8ab5b4..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -22227,15 -22195,14 +22234,23 @@@ F:	arch/riscv/boot/dts/spacemit
  N:	spacemit
  K:	spacemit
 =20
+ RISC-V SSE DRIVER
+ M:	Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
+ R:	Himanshu Chauhan <himanshu@thechauhan.dev>
+ L:	linux-riscv@lists.infradead.org
+ S:	Maintained
+ F:	drivers/firmware/riscv/riscv_sse.c
+ F:	include/linux/riscv_sse.h
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

--Sig_/OMpK2FDEr/6WtGC_m+yWhcD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkeUtYACgkQAVBC80lX
0Gw+yAgAo3RCWiCepk2sVa2lpU9CbFcV0YbVBOtcjmQboBBZe1rqz4D2QKZIurdj
XYWpuuCZVuNwTSB42qeq7wTftzUYWO4tvo3n0zUQ29yVkbaDh8E9FIg8ctNiFKfG
Q/4O1jQgXAm+w/HaUkvFbfc7ge2OJ5lqUaTzLYEME5/kzpZObbQQ+AmdJ7oVyfZz
g8EEjwJtaRWteNDKw1ND4JYONXasdkqSkZng2SCHMjiuL58Bn4A7z1ea9NUWKEem
yg900iKKD8SChTiKQtHBPc26dCwcmR0spMSvyXTXjpVzTMGaOEzke5b9/KgyNg63
Pp4b711jYEzXjGDHJ/jjdx4d3ZoNwA==
=xnUO
-----END PGP SIGNATURE-----

--Sig_/OMpK2FDEr/6WtGC_m+yWhcD--

