Return-Path: <linux-next+bounces-2332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8844B8C7044
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 04:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8C2D1F219C5
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 02:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1B1139F;
	Thu, 16 May 2024 02:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bXMjmNLJ"
X-Original-To: linux-next@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92407138C;
	Thu, 16 May 2024 02:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715826236; cv=none; b=nhEXxKb/4rTYot5qqpvgYQwH3ApXyNjwoMS2x7GvbD1YKmPiRJgtmzcT7jrKmUCS16Lm6fhKowsj84y1closSbnI4e7OQ2OF1jbtO/wkVvlONfQJ8Hfg+THPnC2eU/Da2XDNpbF8iFEiOgETZpPCS2GYZv4RnsMqUzBE32Wg5d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715826236; c=relaxed/simple;
	bh=tZTxUDrO6+scTAx+uDVEAq0hr1JWcYSzWeZKqIavQPI=;
	h=Message-ID:Content-Type:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:References:To; b=OsL38RhQ2ozmDUyL//oaOn65Swo9WKkaROYVhzqHIzvVtuyk0I/Dr5i/djhKNSxRzc+CQnBkTeTqQyyZy0poa1zxQ6xvAsyNEp53IzlLTHqya094QyHwUKRxmuX5dlyLvm44gxpJXsUjlsF4srnK6UEUZp+VbtQuyKWJECg4M4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=none smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bXMjmNLJ; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cyyself.name
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1715826224; bh=QEXXJYEnjAu8uLTDWuS5qNbiA6rlse2sFQ8Jwz9c1tA=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=bXMjmNLJpwBOebkF3ggdwMXRSKnYpreRb5grIj+7V2ZNshgJd0IB3W0lE85irBpxc
	 J6oiXlMNskePqXDLuDGb7+/g5Bj7VFD2wzlGmkKZ4L4CIYF6JmmHtuzWharOmCCl03
	 c9z9ybZaVaRgJpH5LenqMp/B8cIz577qs6Js0IqE=
Received: from smtpclient.apple ([2408:8207:18a0:162f:54a4:17b:b953:6b69])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 4583B20F; Thu, 16 May 2024 10:17:24 +0800
X-QQ-mid: xmsmtpt1715825844t5xrgpdjz
Message-ID: <tencent_15C2F112172FA62C64BB318B8F4330461B05@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku2W+S/puWSJz9BQT5mEIKHIB5ASNdlPNgS7D9cgZB9zvUABdDdg8
	 SiD/DNe4ZOMA2o+2fH2Jm0uJcnTg4v6BncUBixuS5hEQk6/R31+lWsMRioMYnYb9nVIEOU/GAk6p
	 Air1Ch/aB7QNbmwlIg44NC0NdXIKBYz10HRENpnohO7dCTTf5BhSoBzyvSumK4WnZVBoOrQNFc9V
	 n1xTxqYy3n60UDexk7gxJyZ8bFxfz8fDu4XBKSO/Lgv7wrFu90Oz325GBVW3JrvrKfbMBx9zXbwo
	 SzfYrMFDDJL6kSG4ut3gxZZR/AjdftBH5R/1ZUGJf4s/6KSaIur0pvF6kh8psuJj2nXSy8KB/lMk
	 vYGJ8QqsmZBRAb9WgxflQXfPytnn++M3S02G1tF5fn3KfVGuJLITrAQuApLM7qPJyMHeRPVJSLgR
	 6gxT+lmEdUzCjmIi7lQF/CZCP0ZzNafUCws/5JgcsccqSPHh/udT5977J5380BX3Jmfq0r1VDfo/
	 c8+ts1xcKTrRxHiapd6enc33f6gxYcAYTNb2St80ow2rcLFZdL44iBuIxQw50baA6Ughl+icR7F+
	 FzxEicD9KjnkSQSJLPoC6jdX5T0adhtAbQvOPnmZh77SxibASYYj/8ir7HCW2lUVryGYGb/ozG22
	 WU8GwrEWeZQJiEcsqmYDdKAxLK5/VgvDpSWVpIdC465RAW3seDAcDx4kaKBB/CQZUx1fT9QrvEc7
	 ejruEEg31ZtpNcwQkzXS02u30sinxJP0gdDSsr9yhsJ/S9RAvvRwtR9FcDAi4CEZGwCe6OUyi6no
	 TCvdGx1oTi0WSdOWdk34Mv0IOKDlvnrzZXdFrRQE3gNfM8X89Qq0IrunRV3QS0O6Qfw775aDbu2F
	 sVMUrN4xiagVP+MtHzzaJPNso8mwANKQAEm4BlCxS/Xqs+ciP9AEJGQTtsjlMpxkpeTOLgnC2wbS
	 PXHpe9bZUQiNFmPEx5+mh+aGaCbxOw4JhDdLXeTqBDjAc7YOe+vg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: linux-next: manual merge of the risc-v tree with Linus' tree
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240516093641.15695f18@canb.auug.org.au>
Date: Thu, 16 May 2024 10:17:14 +0800
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul@pwsan.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Transfer-Encoding: quoted-printable
X-OQ-MSGID: <05C255B1-9837-4B96-A2BE-3A2DCB959425@cyyself.name>
References: <20240516093641.15695f18@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On May 16, 2024, at 07:36, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Hi all,
>=20
> Today's linux-next merge of the risc-v tree got a conflict in:
>=20
>  arch/riscv/Makefile
>=20
> between commit:
>=20
>  ef10bdf9c3e6 ("riscv: Kconfig.socs: Split ARCH_CANAAN and =
SOC_CANAAN_K210")
>=20
> from Linus' tree and commits:
>=20
>  3b938e231b66 ("riscv: merge two if-blocks for KBUILD_IMAGE")
>  c1f59d035966 ("riscv: make image compression configurable")
>=20
> from the risc-v tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your =
tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any =
particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/riscv/Makefile
> index 0577d34fb1a7,321c057e2bdc..000000000000
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@@ -132,12 -136,20 +139,20 @@@ endi
>  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
>=20
>  # Default target when executing plain make
> - boot :=3D arch/riscv/boot
> - ifeq ($(CONFIG_XIP_KERNEL),y)
> - KBUILD_IMAGE :=3D $(boot)/xipImage
> - else
> - KBUILD_IMAGE :=3D $(boot)/Image.gz
> + boot :=3D arch/riscv/boot
> + boot-image-y :=3D Image
> + boot-image-$(CONFIG_KERNEL_BZIP2) :=3D Image.bz2
> + boot-image-$(CONFIG_KERNEL_GZIP) :=3D Image.gz
> + boot-image-$(CONFIG_KERNEL_LZ4) :=3D Image.lz4
> + boot-image-$(CONFIG_KERNEL_LZMA) :=3D Image.lzma
> + boot-image-$(CONFIG_KERNEL_LZO) :=3D Image.lzo
> + boot-image-$(CONFIG_KERNEL_ZSTD) :=3D Image.zst
> + ifdef CONFIG_RISCV_M_MODE
> -boot-image-$(CONFIG_ARCH_CANAAN) :=3D loader.bin
> ++boot-image-$(CONFIG_ARCH_CANAAN_K210) :=3D loader.bin

Oh, No.

Here should be CONFIG_SOC_CANAAN_K210 not CONFIG_ARCH_CANAAN_K210 .

The correct diff should be:

diff --cc arch/riscv/Makefile
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
++boot-image-$(CONFIG_SOC_CANAAN_K210)	:=3D loader.bin
  endif
+ boot-image-$(CONFIG_EFI_ZBOOT)		:=3D vmlinuz.efi
+ boot-image-$(CONFIG_XIP_KERNEL)		:=3D xipImage
+ KBUILD_IMAGE				:=3D $(boot)/$(boot-image-y)
 =20
  libs-y +=3D arch/riscv/lib/
  libs-$(CONFIG_EFI_STUB) +=3D =
$(objtree)/drivers/firmware/efi/libstub/lib.a
@@@ -154,20 -166,9 +169,9 @@@ endi
  endif
 =20
  vdso-install-y			+=3D =
arch/riscv/kernel/vdso/vdso.so.dbg
 -vdso-install-$(CONFIG_COMPAT)	+=3D =
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vds=
o.so
 +vdso-install-$(CONFIG_COMPAT)	+=3D =
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
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
- BOOT_TARGETS :=3D Image Image.gz loader loader.bin xipImage =
vmlinuz.efi
+ BOOT_TARGETS :=3D Image Image.gz Image.bz2 Image.lz4 Image.lzma =
Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
 =20
  all:	$(notdir $(KBUILD_IMAGE))


>  endif
> + boot-image-$(CONFIG_EFI_ZBOOT) :=3D vmlinuz.efi
> + boot-image-$(CONFIG_XIP_KERNEL) :=3D xipImage
> + KBUILD_IMAGE :=3D $(boot)/$(boot-image-y)
>=20
>  libs-y +=3D arch/riscv/lib/
>  libs-$(CONFIG_EFI_STUB) +=3D =
$(objtree)/drivers/firmware/efi/libstub/lib.a
> @@@ -154,20 -166,9 +169,9 @@@ endi
>  endif
>=20
>  vdso-install-y +=3D arch/riscv/kernel/vdso/vdso.so.dbg
> -vdso-install-$(CONFIG_COMPAT) +=3D =
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vds=
o.so
> +vdso-install-$(CONFIG_COMPAT) +=3D =
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
>=20
> - ifneq ($(CONFIG_XIP_KERNEL),y)
> - ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
> - KBUILD_IMAGE :=3D $(boot)/loader.bin
> - else
> - ifeq ($(CONFIG_EFI_ZBOOT),)
> - KBUILD_IMAGE :=3D $(boot)/Image.gz
> - else
> - KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> - endif
> - endif
> - endif
> - BOOT_TARGETS :=3D Image Image.gz loader loader.bin xipImage =
vmlinuz.efi
> + BOOT_TARGETS :=3D Image Image.gz Image.bz2 Image.lz4 Image.lzma =
Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
>=20
>  all: $(notdir $(KBUILD_IMAGE))
>=20


