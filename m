Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815F52AA069
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 23:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728794AbgKFWbz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 17:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbgKFWby (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 17:31:54 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7539AC0613CF;
        Fri,  6 Nov 2020 14:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=uKFp6ndH5gt97JZMTQlnD2RC9vnO3OIFv4HmGm7a2e4=; b=Fn6oKQaK7vWLVZGa5Y+vMLjcC3
        Xd70zDJFJ1djl7SvZL0cpf9YV4Z3sTJaUBJVnp9MKc3omKtXSOa98pCk1CgKbfE0utgIJXPAXkCxV
        zMU6Ysxye5xQxqZq7w6U4li7hRMgZyThYBrkSVST/mrI0gWGHzEI9eviMrsyzgMaywUbpRosFlXrH
        7lHmfCkjCf5ymOap1etR2B9Htkha0CX+/ABFWji7i4Wrqmy+1qpM+PtluPjE7eOJ4ePvQlA/AuVQR
        VmhaDw1kHAvfFkTcnbDHOsl8VdonN8e88XmWbQiKquXhSHv4bU+U2hmr3KVKNxfBXgsPFxeF86v1v
        FXzVntrA==;
Received: from [2601:1c0:6280:3f0::a1cb]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kbAGn-0007ZG-BZ; Fri, 06 Nov 2020 22:31:45 +0000
Subject: Re: [Sound-open-firmware] linux-next: Tree for Nov 6
 (sound/soc/sof/sof-pci-dev.o)
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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
 <7505ed68-f12b-d1d9-12e5-f8ae34a74ebd@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0e8f0a8b-60c4-d146-90a2-a972d1748a4c@infradead.org>
Date:   Fri, 6 Nov 2020 14:31:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7505ed68-f12b-d1d9-12e5-f8ae34a74ebd@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/6/20 12:53 PM, Pierre-Louis Bossart wrote:
> 
>> on x86_64:
>>
>> ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
>> sof-pci-dev.c:(.text+0x5c): undefined reference to `snd_intel_dsp_driver_probe'
>>
>>
>> Full randconfig file is attached.
> 
> Nice catch, thanks Randy! Looks like we put the select SND_INTEL_DSP_CONFIG in the wrong place, it's not dependent on the HDaudio link being selected. Clearly a bug we've had for a while.
> 
> The diff below makes the error go away but I have to run it past folks who are already enjoying their week-end. Will follow-up next week with a proper fix.

Works for me. You can have an Ack if you use this patch.
Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index a066e08860cb..5bfc2f8b13b9 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -271,6 +271,7 @@ config SND_SOC_SOF_JASPERLAKE
> 
>  config SND_SOC_SOF_HDA_COMMON
>         tristate
> +       select SND_INTEL_DSP_CONFIG
>         select SND_SOC_SOF_INTEL_COMMON
>         select SND_SOC_SOF_HDA_LINK_BASELINE
>         help
> @@ -330,7 +331,6 @@ config SND_SOC_SOF_HDA
>         tristate
>         select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
>         select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
> -       select SND_INTEL_DSP_CONFIG
>         help
>           This option is not user-selectable but automagically handled by
>           'select' statements at a higher level
> 
> 


-- 
~Randy
