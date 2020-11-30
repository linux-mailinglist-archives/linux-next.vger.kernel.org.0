Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379D72C8C31
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 19:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgK3SIw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 13:08:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:18018 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgK3SIw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 13:08:52 -0500
IronPort-SDR: jPoweAtGgXc1YEftVMhLX5Nwl+p6cZI+ja5SR6kBadbSo7URMbs1HIci9AzKaY/Cwd/zYCZQ73
 l+dW302FYuLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172840901"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="172840901"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:07:19 -0800
IronPort-SDR: 6800CkDS1JpOJei6Ner7qx0lDXSg0GOD77vZRW6sCNuiM8cMyqMu7VzuiDPbB07SS4p+XAjckM
 JEo1L+LO+gvw==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="364344666"
Received: from clord1-mobl1.amr.corp.intel.com (HELO [10.209.130.46]) ([10.209.130.46])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:07:18 -0800
Subject: Re: linux-next: build failure after merge of the regmap tree
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jack Yu <jack.yu@realtek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201127182411.07c15471@canb.auug.org.au>
 <20201130175937.GA37431@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6e2ff635-dfb0-b795-0519-9131df037150@linux.intel.com>
Date:   Mon, 30 Nov 2020 12:07:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130175937.GA37431@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 11/30/20 11:59 AM, Mark Brown wrote:
> On Fri, Nov 27, 2020 at 06:24:11PM +1100, Stephen Rothwell wrote:
>> Caused by commit
>>
>>    6f4a038b9967 ("ASoC/SoundWire: rt715-sdca: First version of rt715 sdw sdca codec driver")
>>
>> I have reverted that commit for today.
> 
> I'll drop this, hopefully it can be re-added in future.

We fixed this problem in October, must be a patch that wasn't merged 
while upstreaming. If you give me 2-3 hours I can send the fix.

