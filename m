Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4E221463FF
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2020 09:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgAWI7z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 03:59:55 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37586 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgAWI7z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jan 2020 03:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dpZ47qLZaEo9JYE9lvvCZ6F2TCPcWXoLFmFAw8P69Fo=; b=iJDkJ1S4gq3EJ1+VdxtvCFj7Y
        rTeEbPXx3tZ1Tze79PmAxEEKo4IGjlEpXwtPJsJNGq63U9jMxKB49sGuGgZaXA6rh1GPLVYK4BAdf
        BuW+hFUSe0w/LOQhKJXHg4+b5fbtDVbUGLt7aNHOeX+Ur1faJopoXAg6g/LvathcaPCN3auDakc4L
        ubzySayOORDpdnB+dozE9V0wPKs5ytcm+hIXhOwuMUnACvmU+Jw9gx/Ua0QWlnneZ7MSl25jbT2GM
        sM7XXXAELfHaR3Q6/XnSLtW96ySyzkUvbaw8A5DmsAs7/+elxXdnyhh7HAQ8vWcKtkpRkfQdKpzNb
        VYYD05Srg==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuYL6-0005PN-VT; Thu, 23 Jan 2020 08:59:49 +0000
Subject: Re: linux-next: Tree for Jan 23 (PHY_EXYNOS5250_SATA in
 drivers/phy/samsung/Kconfig)
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200123172101.2f31947c@canb.auug.org.au>
 <beb9e3a3-4824-6328-12f8-3d005f376374@infradead.org>
 <CAJKOXPcJ8V+bLDeJGg+emCaYHtDjuKa--yMk_HRCsB_DrwJGrw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6c09668b-488e-eb1d-3d11-2e2773b32e70@infradead.org>
Date:   Thu, 23 Jan 2020 00:59:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPcJ8V+bLDeJGg+emCaYHtDjuKa--yMk_HRCsB_DrwJGrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/23/20 12:03 AM, Krzysztof Kozlowski wrote:
> On Thu, 23 Jan 2020 at 08:00, Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 1/22/20 10:21 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200122:
>>>
>>
>> Is linux-next missing some of the COMPILE_TEST fixes?  I am still seeing
>> this warning (that I reported on Jan. 9-2020 and that Arnd has sent a
>> possible patch for):
>>
>>
>> on i386 or x86_64:
>>
>> WARNING: unmet direct dependencies detected for I2C_S3C2410
>>   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
>>   Selected by [y]:
>>   - PHY_EXYNOS5250_SATA [=y] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
> 
> Hi Randy,
> 
> The fix was posted quite some time ago - next to the patches
> (unfortunately) introducing the issue.  I posted v2, after review, on
> 7th of January:
> https://lore.kernel.org/linux-arm-kernel/1578384779-15487-1-git-send-email-krzk@kernel.org/T/#t

That works for me.
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

> Maybe I missed someone on Cc there?

Sometimes you just have to resend patches...

thanks.
-- 
~Randy

