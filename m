Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACB71E283D
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 19:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388396AbgEZRRW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 13:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388295AbgEZRRW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 13:17:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E228CC03E96D;
        Tue, 26 May 2020 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=hzmwvPMV6qsKH3Fjv+ABmvoHXc3ghBrylUwoJMaGHgM=; b=Bff9uUKrKdt5Bqjzg02mc4s5XU
        DSgEcQzMKFTtWSifsOGqAUYXG9D9dBJLm+Zkcu8A9q3g8M0cWhHEW25cvZyitUWNR9EFhxb4biDEV
        7uyKVottL/G0vXG1Yjx2IPKXL2b3sv6zXy8vXRwzcss76BGKeCPF5xJDhWFFDxvPxurQcGQWHC1fG
        oCrUdjNdeN7jMR4w1vWOlfe3do1askEoA5qNWLCvaV4uESRQsXN8pzIv062D4VThk9kNXiSwQIJak
        BEKvUR0GKPobN5/Td+V5b6fA2O213+4WA/L3cs5TJwMqmvrE8RV60P3ddDhvXptRslm/u70WTUfN2
        OTpzg9WQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jddCX-0004Th-HS; Tue, 26 May 2020 17:17:17 +0000
Subject: Re: linux-next: Tree for May 26 (hwmon/amd_energy.c)
To:     Guenter Roeck <linux@roeck-us.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20200526203932.732df7c6@canb.auug.org.au>
 <f050c447-18fa-50d0-dbdd-b60820dc7ba1@infradead.org>
 <c31504dc-9646-81f9-c262-88890556ece9@roeck-us.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4e0c840d-3a2a-6aeb-8c3e-894f6ba47fda@infradead.org>
Date:   Tue, 26 May 2020 10:17:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c31504dc-9646-81f9-c262-88890556ece9@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/26/20 10:14 AM, Guenter Roeck wrote:
> On 5/26/20 9:24 AM, Randy Dunlap wrote:
>> On 5/26/20 3:39 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> News: there will be no linux-next release tomorrow.
>>>
>>> Changes since 20200525:
>>>
>>
>> Hi,
>>
>> All of my drivers/hwmon/amd_energy.c builds are failing (on i386 or x86_64).
>>
> I don't see that, neither in my hwmon-next branch (on top of v5.7-rc6)
> nor with next-20200526.
> 
> Ah yes, you must have NUMA and NEED_MULTIPLE_NODES disabled.
> With that (allnoconfig+HWMON+SENSORS_AMD_ENERGY), I see the error as well.
> The problem is:
> 
> 	#define cpumask_of_node(node)       ((void)node, cpu_online_mask)
> 
> The caller passes node as "channel - data->nr_cpus", which I would argue
> is perfectly valid. This is converted to
> 
> 	#define cpumask_of_node(node)       ((void)channel - data->nr_cpus, cpu_online_mask)
> 
> which doesn't look that good and results in the error. The problem
> is the missing ( ) around node, not the amd_energy driver.
> 
> Do you want to submit a patch, or do you want me to do it ?

You go ahead, please.

thanks.
-- 
~Randy

