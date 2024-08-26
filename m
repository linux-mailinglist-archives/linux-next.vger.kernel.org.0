Return-Path: <linux-next+bounces-3429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0361495FB48
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 23:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C361C21BB4
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 21:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DD3145344;
	Mon, 26 Aug 2024 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYrEMCtc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4294A881E;
	Mon, 26 Aug 2024 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706650; cv=none; b=tewwQL9oXuXjB6bZU8ShQEQ8/YzQpiLcvHgqIsB95pKjchEwvDmZ8OlQ5jwGUx4mpc0ehgY9kzIw0EKk5YwNi+hC8JU4cv0N9ecT1CXOuM46zxIEF37GixvLHHxALYLQixyn71aBnV55+yvW1j6mRkVMbtmWwtzT5LPMyng0Nls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706650; c=relaxed/simple;
	bh=AxCDnE68GkibdBOqxqO4LPCEcA6Whks6cJ8JZTKjBPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPgci35Vic75gfsb4M3G2lqzvujJGL94qkQHL9TUQp8kGKRlvnCMXqDPaaguQvjuR+5y2kczB/k00tlIysrbJ0pnQAolhMI77W9SWmw3+q+CaCwmC3JjWP7KffiGRqalv4Mdvli5AsdBeCiWSN8vwKJSQZDPOkdkl5WrwW2AOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYrEMCtc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C24C8B7A3;
	Mon, 26 Aug 2024 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724706649;
	bh=AxCDnE68GkibdBOqxqO4LPCEcA6Whks6cJ8JZTKjBPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYrEMCtcNUMwRshAkVUKWPuZnPgDNHy323ItS4fI/kicK71U6NPSp1usTwi7354pl
	 hFopOTgWELk0s96Wk2WT02U2fg62QmmA2FTitwMc7cjHv5NDOJQWZA2v/kUvzC2j3c
	 buudB2bK1tl/A1SYLsnXin/3siqhcmBAM8c+fUbRsUgMT+sI1NFbgQLlSLWxtPznng
	 K93QRs8uRRffpzAAycHhUJLuqRMFejV0YShFQMzfS9B1rCrsyuzS4E0LEGpbhW7Hux
	 kZOS51+4yeu6qHWqaMIcyt5/GP4vthBofNwRGnafqRDxsFTq5RKGU+ULidZc0RWV1a
	 CFjZys8lpouEQ==
Date: Mon, 26 Aug 2024 14:10:49 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ritesh.list@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
Message-ID: <20240826211049.GC6082@frogsfrogsfrogs>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
 <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
 <ZszrJkFOpiy5rCma@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZszrJkFOpiy5rCma@bombadil.infradead.org>

On Mon, Aug 26, 2024 at 01:52:54PM -0700, Luis Chamberlain wrote:
> On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
> > 
> > 
> > Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> > > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
> > > > pseries_le_defconfig) produced this warning:
> > > 
> > > iomap dio calls set_memory_ro() on the page that is used for sub block
> > > zeroing.
> > > 
> > > But looking at powerpc code, they don't support set_memory_ro() for
> > > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> > > 
> > > /*
> > >   * On hash, the linear mapping is not in the Linux page table so
> > >   * apply_to_existing_page_range() will have no effect. If in the future
> > >   * the set_memory_* functions are used on the linear map this will need
> > >   * to be updated.
> > >   */
> > > if (!radix_enabled()) {
> > >          int region = get_region_id(addr);
> > > 
> > >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > >                  return -EINVAL;
> > > }
> > > 
> > > We call set_memory_ro() on the zero page as a extra security measure.
> > > I don't know much about powerpc, but looking at the comment, is it just
> > > adding the following to support it in powerpc:
> > > 
> > > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > > index ac22bf28086fa..e6e0b40ba6db4 100644
> > > --- a/arch/powerpc/mm/pageattr.c
> > > +++ b/arch/powerpc/mm/pageattr.c
> > > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
> > >          if (!radix_enabled()) {
> > >                  int region = get_region_id(addr);
> > > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> > > +                                region != IO_REGION_ID &&
> > > +                                region != LINEAR_MAP_REGION_ID))
> > >                          return -EINVAL;
> > >          }
> > >   #endif
> > 
> > By doing this you will just hide the fact that it didn't work.
> > 
> > See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
> > details. The linear memory region is not mapped using page tables so
> > set_memory_ro() will have no effect on it.
> > 
> > You can either use vmalloc'ed pages, or do a const static allocation at
> > buildtime so that it will be allocated in the kernel static rodata area.
> > 
> > By the way, your code should check the value returned by set_memory_ro(),
> > there is some work in progress to make it mandatory, see
> > https://github.com/KSPP/linux/issues/7
> 
> Our users expect contiguous memory [0] and so we use alloc_pages() here,
> so if we're architecture limitted by this I'd rather we just remove the
> set_memory_ro() only for PPC, I don't see why other have to skip this.

Just drop it, then.

--D

> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index c02b266bba52..aba5cde89e14 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -775,14 +775,22 @@ EXPORT_SYMBOL_GPL(iomap_dio_rw);
>  
>  static int __init iomap_dio_init(void)
>  {
> +	int ret;
> +
>  	zero_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
>  				IOMAP_ZERO_PAGE_ORDER);
>  
>  	if (!zero_page)
>  		return -ENOMEM;
>  
> -	set_memory_ro((unsigned long)page_address(zero_page),
> -		      1U << IOMAP_ZERO_PAGE_ORDER);
> -	return 0;
> +	if (IS_ENABLED(CONFIG_PPC))
> +		return 0;
> +
> +	ret = set_memory_ro((unsigned long)page_address(zero_page),
> +			    1U << IOMAP_ZERO_PAGE_ORDER);
> +	if (ret)
> +		free_pages((unsigned long) zero_page, IOMAP_ZERO_PAGE_ORDER);
> +
> +	return ret;
>  }
>  fs_initcall(iomap_dio_init);
> 
> Thoughts?
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=vfs.blocksize&id=d940b3b7b76b409b0550fdf2de6dc2183f01526f
> 
>   Luis

