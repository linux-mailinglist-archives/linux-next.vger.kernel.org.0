Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC36108BD0
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 11:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfKYKfZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Nov 2019 05:35:25 -0500
Received: from mga01.intel.com ([192.55.52.88]:25774 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbfKYKfZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Nov 2019 05:35:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Nov 2019 02:35:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; 
   d="scan'208";a="291347805"
Received: from slehanex-mobl1.ger.corp.intel.com ([10.252.10.177])
  by orsmga001.jf.intel.com with ESMTP; 25 Nov 2019 02:35:23 -0800
Message-ID: <f7d56013bc4b9f52c48ceeb44f2b03b65370ce61.camel@intel.com>
Subject: Re: Coverity: _iwl_dbgfs_fw_dbg_domain_write(): Insecure data
 handling
From:   Luciano Coelho <luciano.coelho@intel.com>
To:     coverity-bot <keescook@chromium.org>,
        Shahar S Matityahu <shahar.s.matityahu@intel.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Date:   Mon, 25 Nov 2019 12:35:22 +0200
In-Reply-To: <201911040942.30D0EBA@keescook>
References: <201911040942.30D0EBA@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2019-11-04 at 09:42 -0800, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191031 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 068893b7a28f ("iwlwifi: dbg_ini: support domain changing via debugfs")
> 
> Coverity reported the following:
> 
> *** CID 1487394:  Insecure data handling  (TAINTED_SCALAR)
> /drivers/net/wireless/intel/iwlwifi/fw/debugfs.c: 355 in _iwl_dbgfs_fw_dbg_domain_write()
> 349     					    size_t size, char *buf)
> 350     {
> 351     	return scnprintf(buf, size, "0x%08x\n",
> 352     			 fwrt->trans->dbg.domains_bitmap);
> 353     }
> 354
> vvv     CID 1487394:  Insecure data handling  (TAINTED_SCALAR)
> vvv     Passing tainted variable "buf" to a tainted sink.
> 355     FWRT_DEBUGFS_READ_WRITE_FILE_OPS(fw_dbg_domain, 20);
> 356
> 357     void iwl_fwrt_dbgfs_register(struct iwl_fw_runtime *fwrt,
> 358     			    struct dentry *dbgfs_dir)
> 359     {
> 360     	INIT_DELAYED_WORK(&fwrt->timestamp.wk, iwl_fw_timestamp_marker_wk);
> 361     	FWRT_DEBUGFS_ADD_FILE(timestamp_marker, dbgfs_dir, 0200);
> 362     	FWRT_DEBUGFS_ADD_FILE(send_hcmd, dbgfs_dir, 0200);
> 363     	FWRT_DEBUGFS_ADD_FILE(fw_dbg_domain, dbgfs_dir, 0600);
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487394 ("Insecure data handling")
> Fixes: 068893b7a28f ("iwlwifi: dbg_ini: support domain changing via debugfs")
> 
> 
> Thanks for your attention!

We have removed the "write" part of this debugfs entry, so this is not
applicable anymore.

Thanks for reporting!

--
Cheers,
Luca.


