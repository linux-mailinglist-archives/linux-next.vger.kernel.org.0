Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 736B0108B30
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 10:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbfKYJtp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Nov 2019 04:49:45 -0500
Received: from mga05.intel.com ([192.55.52.43]:53966 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727052AbfKYJto (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Nov 2019 04:49:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Nov 2019 01:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; 
   d="scan'208";a="382759071"
Received: from slehanex-mobl1.ger.corp.intel.com ([10.252.10.177])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2019 01:49:42 -0800
Message-ID: <539a97a80cab6424df2fe8d2120374c5e39892ef.camel@intel.com>
Subject: Re: Coverity: iwl_dbg_tlv_alloc_fragment(): Control flow issues
From:   Luciano Coelho <luciano.coelho@intel.com>
To:     coverity-bot <keescook@chromium.org>,
        Shahar S Matityahu <shahar.s.matityahu@intel.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Date:   Mon, 25 Nov 2019 11:49:41 +0200
In-Reply-To: <201911040937.0079956C5@keescook>
References: <201911040937.0079956C5@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2019-11-04 at 09:37 -0800, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191031 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 14124b25780d ("iwlwifi: dbg_ini: implement monitor allocation flow")
> 
> Coverity reported the following:
> 
> *** CID 1487402:  Control flow issues  (DEADCODE)
> /drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c: 497 in iwl_dbg_tlv_alloc_fragment()
> 491     			 pages * PAGE_SIZE);
> 492
> 493     		pages = DIV_ROUND_UP(pages, 2);
> 494     	}
> 495
> 496     	if (!block)
> vvv     CID 1487402:  Control flow issues  (DEADCODE)
> vvv     Execution cannot reach this statement: "return -12;".
> 497     		return -ENOMEM;
> 498
> 499     	frag->physical = physical;
> 500     	frag->block = block;
> 501     	frag->size = pages * PAGE_SIZE;
> 502
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487402 ("Control flow issues")
> Fixes: 14124b25780d ("iwlwifi: dbg_ini: implement monitor allocation flow")
> 
> 
> Thanks for your attention!

Hi,

This is a good catch! We have a loop:

	while (pages) {
		block = dma_alloc_coherent(fwrt->dev, pages * PAGE_SIZE,
					   &physical,
					   GFP_KERNEL | __GFP_NOWARN);
		if (block)
			break;

		IWL_WARN(fwrt, "WRT: Failed to allocate fragment size %lu\n",
			 pages * PAGE_SIZE);

		pages = DIV_ROUND_UP(pages, 2);
	}

	if (!block)
		return -ENOMEM;

Which seems like it will keep trying allocate smaller and smaller
blocks until it succeeds.  But "pages" will never become zero (because
of the DIV_ROUND_UP), so if we can't allocate any size and pages
becomes 1, we will keep trying to allocate 1 page until it succeeds. 
And in that case, as coverity reported, block will never be NULL.

I'll add a fix to this in our internal tree and it will reach the
mainline following our normal upstream process.

--
Cheers,
Luca.

