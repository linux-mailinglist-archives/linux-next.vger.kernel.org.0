Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFAB3424C22
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 05:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbhJGDPl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 23:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232310AbhJGDPj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 23:15:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA42C061746;
        Wed,  6 Oct 2021 20:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=34yG0yolFJPz5oFr6D7PlKRd0ixiVrEKP+B9Vx2JloY=; b=XYvgeZ4KaZGtOb7G8AtpRXlI3P
        +9Z4xIaBQ6AWojP3BdarOscDdIt9QJpja/wWOwS0Oe9gCalWO99Zit4tKviCTBVjF0UVamCyAkHO6
        A0GbVZlo39edIgM4g+nA+rvWVNeafEnUcGdQ5y9SMez32qPcZ4D6lkhMSA8hAsMmUm/kDhouZgZLD
        /hLpsxdGInMc5MmP4zVav76RwxJC9HZE3udFahrM5Bz7xQdXV7pug7h6IDkKpbaCWEO6zL7A+4AOb
        A5SgjVtS4na29vcvzuK/y+euMcbfg9a/uS/xfC0R6XCx1Ar6VXkz81wWXFX8xmEBXi03nD08Y+Vi0
        PCrRCwUg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mYJqn-00G3cm-7t; Thu, 07 Oct 2021 03:13:41 +0000
Subject: Re: linux-next: Tree for Oct 5 (warnings: a. trace; b. mm/migrate)
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Jackie Liu <liu.yun@linux.dev>
References: <20211005190628.1f26b13d@canb.auug.org.au>
 <c1d9e328-ad7c-920b-6c24-9e1598a6421c@infradead.org>
 <20211006172207.11982951@gandalf.local.home>
 <6d8f22a1-5f54-aa2a-7628-1d98a7f0fb95@infradead.org>
 <20211006211000.16b2284b@rorschach.local.home>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bbe4a9ed-f641-8bd2-8501-2ab79f0c882d@infradead.org>
Date:   Wed, 6 Oct 2021 20:13:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006211000.16b2284b@rorschach.local.home>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/6/21 6:10 PM, Steven Rostedt wrote:
> On Wed, 6 Oct 2021 14:32:21 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 10/6/21 2:22 PM, Steven Rostedt wrote:
>>> On Tue, 5 Oct 2021 13:46:52 -0700
>>> Randy Dunlap <rdunlap@infradead.org> wrote:
>>>    
>>>> a. randconfig: KCONFIG_SEED=0xBFBEA13C
>>>> ../kernel/trace/trace.c:1712:13: error: 'trace_create_maxlat_file' defined but not used [-Werror=unused-function]
>>>>     static void trace_create_maxlat_file(struct trace_array *tr,
>>>
>>> Does this fix it?
>>>
>>> -- Steve
>>
>> Yes, thanks.
>>
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 
> Plumbers followed by Open Source Summit totally blew my brain cache. I
> have a fix for this in my queue from Jackie Liu that I haven't
> processed yet (just going through my queue now when I noticed it).
> 
> Can you test this patch instead?
> 
>     https://lore.kernel.org/r/20210922025122.3268022-1-liu.yun@linux.dev


Sure, done. Same good result.

thanks.
-- 
~Randy
