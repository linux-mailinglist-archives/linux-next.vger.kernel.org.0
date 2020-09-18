Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C07E127074A
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 22:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgIRUq4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 16:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIRUqz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Sep 2020 16:46:55 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8431FC0613CE;
        Fri, 18 Sep 2020 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=DvBn9yNEqOp/ycwDKoc7SiHgVUGQxPxJpjYJFyRGnGs=; b=LFExuychVfgthbqOhvgRAOQT91
        bJf4xa+OuBxQ5RRkr6/0gPyrrSWcC+QqsQOCOGKYFniUjPEplhqja9HYglXqQof3DzHl0WwpO0z8J
        Qq7FrrZyq/i7sL2MMXrT/qKPCM+FLsUkI10fEZZAPX83LatPySScyi8K1m0yRsFYfYyYYZ5ulECvq
        hm/CdlEOs+tmNUPKd3mXRWuNar+vI5BC8CQxigZeqx237ziJed14OqWaEtJ8sAifrsZsiD4ufx8Qo
        2T43JAdXsnjxpYDQJtUx4GmMyL3NllycC3xp6U6Q61T2r5LlmgwdNpi2G134dIX5kZVj9dE+NETta
        foBneOXA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJNHM-0007eT-B4; Fri, 18 Sep 2020 20:46:48 +0000
Subject: Re: linux-next: Tree for Sep 17 (net/ipv4/devinet.c)
To:     nicolas.dichtel@6wind.com, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20200917202313.143f66f3@canb.auug.org.au>
 <0b592973-55d6-b318-ed38-1d5fbd706e7a@infradead.org>
 <42a4f790-6175-2835-2022-cbfcbe1e5504@6wind.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <15e457d1-e3a1-9cbc-0589-2033b67a24c5@infradead.org>
Date:   Fri, 18 Sep 2020 13:46:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <42a4f790-6175-2835-2022-cbfcbe1e5504@6wind.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/18/20 1:25 AM, Nicolas Dichtel wrote:
> Le 17/09/2020 à 22:45, Randy Dunlap a écrit :
>> On 9/17/20 3:23 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200916:
>>>
>>
>>
>> Maybe some older versions of gcc just can't handle IS_ENABLED() inside an
>> if (expression) very well.
>>
>>> gcc --version
>> gcc (SUSE Linux) 7.5.0


> I tried with a (very old) gcc and I did not reproduce this error:
> $ gcc --version
> gcc (Debian 4.9.2-10+deb8u2) 4.9.2
> 

OK, no problem then.
I cannot reproduce it now either (I just tried 3-4 times).
We can forget about it. Sorry for the noise.

> 
>>
>> This patch:
>>
>> commit 9efd6a3cecdde984d67e63d17fe6af53c7c50968
>> Author: Nicolas Dichtel <nicolas.dichtel@6wind.com>
>> Date:   Wed May 13 15:58:43 2020 +0200
>>
>>     netns: enable to inherit devconf from current netns
>>
>> causes a build error:
>>
>> ../net/ipv4/devinet.c: In function ‘devinet_init_net’:
>> ../net/ipv4/devinet.c:2672:7: error: ‘sysctl_devconf_inherit_init_net’ undeclared (first use in this function); did you mean ‘devinet_init_net’?
>>        sysctl_devconf_inherit_init_net == 3) {
>>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>        devinet_init_net
>> ../net/ipv4/devinet.c:2672:7: note: each undeclared identifier is reported only
>>
>>

thanks.
-- 
~Randy

