Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3F769038D
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 16:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbfHPOAH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 10:00:07 -0400
Received: from foss.arm.com ([217.140.110.172]:57422 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727261AbfHPOAH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 10:00:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 795CD360;
        Fri, 16 Aug 2019 07:00:06 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C83D23F694;
        Fri, 16 Aug 2019 07:00:05 -0700 (PDT)
Date:   Fri, 16 Aug 2019 15:00:03 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20190816140003.GA33405@arrakis.emea.arm.com>
References: <20190816221603.7c0939f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816221603.7c0939f0@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 16, 2019 at 10:16:03PM +1000, Stephen Rothwell wrote:
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> mm/kmemleak.c: In function 'kmemleak_disable':
> mm/kmemleak.c:1884:2: error: 'kmemleak_early_log' undeclared (first use in this function); did you mean 'kmemleak_alloc'?
>   kmemleak_early_log = 0;
>   ^~~~~~~~~~~~~~~~~~
>   kmemleak_alloc
> mm/kmemleak.c:1884:2: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit
> 
>   fcf3a5b62f43 ("mm: kmemleak: disable early logging in case of error")
> 
> from Linus' tree mismerging with commits
> 
>   bce40af67cba ("mm: kmemleak: disable early logging in case of error")
>   c405460afc4a ("mm: kmemleak: use the memory pool for early allocations")
> 
> from the akpm-current tree.
> 
> I just removed the above line again (as was dome in the last commit
> above).

Thanks. Commit c405460 should remove all traces of kmemleak_early_log
from current Linus' tree but somehow during merging in -next the line
reappeared.

-- 
Catalin
