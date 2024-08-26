Return-Path: <linux-next+bounces-3428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B695FAFA
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 22:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D68B1F245A6
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 20:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0823E19AA53;
	Mon, 26 Aug 2024 20:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0aX/dEnD"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE419A296;
	Mon, 26 Aug 2024 20:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724705579; cv=none; b=A6uKOd7c0820Ms2+ctEQUeitM5fL0BiAjM3Ht6rbZUHnCFd7giU4HV0gUd5Iy3zXpVLm0Al9irs5F6XgZV6fCpBsSQ4xrn2ni9Nqq68NlVrXzYAfwW0ljZ7Df48vvQ2Gf6K+IJIbszoI2hhu23JlXLa3nta3VzuUJc14a8O7PuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724705579; c=relaxed/simple;
	bh=PFQU/PS+nzn5AwViaP6bwj645NuPHxPMaIJmLww+gzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyX9AOp1F6evKT4Phn88QbrlYucwfo7YIHLqRrQr/i90ezSIHFpqkzBRu+QwJ3UADvNq4hu7eHlnPBerhFCDfqfuafW3W1kIb3q+IC1OPn4ie/GXwc6uqhk/F0fMnrhmJyQ7rWGTXVYrr0reuCX0LhDpe27NVBNmWxYAZyashp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0aX/dEnD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=c73EoVltrEzE0c3SyNvy5fA/Z+sXixymI3hZW3zbr5I=; b=0aX/dEnDFs7ExvKfulvsUlzm08
	2P0Puk/riOn9G3On2v2UnJNhjLz6qV/Ya6Vv025TYXvaLeIhUszqUAY33XtZ+6vxTtT2kMg5XKO2I
	OpOYchEen13o/RlJCxpwqDLLqzbZUjCRq6BqftC6Ep4ZvTxvLU3Z7FfL8b0r6GvIEIpp3sIPPMQE5
	253k68FRucS9fTPXtgKx8gZoGPpZ2ajMjRlk/lFvB4Mevlb1AzCGD4bQIYyierI/DHNtyecvF21X7
	1ZqyB47bTiI7TtOfw+KGNjUENmigQhZWes0hD7T/xXFe8QIMepEFVIfyyzwalW633Ls6yfJRfGRsz
	1zM4L9Wg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sighr-00000008hBX-07xX;
	Mon, 26 Aug 2024 20:52:55 +0000
Date: Mon, 26 Aug 2024 13:52:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mike Rapoport <rppt@kernel.org>, Song Liu <song@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	djwong@kernel.org, ritesh.list@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
Message-ID: <ZszrJkFOpiy5rCma@bombadil.infradead.org>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
 <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
> 
> 
> Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
> > > pseries_le_defconfig) produced this warning:
> > 
> > iomap dio calls set_memory_ro() on the page that is used for sub block
> > zeroing.
> > 
> > But looking at powerpc code, they don't support set_memory_ro() for
> > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> > 
> > /*
> >   * On hash, the linear mapping is not in the Linux page table so
> >   * apply_to_existing_page_range() will have no effect. If in the future
> >   * the set_memory_* functions are used on the linear map this will need
> >   * to be updated.
> >   */
> > if (!radix_enabled()) {
> >          int region = get_region_id(addr);
> > 
> >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> >                  return -EINVAL;
> > }
> > 
> > We call set_memory_ro() on the zero page as a extra security measure.
> > I don't know much about powerpc, but looking at the comment, is it just
> > adding the following to support it in powerpc:
> > 
> > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > index ac22bf28086fa..e6e0b40ba6db4 100644
> > --- a/arch/powerpc/mm/pageattr.c
> > +++ b/arch/powerpc/mm/pageattr.c
> > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
> >          if (!radix_enabled()) {
> >                  int region = get_region_id(addr);
> > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> > +                                region != IO_REGION_ID &&
> > +                                region != LINEAR_MAP_REGION_ID))
> >                          return -EINVAL;
> >          }
> >   #endif
> 
> By doing this you will just hide the fact that it didn't work.
> 
> See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
> details. The linear memory region is not mapped using page tables so
> set_memory_ro() will have no effect on it.
> 
> You can either use vmalloc'ed pages, or do a const static allocation at
> buildtime so that it will be allocated in the kernel static rodata area.
> 
> By the way, your code should check the value returned by set_memory_ro(),
> there is some work in progress to make it mandatory, see
> https://github.com/KSPP/linux/issues/7

Our users expect contiguous memory [0] and so we use alloc_pages() here,
so if we're architecture limitted by this I'd rather we just remove the
set_memory_ro() only for PPC, I don't see why other have to skip this.

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index c02b266bba52..aba5cde89e14 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -775,14 +775,22 @@ EXPORT_SYMBOL_GPL(iomap_dio_rw);
 
 static int __init iomap_dio_init(void)
 {
+	int ret;
+
 	zero_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
 				IOMAP_ZERO_PAGE_ORDER);
 
 	if (!zero_page)
 		return -ENOMEM;
 
-	set_memory_ro((unsigned long)page_address(zero_page),
-		      1U << IOMAP_ZERO_PAGE_ORDER);
-	return 0;
+	if (IS_ENABLED(CONFIG_PPC))
+		return 0;
+
+	ret = set_memory_ro((unsigned long)page_address(zero_page),
+			    1U << IOMAP_ZERO_PAGE_ORDER);
+	if (ret)
+		free_pages((unsigned long) zero_page, IOMAP_ZERO_PAGE_ORDER);
+
+	return ret;
 }
 fs_initcall(iomap_dio_init);

Thoughts?

[0] https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=vfs.blocksize&id=d940b3b7b76b409b0550fdf2de6dc2183f01526f

  Luis

