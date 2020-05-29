Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F107D1E89C8
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 23:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgE2VPs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 17:15:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727781AbgE2VPs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 17:15:48 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BB9D206A4;
        Fri, 29 May 2020 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590786947;
        bh=Xjag/YPc/0AgAXCJUxNoTUQIY7dHgq0clEq9c7ijcfk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=047ePcendymksQyJQEtuuSTfHVzyFfVRBLrUvMHKYxCwNRyyJRH/SEvckeqhxZ9Bd
         CROJNZR6ua5gEWcjktFSIgG12BdncgM+K3QgpKFObWQlTdndwzBgwaXGzSnh+NQZQu
         EX53PhATA2yKqNcdoyhzYAEXvUWxldWJEHM2dobg=
Date:   Fri, 29 May 2020 14:15:46 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the mips
 tree
Message-Id: <20200529141546.8fcc75eecdba416a26e269cf@linux-foundation.org>
In-Reply-To: <20200528192943.2bb04a5e@canb.auug.org.au>
References: <20200528192943.2bb04a5e@canb.auug.org.au>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 28 May 2020 19:29:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/memory.c
> 
> between commit:
> 
>   7df676974359 ("mm/memory.c: Update local TLB if PTE entry exists")
> 
> from the mips tree and commit:
> 
>   e325f89fdd69 ("mm: memcontrol: convert anon and file-thp to new mem_cgroup_charge() API")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@@ -2752,9 -2748,6 +2749,8 @@@ static vm_fault_t wp_page_copy(struct v
>   		/* Free the old page.. */
>   		new_page = old_page;
>   		page_copied = 1;
>  +	} else {
>  +		update_mmu_tlb(vma, vmf->address, vmf->pte);
> - 		mem_cgroup_cancel_charge(new_page, memcg, false);
>   	}
>   
>   	if (new_page)

We decided that the update_mmu_tlb() call is no longer needed here, so
there is no need to re-add it when resolving this.



