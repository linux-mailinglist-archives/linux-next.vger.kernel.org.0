Return-Path: <linux-next+bounces-4557-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD19B7971
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 12:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE1011C214A9
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 11:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F94F199391;
	Thu, 31 Oct 2024 11:14:15 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A2713A869;
	Thu, 31 Oct 2024 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730373255; cv=none; b=GwWVIf0oETyRsqHuMWQ6WN+clWozUzD4RIj8Tzy7VSYckPhg/jUPdsuQn8tYHYeBgKnnxtaowazhdfCfGIbMG14IOlnt5h/hYbV7EU16YylDVSAS3trnMeghJ1ZxO5bngPtJt+BhwjrXLIZhPO9WyzfIHwiSWcBE+AfobNVibYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730373255; c=relaxed/simple;
	bh=GDOS+QhdehVzHBthJoD5fN7tTjcG7ySvP3NISKl9iN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9Bq8uAZTLhWrg8oOz2bRgO7nz7hO/NuM5JEiLN9vpVshvn6pZtDqUh1/80A0IthL7EuqEPjUcijtkLkIKiydPfkABSNnupCSGck0uqdSx9jJqHoKmfCCNLHDrGQZcWlNXrWk/R5ENtFIKE9RDWiloKPnBvWAYLwwT8DnTNbmbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B8AC4CEE3;
	Thu, 31 Oct 2024 11:14:12 +0000 (UTC)
Date: Thu, 31 Oct 2024 11:14:10 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm-hotfixes
 tree
Message-ID: <ZyNmgiZ2e_aKcD9K@arm.com>
References: <20241031104247.65c76c00@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031104247.65c76c00@canb.auug.org.au>

On Thu, Oct 31, 2024 at 10:42:47AM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/include/asm/mman.h
> index 798d965760d4,1dbfb56cb313..000000000000
> --- a/arch/arm64/include/asm/mman.h
> +++ b/arch/arm64/include/asm/mman.h
> @@@ -42,7 -39,7 +42,7 @@@ static inline unsigned long arch_calc_v
>   	 * filesystem supporting MTE (RAM-based).
>   	 */
>   	if (system_supports_mte() &&
> - 	    ((flags & MAP_ANONYMOUS) || shmem_file(file)))
>  -	    (flags & (MAP_ANONYMOUS | MAP_HUGETLB)))
> ++	    ((flags & (MAP_ANONYMOUS | MAP_HUGETLB)) || shmem_file(file)))
>   		return VM_MTE_ALLOWED;
>   
>   	return 0;

Thanks Stephen. This looks fine.

-- 
Catalin

