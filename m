Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E7F17FF7A
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 14:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgCJNtF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 09:49:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:22466 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgCJNtE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 09:49:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Mar 2020 06:49:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
   d="scan'208";a="260793292"
Received: from akharche-mobl2.ccr.corp.intel.com (HELO localhost) ([10.251.86.23])
  by orsmga002.jf.intel.com with ESMTP; 10 Mar 2020 06:49:01 -0700
Date:   Tue, 10 Mar 2020 15:49:00 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the tpmdd tree
Message-ID: <20200310134900.GB32334@linux.intel.com>
References: <20200310004629.5a752080@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310004629.5a752080@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 12:46:29AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   4eecda6b7df2 ("tpm: tpm_tis_spi_cr50: use new structure for SPI transfer delays")
>   0fbd8fe52759 ("tpm_tis_spi: use new 'delay' structure for SPI transfer delays")
> 
> are missing a Signed-off-by from their committer.
> 
> Not really, but "Signed-off-by" is misspelled.  Please fix up what ever
> script produces this (or your finger memory :-)).

Sure thing!

Backtracked to a manual typo in a filter-branch spell. I'll convert my
regulary used fb-spells as scripts to counter measure this in the future.

/Jarkko
