Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7322B9A67
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 19:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728590AbgKSSMk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Nov 2020 13:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728509AbgKSSMk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2020 13:12:40 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590C6C0613CF;
        Thu, 19 Nov 2020 10:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=Fo7XA1P7L7ydAINyh811w5lW8AIHaI8eTME21i7qTwg=; b=V7ahkSEbh8W1W/0PwZOAXxUU2c
        yzevupau9gfPxZ8mowU+Xg9Fkq/5Y26Tng93lxjNb5Tb6Kp5LRv/K39nqa5sw3+fj2F/U9FSPlcIl
        68PjBeKjC96HmTaPgxYgwfXcSrTExosF/puNJvIt5cx87Ja+Uw4oyf6C/PayrAEk7KKJbisDLMFrg
        vkgOsR29npRmZAAuavmgFZt2FHk1mu1VzjJ2hWibg4QxiDjwTlK/MZS7XC17nCN3wDcavp8MQVedg
        jDreCleJxU+oG5hAQhuCxHQbNADFp2QLE3BHpHpcVchJYOp3rLuEAfr2Gj7trPLC65uldmpcl9Typ
        nhDqHwLQ==;
Received: from [2601:1c0:6280:3f0::bcc4]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kfoQ5-0005pf-0B; Thu, 19 Nov 2020 18:12:33 +0000
Subject: Re: linux-next: Tree for Nov 19 (drivers/edac/igen6_edac.c)
To:     "Luck, Tony" <tony.luck@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20201119170832.614bf46d@canb.auug.org.au>
 <6d36cd23-2647-f3b1-5f55-1e00105698eb@infradead.org>
 <0ad9aeffcd5342f59bae6fe64218d011@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d8880e79-40a0-4d92-29dd-82b0b59d653b@infradead.org>
Date:   Thu, 19 Nov 2020 10:12:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0ad9aeffcd5342f59bae6fe64218d011@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/19/20 9:53 AM, Luck, Tony wrote:
>> ../drivers/edac/igen6_edac.c: In function 'ecclog_nmi_handler':
>> ../drivers/edac/igen6_edac.c:525:10: error: 'NMI_DONE' undeclared (first use in this function); did you mean 'DMI_NONE'?
>>    return NMI_DONE;
> 
> This driver has a #include <linux/nmi.h>
> 
> But inside that file it says:
> 
> #if defined(CONFIG_HAVE_NMI_WATCHDOG)
> #include <asm/nmi.h>
> #endif
> 
> and the randconfig used doesn't set CONFIG_HAVE_NMI_WATCHDOG
> 
> 
> Some options:
> 
> 1) Drop that #ifdef from <linux/nmi.h>
> It was introduced as part of this commit:
> f2e0cff85ed1 ("kernel/watchdog: introduce arch_touch_nmi_watchdog()")
> presumably for some good reason.
> 
> 2) Make this edac driver select CONFIG_HAVE_NMI_WATCHDOG
> Yuck!
> 
> 3) Make this driver #include <asm/nmi.h> instead of <linux/nmi.h>
> This fixes this build error, but I thought that general policy was to
> use the <linux/*.h> if it exists rather than the <asm/*.h> one.
> Maybe that's ok here because this is an x86 specific driver?
> 
> I'm leaning toward option #3.

I lean toward option #1 but #3 would be OK.

We generally try NOT to surround #include lines
with ifdef/endif as was done here for some reason.


-- 
~Randy

