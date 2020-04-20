Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F6E1B0D14
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 15:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbgDTNqL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 09:46:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:2419 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgDTNqK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 09:46:10 -0400
IronPort-SDR: aetgUe4Rqc1vqtAFF1LKm3PYmrR0/PJuvDqQBQaS+0eHy1mGAmxMDgGj3nkLyzcsoL2GwD9kNh
 i/9hxBJxvfzg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 06:46:09 -0700
IronPort-SDR: 1YErZVp17AT81ueYfmLyxl8OVkXE568E5vDmzNW6ZfxrwHXYz/y0+7gGoYzB8XPKixV/CxDvPh
 FOz+2/DC8oAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="333930677"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.157]) ([10.237.72.157])
  by orsmga001.jf.intel.com with ESMTP; 20 Apr 2020 06:46:07 -0700
Subject: Re: linux-next: Tree for Apr 17 (mmc/host/sdhci-of-at91.c)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        linux-mmc <linux-mmc@vger.kernel.org>
References: <20200417145017.3932443d@canb.auug.org.au>
 <995a958c-15a1-cb05-e276-065c7f6e57fd@infradead.org>
 <CAPDyKFqE7zfaKSbpBoBbrSCEnx+70dOrWs+=QG_x2G-Fpt6=ng@mail.gmail.com>
 <ce11a0b5-22a6-dd18-f858-5d30f43e1128@intel.com>
 <CAK7LNARCT3YQEnVE0NMCphSuqvjLoG2EXdpdcAZuoEOD_mFyEw@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <60d26835-245f-9f47-3027-39710d28db74@intel.com>
Date:   Mon, 20 Apr 2020 16:45:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARCT3YQEnVE0NMCphSuqvjLoG2EXdpdcAZuoEOD_mFyEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20/04/20 3:27 pm, Masahiro Yamada wrote:
> On Mon, Apr 20, 2020 at 7:28 PM Adrian Hunter <adrian.hunter@intel.com> wrote:
>>
>> On 20/04/20 12:12 pm, Ulf Hansson wrote:
>>> + Masahiro Yamada, Adrian Hunter
>>>
>>> On Fri, 17 Apr 2020 at 16:48, Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>
>>>> On 4/16/20 9:50 PM, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20200416:
>>>>>
>>>>
>>>> on i386:
>>>>
>>>>   CC      drivers/mmc/host/sdhci-of-at91.o
>>>> In file included from ../include/linux/build_bug.h:5:0,
>>>>                  from ../include/linux/bitfield.h:10,
>>>>                  from ../drivers/mmc/host/sdhci-of-at91.c:9:
>>>> ../drivers/mmc/host/sdhci-of-at91.c: In function ‘sdhci_at91_set_clks_presets’:
>>>> ../include/linux/compiler.h:394:38: error: call to ‘__compiletime_assert_63’ declared with attribute error: FIELD_PREP: value too large for the field
>>>>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>>>                                       ^
>>>> ../include/linux/compiler.h:375:4: note: in definition of macro ‘__compiletime_assert’
>>>>     prefix ## suffix();    \
>>>>     ^~~~~~
>>>> ../include/linux/compiler.h:394:2: note: in expansion of macro ‘_compiletime_assert’
>>>>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>>>   ^~~~~~~~~~~~~~~~~~~
>>>> ../include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
>>>>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>>>                                      ^~~~~~~~~~~~~~~~~~
>>>> ../include/linux/bitfield.h:49:3: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
>>>>    BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
>>>>    ^~~~~~~~~~~~~~~~
>>>> ../include/linux/bitfield.h:94:3: note: in expansion of macro ‘__BF_FIELD_CHECK’
>>>>    __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
>>>>    ^~~~~~~~~~~~~~~~
>>>> ../drivers/mmc/host/sdhci-of-at91.c:185:11: note: in expansion of macro ‘FIELD_PREP’
>>>>   caps1 |= FIELD_PREP(SDHCI_CLOCK_MUL_MASK, clk_mul);
>>
>> My guess is the compiler has decided clk_mul is constant (probably (unsigned
>> int)-1) because there is no CONFIG_COMMON_CLK i.e. clk_get_rate() is 0
>>
>> So maybe add to config MMC_SDHCI_OF_AT91
>>
>>         depends on COMMON_CLK
>>
>>>>            ^~~~~~~~~~
> 
> 
> 
> I checked include/linux/clk.h
> 
> 
> clk_get_rate() is guarded by CONFIG_HAVE_CLK.
> 
> I think
> 
>     depends on HAVE_CLK

Okay
