Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A79CA1FD9A0
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 01:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgFQXaj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Jun 2020 19:30:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:38872 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgFQXai (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Jun 2020 19:30:38 -0400
IronPort-SDR: S+j52iPE8OpJ3wObwCDBURo3edQJ/ZgYmRQOaagwFAg6z6ed6falSHW/+0+kYDAnuuRF8KYOT3
 rwYkor2H5qfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2020 16:30:37 -0700
IronPort-SDR: UpdSRRxUp4FQ6e0QukzkjZnzMNe2h7trheXVQ8wOU50Ct3Cgeix0ON1wGVN6CnWbe25cSH7Ykh
 zl770mIX4Ftg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; 
   d="scan'208";a="317668621"
Received: from kleeve-mobl.ger.corp.intel.com (HELO localhost) ([10.252.50.166])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2020 16:30:35 -0700
Date:   Thu, 18 Jun 2020 02:30:34 +0300
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20200617233034.GG62794@linux.intel.com>
References: <20200617145605.726f0885@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617145605.726f0885@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 17, 2020 at 02:56:05PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   b4988ccd41f4 ("tpm: Make read{16, 32}() and write32() in tpm_tis_phy_ops optional")
> 
> is missing a Signed-off-by from its committer.
> 
> -- 
> Cheers,
> Stephen Rothwell

Nope, I pushed it by mistake. I'll remove the patch. Thanks for
reporting.

/Jarkko
