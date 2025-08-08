Return-Path: <linux-next+bounces-7872-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66597B1E038
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 03:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77CED563B58
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 01:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25EF7DA6A;
	Fri,  8 Aug 2025 01:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f8SaSbUi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE941125D6;
	Fri,  8 Aug 2025 01:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754617429; cv=none; b=ZNNpdT9phHIUG3TDeiJEpSmVik0LsUu+bRqMUljvaNEdl3T0mfIdZ9dpxR/2c47BySOaIZnAOJ0beSr4qrpBgdXNXCjHGmcGiQkikPZw5J0wKEUOb7JFxzsegTVe/jLn1TWhg9jzCvr7klPYoE/TsF/92wa0FMNngmDHPbGnKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754617429; c=relaxed/simple;
	bh=YlpfhaSPeXJORGKJ3BsKqRFKyzQVRrvpIesvJ5+wgM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZMOwaMtRpFyV+x8EZpeet/bM1uU6Adn8T0CVGQfwCgJIqcLysL6RoIPITsuUwoeTDOIYbOVbKdEdcn9cFxNpTQ/Wkj7H2GlIT0sIHfJfAghaUwKLNV/iZqDB/sLwzYKxLp0XUfajey/CXPJZAchYqYVnTUCSXwOBLO6xTe74j5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f8SaSbUi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754617414;
	bh=tNosh8i/c1KjXiiYC5cKA3n7elWrTGlat3J5oyYoucs=;
	h=Date:From:To:Cc:Subject:From;
	b=f8SaSbUi87yjyWOIZVvplPSR0posVopJzil59ALeyquzBzxuhULTyEASQf3yjZmem
	 ETnCiR7NmsH4cmwNg6Cj2fjOrlZyOZ48NoDFzzOxqrIobXkurubtc78HcyBs0iVaTz
	 4a//ZJQwOavHOSFiaVAwlLDfyWhM1Sw7O6Euxhhmk5+MWE33QBJXCaK+3v/67GvXsV
	 IsJrCTYhGYY2HYlh1XFOKsoiiLPQ6ZjyGOKUW+1MWTCg/SL00+M0KWOWXpuXMV/ppo
	 WV6cePkEYaQRYbXXyeGOnDUW9Li5oDRzDmsH5fqq3bqiTRtV3DbLHGOy8rVgNnQvgU
	 kZFwO+FlIPBUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bymyY4qHRz4xWD;
	Fri,  8 Aug 2025 11:43:33 +1000 (AEST)
Date: Fri, 8 Aug 2025 11:43:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Justin Chen
 <justin.chen@broadcom.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>
Subject: linux-next: manual merge of the mailbox tree with the risc-v tree
Message-ID: <20250808114332.63ec1528@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fLvmC1lAeB7FkCqiIIcUQdo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fLvmC1lAeB7FkCqiIIcUQdo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mailbox tree got conflicts in:

  drivers/mailbox/Kconfig
  drivers/mailbox/Makefile

between commit:

  81db83e750ca ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox=
 driver")

from the risc-v tree and commit:

  52436007b862 ("mailbox: Add support for bcm74110")

from the mailbox tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/mailbox/Kconfig
index aa2c868256d7,02432d4a5ccd..000000000000
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@@ -350,15 -359,14 +359,25 @@@ config CIX_MBO
            is unidirectional. Say Y here if you want to use the CIX Mailbox
            support.
 =20
 +config RISCV_SBI_MPXY_MBOX
 +	tristate "RISC-V SBI Message Proxy (MPXY) Mailbox"
 +	depends on RISCV_SBI
 +	default RISCV
 +	help
 +	  Mailbox driver implementation for RISC-V SBI Message Proxy (MPXY)
 +	  extension. This mailbox driver is used to send messages to the
 +	  remote processor through the SBI implementation (M-mode firmware
 +	  or HS-mode hypervisor). Say Y here if you want to have this support.
 +	  If unsure say N.
 +
+ config BCM74110_MAILBOX
+ 	tristate "Brcmstb BCM74110 Mailbox"
+ 	depends on ARCH_BRCMSTB || COMPILE_TEST
+ 	default ARCH_BRCMSTB
+ 	help
+ 	  Broadcom STB mailbox driver present starting with brcmstb bcm74110
+ 	  SoCs. The mailbox is a communication channel between the host
+ 	  processor and coprocessor that handles various power management task
+ 	  and more.
+=20
  endif
diff --cc drivers/mailbox/Makefile
index 6659499a50db,98a68f838486..000000000000
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@@ -75,4 -77,4 +77,6 @@@ obj-$(CONFIG_THEAD_TH1520_MBOX)	+=3D mail
 =20
  obj-$(CONFIG_CIX_MBOX)	+=3D cix-mailbox.o
 =20
 +obj-$(CONFIG_RISCV_SBI_MPXY_MBOX)	+=3D riscv-sbi-mpxy-mbox.o
++
+ obj-$(CONFIG_BCM74110_MAILBOX)	+=3D bcm74110-mailbox.o

--Sig_/fLvmC1lAeB7FkCqiIIcUQdo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiVVkQACgkQAVBC80lX
0GwmewgAgE8wMW7HYFIO+FotWmVREPjdakRkm3eVy6gcnBQJiEAFCeoPk1c/NHgo
j5P6k6yk3Z1KIbRgBJif3wlotrdEt08UBTRMh8uMg2xXx9ndEY7uhs6b5ThG/2DE
yYHHKwvf5+HQ8TcDDzvA8QqeGD1bfwL+/fI3IoBAoZe8SnB+P5heEfo6gkxxE2n1
HFQnTWygE7rze9sLdfSorC5L2IaSw7sL9rrsZadEJ43VkEiKCEM5MzXVM6DdPFx4
rsmC/xOh2dkgufs4ibijpoAe0ofSD4UN7pym/Sqb8Ebm81VRyS7bQJpQHMGGC8nV
AtCVgwzXzRgk2DPrRVIPQwz5gzH/hg==
=6gs9
-----END PGP SIGNATURE-----

--Sig_/fLvmC1lAeB7FkCqiIIcUQdo--

