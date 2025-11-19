Return-Path: <linux-next+bounces-9091-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D58C71745
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6918F4E01D6
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 23:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941DE2F7469;
	Wed, 19 Nov 2025 23:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WGACwg1m"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6F82F6939;
	Wed, 19 Nov 2025 23:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763595463; cv=none; b=QYQ7RvMZSyeS7u2HPyAFkjieHqWzGf77lM7qie9/XDoeVUEWErL0olEw7zlNcbkbrqMlo72bsi7hU+JXJv/ZEu9okNIN679hn6smXIaAph8ndAN5usAzJMiN9az1DlhY9E5WSbyoYqU63feBNLHPSHT/9N5xlRx0kfXjbPix4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763595463; c=relaxed/simple;
	bh=PPUMvmeyRbyatz72wFCdb+wsBeEEr8NRsUnqay2cEGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DN2yHfhqE8KrXplu/kJzwv2mA8QYth+kIhfrO7HjXlPNWfixHewVOanIg6Tqbt8reLjr89wWungi6UeupXgK6MmQ+lLlg/jnRocU5KLezfLf2p21Z7fkQqhPPq08z8+/UT9VkniDgm6MQWOZj6IbVSCiwRMrEVE7w2skjd/+BUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WGACwg1m; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763595458;
	bh=WHRPOG8mWSclxP4E4Ocy0wDwRXSzOye2DoymlK/dEVY=;
	h=Date:From:To:Cc:Subject:From;
	b=WGACwg1mGyeR9WVSD6ADm5o9ZIq3uqT6WJvs1OaLrVBihu1EKZCR1D/VhgU0ZAKeP
	 5o2osZqjVRs4jTo+p0DbeiGbViaV2iId68oU/Mi3FjYuLMldzSAw7utGWA+/yPwf8l
	 +Ue5lu9e6hHaU+MIHjD0Mu4TI0vFsw4RNu4hY3DKUmKLq2oYNmtIh3rf9wkhnB2TKk
	 aapfS1GVt2KZL+kPhM73K7w2/Ja1f82vBL5O0rRkZgfCpYpf5pFFQNHCa6JaCmTVfC
	 YbeZwDWb6h1wyb1FxRJBcogsujtvPnjrLSir4TKxcaascYABnk5Sple6oS7HNG97bu
	 PT2v6jU/SgWdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBdFF6W9Pz4w9Z;
	Thu, 20 Nov 2025 10:37:37 +1100 (AEDT)
Date: Thu, 20 Nov 2025 10:37:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Conor Dooley <Conor.Dooley@microchip.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan
 <hchauhan@ventanamicro.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>
Subject: linux-next: manual merge of the riscv-soc tree with the risc-v tree
Message-ID: <20251120103737.5349662e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TmPX1swXnCBICULKvoDG7pH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TmPX1swXnCBICULKvoDG7pH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the riscv-soc tree got a conflict in:

  MAINTAINERS

between commit:

  5ffe60d26107 ("drivers: firmware: add riscv SSE support")

from the risc-v tree and commits:

  66c6ceb41ed3 ("MAINTAINERS: rename Microchip RISC-V entry")
  12cbb612fa1e ("MAINTAINERS: Setup support for Anlogic DR1V90 SoC tree")

from the riscv-soc tree.

Please keep the MAINTAINERS entries sorted ...

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
index 6e1aa69db0e1,867030aef2f5..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -22124,6 -22055,6 +22124,14 @@@ F:	Documentation/devicetree/bindings/ri
  F:	Documentation/devicetree/bindings/timer/andestech,plmt0.yaml
  F:	arch/riscv/boot/dts/andes/
 =20
++RISC-V ANLOGIC SoC SUPPORT
++M:	Conor Dooley <conor@kernel.org>
++T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
++L:	linux-riscv@lists.infradead.org
++S:	Odd Fixes
++F:	Documentation/devicetree/bindings/riscv/anlogic.yaml
++F:	arch/riscv/boot/dts/anlogic/
++
  RISC-V ARCHITECTURE
  M:	Paul Walmsley <pjw@kernel.org>
  M:	Palmer Dabbelt <palmer@dabbelt.com>
@@@ -22139,6 -22070,6 +22147,13 @@@ F:	arch/riscv
  N:	riscv
  K:	riscv
 =20
++RISC-V FIRMWARE DRIVERS
++M:	Conor Dooley <conor@kernel.org>
++L:	linux-riscv@lists.infradead.org
++S:	Maintained
++T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
++F:	drivers/firmware/riscv/*
++
  RISC-V IOMMU
  M:	Tomasz Jeznach <tjeznach@rivosinc.com>
  L:	iommu@lists.linux.dev
@@@ -22148,14 -22079,15 +22163,7 @@@ T:	git git://git.kernel.org/pub/scm/lin
  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
  F:	drivers/iommu/riscv/
 =20
- RISC-V FIRMWARE DRIVERS
 -RISC-V ANLOGIC SoC SUPPORT
--M:	Conor Dooley <conor@kernel.org>
 -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
--L:	linux-riscv@lists.infradead.org
- S:	Maintained
- T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
- F:	drivers/firmware/riscv/*
 -S:	Odd Fixes
 -F:	Documentation/devicetree/bindings/riscv/anlogic.yaml
 -F:	arch/riscv/boot/dts/anlogic/
--
- RISC-V MICROCHIP FPGA SUPPORT
+ RISC-V MICROCHIP SUPPORT
  M:	Conor Dooley <conor.dooley@microchip.com>
  M:	Daire McNamara <daire.mcnamara@microchip.com>
  L:	linux-riscv@lists.infradead.org

--Sig_/TmPX1swXnCBICULKvoDG7pH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkeVMEACgkQAVBC80lX
0GzG/AgAoTMF1MwvKw6NmyjTd5oIXUoBNlsO3ddVFm2Gx3NvP0inD4pb/WXYhHI5
cm4JyobgV/02ecpt3WywuvZUs6lpWcEOEFY1kRJScUEX6xev2HV0iDnOEOJPWrFo
zZZOV04PXTBcqmhGUachson2sHodMoI0cJn9Cyl4AlK9u8pSyg1KcdU9xYb9pgEn
jrEPdAi9dgqw58DogML2nvsklHznbX+UBcPvcXHz7hNBpultcprRiBitjo0BLJKf
JiyDrtVs2YGhDEj6Lf3BI2bt4fc1neBwb5wvkTBHe34Pwj3UndQIObktpeF5zZhQ
8sa7z+z1QEi1jMV/6Lv5VulL7yxImw==
=lEsn
-----END PGP SIGNATURE-----

--Sig_/TmPX1swXnCBICULKvoDG7pH--

