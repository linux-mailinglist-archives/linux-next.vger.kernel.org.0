Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8E42A77AD
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 08:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKEHDT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 02:03:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:36780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgKEHDT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Nov 2020 02:03:19 -0500
Received: from kernel.org (unknown [87.71.17.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93A8D2080D;
        Thu,  5 Nov 2020 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604559798;
        bh=ZwnmmeEoHE3z9MsWLdlfmgmtgaiQLsrxGAbEAvncd4c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uj3f+zm9mdY3fdGg9FsPhIepZXMpue0wWJYkDeF7Zm//GRKGChi6/7Z34qlGoryfl
         zSqseEzOI3oxukMW9AWvX77+C1AKrQQif2Ex15HTzdrYxdLhEQCVoeRHU5jgh2bkPm
         0bdowRzEokT55SNSTwZt+gyLkdSoQQeUibgwHE4Y=
Date:   Thu, 5 Nov 2020 09:03:11 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Anand K Mistry <amistry@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201105070311.GU4879@kernel.org>
References: <20201105174549.614c2de4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105174549.614c2de4@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 05, 2020 at 05:45:49PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/filesystems/proc.rst:296: WARNING: Malformed table.
> Text in column margin in table line 61.
> 
> ==========================  ===================================================
> Field                       Content
> ==========================  ===================================================
  ...
> Speculation_Store_Bypass    speculative store bypass mitigation status
> Speculation_Indirect_Branch indirect branch speculation mode
  ...
> ==========================  ===================================================
> Documentation/filesystems/proc.rst:234: WARNING: Error parsing content block for the "table" directive: exactly one table expected.

Looks like left column became too wide, so rather than shift the right
column to the right, I'd suggest to drop underscores in Speculation*.

> 
> .. table:: Table 1-2: Contents of the status files (as of 4.19)
> 
>  ==========================  ===================================================
>  Field                       Content
>  ==========================  ===================================================
   ...
>  Speculation_Store_Bypass    speculative store bypass mitigation status
>  Speculation_Indirect_Branch indirect branch speculation mode
>  Cpus_allowed                mask of CPUs on which this process may run
>  Cpus_allowed_list           Same as previous, but in "list format"
>  Mems_allowed                mask of memory nodes allowed to this process
>  Mems_allowed_list           Same as previous, but in "list format"
>  voluntary_ctxt_switches     number of voluntary context switches
>  nonvoluntary_ctxt_switches  number of non voluntary context switches
>  ==========================  ===================================================

Same here.
 
> Introduced by commit
> 
>   60b492d745d5 ("proc: provide details on indirect branch speculation")
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Sincerely yours,
Mike.
