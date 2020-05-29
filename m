Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCE591E7F58
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 15:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgE2Nzt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 09:55:49 -0400
Received: from mga03.intel.com ([134.134.136.65]:11184 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726965AbgE2Nzs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 09:55:48 -0400
IronPort-SDR: 0uCEDg2PM7an/i8S8NJlOJ8gVAJvbKUYMAZsn/LW3/6KaDZvS37Q84acFi/nVNKZYRFbI1YHaS
 /Qb0wsGFrinQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 06:55:48 -0700
IronPort-SDR: 68woBhYwyCb/XPXcZ4/cDoImYUxmuy0sIQn2hcjALc0Gx5CtwOS4ScXcytAZEUbe/+B+jII/4c
 g/ZQbyJHQzfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; 
   d="scan'208";a="257341074"
Received: from glmisa-mobl1.amr.corp.intel.com (HELO [10.251.9.114]) ([10.251.9.114])
  by fmsmga008.fm.intel.com with ESMTP; 29 May 2020 06:55:47 -0700
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20200528135717.3e2d5169@canb.auug.org.au>
 <20200529133054.GN4610@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <51d951b7-f31a-35e4-589b-a538e3a030ba@linux.intel.com>
Date:   Fri, 29 May 2020 08:55:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529133054.GN4610@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 5/29/20 8:30 AM, Mark Brown wrote:
> On Thu, May 28, 2020 at 01:57:17PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the sound-asoc tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> sound/soc/sof/intel/byt.c:464:12: warning: 'byt_remove' defined but not used [-Wunused-function]
>>    464 | static int byt_remove(struct snd_sof_dev *sdev)
>>        |            ^~~~~~~~~~
>> sound/soc/sof/intel/byt.c:454:12: warning: 'byt_resume' defined but not used [-Wunused-function]
>>    454 | static int byt_resume(struct snd_sof_dev *sdev)
>>        |            ^~~~~~~~~~
>> sound/soc/sof/intel/byt.c:447:12: warning: 'byt_suspend' defined but not used [-Wunused-function]
>>    447 | static int byt_suspend(struct snd_sof_dev *sdev, u32 target_state)
>>        |            ^~~~~~~~~~~
>>
>> Introduced by commits
>>
>>    ddcccd543f5d ("ASoC: SOF: Intel: byt: Add PM callbacks")
>>    c691f0c6e267 ("ASoC: SOF: Intel: BYT: add .remove op")
> 
> Ranjani, Pierre?

Humm, I am not sure what happened here or why kbuild didn't report this 
earlier. This was added in

ddcccd543f5dbd ('ASoC: SOF: Intel: byt: Add PM callbacks')

And I do see them used in the code:

sound/soc/sof/intel/byt.c

	/* PM */
	.suspend = byt_suspend,
	.resume = byt_resume,

Will run a check and fix ASAP, my guess it's a Kconfig issue or the 
functions not protected by the usual SND_SOC_SOF_BAYTRAIL.

