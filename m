Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21A41B547C
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 07:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgDWF5y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 01:57:54 -0400
Received: from mga18.intel.com ([134.134.136.126]:50560 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgDWF5x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 01:57:53 -0400
IronPort-SDR: 37dU+3RggHmo4CZ84sPzVbwv2ZUHwV+B9IAkQ28oKpznuUMMddaPzPBsWR89ZcxIjAK0Wg9Tra
 PFfkjKukO2Og==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 22:57:52 -0700
IronPort-SDR: FGx4P3DPnUgqAW0OPUjay613QkPEEnCxslV6Gg18tlThHSJqY3A4IwBeVyfGJBBl+RAVj+4CG0
 Uq+NM54pNRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,305,1583222400"; 
   d="scan'208";a="280279392"
Received: from yhuang-dev.sh.intel.com (HELO yhuang-dev) ([10.239.159.23])
  by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2020 22:57:51 -0700
From:   "Huang\, Ying" <ying.huang@intel.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Tim Chen <tim.c.chen@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>
Subject: Re: Coverity: scan_swap_map(): Memory - corruptions
In-Reply-To: <202004221119.20619A68B@keescook> (coverity-bot's message of
        "Wed, 22 Apr 2020 11:21:28 -0700")
References: <202004221119.20619A68B@keescook>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date:   Thu, 23 Apr 2020 13:57:50 +0800
Message-ID: <87blni217l.fsf@yhuang-dev.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

coverity-bot <keescook@chromium.org> writes:

> Hello!
>
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20200422 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>   Wed Feb 22 15:45:33 2017 -0800
>     36005bae205d ("mm/swap: allocate swap slots in batches")
>
> Coverity reported the following:
>
> *** CID 1492705:  Memory - corruptions  (OVERRUN)
> /mm/swapfile.c: 972 in scan_swap_map()
> 966     static unsigned long scan_swap_map(struct swap_info_struct *si,
> 967     				   unsigned char usage)
> 968     {
> 969     	swp_entry_t entry;
> 970     	int n_ret;
> 971
> vvv     CID 1492705:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning struct type swp_entry_t of 8 bytes by passing it to a function which accesses it at byte offset 15.
> 972     	n_ret = scan_swap_map_slots(si, usage, 1, &entry);
> 973
> 974     	if (n_ret)
> 975     		return swp_offset(entry);
> 976     	else
> 977     		return 0;
>
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
>
> Human edit:
> I can't tell if this is a false positive. The detailed analysis points
> at:
>
> 844        si->cluster_next = offset + 1;
>    	67. index_const: Pointer slots directly indexed by n_ret++ with value 1.
> 845        slots[n_ret++] = swp_entry(si->type, offset);

If my understanding were correct, this will not cause problem.  Because
in the next line,

   /* got enough slots or reach max slots? */
   if ((n_ret == nr) || (offset >= si->highest_bit))
           goto done;

The value of n_ret will be checked and function will return if n_ret==1
because nr==1.

Best Regards,
Huang, Ying

