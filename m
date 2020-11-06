Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2532A9EB9
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 21:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgKFUxk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 15:53:40 -0500
Received: from mga14.intel.com ([192.55.52.115]:24108 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728511AbgKFUxk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 6 Nov 2020 15:53:40 -0500
IronPort-SDR: Txzl4oQdJjMapO7MuXuysByzUS6hjCp02FZwxUtJmhv4fDNjkEH93x8NyGWOh4iNIbVEikykqk
 ImkYoRnqkVqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="168817198"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="168817198"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 12:53:39 -0800
IronPort-SDR: cTbL18lfulNcLJmvQWPDsKkw80vKqGvrKJ1War0IGT0MISwf2SezEohYDHuRWS1BQz2bSnTo+z
 ut12zaw/g3Jg==
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="353483936"
Received: from sfkampme-mobl1.amr.corp.intel.com (HELO [10.212.181.142]) ([10.212.181.142])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 12:53:39 -0800
Subject: Re: [Sound-open-firmware] linux-next: Tree for Nov 6
 (sound/soc/sof/sof-pci-dev.o)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        sound-open-firmware@alsa-project.org,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>
References: <20201106171834.64e4d6d5@canb.auug.org.au>
 <0a66a2b1-85b6-3515-47f4-2e861b991386@infradead.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7505ed68-f12b-d1d9-12e5-f8ae34a74ebd@linux.intel.com>
Date:   Fri, 6 Nov 2020 14:53:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a66a2b1-85b6-3515-47f4-2e861b991386@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


> on x86_64:
> 
> ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
> sof-pci-dev.c:(.text+0x5c): undefined reference to `snd_intel_dsp_driver_probe'
> 
> 
> Full randconfig file is attached.

Nice catch, thanks Randy! Looks like we put the select 
SND_INTEL_DSP_CONFIG in the wrong place, it's not dependent on the 
HDaudio link being selected. Clearly a bug we've had for a while.

The diff below makes the error go away but I have to run it past folks 
who are already enjoying their week-end. Will follow-up next week with a 
proper fix.

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index a066e08860cb..5bfc2f8b13b9 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -271,6 +271,7 @@ config SND_SOC_SOF_JASPERLAKE

  config SND_SOC_SOF_HDA_COMMON
         tristate
+       select SND_INTEL_DSP_CONFIG
         select SND_SOC_SOF_INTEL_COMMON
         select SND_SOC_SOF_HDA_LINK_BASELINE
         help
@@ -330,7 +331,6 @@ config SND_SOC_SOF_HDA
         tristate
         select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
         select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
-       select SND_INTEL_DSP_CONFIG
         help
           This option is not user-selectable but automagically handled by
           'select' statements at a higher level


