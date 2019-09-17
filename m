Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8292FB573C
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 22:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbfIQU44 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 16:56:56 -0400
Received: from mga14.intel.com ([192.55.52.115]:23766 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729898AbfIQU44 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Sep 2019 16:56:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Sep 2019 13:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,518,1559545200"; 
   d="scan'208";a="387693269"
Received: from dlinn-mobl.amr.corp.intel.com (HELO [10.251.154.92]) ([10.251.154.92])
  by fmsmga006.fm.intel.com with ESMTP; 17 Sep 2019 13:56:55 -0700
Subject: Re: [alsa-devel] Build failure after merge of the sound-current
To:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Mac Chiang <mac.chiang@intel.com>
Cc:     alsa-devel@alsa-project.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
References: <20190917103858.GA3524@sirena.co.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a71b94b7-7692-2f12-8568-488bf845742c@linux.intel.com>
Date:   Tue, 17 Sep 2019 15:56:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917103858.GA3524@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 9/17/19 5:38 AM, Mark Brown wrote:
> After merging the sound-current tree, today's linux-next build for x86
> allmodconfig failed like this:
> 
> In file included from /home/broonie/next/next/sound/soc/intel/boards/sof_rt5682.c:23:
> /home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h: In function 'soc_intel_is_cml':
> /home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: error: 'INTEL_FAM6_KABYLAKE_MOBILE' undeclared (first use in this function); did you mean 'INTEL_FAM6_KABYLAKE_L'?
>   SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);

> caused by commit
> 
> 	c643c189f0fec116 (ASoC: Intel: boards: Add Cometlake machine driver support)
> 
> IIRC there was some previous discussion of a dependency on other changes
> here but I thought that was resolved?  I've reverted that commit for
> today.

Seems like a conflict with

af239c44e3f97 ('x86/intel: Aggregate big core mobile naming')

maybe we can have a temporary fix in the ASoC tree along the lines of

#ifdef INTEL_FAM6_KABYLAKE_L
#define INTEL_FAM6_KABYLAKE_MOBILE	INTEL_FAM6_KABYLAKE_L
#endif

and remove it when the initial patch is in an rc1?
