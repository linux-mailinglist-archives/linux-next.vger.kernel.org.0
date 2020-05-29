Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6551E802F
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 16:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgE2O1Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 10:27:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:62851 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726923AbgE2O1Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 29 May 2020 10:27:24 -0400
IronPort-SDR: Ubgwm4P5bPNqt3DNWrTkbDnrzTtlAjw7ao+XhDWez962qdten9uC8r0jX2g17jF39n0c/lmgHN
 bo4EGxdOWnSw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 07:27:24 -0700
IronPort-SDR: Vd4cHwdCSD41QVmBPRnZxtiMMBOnR5zGAB92AwuMWJs+3yOBSYDFY22XhV4JY0RXDb9aXYOgHm
 CTj6GJBRAPRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; 
   d="scan'208";a="257346991"
Received: from glmisa-mobl1.amr.corp.intel.com (HELO [10.251.9.114]) ([10.251.9.114])
  by fmsmga008.fm.intel.com with ESMTP; 29 May 2020 07:27:23 -0700
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <20200528135717.3e2d5169@canb.auug.org.au>
 <20200529133054.GN4610@sirena.org.uk>
 <51d951b7-f31a-35e4-589b-a538e3a030ba@linux.intel.com>
Message-ID: <7ce2c17e-f3b1-fb09-f809-57ecde8664f1@linux.intel.com>
Date:   Fri, 29 May 2020 09:27:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <51d951b7-f31a-35e4-589b-a538e3a030ba@linux.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 5/29/20 8:55 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/29/20 8:30 AM, Mark Brown wrote:
>> On Thu, May 28, 2020 at 01:57:17PM +1000, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the sound-asoc tree, today's linux-next build (x86_64
>>> allmodconfig) produced this warning:
>>>
>>> sound/soc/sof/intel/byt.c:464:12: warning: 'byt_remove' defined but 
>>> not used [-Wunused-function]
>>>    464 | static int byt_remove(struct snd_sof_dev *sdev)
>>>        |            ^~~~~~~~~~
>>> sound/soc/sof/intel/byt.c:454:12: warning: 'byt_resume' defined but 
>>> not used [-Wunused-function]
>>>    454 | static int byt_resume(struct snd_sof_dev *sdev)
>>>        |            ^~~~~~~~~~
>>> sound/soc/sof/intel/byt.c:447:12: warning: 'byt_suspend' defined but 
>>> not used [-Wunused-function]
>>>    447 | static int byt_suspend(struct snd_sof_dev *sdev, u32 
>>> target_state)
>>>        |            ^~~~~~~~~~~
>>>
>>> Introduced by commits
>>>
>>>    ddcccd543f5d ("ASoC: SOF: Intel: byt: Add PM callbacks")
>>>    c691f0c6e267 ("ASoC: SOF: Intel: BYT: add .remove op")
>>
>> Ranjani, Pierre?
> 
> Humm, I am not sure what happened here or why kbuild didn't report this 
> earlier. This was added in
> 
> ddcccd543f5dbd ('ASoC: SOF: Intel: byt: Add PM callbacks')
> 
> And I do see them used in the code:
> 
> sound/soc/sof/intel/byt.c
> 
>      /* PM */
>      .suspend = byt_suspend,
>      .resume = byt_resume,
> 
> Will run a check and fix ASAP, my guess it's a Kconfig issue or the 
> functions not protected by the usual SND_SOC_SOF_BAYTRAIL.

it's both. allmodconfig disables SND_SOC_SOF_BAYTRAIL due to mutual 
exclusion with the legacy driver, but enables SND_SOC_SOF_MERRIFIELD 
(this should be fixed in a separate patch) and in this case we haven't 
tested suspend/resume on merrifield so didn't use this code. Will send a 
patch shortly.
