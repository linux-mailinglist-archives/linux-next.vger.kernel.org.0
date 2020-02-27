Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40DB6172C7E
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2020 00:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbgB0Xrp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 18:47:45 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:55856 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729796AbgB0Xrp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 18:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=28jcykxKbJYL83IzLpxZlMJpogx12W0uOAOwjpNqnaI=; b=Heq4GnYY+Oj+WGi9WwRBC2i0+a
        VDiEiN5ZK58MZelkOzLVC0Lo9BM/xYuYGNVXP9K/p+iYWu5eb46I3FZyzyBkk8Hdu4kN2zk38OXLp
        fvQmkAQ3Y4XwKGHnzDQN3O1dAnOd/DwzCVdjTkt5mmPyVOqhNwLsJsEMdWZuj9riqSmoqc1aC442E
        H3gxgwSY8w49zA/hp8CiVplCDKXUDvVhGFRh5E/z/8khTOS/dEUHq/QsNQGVmFW5r3rM7q5ARE0w1
        8ItcDm1gnyhcSAEg6Je9qtj/S+jDmNJvyotvv5BmQ9SRca38X+95XLIIA3A2Ph04JtFW58ZOaSpV+
        6k2hiJdw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j7Ssa-0005zI-WE; Thu, 27 Feb 2020 23:47:45 +0000
Subject: Re: linux-next: Tree for Feb 27 (drivers/of/unittest.c)
To:     Frank Rowand <frowand.list@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20200227152223.3d8442f0@canb.auug.org.au>
 <ed57c797-1d40-0786-2cdc-adae7047a86f@infradead.org>
 <0bd9179f-c448-c40d-f520-d568547bc810@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <63b12f5e-e5e5-a3ca-70a3-0c65075f657a@infradead.org>
Date:   Thu, 27 Feb 2020 15:47:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0bd9179f-c448-c40d-f520-d568547bc810@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/27/20 1:12 PM, Frank Rowand wrote:
> Hi Randy,
> 
> On 2/27/20 10:23 AM, Randy Dunlap wrote:
>> On 2/26/20 8:22 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200226:
>>>
>>
>> on x86_64:
>>
>> # CONFIG_GPIOLIB is not set
>>
>> ../drivers/of/unittest.c: In function ‘unittest_gpio_probe’:
>> ../drivers/of/unittest.c:94:14: error: ‘struct gpio_chip’ has no member named ‘of_node’
>>   devptr->chip.of_node = pdev->dev.of_node;
>>               ^
>> In file included from ../include/linux/kernel.h:15:0,
>>                  from ../include/asm-generic/bug.h:19,
>>                  from ../arch/x86/include/asm/bug.h:83,
>>                  from ../include/linux/bug.h:5,
>>                  from ../include/linux/mmdebug.h:5,
>>                  from ../include/linux/mm.h:9,
>>                  from ../include/linux/memblock.h:13,
>>                  from ../drivers/of/unittest.c:8:
>> ../drivers/of/unittest.c:103:73: error: ‘struct gpio_chip’ has no member named ‘of_node’
>>     "gpiochip_add_data() for node @%pOF failed, ret = %d\n", devptr->chip.of_node, ret);
>>                                                                          ^
>>
>> Full randconfig file is attached.
>>
> 
> I am trying to build a kernel with the randconfig you provided.
> 
> I am trying to figure out how to build with the exact configuration,
> but every way I've tried to build modifies the .config file.
> 
> Do you have any pointers to info on how to get the build system
> to use exactly the .config without modification?
> 
> (Just in case it is pertinent, I am using Linux 5.6-rc1 instead
> of -next.)

Hi Frank,

Yeah, I can't get 5.6-rc1 to use that same .config file either.
There are too many differences from rc1 to rc3+next and any
'make' command will automatically run oldconfig (or silentoldconfig)
to update the .config file.

-- 
~Randy

