Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E52B1FEBED
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 09:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgFRHKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 03:10:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:13705 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgFRHKs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Jun 2020 03:10:48 -0400
IronPort-SDR: cVwRthZ0tCRYe46EdZ/bZIdoiGodaAD+5fqXFLW/nIZQyjDkptmD0rlAP5RHshMVozc3Btt4Fy
 yr7KKmlLGClg==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="140823367"
X-IronPort-AV: E=Sophos;i="5.73,525,1583222400"; 
   d="scan'208";a="140823367"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 00:10:48 -0700
IronPort-SDR: oaYWFgJ8IrWx7D/HBfQg6a/AVxg/dOstZooMyYvsl3h1iAulsJCA1CUQTqbU7m8gHC1cGxsfC2
 0n45N+S6ZcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,525,1583222400"; 
   d="scan'208";a="263514896"
Received: from jkalinox-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.49.234])
  by fmsmga008.fm.intel.com with ESMTP; 18 Jun 2020 00:10:45 -0700
Date:   Thu, 18 Jun 2020 10:10:44 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20200618071044.GA6560@linux.intel.com>
References: <20200618095235.4040a1bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618095235.4040a1bf@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 18, 2020 at 09:52:35AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   8270cafb505e ("tpm/st33zp24: fix spelling mistake "drescription" -> "description"")
> 
> is missing a Signed-off-by from its committer.
> 
> -- 
> Cheers,
> Stephen Rothwell

Should be good now.

/Jarkko
