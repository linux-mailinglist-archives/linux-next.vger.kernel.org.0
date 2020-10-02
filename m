Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E512280D8A
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 08:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgJBGhP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 02:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJBGhP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 02:37:15 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4D4C0613D0;
        Thu,  1 Oct 2020 23:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=37Og0eWGWeq4YVLKCVhVrI41YwZWtTzwTczGuBNnLts=; b=2nze4duoYFHTM/7wsBFerScghC
        LR1FFg+xNVz7Ir4UGhyjChtl9OKKAy5UNca+yKezw1ogWgs4TZwgPl68c5+mdWZYMGuxkDqWTXgh2
        hytpBgxvC8nDIAfqMsYQvsAOMSz1YZ5rviMCpSJr28zmI6hDVHPQVajgAgQ+Kee0iXr+5G80xZ7mT
        lh12FvzbzPKC+8/p9od33nTCKWc80+gQ/Ifgow4TGay/B/YMuL111lzQntIgHdl9uSi/+p2JXOlJx
        BqPM6NUxw8k0AvrxZhkmN4RV9/qfXmekLSk6xbPi6SZDJr/ae8PE0ZTvflKJrMznWbcPqIYGEDKMk
        nifipduA==;
Received: from [2601:1c0:6280:3f0::863]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kOEgq-0003Qf-4i; Fri, 02 Oct 2020 06:37:12 +0000
Subject: Re: linux-next: Tree for Oct 1 (drivers/mfd/simple-mfd-i2c.o)
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201001213929.241c1006@canb.auug.org.au>
 <0dca758e-1b61-a4cd-db12-2e2060f7cf60@infradead.org>
 <20201002063203.GP6148@dell>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5974d448-a704-fd74-704c-b902b0ac9a8f@infradead.org>
Date:   Thu, 1 Oct 2020 23:37:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002063203.GP6148@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/1/20 11:32 PM, Lee Jones wrote:
> On Thu, 01 Oct 2020, Randy Dunlap wrote:
> 
>> On 10/1/20 4:39 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200930:
>>>
>>
>> on x86_64:
>>
>> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_probe':
>> simple-mfd-i2c.c:(.text+0x48): undefined reference to `__devm_regmap_init_i2c'
>> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_init':
>> simple-mfd-i2c.c:(.init.text+0x14): undefined reference to `i2c_register_driver'
>> ld: drivers/mfd/simple-mfd-i2c.o: in function `simple_mfd_i2c_driver_exit':
>> simple-mfd-i2c.c:(.exit.text+0xd): undefined reference to `i2c_del_driver'
>>
>>
>> CONFIG_I2C=m
>> CONFIG_MFD_SIMPLE_MFD_I2C=y
>> CONFIG_MFD_SL28CPLD=y
>>
>>
>> Is linux-next missing the source code for CONFIG_MFD_SL28CPLD?
> 
> There isn't any associated source code.  It's a virtual symbol.
> 
>> The build error is caused by:
>>
>> config MFD_SL28CPLD
>> 	tristate "Kontron sl28cpld Board Management Controller"
>> 	select MFD_SIMPLE_MFD_I2C
>>
>> that "select" when "depends on I2C" is absent/missing.
> 
> Okay, so CONFIG_MFD_SIMPLE_MFD_I2C needs to depend on I2C too?  I made
> the assumption that 'select REGMAP_I2C' would do the right thing.

"select" never follows any dependency chains, so Yes, the other symbol
needs to depend on I2C also.


thanks.
-- 
~Randy

