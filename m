Return-Path: <linux-next+bounces-3431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F995FBDF
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 23:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07DB31C21C9E
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 21:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ADA199FA7;
	Mon, 26 Aug 2024 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bbn5Usiy"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD4F7F7FC;
	Mon, 26 Aug 2024 21:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724708487; cv=none; b=I2NSoxpc8n5yT7reOTe1D4WRXizBnZnfTu1awF/kiZjHQXb/L6TxdQ61UgoRo3CF5eEu7txfHBpx/amUYpvdT/fez8DgT/M3Mg6yqUiE5J2wvINAixpMNg5ehw4dYEDbW1fYJrVyQkl3zSX/L43cFx83qZkZU+f6dyqYTSFKe2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724708487; c=relaxed/simple;
	bh=gQD+9DJRblVHbVoMapoyfoe93S83Y/BpUhX3zQu/rvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSfc9CC7UxrjgNnNfPNKxTMIyQ060m5HfUtluHXolzttGOCO/5TfilFyqltufZ3FNRgsrwZ0YMEIEIYnNuyn8C9FrbYQKi3Sm+RgZWuQqOj6IV2QoGPa+wiiAV8S8n1rmKl80O/m1wpJYOAI6hyEww2AXnXmIRuRnTwAG0qfzGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bbn5Usiy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=v/qPBUyTJLcxrocLg1eH+X9CRl0z59P294XRmU1JRP8=; b=bbn5Usiy6rh8dv+WfLE48zIl0u
	QBiFgXQ9Onw8NP+eZE8TqpXG45ia3z2KzJIA05muwyaWbqv7TPgPMenUE+3Jo41ekskkUYZSO51lP
	nU/JBxP0pdRux/JzjT1majLelDhhphtVmGukWpM80Y9UBKsTNSAWvWuHh22dC1atZcuxyo45s+c7p
	BIwWiNNFy4nhjrScK7H48/5TXlMg3y5Yr9e7hMjVpgxdzG0gkM8LB5sHYpdIJPkEFQo4cGBLFwILI
	9ofmoxGAtv79hll0LQjThYwbLNV8eB7jRJQ8NOoGkYyO0BzWD0brLhSitfQnIwjwFyI4XF87dI+J5
	u5pBOhzw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sihSi-00000008qoj-3orJ;
	Mon, 26 Aug 2024 21:41:20 +0000
Date: Mon, 26 Aug 2024 14:41:20 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
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
Message-ID: <Zsz2gGgORfeVkVfG@bombadil.infradead.org>
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
 <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
 <ZszrJkFOpiy5rCma@bombadil.infradead.org>
 <20240826211049.GC6082@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826211049.GC6082@frogsfrogsfrogs>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Aug 26, 2024 at 02:10:49PM -0700, Darrick J. Wong wrote:
> On Mon, Aug 26, 2024 at 01:52:54PM -0700, Luis Chamberlain wrote:
> > On Mon, Aug 26, 2024 at 07:43:20PM +0200, Christophe Leroy wrote:
> > > 
> > > 
> > > Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> > > > On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > > 
> > > > > After merging the vfs-brauner tree, today's linux-next boot test (powerpc
> > > > > pseries_le_defconfig) produced this warning:
> > > > 
> > > > iomap dio calls set_memory_ro() on the page that is used for sub block
> > > > zeroing.
> > > > 
> > > > But looking at powerpc code, they don't support set_memory_ro() for
> > > > memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> > > > 
> > > > /*
> > > >   * On hash, the linear mapping is not in the Linux page table so
> > > >   * apply_to_existing_page_range() will have no effect. If in the future
> > > >   * the set_memory_* functions are used on the linear map this will need
> > > >   * to be updated.
> > > >   */
> > > > if (!radix_enabled()) {
> > > >          int region = get_region_id(addr);
> > > > 
> > > >          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > > >                  return -EINVAL;
> > > > }
> > > > 
> > > > We call set_memory_ro() on the zero page as a extra security measure.
> > > > I don't know much about powerpc, but looking at the comment, is it just
> > > > adding the following to support it in powerpc:
> > > > 
> > > > diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> > > > index ac22bf28086fa..e6e0b40ba6db4 100644
> > > > --- a/arch/powerpc/mm/pageattr.c
> > > > +++ b/arch/powerpc/mm/pageattr.c
> > > > @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
> > > >          if (!radix_enabled()) {
> > > >                  int region = get_region_id(addr);
> > > > -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> > > > +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> > > > +                                region != IO_REGION_ID &&
> > > > +                                region != LINEAR_MAP_REGION_ID))
> > > >                          return -EINVAL;
> > > >          }
> > > >   #endif
> > > 
> > > By doing this you will just hide the fact that it didn't work.
> > > 
> > > See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") for
> > > details. The linear memory region is not mapped using page tables so
> > > set_memory_ro() will have no effect on it.
> > > 
> > > You can either use vmalloc'ed pages, or do a const static allocation at
> > > buildtime so that it will be allocated in the kernel static rodata area.
> > > 
> > > By the way, your code should check the value returned by set_memory_ro(),
> > > there is some work in progress to make it mandatory, see
> > > https://github.com/KSPP/linux/issues/7
> > 
> > Our users expect contiguous memory [0] and so we use alloc_pages() here,
> > so if we're architecture limitted by this I'd rather we just remove the
> > set_memory_ro() only for PPC, I don't see why other have to skip this.
> 
> Just drop it, then.

OK sent a patch for that.

  Luis

