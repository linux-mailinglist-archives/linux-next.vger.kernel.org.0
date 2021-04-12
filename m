Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D933F35CA65
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 17:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238937AbhDLPuQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 11:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238197AbhDLPuP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Apr 2021 11:50:15 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FFBC061574;
        Mon, 12 Apr 2021 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=YhGIt0sp1LY+6+VL5MEGyfiB4ctSoL5NXivfGSoUSKM=; b=Q/Cg+araSzz6KZwB65pIW4cNUk
        Fn4IvUyKE82k+UK0rI6dCOGJLqKEP1gdvkBUy7wTCPEF2i1I2alndNxLL8Bam5Ad29Ad4rGZ8566b
        4oxuuVgA9nVLfPNWe2WltOicBm7/kQuRYlfR+7ZWoyUnz6LU8m/TNK+p/HBPXtOX2w6njN4xRJLlm
        yprVHI3SSYaPsfSyg7r8yJPV50zRLtDv0CFNYuDWz8FRe4ejo9EVZbjxMhg4kKtUFtnI3yDiCGMet
        dSTsmSaQZFabd8K7wXtZMfoLzSUO7tNRPuAzoX8k5oQRp/5u5xqQPSZ3FwAZ/jrrciGGT+KllphIF
        MNQbsTPQ==;
Received: from [2601:1c0:6280:3f0::e0e1]
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lVyoy-0079wL-QS; Mon, 12 Apr 2021 15:49:54 +0000
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
 <YHPlTifk6jST5auY@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
Date:   Mon, 12 Apr 2021 08:49:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YHPlTifk6jST5auY@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/11/21 11:14 PM, Mike Rapoport wrote:
> Hi Randy,
> 
> On Sun, Apr 11, 2021 at 07:41:37PM -0700, Randy Dunlap wrote:
>> On 4/9/21 4:51 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20210408:
>>>
>>
>> Hi,
>>
>> I cannot boot linux-next 20210408 nor 20210409 on an antique
>> x86_64 laptop (Toshiba Portege).
>>
>> After many failed tests, I finally resorted to git bisect,
>> which led me to:
>>
>> # bad: [4c674481dcf9974834b96622fa4b079c176f36f9] x86/setup: Merge several reservations of start of memory
>> git bisect bad 4c674481dcf9974834b96622fa4b079c176f36f9
>>
>>
>> I reverted both of these patches and the laptop boots successfully:
>>
>> commit a799c2bd29d19c565f37fa038b31a0a1d44d0e4d
>> Author: Mike Rapoport <rppt@kernel.org>
>> Date:   Tue Mar 2 12:04:05 2021 +0200
>>
>>     x86/setup: Consolidate early memory reservations
>>
>> &&
>>
>> commit 4c674481dcf9974834b96622fa4b079c176f36f9
>> Author: Mike Rapoport <rppt@kernel.org>
>> Date:   Tue Mar 2 12:04:06 2021 +0200
>>
>>     x86/setup: Merge several reservations of start of memory
>>
>>
>> There is no (zero, nil) console display when I try to boot
>> next 0408 or 0409. I connected a USB serial debug cable and
>> booted with earlyprintk=dbgp,keep and still got nothing.
>>
>> The attached boot log is linux-next 20210409 minus the 2 patches
>> listed above.
>>
>> Mike- what data would you like to see?
> 
> Huh, with no console this would be fun :)
> For now the only idea I have is to "bisect" the changes and move
> reservations one by one back to their original place until the system boots
> again. 
> 
> I'd start with trim_snb_memory() since it's surely needed on your laptop
> and quite likely it is a NOP on other systems.
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 776fc9b3fafe..dfca9d6b1aa6 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -746,8 +746,6 @@ static void __init early_reserve_memory(void)
>  
>  	reserve_ibft_region();
>  	reserve_bios_regions();
> -
> -	trim_snb_memory();
>  }
>  
>  /*
> @@ -1081,6 +1079,8 @@ void __init setup_arch(char **cmdline_p)
>  
>  	reserve_real_mode();
>  
> +	trim_snb_memory();
> +
>  	init_mem_mapping();
>  
>  	idt_setup_early_pf();
>  
>> -- 

Hi Mike,
That works fine.
Can you provide another/next step?

If not, I'll try a few things.

thanks.
-- 
~Randy

