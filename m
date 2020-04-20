Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF1B1B0698
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 12:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgDTK26 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 06:28:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:24690 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgDTK25 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 06:28:57 -0400
IronPort-SDR: cxKonAg+3BbLhdUwiJZXNL2JnQ3xGeubqdBCn15JAaD1b8dOIAZejrvffOAlJaEr8trFGDRma/
 CsADFAUIl2qg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 03:28:56 -0700
IronPort-SDR: iHULl3pxbtqQ1MqumC0TUlV1+InpWyde7JALFkMK93zTjHDxNzzjlKzi+4FW1T4iQh1UI5UnhB
 XnHAlzl8Wzbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,406,1580803200"; 
   d="scan'208";a="243766286"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.157]) ([10.237.72.157])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2020 03:28:54 -0700
Subject: Re: linux-next: Tree for Apr 17 (mmc/host/sdhci-of-at91.c)
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@atmel.com>,
        linux-mmc <linux-mmc@vger.kernel.org>
References: <20200417145017.3932443d@canb.auug.org.au>
 <995a958c-15a1-cb05-e276-065c7f6e57fd@infradead.org>
 <CAPDyKFqE7zfaKSbpBoBbrSCEnx+70dOrWs+=QG_x2G-Fpt6=ng@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <ce11a0b5-22a6-dd18-f858-5d30f43e1128@intel.com>
Date:   Mon, 20 Apr 2020 13:28:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqE7zfaKSbpBoBbrSCEnx+70dOrWs+=QG_x2G-Fpt6=ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20/04/20 12:12 pm, Ulf Hansson wrote:
> + Masahiro Yamada, Adrian Hunter
> 
> On Fri, 17 Apr 2020 at 16:48, Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 4/16/20 9:50 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200416:
>>>
>>
>> on i386:
>>
>>   CC      drivers/mmc/host/sdhci-of-at91.o
>> In file included from ../include/linux/build_bug.h:5:0,
>>                  from ../include/linux/bitfield.h:10,
>>                  from ../drivers/mmc/host/sdhci-of-at91.c:9:
>> ../drivers/mmc/host/sdhci-of-at91.c: In function ‘sdhci_at91_set_clks_presets’:
>> ../include/linux/compiler.h:394:38: error: call to ‘__compiletime_assert_63’ declared with attribute error: FIELD_PREP: value too large for the field
>>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>                                       ^
>> ../include/linux/compiler.h:375:4: note: in definition of macro ‘__compiletime_assert’
>>     prefix ## suffix();    \
>>     ^~~~~~
>> ../include/linux/compiler.h:394:2: note: in expansion of macro ‘_compiletime_assert’
>>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>   ^~~~~~~~~~~~~~~~~~~
>> ../include/linux/build_bug.h:39:37: note: in expansion of macro ‘compiletime_assert’
>>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>>                                      ^~~~~~~~~~~~~~~~~~
>> ../include/linux/bitfield.h:49:3: note: in expansion of macro ‘BUILD_BUG_ON_MSG’
>>    BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
>>    ^~~~~~~~~~~~~~~~
>> ../include/linux/bitfield.h:94:3: note: in expansion of macro ‘__BF_FIELD_CHECK’
>>    __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
>>    ^~~~~~~~~~~~~~~~
>> ../drivers/mmc/host/sdhci-of-at91.c:185:11: note: in expansion of macro ‘FIELD_PREP’
>>   caps1 |= FIELD_PREP(SDHCI_CLOCK_MUL_MASK, clk_mul);

My guess is the compiler has decided clk_mul is constant (probably (unsigned
int)-1) because there is no CONFIG_COMMON_CLK i.e. clk_get_rate() is 0

So maybe add to config MMC_SDHCI_OF_AT91

	depends on COMMON_CLK

>>            ^~~~~~~~~~
>>
>>
>> Full randconfig file is attached.
>>
>>
>> --
>> ~Randy
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks for reporting! I have looped in the relevant people, let's see
> how we move forward with this.
> 
> I assume the offending commit is this one:
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Wed Apr 8 16:21:05 2020 +0900
> mmc: sdhci: use FIELD_GET/PREP for capabilities bit masks
> 
> Kind regards
> Uffe
> 

