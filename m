Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5833E93D3
	for <lists+linux-next@lfdr.de>; Wed, 11 Aug 2021 16:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhHKOoK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 10:44:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:34788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231872AbhHKOoJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 10:44:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8AB560E93;
        Wed, 11 Aug 2021 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628693025;
        bh=A4sH3E2KfyLdhCZNMa6bajIYD//xy6/126wVil10EmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fMKD9jHSTsGoJ7/M9qyzF9VUMwo+yqYhQSkzJ73z8l+Kr+EB6Xn6s56daPVg0z6+u
         kv4ZPQnOTr5NkLfQaVQJ6MkxsHGKg3+2jeuSAb/Jv/OEK4/QHA9m8qXheEVlsnuJ4X
         F65m3OfiNtOB4qKENXSt2sM6gpxcAsK/Mgm5+1N43PFsei+TcDHqPW4HL1owG8LVI4
         IDLKnjPI6B0ZKkxwMWybTVqaIc/ykpejz+o1b09xct7IKv3Fj56L1El59oECL45dX3
         Bsm5QsmHCj9TTzfQk7mqWqIiQmT8QcJfa3VnD52WZo1uLp3YOteq18Lezo1hNP62xZ
         yZpRekj+rC3mQ==
Date:   Wed, 11 Aug 2021 07:43:45 -0700
From:   "Darrick J. Wong" <djwong@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Matthew Wilcox <willy@infradead.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Dave Chinner <dchinner@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the folio tree with the xfs tree
Message-ID: <20210811144345.GC3601443@magnolia>
References: <20210811174231.688566de@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811174231.688566de@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 11, 2021 at 05:42:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the folio tree got a conflict in:
> 
>   mm/util.c
> 
> between commit:
> 
>   de2860f46362 ("mm: Add kvrealloc()")
> 
> from the xfs tree and commit:
> 
>   3bc0556bade4 ("mm: Add folio_raw_mapping()")
> 
> from the folio tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hmmm.  Seeing as krealloc lives in mm/slab_common.c anyway, I might just
move this function there, and (hopefully) avoid this conflict.

--D

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc mm/util.c
> index d06e48b28eec,e8fa30e48447..000000000000
> --- a/mm/util.c
> +++ b/mm/util.c
> @@@ -660,31 -635,6 +660,21 @@@ void kvfree_sensitive(const void *addr
>   }
>   EXPORT_SYMBOL(kvfree_sensitive);
>   
>  +void *kvrealloc(const void *p, size_t oldsize, size_t newsize, gfp_t flags)
>  +{
>  +	void *newp;
>  +
>  +	if (oldsize >= newsize)
>  +		return (void *)p;
>  +	newp = kvmalloc(newsize, flags);
>  +	if (!newp)
>  +		return NULL;
>  +	memcpy(newp, p, oldsize);
>  +	kvfree(p);
>  +	return newp;
>  +}
>  +EXPORT_SYMBOL(kvrealloc);
>  +
> - static inline void *__page_rmapping(struct page *page)
> - {
> - 	unsigned long mapping;
> - 
> - 	mapping = (unsigned long)page->mapping;
> - 	mapping &= ~PAGE_MAPPING_FLAGS;
> - 
> - 	return (void *)mapping;
> - }
> - 
>   /* Neutral page->mapping pointer to address_space or anon_vma or other */
>   void *page_rmapping(struct page *page)
>   {


