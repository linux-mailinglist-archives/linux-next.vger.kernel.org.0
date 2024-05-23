Return-Path: <linux-next+bounces-2388-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520C8CCC91
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 08:54:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D548281417
	for <lists+linux-next@lfdr.de>; Thu, 23 May 2024 06:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A51713C908;
	Thu, 23 May 2024 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="u5sgzff8"
X-Original-To: linux-next@vger.kernel.org
Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C313C669;
	Thu, 23 May 2024 06:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716447293; cv=none; b=BF4N/jyXZFo3wDs1tU8MSRDl8gpJQd6hiN+owq7PhBjVKkJCedxWaH4n2RuqDGWBJpaKHd2zpT26hHkhjF7w483Dc0jzIOCUMYudbtzS9WnTmbC3NzjjMoIF7pKO4xEbkPNCAz2zmRpdrsTqq1BXVSCs43RNUe50Sg1CslDKWIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716447293; c=relaxed/simple;
	bh=WrshdjdQCiWdEVJORfQGuVtKv7YgRQp5f+HzVPpqqK0=;
	h=Message-ID:Content-Type:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:References:To; b=jba+LH+uEt2b9EjfK+Aig82ZdNnsX+roiVdyIJgMup8dYnD12NRwmrx7rYJW27kZgP5Bu7ON2jcGX0h772U1WoSM4hdEd0OKZWZNeyTsWdwg0u9FvxT5AvFUT2iZ5drWVPBoo/1Kbc3rEk7/TR/ePMQUSZsuPECz1umqPAEC/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name; spf=none smtp.mailfrom=cyyself.name; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=u5sgzff8; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cyyself.name
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cyyself.name
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716447281; bh=JSwvL4sbbJa+6I64RApjeruJaZbUHAc1LOtTCiwI9RY=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=u5sgzff8HP8T4uElaX5q6oofJbVeCO08TTWLDfA0w30APktrQo9PCF/uZH7MrQ1i2
	 pcvYLEyjvHgNMCtIhnDpT9A8e52Ul1SrpQ2+OEBzSBxJEepvt+2VD+k4FFF9JWQZZ6
	 ZeIdySSHLnJXGf8OV7N2BebTw9I8QJKeVLwnmoKE=
Received: from smtpclient.apple ([101.5.20.23])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id DA6A70F1; Thu, 23 May 2024 14:54:38 +0800
X-QQ-mid: xmsmtpt1716447278t0yr7vbvr
Message-ID: <tencent_98572A2633C4B01197EF4F10513BD9F10D05@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9aN1P2HWeN5HqIARIbqUNqkOdoq9wu4tV1gZvLGdzo3GPdbPmlm
	 l37iAYNfMrO8b4bAUAEOaQ/BAj61N3BZInOnfzuGqbhEkgaLnn+MU78sVMb4OWOTeyLRXRmRBfQn
	 QAH/zogXmf31ABSf1OQI/O0/HizW7SkAeGjBTADTKR270vW4KgmypQkfl6B7TX8Sz4onVH06WYB3
	 8fnBJM6oE+HhHpF9styVsdeTL6iAGel7eFQjclsuYrTG8t5KHYfNHUglFJ4snWr9+AiJ2/AArnqm
	 i/TzYNYpk3eKcLf+wibkVFkkHcjDTNr4fbJZ7Gaw9xaPWExwAINJPn+4sErUE4IfEfT0sQkNfiNF
	 dMF3icWbvWfooQ55iv6txTmkkGduElt7GDsJQ8GEWThIuEr06QCcsGw/mp+282alzyemAoRWalsn
	 nnOtsw7AEuV8FEPBVnMFDwxmL5HRpXAotsKdSrMeVd1AKFwY6l2R+IEoro/Y3P4vUszyp8gXfldf
	 +dhcDln2PUIPmbPUPU7fGoY57dbQfanSwiPAO5luaK//xT5viags5PDXKPcY7lO1hlEzSwz0D6zN
	 STgUmMTdS/uwDtKQ42Om8rBNCl4XUUZigAGEZz6OsGh3Su5Mkq0QgcMywGu+djr+SRjcp5iPKDKs
	 /k3wnuxEn2eX6gJ8T0fX9WS4I29vs9GB5eAb04j0RvWP0O1syeQTvP1kCbUaEZ/UPIF/CLtdqBJ7
	 yPJryTmjLJx5ZZ8q8DLD1f1vxH8wHoWGY1Lep/GbGWmPCUq3XG5/0HWYR2AnjqcvhRmJ1pRxx8Ta
	 TdmO7ikKNYcyZDyWGKDChckhFZkTSmKFvTimujVByqii2xdqZSZ4kv18YRcPU7VxP0LeoVp6O8il
	 mKe3XwpFQ48yoxpI8IAapsURVfh+g6LaXTktrBHPv0O4EJUxD9zqp8m/JhgHAWGoWdwVKmYQSGB2
	 AMnwtd0zfVE9LAkqNAUbGygmVFDh7I
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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
In-Reply-To: <20240523091729.71a9017f@canb.auug.org.au>
Date: Thu, 23 May 2024 14:54:28 +0800
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul@pwsan.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Transfer-Encoding: quoted-printable
X-OQ-MSGID: <DA09A61C-96C0-4496-89D4-EF10C4791EA6@cyyself.name>
References: <20240523091729.71a9017f@canb.auug.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On May 23, 2024, at 07:17, Stephen Rothwell <sfr@canb.auug.org.au> =
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
> from Linus' tree and commit:
>=20
>  d944d47b77cd ("riscv: make image compression configurable")
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
> index ec47787acd89,321c057e2bdc..000000000000
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@@ -139,20 -136,20 +139,20 @@@ endi
>  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
>=20
>  # Default target when executing plain make
> - boot :=3D arch/riscv/boot
> - ifeq ($(CONFIG_XIP_KERNEL),y)
> - KBUILD_IMAGE :=3D $(boot)/xipImage
> - else
> - ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
> - KBUILD_IMAGE :=3D $(boot)/loader.bin
> - else
> - ifeq ($(CONFIG_EFI_ZBOOT),)
> - KBUILD_IMAGE :=3D $(boot)/Image.gz
> - else
> - KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> - endif
> - endif
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
> ++boot-image-$(CONFIG_SOC_CANAAN_K210) :=3D loader.bin

Looks good to me.

Acked-by: Yangyu Chen <cyy@cyyself.name>

>  endif
> + boot-image-$(CONFIG_EFI_ZBOOT) :=3D vmlinuz.efi
> + boot-image-$(CONFIG_XIP_KERNEL) :=3D xipImage
> + KBUILD_IMAGE :=3D $(boot)/$(boot-image-y)
>=20
>  libs-y +=3D arch/riscv/lib/
>  libs-$(CONFIG_EFI_STUB) +=3D =
$(objtree)/drivers/firmware/efi/libstub/lib.a
> @@@ -169,9 -166,9 +169,9 @@@ endi
>  endif
>=20
>  vdso-install-y +=3D arch/riscv/kernel/vdso/vdso.so.dbg
> -vdso-install-$(CONFIG_COMPAT) +=3D =
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vds=
o.so
> +vdso-install-$(CONFIG_COMPAT) +=3D =
arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
>=20
> - BOOT_TARGETS :=3D Image Image.gz loader loader.bin xipImage =
vmlinuz.efi
> + BOOT_TARGETS :=3D Image Image.gz Image.bz2 Image.lz4 Image.lzma =
Image.lzo Image.zst loader loader.bin xipImage vmlinuz.efi
>=20
>  all: $(notdir $(KBUILD_IMAGE))
>=20


