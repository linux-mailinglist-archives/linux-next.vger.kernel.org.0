Return-Path: <linux-next+bounces-2331-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9958C6F3C
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 01:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26A7AB22AE3
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 23:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA8753FB2C;
	Wed, 15 May 2024 23:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M6EFXWVs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795415B0E2;
	Wed, 15 May 2024 23:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816210; cv=none; b=VPAZd2yvE2r+1GibNK05Nv5SYW4dvbbqqMJB2XRho5pXcxziCgkzaOZyjOI0hwDGZVh14flk52RSm7gvwJMqG6+183j854ldHIKIGhsSIa/Zh161tMiBKzG5y7hPyqPfg3fkppqwlg9MsfspMs2EIUYmYCSMxQFtAXUA1IMe27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816210; c=relaxed/simple;
	bh=h/fELJAsDg748mkEEC6ctQgaxGp68FRdRSGLSUo9hEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RPu5rzR0MayFyqLherFPlBg5wRilEUFV9WhEdnmZEJ800rSTow1ztO8PSS61Vm4+VHPSwPKaE0XQ+G/BkdOnHxvmZ8v1AC7P1tN2F/Z93MfSYwfEzoswj3jAOCne3qpKIkcqG4icpzMEByjqKWfn57QZnQR56J46MekmtTPZpV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M6EFXWVs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715816204;
	bh=zxamCbQZXQn0CBVHpsgeP7uFu78F+PTSpmPwxa+Bibo=;
	h=Date:From:To:Cc:Subject:From;
	b=M6EFXWVsGQLVfWrhP2ExvblMzaeS/jLjNXSHcRPxbCKObGxY6L6qThezBkHAAqwqD
	 /MIp3UMFPL2bJPG12OKPucEN52nMlzjqNpSt9lvRMQ5qMujZGJ4wg23fZqx2Lfius5
	 zzEV/UREQEx0Gh5sReDdpxyqefJ8rcf+kgKi2RsPZdz281tqdNyAZtl4WvwMZvTSiU
	 kUgng1cFnom9H3LQaYZBlXRfj7PXMX+LJCP/dDxnRt7rqhgZf9EDLsMRcFP7zC5CSR
	 LCzS6b1nd3k2DfbUcmEkfuC6zmcHJ+AktyvIZAQ2mwXPNS5d5SLtU7kChIujb2p4bH
	 X74/Xj1gj3Q5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfqPP71Fgz4x1Y;
	Thu, 16 May 2024 09:36:41 +1000 (AEST)
Date: Thu, 16 May 2024 09:36:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20240516093641.15695f18@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zBiFYrER7aIM+9EzT=z+MMJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zBiFYrER7aIM+9EzT=z+MMJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Makefile

between commit:

  ef10bdf9c3e6 ("riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210=
")

from Linus' tree and commits:

  3b938e231b66 ("riscv: merge two if-blocks for KBUILD_IMAGE")
  c1f59d035966 ("riscv: make image compression configurable")

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

diff --cc arch/riscv/Makefile
index 0577d34fb1a7,321c057e2bdc..000000000000
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@@ -132,12 -136,20 +139,20 @@@ endi
  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
 =20
  # Default target when executing plain make
- boot		:=3D arch/riscv/boot
- ifeq ($(CONFIG_XIP_KERNEL),y)
- KBUILD_IMAGE :=3D $(boot)/xipImage
- else
- KBUILD_IMAGE	:=3D $(boot)/Image.gz
+ boot					:=3D arch/riscv/boot
+ boot-image-y				:=3D Image
+ boot-image-$(CONFIG_KERNEL_BZIP2)	:=3D Image.bz2
+ boot-image-$(CONFIG_KERNEL_GZIP)	:=3D Image.gz
+ boot-image-$(CONFIG_KERNEL_LZ4)		:=3D Image.lz4
+ boot-image-$(CONFIG_KERNEL_LZMA)	:=3D Image.lzma
+ boot-image-$(CONFIG_KERNEL_LZO)		:=3D Image.lzo
+ boot-image-$(CONFIG_KERNEL_ZSTD)	:=3D Image.zst
+ ifdef CONFIG_RISCV_M_MODE
 -boot-image-$(CONFIG_ARCH_CANAAN)	:=3D loader.bin
++boot-image-$(CONFIG_ARCH_CANAAN_K210)	:=3D loader.bin
  endif
+ boot-image-$(CONFIG_EFI_ZBOOT)		:=3D vmlinuz.efi
+ boot-image-$(CONFIG_XIP_KERNEL)		:=3D xipImage
+ KBUILD_IMAGE				:=3D $(boot)/$(boot-image-y)
 =20
  libs-y +=3D arch/riscv/lib/
  libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/lib.a
@@@ -154,20 -166,9 +169,9 @@@ endi
  endif
 =20
  vdso-install-y			+=3D arch/riscv/kernel/vdso/vdso.so.dbg
 -vdso-install-$(CONFIG_COMPAT)	+=3D arch/riscv/kernel/compat_vdso/compat_v=
dso.so.dbg:../compat_vdso/compat_vdso.so
 +vdso-install-$(CONFIG_COMPAT)	+=3D arch/riscv/kernel/compat_vdso/compat_v=
dso.so.dbg
 =20
- ifneq ($(CONFIG_XIP_KERNEL),y)
- ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
- KBUILD_IMAGE :=3D $(boot)/loader.bin
- else
- ifeq ($(CONFIG_EFI_ZBOOT),)
- KBUILD_IMAGE :=3D $(boot)/Image.gz
- else
- KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
- endif
- endif
- endif
- BOOT_TARGETS :=3D Image Image.gz loader loader.bin xipImage vmlinuz.efi
+ BOOT_TARGETS :=3D Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo=
 Image.zst loader loader.bin xipImage vmlinuz.efi
 =20
  all:	$(notdir $(KBUILD_IMAGE))
 =20

--Sig_/zBiFYrER7aIM+9EzT=z+MMJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFRwkACgkQAVBC80lX
0Gym4Qf/U1wWiCaSM9jRRxodXRPieDLW/xtdKEph4feEq5H+wV6czgoMRDNQFLlH
0Xai1JA2puWR+naZVOcPJ8eB/r07Tn2M3DgiJk42ItkzAQBdTci036cbE/T+/sKV
rHm5nDFYGQ1qo4Fg1L7sqHLo7nIh4dNGlsBW9PT6w/6SNMxLcY/jsc29CdYXhpRx
UxhwuyikTmuAIBezIxLPQiEhTP8VI3lvgJ6MCcv3IjPIX2Sozk/6SjXCvXBpmz2b
pS/FqTz5jQ6DR/s/IVWDK0Z0oxaCpU+HaTHKyi6WwBeS5pY4TpZ/UqEjnGigkSs4
X3EL0kQveCwS2hlcR23fWI+3LL3FcA==
=D5or
-----END PGP SIGNATURE-----

--Sig_/zBiFYrER7aIM+9EzT=z+MMJ--

