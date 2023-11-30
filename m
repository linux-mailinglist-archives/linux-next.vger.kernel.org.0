Return-Path: <linux-next+bounces-168-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF077FFE7C
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 23:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A86528102A
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 22:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3FD61FC8;
	Thu, 30 Nov 2023 22:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="C+OuN7+y"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6061FC5
	for <linux-next@vger.kernel.org>; Thu, 30 Nov 2023 22:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7115C433C8;
	Thu, 30 Nov 2023 22:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1701383522;
	bh=15PK2iNoEdJqQGu4Y59xZHRAisUs8d1YcFlFM7D9rm4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=C+OuN7+yM+sxavjVw4ZrcIBrT0DvHOfPbhPXXrX/U19VBrV2Ee89qctdK6Xk3Mc76
	 64IbiuxS/dQSrMry0JwhugX5ynF6MKtviT1+UEppQDdD+p6YalkV2n1DjzlZFnmRB6
	 R0qK8DvoAPQld9ht5Mg/WLLCleifoU+Gb2lBMmt4=
Date: Thu, 30 Nov 2023 14:32:02 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20231130143202.70d56b3818ee48b0e4edd213@linux-foundation.org>
In-Reply-To: <20231201090439.7ae92c13@canb.auug.org.au>
References: <20231127132809.45c2b398@canb.auug.org.au>
	<20231127144852.069b2e7e@canb.auug.org.au>
	<20231201090439.7ae92c13@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 1 Dec 2023 09:04:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> > > diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> > > index be229290a6a7..3438ab72c346 100644
> > > --- a/arch/powerpc/mm/book3s64/pgtable.c
> > > +++ b/arch/powerpc/mm/book3s64/pgtable.c
> > > @@ -542,6 +542,7 @@ void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr,
> > >  	set_pte_at(vma->vm_mm, addr, ptep, pte);
> > >  }
> > >  
> > > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >  /*
> > >   * For hash translation mode, we use the deposited table to store hash slot
> > >   * information and they are stored at PTRS_PER_PMD offset from related pmd
> > > @@ -563,6 +564,7 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
> > >  
> > >  	return true;
> > >  }
> > > +#endif
> > >  
> > >  /*
> > >   * Does the CPU support tlbie?
> > > -- 
> > > 2.40.1  
> 
> I am still carrying this patch (it should probably go into the mm
> tree).  Is someone going to pick it up (assuming it is correct)?

AFAIK we're still awaiting input from the ppc team.

I'll grab it.  If it breaks things then we-told-you-so!

