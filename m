Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2582C8C9E
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 19:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbgK3SXD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 13:23:03 -0500
Received: from mga18.intel.com ([134.134.136.126]:7420 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbgK3SXD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 13:23:03 -0500
IronPort-SDR: b4pAO/PTea1OMqhzoIX8zrsPM+j2dYiLos72pFBNiITvWU4SQiuXSIkEQr+x2OQ5VxcEF7l3HL
 bHMbsrsd0k4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="160457979"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="160457979"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:21:22 -0800
IronPort-SDR: agoqGHw3SvhcUS5rLikiTY02zpHMiKsREORD0m+A1d98WBzKUX/tqcACxlnJ/v1+GpuudT8fa+
 Dibyeuhc8Blg==
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; 
   d="scan'208";a="364350824"
Received: from clord1-mobl1.amr.corp.intel.com (HELO [10.209.130.46]) ([10.209.130.46])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 10:21:21 -0800
Subject: Re: linux-next: build failure after merge of the regmap tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jack Yu <jack.yu@realtek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201127182411.07c15471@canb.auug.org.au>
 <20201130175937.GA37431@sirena.org.uk>
 <6e2ff635-dfb0-b795-0519-9131df037150@linux.intel.com>
 <20201130181129.GE4756@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <37c13527-2a6a-86f7-36f7-76c4635e833d@linux.intel.com>
Date:   Mon, 30 Nov 2020 12:21:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130181129.GE4756@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



>>> I'll drop this, hopefully it can be re-added in future.
> 
>> We fixed this problem in October, must be a patch that wasn't merged while
>> upstreaming. If you give me 2-3 hours I can send the fix.
> 
> I already pushed out the revert (but we can re-apply), and I'm also
> about to send another mail about how I can't build any of the other
> drivers separately which was why it was only this one that got applied
> in the first case.

Sounds like we'll submit a v2 then, we've got small additional fixes 
that were added for UCM integration. Sorry for the noise and delays in 
responding with last week's break.
