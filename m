Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D971F189767
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 09:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgCRItU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 04:49:20 -0400
Received: from foss.arm.com ([217.140.110.172]:46950 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgCRItT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 04:49:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5C3D31B;
        Wed, 18 Mar 2020 01:49:18 -0700 (PDT)
Received: from mbp (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D32A53F52E;
        Wed, 18 Mar 2020 01:49:17 -0700 (PDT)
Date:   Wed, 18 Mar 2020 08:49:15 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Kiss <daniel.kiss@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: linux-next: manual merge of the jc_docs tree with the arm64 tree
Message-ID: <20200318084915.GO3005@mbp>
References: <20200318124033.6c523374@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318124033.6c523374@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 12:40:33PM +1100, Stephen Rothwell wrote:
> diff --cc Documentation/filesystems/proc.rst
> index ed5465d0f435,38b606991065..000000000000
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@@ -489,37 -511,39 +511,40 @@@ does not take into account swapped out 
>   "THPeligible" indicates whether the mapping is eligible for allocating THP
>   pages - 1 if true, 0 otherwise. It just shows the current status.
>   
> - "VmFlags" field deserves a separate description. This member represents the kernel
> - flags associated with the particular virtual memory area in two letter encoded
> - manner. The codes are the following:
> -     rd  - readable
> -     wr  - writeable
> -     ex  - executable
> -     sh  - shared
> -     mr  - may read
> -     mw  - may write
> -     me  - may execute
> -     ms  - may share
> -     gd  - stack segment growns down
> -     pf  - pure PFN range
> -     dw  - disabled write to the mapped file
> -     lo  - pages are locked in memory
> -     io  - memory mapped I/O area
> -     sr  - sequential read advise provided
> -     rr  - random read advise provided
> -     dc  - do not copy area on fork
> -     de  - do not expand area on remapping
> -     ac  - area is accountable
> -     nr  - swap space is not reserved for the area
> -     ht  - area uses huge tlb pages
> -     ar  - architecture specific flag
> -     dd  - do not include area into core dump
> -     sd  - soft-dirty flag
> -     mm  - mixed map area
> -     hg  - huge page advise flag
> -     nh  - no-huge page advise flag
> -     mg  - mergable advise flag
> + "VmFlags" field deserves a separate description. This member represents the
> + kernel flags associated with the particular virtual memory area in two letter
> + encoded manner. The codes are the following:
> + 
> +     ==    =======================================
> +     rd    readable
> +     wr    writeable
> +     ex    executable
> +     sh    shared
> +     mr    may read
> +     mw    may write
> +     me    may execute
> +     ms    may share
> +     gd    stack segment growns down
> +     pf    pure PFN range
> +     dw    disabled write to the mapped file
> +     lo    pages are locked in memory
> +     io    memory mapped I/O area
> +     sr    sequential read advise provided
> +     rr    random read advise provided
> +     dc    do not copy area on fork
> +     de    do not expand area on remapping
> +     ac    area is accountable
> +     nr    swap space is not reserved for the area
> +     ht    area uses huge tlb pages
> +     ar    architecture specific flag
> +     dd    do not include area into core dump
> +     sd    soft dirty flag
> +     mm    mixed map area
> +     hg    huge page advise flag
> +     nh    no huge page advise flag
> +     mg    mergable advise flag
> ++    bt    arm64 BTI guarded page
> +     ==    =======================================

Looks fine. Thanks Stephen.

-- 
Catalin
