Return-Path: <linux-next+bounces-4435-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B1A9AFCF0
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 10:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52EE2B22A5D
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 08:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8F21B6CF6;
	Fri, 25 Oct 2024 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpxtHSBR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FD322B666;
	Fri, 25 Oct 2024 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845960; cv=none; b=MzZn+TFLGRcUVmBayehqfkziJS5LEFUQa+IfKVi21nO9+uZeK1yNgn7h3cb/rJT2w4RjnymztH8LVUloari5nXDf4EiNls22oGa6MnZhe58kvCsaT7k48/hxW/9u0jY9lUS8C3i9kwbUzVcUJFeNIxMJGaRSD20mJ20CUbzE3DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845960; c=relaxed/simple;
	bh=QP6Kk4yB8Wn3ZioHGlX/mPjAOx+fAnLDEB/GNfWz0Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLzvm1G3bnSfHgLzqidm92LaYu6Np06UvdgYH+7q4FW+EqYVEZO4+RX3NQNmEIQSIhotmRUo5rySOymnU+Ejfva+KXNcaMFyhrEtsMI+TJWG7mQcSHwU1MlSPAhCg2eblvicdQ8u3B2B+cVkOKABSE+y+C9/xEKjrXCax67Fmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpxtHSBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642BBC4CEC3;
	Fri, 25 Oct 2024 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729845960;
	bh=QP6Kk4yB8Wn3ZioHGlX/mPjAOx+fAnLDEB/GNfWz0Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpxtHSBRrujWUmsVsUO7bc2O11dkN5Bwp7uxb8UE0JIToCLCFEreeHB45nAPy4WDG
	 0ubuehQ4Jaj3+rgNHvUO5GR29WeH+OUAf287dhp2LyrIQuTY8yVW3mtleffHwoW1PT
	 01Ro5vRV4YKbp6itqZCJYXmEotsLlD0HUXM/eIpeJfVzLhHNv3dW8tDD7QcjvYrxFq
	 sF0qU3WXNvkN+K+sY3NUYEAZ6I9iasfSYeZlX8JAfJTlnf3bZg/A1YXMUO1Th8eVIH
	 2KNbwDA3kuhoAEauXDFuZHsit9UZbQVNG1V0HS2ymML3oc/iNtVZRdB2MtqH+xYASJ
	 +J2vZpYybJTFQ==
Date: Fri, 25 Oct 2024 11:42:14 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Su Hua <suhua.tanke@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the memblock tree
Message-ID: <ZxtZ5q5HH-gu0zeQ@kernel.org>
References: <20241022173921.6fdbdd38@canb.auug.org.au>
 <ZxtAWopjlF9unBno@kernel.org>
 <CALe3CaAehCC6WOpCAGtMX3qsTqMc8jh3kn1Fz_m7_7_M6SMgfQ@mail.gmail.com>
 <CALe3CaDW9vWcrukmWP+tj-ToSUh8p6==goL+B3aiGvxBDg79Ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALe3CaDW9vWcrukmWP+tj-ToSUh8p6==goL+B3aiGvxBDg79Ww@mail.gmail.com>

On Fri, Oct 25, 2024 at 04:33:16PM +0800, Su Hua wrote:
> Su Hua <suhua.tanke@gmail.com> 于2024年10月25日周五 16:19写道：
> >
> > Appreciate everyone.
> >
> > Mike Rapoport <rppt@kernel.org> 于2024年10月25日周五 14:57写道：
> > >
> > > Hi Stephen,
> > >
> > > On Tue, Oct 22, 2024 at 05:39:21PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > After merging the memblock tree, today's linux-next build
> > > > (powerpc_pseries_le_defconfig) failed my qemu boot test like this:
> > > >
> > > > Kernel panic - not syncing: Attempted to kill the idle task!
> > > >
> > > > Caused by commit
> > > >
> > > >   ad48825232a9 ("memblock: uniformly initialize all reserved pages to MIGRATE_MOVABLE")
> > > >
> > > > I bisected the failure to this commit and have reverted it for today.
> > >
> > > Apparently set_pfnblock_flags_mask() is unhappy when called for
> > > uninitialized struct page. With the patch below
> > >
> > > qemu-system-ppc64el -M pseries -cpu power10 -smp 16 -m 32G -vga none -nographic -kernel $KERNEL
> > >
> > > boots up to mounting root filesystem.
> > >
> > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > index 49dbd30e71ad..2395970314e7 100644
> > > --- a/mm/mm_init.c
> > > +++ b/mm/mm_init.c
> > > @@ -723,10 +723,10 @@ static void __meminit init_reserved_page(unsigned long pfn, int nid)
> > >                         break;
> > >         }
> > >
> > > +       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > > +
> > >         if (pageblock_aligned(pfn))
> > >                 set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
> > > -
> > > -       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> >
> > Indeed, when #ifdef NODE_NOT_IN_PAGE_FLAGS is defined, there is no
> > problem, and this is why my
> > test environment did not reveal any issues. However, when
> > NODE_NOT_IN_PAGE_FLAGS is not defined,
> > page_to_nid needs to use page->flags to get the node ID, which depends
> > on __init_single_page for initialization.
> 
> Hi Mike
> Could you please advise whether the fix for this issue should be
> submitted by you or me
> as a new patch, or should I submit a patch that adjusts the code
> position, just like this:

I've folded the update into your original commit, it's now in for-next
branch of memblock tree
 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 4ba5607aaf19..5a8114fb02ae 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -723,6 +723,9 @@ static void __meminit init_reserved_page(unsigned
> long pfn, int nid)
>                         break;
>         }
>         __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> +
> +       if (pageblock_aligned(pfn))
> +               set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOVABLE);
>  }
>  #else
> 
> Sincerely yours,
> Su

-- 
Sincerely yours,
Mike.

