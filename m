Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF2E28528B
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 21:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgJFTgC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 15:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgJFTgC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 15:36:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8E3C061755;
        Tue,  6 Oct 2020 12:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=DJKJ8r3sz1KNUVoUA6+L/JRy5qYNTx6QHmLO0xUeMgk=; b=bIBEUHlO2Zq+nAPOB1WSpZCB+L
        fOiT5gyGLPR/t2q6QgJyPt4+h6c6MpfaDpfQy/kiWI2E6hOD6cG/gaWefTPn08AMySXjTNO5ms8rq
        UBHuRU75A7LtqJI+NvrAoKOQCxG74VOLFnd5QHz7YTDqMUQMDhWnJo+58CDFoNYYR2m4zUGqkYW/X
        LB/UcFaj431QMvXb5NJIF6w73YmfK4F6JqD3CyUYC7CTg6YrPgiK0vhZ9rqoY8SZ0YMMmQgTkUT9x
        zdwKWHZHjdVKznoG03Hkk5nF+OzekKsyjOCrMDc+Zuxr4OLvNCYt1VoUVkKA5LV0QLBI7n2rdUfZy
        XJuNDiZQ==;
Received: from [2601:1c0:6280:3f0::2c9a]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kPskc-0007RY-3H; Tue, 06 Oct 2020 19:35:54 +0000
Subject: Re: linux-next: Tree for Oct 6 (sound/soc/intel/catpt/device.c)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>
References: <20201006231234.701591b5@canb.auug.org.au>
 <0d1072b7-c57c-6a50-0561-389ad6a3e414@infradead.org>
Message-ID: <3cb00b47-2143-e867-433d-4e8ba026cb90@infradead.org>
Date:   Tue, 6 Oct 2020 12:35:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0d1072b7-c57c-6a50-0561-389ad6a3e414@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/6/20 11:54 AM, Randy Dunlap wrote:
> On 10/6/20 5:12 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20201002:
>>
> 
> on x86_64 or i386:
> when CONFIG_MODULES is not set/enabled:
> 
> ../sound/soc/intel/catpt/device.c: In function ‘catpt_resume’:
> ../sound/soc/intel/catpt/device.c:84:7: error: implicit declaration of function ‘module_is_live’; did you mean ‘module_driver’? [-Werror=implicit-function-declaration]
>   if (!module_is_live(dev->driver->owner)) {
>        ^~~~~~~~~~~~~~
>        module_driver
> 
> 
> You could see
> commit cdb685cb9158fa67f6f4584ea39279ed7ae39253
> Author: Danil Kipnis <danil.kipnis@cloud.ionos.com>
> Date:   Thu May 21 20:59:09 2020 +0200
> 
>     RDMA/rnbd: Fix compilation error when CONFIG_MODULES is disabled
> 
> for a possible fix.
> 

I also just saw this:

WARNING: unmet direct dependencies detected for DW_DMAC_CORE
  Depends on [n]: DMADEVICES [=n]
  Selected by [y]:
  - SND_SOC_INTEL_CATPT [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_SST_TOPLEVEL [=y] && (ACPI [=n] || COMPILE_TEST [=y]) && SND_DMA_SGBUF [=y]

so SND_SOC_INTEL_CATPT should also depend on DMADEVICES.


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
