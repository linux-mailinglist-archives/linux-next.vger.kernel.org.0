Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E5E39D9A8
	for <lists+linux-next@lfdr.de>; Mon,  7 Jun 2021 12:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhFGKb3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 06:31:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:53872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230233AbhFGKb3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Jun 2021 06:31:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18B85611AD;
        Mon,  7 Jun 2021 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623061778;
        bh=Zk1bcXx7TLwrFaOUSJuFhwPwz4xFtCkQh2SupLh+gF8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CP8QqgWbxC2BmMEvucqk4G+jjoxFcUHu21ySa8azUrgYh0BMEp8an3roqhckHl5i6
         JXsaGZIo5nBHXJVeXh5/yoJv44oQ4QoRznJFL2OgSEi5wo4EGoWB3yLPUVq9PzlXxr
         1blzWmFIWJY2QdDt0535VWX1JdWzdtdm0hxDbsqrSZ7VLPf1Nva2OoiM17Fu5TsWmR
         cpkRt7qgH17CahpcjSArklNTgBUwDqHYXxWRNOIYdPAf0BMeMKdV5pOsjOw1syn//5
         vP68qgg8c2ukp/ZcVgUM3Gtsp/PuyRuIejcfEHQryLsjVVGOOh64iD6pf0UAho95VJ
         sDnn+izKeePRw==
Date:   Mon, 7 Jun 2021 11:29:33 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20210607102932.GA6924@willie-the-truck>
References: <20210607192513.466770c0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607192513.466770c0@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 07, 2021 at 07:25:13PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   arch/arm64/include/asm/page.h
> 
> between commits:
> 
>   92638b4e1b47 ("mm: arch: remove indirection level in alloc_zeroed_user_highpage_movable()")
>   7a3b83537188 ("kasan: use separate (un)poison implementation for integrated init")
>   013bb59dbb7c ("arm64: mte: handle tags zeroing at page allocation time")
>   c275c5c6d50a ("kasan: disable freed user page poisoning with HW tags")
> 
> from the arm64 tree and (more or less) duplicated patches in the akpm tree.
> 
> I fixed it up (I dropped the patches form the akpm tree) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.

Thanks, Stephen.

Andrew -- you can drop your copies of these patches, as you suggested at:

https://lore.kernel.org/r/20210603200308.2a08d25db0dc92430a545b4c@linux-foundation.org

Will
