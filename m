Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCA2344E0E
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 19:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhCVSDh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 14:03:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:52680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229951AbhCVSDd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Mar 2021 14:03:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14F9061874;
        Mon, 22 Mar 2021 18:03:31 +0000 (UTC)
Date:   Mon, 22 Mar 2021 18:03:29 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: linux-next: manual merge of the akpm tree with the arm64 tree
Message-ID: <20210322180329.GA12107@arm.com>
References: <20210322174023.602a110b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322174023.602a110b@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 22, 2021 at 05:40:23PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   arch/arm64/mm/mmu.c
> 
> between commit:
> 
>   87143f404f33 ("arm64: mm: use XN table mapping attributes for the linear region")
> 
> from the arm64 tree and commit:
> 
>   0a2634348ef8 ("set_memory: allow querying whether set_direct_map_*() is actually enabled")
> 
> from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks fine. Thanks Stephen.

-- 
Catalin
