Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476FA1A9184
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 05:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730847AbgDOD2P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 23:28:15 -0400
Received: from mga06.intel.com ([134.134.136.31]:11625 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727892AbgDOD2P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 23:28:15 -0400
IronPort-SDR: M/AJ0EAN852Cj9FlDZFXOzZt1QsyjI1lfgOnmKoWczTk20UElZ0D/2xkijEzyqxlyB2z2uKXfr
 +it+oRIpXqlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 20:28:13 -0700
IronPort-SDR: 6mikhZX4YlawlkLmapDZYua/68wWKiO0WVIsxgOlrcBFuuVTi87P1ABA/cvUbU2eB8BvTWSdva
 +G2Ha1cb2gNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; 
   d="scan'208";a="298883328"
Received: from pazucen-mobl.amr.corp.intel.com (HELO [10.209.38.34]) ([10.209.38.34])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2020 20:28:12 -0700
Subject: Re: linux-next: build failures after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hui Wang <hui.wang@canonical.com>,
        Rander Wang <rander.wang@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bard liao <yung-chuan.liao@linux.intel.com>
References: <20200415121521.3e40b591@canb.auug.org.au>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f73485eb-c0c8-c557-7491-5daabce4d3de@linux.intel.com>
Date:   Tue, 14 Apr 2020 22:28:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200415121521.3e40b591@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 4/14/20 9:15 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the sound-asoc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/soc/intel/boards/skl_hda_dsp_generic.c: In function 'skl_set_hda_codec_autosuspend_delay':
> sound/soc/intel/boards/skl_hda_dsp_generic.c:178:37: error: 'struct snd_soc_pcm_runtime' has no member named 'codec_dai'
>    178 |  struct snd_soc_dai *codec_dai = rtd->codec_dai;

Yes, I just sent a fix for this.

>        |                                     ^~
> drivers/soundwire/intel.c: In function 'sdw_stream_setup':
> drivers/soundwire/intel.c:672:39: error: 'struct snd_soc_pcm_runtime' has no member named 'codec_dais'
>    672 |   ret = snd_soc_dai_set_sdw_stream(rtd->codec_dais[i], sdw_stream,
>        |                                       ^~
> In file included from include/linux/device.h:15,
>                   from include/linux/acpi.h:15,
>                   from drivers/soundwire/intel.c:8:
> drivers/soundwire/intel.c:676:8: error: 'struct snd_soc_pcm_runtime' has no member named 'codec_dais'
>    676 |     rtd->codec_dais[i]->name);

Bard, can you take care of the SoundWire change - this needs to change 
to asoc_rtd_to_codec(rtd, i)

Thanks!

