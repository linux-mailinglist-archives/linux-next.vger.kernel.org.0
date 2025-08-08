Return-Path: <linux-next+bounces-7871-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B0B1DFF7
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 02:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8320F726059
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 00:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72917DDAD;
	Fri,  8 Aug 2025 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OiFOhO6t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC79D20E6;
	Fri,  8 Aug 2025 00:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754613400; cv=none; b=uZ1gv0DvCzvftCm3Iin2msQ2q7QUvHTOZKOtIvcMJ6fn+oFz/aPqTnS7TpawPRYcywVhxelfiOCCvKVIgT8hFeNxH2Vb5lfQWUtGFR4tyn3pdICG/pU41QV3x6WO2sbQx23ADnRuxZF8viKQtTZZtizK70EE7Q2TFY6eLoBaMYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754613400; c=relaxed/simple;
	bh=EGePS9JGcg7idFVyEz+0PCZSpTmlbrDjpLn+UMJIt10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t+C4fQCNRx5ekTRu+HuVqmkLdImafqyp4p0AQ/RrC7KvKPqgVIw3+LCZ+vFBx4GBZmYgxoMtPY62dgbzOIvpxG6fNJN5DYKFYnt6VlnlTq92QQvWEl2knsOAw+RCxlmkqHKY4gNUXX+XM3pH1J5Q7/qr5kJNZBc8UyJ4SMVX4YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OiFOhO6t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754613395;
	bh=dWEsrAQt6ieME3mdr/7k8jbPePRkGgqXjxMEQZUGcVw=;
	h=Date:From:To:Cc:Subject:From;
	b=OiFOhO6t10XYvR54hTbvjeimkvCD/AKSxSEaMRXoI9xMTwWVdZ31YtYNW5KrdXJUI
	 dAJIcJdesgvxcVmZIZFD9LivdVNVJ6ShVkMnoGS91MKIEup6zZBjrpO24mPmz4clJS
	 9VCMzxzha5tmE9I2HJDZsCAxg7MgXQpzavAwBPHwRvhPO78re4SKe5Z1OvX35ltNAg
	 xmIbku8VZj8ulHVtRHho7AHnUAVKzK5Ufb2OQqEjxs3Rl269JKcK2hYLZBU0UDI9ey
	 aWL2F6YKRduNjWfhOgoi/m4XcvDuFBpjSWT6mB6Ih84Qr9VBUglZmku+hNgfHPqF22
	 ySXeurFJ0K/Lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bylTG69d8z4wd0;
	Fri,  8 Aug 2025 10:36:34 +1000 (AEST)
Date: Fri, 8 Aug 2025 10:36:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Arnd Bergmann <arnd@arndb.de>,
 Gary Yang <gary.yang@cixtech.com>, Guomin Chen <Guomin.Chen@cixtech.com>,
 Lihua Liu <Lihua.Liu@cixtech.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Peter Chen <peter.chen@cixtech.com>, Rahul
 Pathak <rpathak@ventanamicro.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20250808103634.6679cdcd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8smt1qNLNVfKG2T+Rd7sKM0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8smt1qNLNVfKG2T+Rd7sKM0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got conflicts in:

  drivers/mailbox/Kconfig
  drivers/mailbox/Makefile

between commit:

  fe2aa2361ddb ("mailbox: add CIX mailbox driver")

from Linus' tree and commit:

  81db83e750ca ("mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox=
 driver")

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

diff --cc drivers/mailbox/Kconfig
index 4fef4797b110,eb5e0384fec6..000000000000
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@@ -340,14 -340,15 +340,25 @@@ config THEAD_TH1520_MBO
  	  kernel is running, and E902 core used for power management among other
  	  things.
 =20
 +config CIX_MBOX
 +        tristate "CIX Mailbox"
 +        depends on ARCH_CIX || COMPILE_TEST
 +        depends on OF
 +        help
 +          Mailbox implementation for CIX IPC system. The controller suppo=
rts
 +          11 mailbox channels with different operating mode and every cha=
nnel
 +          is unidirectional. Say Y here if you want to use the CIX Mailbox
 +          support.
 +
+ config RISCV_SBI_MPXY_MBOX
+ 	tristate "RISC-V SBI Message Proxy (MPXY) Mailbox"
+ 	depends on RISCV_SBI
+ 	default RISCV
+ 	help
+ 	  Mailbox driver implementation for RISC-V SBI Message Proxy (MPXY)
+ 	  extension. This mailbox driver is used to send messages to the
+ 	  remote processor through the SBI implementation (M-mode firmware
+ 	  or HS-mode hypervisor). Say Y here if you want to have this support.
+ 	  If unsure say N.
+=20
  endif
diff --cc drivers/mailbox/Makefile
index 786a46587ba1,46689c1277f8..000000000000
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@@ -73,4 -73,4 +73,6 @@@ obj-$(CONFIG_QCOM_IPCC)		+=3D qcom-ipcc.
 =20
  obj-$(CONFIG_THEAD_TH1520_MBOX)	+=3D mailbox-th1520.o
 =20
 +obj-$(CONFIG_CIX_MBOX)	+=3D cix-mailbox.o
++
+ obj-$(CONFIG_RISCV_SBI_MPXY_MBOX)	+=3D riscv-sbi-mpxy-mbox.o

--Sig_/8smt1qNLNVfKG2T+Rd7sKM0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiVRpIACgkQAVBC80lX
0GzJ6gf+J5gnb9GdX6RvzrHfFMlrGQNOz88efO8KvLZkVFZXLYWYQ9NKZ+/DOGUc
rVXG/d9ched1mQYdy3mgRGanPCqxhoCiL/bTr8WLHbZofWiKVo0jamKRKpn5riFQ
8e42/TFdKFl0H+UFRRRncWD2bGD2WZJK7GPyT0hu4RsDlnN7qtNVMmBCRmAsWGA7
9rLUwCanieC+xnaThkm+Hh6uRPiacSeltRBiOfyRMIgRLaSVZRBDCal5r2Mw4O5Q
4LBZ7QcoJN8rcnRHoIx0xizYf6phWGBUdqfU3szjs1KUnicoLW5eshJHk8aHlPAv
VIT+veGCvyrTKzZ/Sqk8KtddcJ6gag==
=ioqB
-----END PGP SIGNATURE-----

--Sig_/8smt1qNLNVfKG2T+Rd7sKM0--

