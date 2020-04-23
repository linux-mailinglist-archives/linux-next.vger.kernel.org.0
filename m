Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12E931B5B5A
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 14:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgDWM0e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Apr 2020 08:26:34 -0400
Received: from mga06.intel.com ([134.134.136.31]:62016 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgDWM0d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Apr 2020 08:26:33 -0400
IronPort-SDR: /sihSxZVvuDj6/0YsQxdBiFJ6ROFhR+PnSXIfJecDVMONCIbYSafRZ0b47QrXYUVgoChQo3WxY
 Dc2rsZXCcWdg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 05:26:33 -0700
IronPort-SDR: gFk0zFCNkZPm9QNMJ8rY7QXqd35COTkC6c1cVd+Rj7Ey+G/MP3RMx2ZVo6uTtEXNx+YUIz3qrA
 p7xGQ7cYZXkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="259407494"
Received: from zzhang7-mobl1.amr.corp.intel.com (HELO [10.255.73.51]) ([10.255.73.51])
  by orsmga006.jf.intel.com with ESMTP; 23 Apr 2020 05:26:32 -0700
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
References: <20200423155539.4492a0cc@canb.auug.org.au>
 <20200423113041.GI4808@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <00f801fc-cf1c-8ea0-3d2a-0c8e902dd1f0@linux.intel.com>
Date:   Thu, 23 Apr 2020 07:26:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423113041.GI4808@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 4/23/20 6:30 AM, Mark Brown wrote:
> On Thu, Apr 23, 2020 at 03:55:39PM +1000, Stephen Rothwell wrote:
> 
>> Presumably caused by (one of) commits
> 
>>    fe17e6cdc0fe ("ASoC: SOF: imx8: Fix randbuild error")
>>    cb0312f61c3e ("ASoC: SOF: imx: fix undefined reference issue")
> 
>> I just removed the COMPILE_TEST from SND_SOC_SOF_IMX_TOPLEVEL for today.
> 
> It looks like this is triggered by PowerPC not including
> drivers/firmware - there are missing dependencies but it works for other
> all*configs since the dependencies all get built in those.  It would be
> helpful if PowerPC were fixed to include the firmware directory to
> improve coverage.

We have a fix for this, I'll send it later today. There were still unmet 
dependencies and inconsistent use of select/depends.
