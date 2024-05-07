Return-Path: <linux-next+bounces-2197-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E578BD9EA
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 05:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DBEA283707
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 03:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E59F4087F;
	Tue,  7 May 2024 03:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="evVuxTsO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF61E3FBB0;
	Tue,  7 May 2024 03:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715054151; cv=none; b=Dv87AemdSZVxci6TOABjmUS/g235hR+Kt/b8e1Z4ugRJFfTGxademgORIfdM8Rdffcz+iE0meS3/V7Rs8cX54xNx832z/PozDQOLTMd0Q3p0ktWr6ydMRGH3Bdk6xmu2ut7Vo0+G45QfWi4NTc5HYdq9M06hqCHc1Vgc/2/FTJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715054151; c=relaxed/simple;
	bh=/vJ4c0AQmmB9ps+rh3Y0oGTRG28m+JJpNgChWpJQls8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=slL+6BGuusrWA3IpeFFztZzAFo+6XWInPjkCRRGRMs9by+yMzIpP1vj/0w8tJgr+YaPF6ATTFRTFgcjNHRPkNLeY2cI2tAFT1+i25xzsuqm1xpslU96EImGj5SmxgAMx64oNm+AgN1IYCXcfMXilmAIHXmFhaXBo0NfyZgn7ENs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=evVuxTsO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715054144;
	bh=wOtPNxB5OzuiLNH0fMUK5c9wuXAdWP2Bh0gK00toAS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=evVuxTsO7Gm7tMSnmmBSjDM4TuiWoSBD7DYmjC3UEU2GnTX2MwcFzVxP/6+l7NmnM
	 7JtZJMkxHIamnBKP5WjbBYTKOGZHOOHZ8Wn/jvbGpwX9iW4VTgbPFDmsTZfV60cc4P
	 4ToGoBe47wula7JmgLIVWWGxI1KkG4Gk4QH9XJDApifStJ3WaJu5as0VkowtpflfjZ
	 1aeCvk40Pq6CCPMyw02b63LnpN+yIX3FENWe6rsT3KJlIOoA/v4O1++b6DQfIMOSTr
	 HEs4BtC7AacZWM4FlJ6euZ32mcsiRC5qxqvZpI8Cerd0tS8TGW8UctxxJ/9eQq2HjC
	 ei1qEaUaXLW9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYPZS0ThQz4x0K;
	Tue,  7 May 2024 13:55:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Benjamin Gray <bgray@linux.ibm.com>, Charlie Jenkins
 <charlie@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the risc-v tree with the powerpc tree
In-Reply-To: <20240507100441.0ffefbd9@canb.auug.org.au>
References: <20240507100441.0ffefbd9@canb.auug.org.au>
Date: Tue, 07 May 2024 13:55:41 +1000
Message-ID: <87bk5ip96q.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the risc-v tree got conflicts in:
>
>   include/uapi/linux/prctl.h
>   kernel/sys.c
>
> between commit:
>
>   628d701f2de5 ("powerpc/dexcr: Add DEXCR prctl interface")
>
> from the powerpc tree and commit:
>
>   6b9391b581fd ("riscv: Include riscv_set_icache_flush_ctx prctl")
>
> from the risc-v tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

As you would have seen, I accounted for 71 being taken by
PR_RISCV_SET_ICACHE_FLUSH_CTX in my tree, so this is just a textual
conflict.

So should be nothing to do other than mention it to Linus.

cheers

> diff --cc include/uapi/linux/prctl.h
> index 713d28788df7,524d546d697b..000000000000
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@@ -306,20 -306,10 +306,26 @@@ struct prctl_mm_map 
>   # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
>   # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
>   
> + #define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> + # define PR_RISCV_CTX_SW_FENCEI_ON	0
> + # define PR_RISCV_CTX_SW_FENCEI_OFF	1
> + # define PR_RISCV_SCOPE_PER_PROCESS	0
> + # define PR_RISCV_SCOPE_PER_THREAD	1
> + 
>  +/* PowerPC Dynamic Execution Control Register (DEXCR) controls */
>  +#define PR_PPC_GET_DEXCR		72
>  +#define PR_PPC_SET_DEXCR		73
>  +/* DEXCR aspect to act on */
>  +# define PR_PPC_DEXCR_SBHE		0 /* Speculative branch hint enable */
>  +# define PR_PPC_DEXCR_IBRTPD		1 /* Indirect branch recurrent target prediction disable */
>  +# define PR_PPC_DEXCR_SRAPD		2 /* Subroutine return address prediction disable */
>  +# define PR_PPC_DEXCR_NPHIE		3 /* Non-privileged hash instruction enable */
>  +/* Action to apply / return */
>  +# define PR_PPC_DEXCR_CTRL_EDITABLE	 0x1 /* Aspect can be modified with PR_PPC_SET_DEXCR */
>  +# define PR_PPC_DEXCR_CTRL_SET		 0x2 /* Set the aspect for this process */
>  +# define PR_PPC_DEXCR_CTRL_CLEAR	 0x4 /* Clear the aspect for this process */
>  +# define PR_PPC_DEXCR_CTRL_SET_ONEXEC	 0x8 /* Set the aspect on exec */
>  +# define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
>  +# define PR_PPC_DEXCR_CTRL_MASK		0x1f
>  +
>   #endif /* _LINUX_PRCTL_H */
> diff --cc kernel/sys.c
> index f9c95410278c,1b7bda0722ca..000000000000
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@@ -146,12 -146,9 +146,15 @@@
>   #ifndef RISCV_V_GET_CONTROL
>   # define RISCV_V_GET_CONTROL()		(-EINVAL)
>   #endif
> + #ifndef RISCV_SET_ICACHE_FLUSH_CTX
> + # define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> + #endif
>  +#ifndef PPC_GET_DEXCR_ASPECT
>  +# define PPC_GET_DEXCR_ASPECT(a, b)	(-EINVAL)
>  +#endif
>  +#ifndef PPC_SET_DEXCR_ASPECT
>  +# define PPC_SET_DEXCR_ASPECT(a, b, c)	(-EINVAL)
>  +#endif
>   
>   /*
>    * this is where the system-wide overflow UID and GID are defined, for

