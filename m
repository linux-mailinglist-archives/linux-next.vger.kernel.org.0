Return-Path: <linux-next+bounces-9215-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3987C86420
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 18:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77673B5859
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 17:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A75329396;
	Tue, 25 Nov 2025 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="nB1pk6A2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE9F2153E7;
	Tue, 25 Nov 2025 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092429; cv=none; b=odabcaqnd4B9Yn/HjpZLyPlc9sRq+V/5xeMjZ9z6rb5lwW1gvo3PPoJgqwmY1LJdZPLj3+XClnTvEDN0es46A/g7PFWIOJIFqahtAiJaGyc2gaAg7Dei2Pv5cJAS54Qsn9QL0V2UEX7Ys656OOhmbIPWWhV53d/bFQ5rHL2/9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092429; c=relaxed/simple;
	bh=zwzEd/XrCeh4HTFzMQnn7EUFfM3w557QHp1Lay65TbY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZBrSc9HmFspyPEGIYZgMqiqGANxLLDxSVT5GOEo8WzCKSfmiu5VI4q99krb8+GiM8c3z45drSbu/XFiWXBTQ3vFIzXY8BC4sFJ5HiYHP6Fos9d+ptEJADjXtN5dk/0pkfF961pk2ZjqcO5BVuz1guui5s2s5+2bfTsad4JK2P5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=nB1pk6A2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93739C4CEF1;
	Tue, 25 Nov 2025 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764092428;
	bh=zwzEd/XrCeh4HTFzMQnn7EUFfM3w557QHp1Lay65TbY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nB1pk6A2zbI5s66qD1kYpYZ98WvnBnSFd0OluCv+9HFuydfIb9EWhiFzAkdhVhmiH
	 ScdX9MxfKt1+Rk1Lt1vOfQYu3SwU9xId+fxrxjgcLdkIYjsau7STl5yidTo7vOXrP9
	 NmTFl1a1ufPDP/HhnmRwwRYs68bnxp5Mvl+t/rcI=
Date: Tue, 25 Nov 2025 09:40:27 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Palmer Dabbelt
 <palmer@dabbelt.com>, david@redhat.com, Paul Walmsley <paul@pwsan.com>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the
 mm-unstable tree
Message-Id: <20251125094027.62b358b4ba98e599a366eb3b@linux-foundation.org>
In-Reply-To: <deb9f5c1-87fd-9a1f-6277-93d63829bcf5@kernel.org>
References: <20251124120543.7dee3c33@canb.auug.org.au>
	<deb9f5c1-87fd-9a1f-6277-93d63829bcf5@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Nov 2025 02:12:26 -0700 (MST) Paul Walmsley <pjw@kernel.org> wrote:

> Hi Andrew,
> 
> On Mon, 24 Nov 2025, Stephen Rothwell wrote:
> 
> > Today's linux-next merge of the risc-v tree got a conflict in:
> > 
> >   arch/riscv/include/asm/hwcap.h
> > 
> > between commit:
> > 
> >   a2fb99195ca8 ("riscv: add RISC-V Svrsw60t59b extension support")
> > 
> > from the mm-unstable tree and commit:
> > 
> >   0597b9c8627e ("riscv: Add ISA extension parsing for Zalasr")
> > 
> > from the risc-v tree.
> 
> [ ... ]
> 
> > diff --cc arch/riscv/include/asm/hwcap.h
> > index f98fcb5c17d5,ae3852c4f2ca..000000000000
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@@ -106,7 -106,7 +106,8 @@@
> >   #define RISCV_ISA_EXT_ZAAMO		97
> >   #define RISCV_ISA_EXT_ZALRSC		98
> >   #define RISCV_ISA_EXT_ZICBOP		99
> >  -#define RISCV_ISA_EXT_ZALASR		100
> >  +#define RISCV_ISA_EXT_SVRSW60T59B	100
> > ++#define RISCV_ISA_EXT_ZALASR		101
> >   
> >   #define RISCV_ISA_EXT_XLINUXENVCFG	127
> 
> I think it might be easier for us, and would result in fewer merge 
> conflicts, if we took this series through the RISC-V tree.  We're merging 
> in quite a few changes to this hwcap.h file, and touching it in -mm is 
> likely to result in some unnecessary merge conflicts when we send it to 
> Linus.
> 
> If you'd still prefer to take it via -mm, we could also establish a shared 
> base.

Is it worth the fuss?  This patchset hits on mm/ quite a lot, it's now
in mm.git's allegedly-nonrebasing mm-stable branch and it's a trivial
one-liner fixup.

Unless you have a lot of material pending merge (at -rc7??) then I'd
say just let this be.

