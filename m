Return-Path: <linux-next+bounces-2384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F458CC97E
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 01:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D30C281FAF
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 23:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF668061D;
	Wed, 22 May 2024 23:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QSQY5HT9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471742C694;
	Wed, 22 May 2024 23:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716419863; cv=none; b=kFfVjCn1d/vmbnfjtt2uyKN8ZyWKsq5qEtLZZe5PwgVHRRAzfEn/VOdK3+oHfKiL+EoEzGWTIBbaf3BopBorefpa9LVkBHt6u3/SSjtdRZJrRE2FKd8agGhYVsikmOT3tIT4bgEoZCTH7Ya/y6v32/2e1fsjFEc7Bwwe6SPj2Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716419863; c=relaxed/simple;
	bh=3MpT3UXX+mFPE9zu2Tpim4dfMERLTKklCZNZl44SPrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gFhy8pWltXbATjuUiM8VXtIs1NI6AptCIdwA3tJT3FGKRzy5jiBYj/QY3LRsoYLcmIjol9yOkg9jMhMJLkfEoQf90rwgtUzwJ/SqgDxQC3ZHh46P8HNAONE/OkdI6kI4dsmKnjXEDpbJkYJfz09tjL9wHRh6D4rEGvjaTgI6Yqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QSQY5HT9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716419855;
	bh=Yaj3dhhHQNZb9D8Kq2iLfCq10gcrXeX4nfCLf2gW15I=;
	h=Date:From:To:Cc:Subject:From;
	b=QSQY5HT9w9Sw1L4uwWkAGWTqpob5MM+Pob5lr7CWAgtLnvNVZbQrn1G263lbL5raY
	 brwZdPFSboBL0F9iV5Yec1u0yHqmV9KP9zJzhfJfCbYJrIL4CozVwvKEX4i12jjAZ3
	 EIGmYLvO4MuodIdlSxxeZx13ZtO1vrwpi9XCSJXf2ysIosXrMyFG85ZN93W1VkdF52
	 PR3HlLOWLE9qX8dGZ2QmLYOhxbhnXwmPA3tjhLCn+kAWZiMpgQmrWr+PTWeps4HF/U
	 f3oAsZSLM5XdkgFkVhNa6H8TzfgZNlRbYKdtfHDhjtU+jh9q2mjDQsWMuB+dM94WB7
	 2UmycJgGo7fdQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vl6f311ZBz4wbr;
	Thu, 23 May 2024 09:17:31 +1000 (AEST)
Date: Thu, 23 May 2024 09:17:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Yangyu
 Chen <cyy@cyyself.name>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20240523091729.71a9017f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0tjN9kR=MCLUdLpdqnlQ4N2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0tjN9kR=MCLUdLpdqnlQ4N2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/Makefile

between commit:

  ef10bdf9c3e6 ("riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210=
")

from Linus' tree and commit:

  d944d47b77cd ("riscv: make image compression configurable")

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
index ec47787acd89,321c057e2bdc..000000000000
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@@ -139,20 -136,20 +139,20 @@@ endi
  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
 =20
  # Default target when executing plain make
- boot		:=3D arch/riscv/boot
- ifeq ($(CONFIG_XIP_KERNEL),y)
- KBUILD_IMAGE :=3D $(boot)/xipImage
- else
- ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
- KBUILD_IMAGE :=3D $(boot)/loader.bin
- else
- ifeq ($(CONFIG_EFI_ZBOOT),)
- KBUILD_IMAGE	:=3D $(boot)/Image.gz
- else
- KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
- endif
- endif
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
++boot-image-$(CONFIG_SOC_CANAAN_K210)	:=3D loader.bin
  endif
+ boot-image-$(CONFIG_EFI_ZBOOT)		:=3D vmlinuz.efi
+ boot-image-$(CONFIG_XIP_KERNEL)		:=3D xipImage
+ KBUILD_IMAGE				:=3D $(boot)/$(boot-image-y)
 =20
  libs-y +=3D arch/riscv/lib/
  libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmware/efi/libstub/lib.a
@@@ -169,9 -166,9 +169,9 @@@ endi
  endif
 =20
  vdso-install-y			+=3D arch/riscv/kernel/vdso/vdso.so.dbg
 -vdso-install-$(CONFIG_COMPAT)	+=3D arch/riscv/kernel/compat_vdso/compat_v=
dso.so.dbg:../compat_vdso/compat_vdso.so
 +vdso-install-$(CONFIG_COMPAT)	+=3D arch/riscv/kernel/compat_vdso/compat_v=
dso.so.dbg
 =20
- BOOT_TARGETS :=3D Image Image.gz loader loader.bin xipImage vmlinuz.efi
+ BOOT_TARGETS :=3D Image Image.gz Image.bz2 Image.lz4 Image.lzma Image.lzo=
 Image.zst loader loader.bin xipImage vmlinuz.efi
 =20
  all:	$(notdir $(KBUILD_IMAGE))
 =20

--Sig_/0tjN9kR=MCLUdLpdqnlQ4N2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZOfQkACgkQAVBC80lX
0GwCzQf9Es9AcRgggXyRzeGJM7rT1zFVtdhN7Eh9LJTuxBeHJhC1/By1v70UEbbn
NlW84ad4HpimEu3HW0iSR4IyDZntJwhCEXfoKNxM8r6SqsH94BkChU1hBogeTM3o
tQggKmLHcUygV5Z+3ZB2kX45uiHk/h4k9pVyXCtWq4ao5R4ScgDS1f4jEzfLDQl6
mPJI9v0EMmya03dA8HLn1VeCZdfXDqQgHGmG+ChqIOe6kqhTFL4P+L89xPZL4kRf
qeSN44y5sZiyVQbVgj76rXjzwdFPTb1re1e4zJaUQ4H3HdJdB/ogWTrX7gpLRGeq
7q0qNoCQe322H96UKMl0bEgOtx4MMA==
=JUl7
-----END PGP SIGNATURE-----

--Sig_/0tjN9kR=MCLUdLpdqnlQ4N2--

