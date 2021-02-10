Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9230C315B53
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 01:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233626AbhBJAfD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 19:35:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbhBJAQ7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 19:16:59 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0D7C0613D6;
        Tue,  9 Feb 2021 16:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=qX9dgxLNJOMdgTh6AiqA2plu68i8p3vWkLJ60+sUcz0=; b=Z0Y/UjYghzuPoYzZVcFGvHyd1L
        kp4kxvY2UO2cGym0+P/hUi368LLfO6D66mCGpuiUNswLZ67fZ7jRDkfoCqwml+Oh9I/F+EdyKeRbr
        mr9Mvy2g03ibmQVNnA7RqmttwI62iBC6V+bNZtyuCqvRvEZVXjDWw1M2dlI75sHO8aAXLk7DTMQY6
        xFe0OrOB8hev2n5xGCAu1gQTmN9+hP61CkOhoRwip3pzR0bN5uc/owOd48VOSkxWFsVB4Z1A+VJlz
        FIHrVYSgwPqqjdUjtw8k1vUftSvM1DmPzmbjzWjz4OFO2LPJlpPWx27hi9jZIuaKGjAe3w9a93txB
        A7rnTHVw==;
Received: from [2601:1c0:6280:3f0::cf3b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9dB0-0007xA-Ks; Wed, 10 Feb 2021 00:16:14 +0000
Subject: Re: linux-next: Tree for Feb 8 (objtool: warnings: 5)
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
 <20210208212153.vs2v7k2c55a3syvo@treble>
 <9fd03d53-8001-b76f-feea-179c13633a8b@infradead.org>
 <20210209225959.vobnut7nsneiujyl@treble>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <14d25a4e-8163-b29f-0297-47dcda59cb77@infradead.org>
Date:   Tue, 9 Feb 2021 16:16:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209225959.vobnut7nsneiujyl@treble>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/9/21 2:59 PM, Josh Poimboeuf wrote:
> On Mon, Feb 08, 2021 at 01:39:03PM -0800, Randy Dunlap wrote:
>> On 2/8/21 1:21 PM, Josh Poimboeuf wrote:
>>> On Mon, Feb 08, 2021 at 11:30:59AM -0800, Randy Dunlap wrote:
>>>> On 2/8/21 4:52 AM, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Changes since 20210205:
>>>>>
>>>>
>>>> on x86_64:
>>>>
>>>> objtool warnings: (from 3 different randconfig builds)
>>>>
>>>> drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()
>>>
>>> Randy, can you share the .o?  (you may need to gzip it, still waiting on
>>> corporate IT to allow me to receive .o files)
>>
>> Sure, no problem. It's attached.
> 
> Does this fix?
> 
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> Subject: [PATCH] input/elants_i2c: Detect enum overflow
> 
> If an enum value were to get added without updating this switch
> statement, the unreachable() annotation would trigger undefined
> behavior, causing execution to fall through the end of the function,
> into the next one.
> 
> Make the error handling more robust for an unexpected enum value, by
> doing BUG() instead of unreachable().
> 
> Fixes the following objtool warning:
> 
>   drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>

Yes, thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/input/touchscreen/elants_i2c.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 6f57ec579f00..4c2b579f6c8b 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -656,8 +656,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  			error = elants_i2c_query_ts_info_ektf(ts);
>  		break;
>  	default:
> -		unreachable();
> -		break;
> +		BUG();
>  	}
>  
>  	if (error)
> 


-- 
~Randy

