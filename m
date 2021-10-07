Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D98424E33
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 09:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240452AbhJGHof (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 03:44:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240448AbhJGHoe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Oct 2021 03:44:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05FF861056;
        Thu,  7 Oct 2021 07:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633592561;
        bh=NNhg+yL/bqAmk9eRKMoH2Y7N6wPGT0D+zFk5MLofafY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BTO+GdHE3WN9Q6sP7uN/2k8OailOM319W3kXcdLa4ZgykPzMvBJlkRtwt4nxXrbS+
         mIBxXjGynsaiChgLZyomiTP4MhmqYhREdISrhFYs930xHz9qdZV6sP3iZiR6czkRRb
         kZbfiS5VVD29H7uMiw8m9ET9JIg33vGDFynynMKB+l6okRarnRxPIGYNBgoMk8xDNn
         2Z4LHDNke9NgNvcklrdU1cQ0EgiJIIG9mSmMshoud1rg8pzsVME5qfphAjJmVMzZ3c
         Y17m+Db7JxhPCYx9vQBJIgG/IH/alvo7DcJxws1Xtr8kHVe6AQ0UGTYA/JN0gnxa7y
         EVR737JgUWJCA==
Date:   Thu, 7 Oct 2021 08:42:36 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the arm64-fixes
 tree
Message-ID: <20211007074236.GA31441@willie-the-truck>
References: <20211007094221.1c9ce01f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007094221.1c9ce01f@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 07, 2021 at 09:42:21AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/mm/hugetlbpage.c
> 
> between commit:
> 
>   0350419b14b9 ("arm64/hugetlb: fix CMA gigantic page order for non-4K PAGE_SIZE")
> 
> from the arm64-fixes tree and commit:
> 
>   f8b46c4b51ab ("arm64/mm: Add pud_sect_supported()")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/arm64/mm/hugetlbpage.c
> index a8158c948966,029cf5e42c4c..000000000000
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@@ -40,11 -40,10 +40,10 @@@ void __init arm64_hugetlb_cma_reserve(v
>   {
>   	int order;
>   
> - #ifdef CONFIG_ARM64_4K_PAGES
> - 	order = PUD_SHIFT - PAGE_SHIFT;
> - #else
> - 	order = CONT_PMD_SHIFT - PAGE_SHIFT;
> - #endif
> + 	if (pud_sect_supported())
> + 		order = PUD_SHIFT - PAGE_SHIFT;
> + 	else
>  -		order = CONT_PMD_SHIFT + PMD_SHIFT - PAGE_SHIFT;
> ++		order = CONT_PMD_SHIFT - PAGE_SHIFT;

Thanks, Stephen. I think I'll merge our fixes branch into the core branch
and resolve this there.

Will
