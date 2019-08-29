Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 680EBA1E6C
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 17:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbfH2PIX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 11:08:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:40516 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727115AbfH2PIX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 11:08:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 691F7B681;
        Thu, 29 Aug 2019 15:08:21 +0000 (UTC)
Date:   Thu, 29 Aug 2019 17:08:21 +0200
Message-ID: <s5hzhjs102i.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, akpm@linux-foundation.org,
        broonie@kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] mmotm 2019-08-27-20-39 uploaded       (sound/hda/intel-nhlt.c)
In-Reply-To: <19edfb9a-f7b3-7a89-db5a-33289559aeef@linux.intel.com>
References: <20190828034012.sBvm81sYK%akpm@linux-foundation.org>
        <274054ef-8611-2661-9e67-4aabae5a7728@infradead.org>
        <5ac8a7a7-a9b4-89a5-e0a6-7c97ec1fabc6@linux.intel.com>
        <98ada795-4700-7fcc-6d14-fcc1ab25d509@infradead.org>
        <f0a62b08-cba9-d944-5792-8eac0ea39df1@linux.intel.com>
        <19edfb9a-f7b3-7a89-db5a-33289559aeef@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 29 Aug 2019 00:45:05 +0200,
Pierre-Louis Bossart wrote:
> 
> 
> >>> I just checked with Mark Brown's for-next tree
> >>> 8aceffa09b4b9867153bfe0ff6f40517240cee12
> >>> and things are fine in i386 mode, see below.
> >>>
> >>> next-20190828 also works fine for me in i386 mode.
> >>>
> >>> if you can point me to a tree and configuration that don't work
> >>> I'll look into this, I'd need more info to progress.
> >>
> >> Please try the attached randconfig file.
> >>
> >> Thanks for looking.
> >
> > Ack, I see some errors as well with this config. Likely a missing
> > dependency somewhere, working on this now.
> 
> My bad, I added a fallback with static inline functions in the .h file
> when ACPI is not defined, but the .c file was still compiled.
> 
> The diff below makes next-20190828 compile with Randy's config.

IMO, we need to fix the site that enables this config.  i.e.
the "select SND_INTEL_NHLT" must be always conditional, e.g.
	select SND_INTEL_NHLT if ACPI

> It looks like the alsa-devel server is down btw?

Now it seems starting again.


thanks,

Takashi

> diff --git a/sound/hda/Makefile b/sound/hda/Makefile
> index 8560f6ef1b19..b3af071ce06b 100644
> --- a/sound/hda/Makefile
> +++ b/sound/hda/Makefile
> @@ -14,5 +14,7 @@ obj-$(CONFIG_SND_HDA_CORE) += snd-hda-core.o
>  #extended hda
>  obj-$(CONFIG_SND_HDA_EXT_CORE) += ext/
> 
> +ifdef CONFIG_ACPI
>  snd-intel-nhlt-objs := intel-nhlt.o
>  obj-$(CONFIG_SND_INTEL_NHLT) += snd-intel-nhlt.o
> +endif
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
