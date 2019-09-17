Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31DB2B5103
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 17:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729021AbfIQPHh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 11:07:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50512 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbfIQPHh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 11:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=g0wDThJhJk6xEP6+7wuEBmfpyo1yN81hEbDAuyakqAU=; b=u7mds5PPdSTR7ejNyo4WFHEFN
        BOarRL5BN4IRI6hVRBbHn08vbRaHOS7yNh9niQTa6xNB4IGZHvo3CHVXMKbutKw/KP044HL+DtB3M
        jz+DnqCecVsLVQ/HYLs+DHwGDRz9TMNNCyf/aA291SVr0gqy0aqfhqJc9tBcYhjmiDR5jvp7Y1Mts
        ViMlINZQDaRX7sw9VHTN2FiC2mk4xhDE+KGJgaGVVWq674l2xoOw9wxHGZHZJ9O33ozAgwezIVqzc
        VYtyp4lBmkQZOTNYjs8a9n8yzBX3vHnNdMIXRZR7rcLay1SP+d+3z9Zeba0iArP5LVzYOmxa6ROrN
        kPMMAkq+g==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iAF4p-0007Vy-EK; Tue, 17 Sep 2019 15:07:35 +0000
Subject: Re: linux-next: Tree for Sep 16 (kernel/sched/core.c)
To:     Patrick Bellasi <patrick.bellasi@arm.com>
Cc:     Ingo Molnar <mingo@kernel.org>, Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20190916223850.GQ4352@sirena.co.uk>
 <1898d3c9-1997-17ce-a022-a5e28c8dc115@infradead.org>
 <20190917075242.GB49590@gmail.com> <8736gv2gbv.fsf@arm.com>
 <871rwf2fr0.fsf@arm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3c2a09d6-c0b5-aba7-af49-04f521026b15@infradead.org>
Date:   Tue, 17 Sep 2019 08:07:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <871rwf2fr0.fsf@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/17/19 6:50 AM, Patrick Bellasi wrote:
> 
> On Tue, Sep 17, 2019 at 14:38:28 +0100, Patrick Bellasi wrote...
> 
>> On Tue, Sep 17, 2019 at 08:52:42 +0100, Ingo Molnar wrote...
>>
>>> * Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>>> On 9/16/19 3:38 PM, Mark Brown wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20190915:
>>>>>
>>>>
>>>> on x86_64:
>>>>
>>>> when CONFIG_CGROUPS is not set:
>>
>> Hi Randy,
>> thanks for the report.
> 
> Out of curiosity, which compiler version are you using?
> 
> I'm on:
> 
>  aarch64-linux-gnu-gcc (GNU Toolchain for the A-profile Architecture 8.3-2019.03 (arm-rel-8.36)) 8.3.0
> 
> Cheers,
> Patrick

> gcc --version
gcc (SUSE Linux) 7.4.1 20190424 [gcc-7-branch revision 270538]


-- 
~Randy
