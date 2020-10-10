Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266BE28A040
	for <lists+linux-next@lfdr.de>; Sat, 10 Oct 2020 13:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgJJLfr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 10 Oct 2020 07:35:47 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:33306 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728618AbgJJKUD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 10 Oct 2020 06:20:03 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 18B378A4D91A19AD4512;
        Sat, 10 Oct 2020 18:01:52 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.134) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Sat, 10 Oct 2020
 18:01:48 +0800
Subject: Re: linux-next: manual merge of the devicetree tree with the mfd tree
To:     Rob Herring <robherring2@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
References: <20201001162237.633d6043@canb.auug.org.au>
 <CAJKOXPdyCYkSE1ie_t5G5X4JStU0zxxuoovLFnUxJP4aQbvM=g@mail.gmail.com>
 <CAL_JsqKKaStNsDxfJw0UOzU6rTyeeJtVkaE4-nJXKHA5A1pOLg@mail.gmail.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <4ecdefed-c047-a318-a3bf-14bc4bc50b23@huawei.com>
Date:   Sat, 10 Oct 2020 18:01:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKKaStNsDxfJw0UOzU6rTyeeJtVkaE4-nJXKHA5A1pOLg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020/10/1 20:31, Rob Herring wrote:
> On Thu, Oct 1, 2020 at 1:26 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Thu, 1 Oct 2020 at 08:22, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Hi all,
>>>
>>> Today's linux-next merge of the devicetree tree got a conflict in:
>>>
>>>   Documentation/devicetree/bindings/mfd/syscon.yaml
>>>
>>> between commit:
>>>
>>>   18394297562a ("dt-bindings: mfd: syscon: Merge Samsung Exynos Sysreg bindings")
>>>   05027df1b94f ("dt-bindings: mfd: syscon: Document Exynos3 and Exynos5433 compatibles")
>>>
>>> from the mfd tree and commit:
>>>
>>>   35b096dd6353 ("dt-bindings: mfd: syscon: add some compatible strings for Hisilicon")
>>>
>>> from the devicetree tree.
>>>
>>> I fixed it up (see below) and can carry the fix as necessary. This
>>> is now fixed as far as linux-next is concerned, but any non trivial
>>> conflicts should be mentioned to your upstream maintainer when your tree
>>> is submitted for merging.  You may also want to consider cooperating
>>> with the maintainer of the conflicting tree to minimise any particularly
>>> complex conflicts.
>>>
>>> --
>>> Cheers,
>>> Stephen Rothwell
>>>
>>> diff --cc Documentation/devicetree/bindings/mfd/syscon.yaml
>>> index 0f21943dea28,fc2e85004d36..000000000000
>>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>>> @@@ -40,11 -40,10 +40,14 @@@ properties
>>>                 - allwinner,sun50i-a64-system-controller
>>>                 - microchip,sparx5-cpu-syscon
>>>                 - mstar,msc313-pmsleep
>>>  +              - samsung,exynos3-sysreg
>>>  +              - samsung,exynos4-sysreg
>>>  +              - samsung,exynos5-sysreg
>>>  +              - samsung,exynos5433-sysreg
>>> -
>>> +               - hisilicon,hi6220-sramctrl
>>> +               - hisilicon,pcie-sas-subctrl
>>> +               - hisilicon,peri-subctrl
>>> +               - hisilicon,dsa-subctrl
>>
>> Thanks Stephen, looks good.
>>
>> Zhei,
>> However the Huawei compatibles in the original patch were added not
>> alphabetically which messes the order and increases the possibility of
>> conflicts. It would be better if the entries were kept ordered.
> 
> I've fixed up the order.

Thanks.

> 
> Rob
> 
> .
> 

