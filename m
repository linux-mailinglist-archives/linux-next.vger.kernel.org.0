Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6EDEA192
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 17:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfJ3QRd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 12:17:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:52283 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726800AbfJ3QRc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Oct 2019 12:17:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Oct 2019 09:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,247,1569308400"; 
   d="scan'208";a="400189110"
Received: from sneftin-mobl1.ger.corp.intel.com (HELO [10.185.23.132]) ([10.185.23.132])
  by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2019 09:17:23 -0700
Subject: Re: Coverity: igc_hash_mc_addr(): Integer handling issues
To:     coverity-bot <keescook@chromium.org>
Cc:     Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Aaron Brown <aaron.f.brown@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org,
        "Neftin, Sasha" <sasha.neftin@intel.com>,
        "Shalev, Avi" <avi.shalev@intel.com>
References: <201910281606.99B58CD542@keescook>
From:   "Neftin, Sasha" <sasha.neftin@intel.com>
Message-ID: <8daf63dc-15bf-0487-28a3-6119b17e9c11@intel.com>
Date:   Wed, 30 Oct 2019 18:17:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910281606.99B58CD542@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/29/2019 01:06, coverity-bot wrote:
> Hello!
> 
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191025 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
> 
> 7f839684c5c4 ("igc: Add set_rx_mode support")
> 
> Coverity reported the following:
> 
> *** CID 1487361:  Integer handling issues  (BAD_SHIFT)
> /drivers/net/ethernet/intel/igc/igc_mac.c: 851 in igc_hash_mc_addr()
> 845     		break;
> 846     	case 3:
> 847     		bit_shift += 4;
> 848     		break;
> 849     	}
> 850
> vvv     CID 1487361:  Integer handling issues  (BAD_SHIFT)
> vvv     In expression "mc_addr[4] >> 8 - bit_shift", right shifting "mc_addr[4]" by more than 7 bits always yields zero.  The shift amount, "8 - bit_shift", is 8.
> 851     	hash_value = hash_mask & (((mc_addr[4] >> (8 - bit_shift)) |
> 852     				  (((u16)mc_addr[5]) << bit_shift)));
> 853
> 854     	return hash_value;
> 855     }
> 856
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include:
We will provide a fix for multicast table array hashing.
Thanks,
Sasha
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487361 ("Integer handling issues")
> Fixes: 7f839684c5c4 ("igc: Add set_rx_mode support")
> 
> 
> Thanks for your attention!
> 

