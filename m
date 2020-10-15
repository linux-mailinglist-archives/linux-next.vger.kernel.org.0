Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6136F28F7E8
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 19:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731494AbgJOR4P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 13:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731483AbgJOR4P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 13:56:15 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028B9C061755
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 10:56:15 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id m22so12855ots.4
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WhXHtRQLiNvlxA4Ve4EGkL4Yj2RyR9bAfejYfV8NKoY=;
        b=LkXC4WB06ByVlUKUgEg92KmVPC9c/Lr6VceWMRdBnVynCIMxm/QJN29fJtLeyA/8JM
         V71tbZYSR6gKPlYBmn96I5oGiLRE498NemTt/nGrhS2UvwC4DS6/oYde3SmHYGtWCpLA
         I2nlg/XJzRzSEZoydxkttpkCLyNWZNPnp2l18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WhXHtRQLiNvlxA4Ve4EGkL4Yj2RyR9bAfejYfV8NKoY=;
        b=hqI6upwB7i/QE4zV2YIAOy20AXx7T+zSqPhV6B8O79yHaGfHl/9C6bc4NxHa40Lkw6
         TJ/KS4Q79Gduri+/ylXu/k52zqfWhvR7JqAL+udHC2GDYqzlj2yhanKBvLKaOVTiF8et
         y8pwDAAjUCEyMuHHK1/gGB+aCkUX1CWEDUUArGXXgD6+p7OU5ExzlRjle2gqG69zgKJo
         LdUgt3HfaESpyn9aN3cwLR4tJNrwZbmq7W/pBbTozbks+lbvQdsxx9GcCoDWpPMAh9IB
         /jxQti+SQlKFU/4Y8zRFhEreh5GSgBSpomx4aldBUYBSu3xjSCswGhTpNlnm5bkU5eNu
         SffA==
X-Gm-Message-State: AOAM532BS195UiowMjgad0mX2ccJFRpXEiK4s5opeJKd4fSv3Xm85CSp
        VwCDrL9Pw+49/HgHGoPlHMBhpA==
X-Google-Smtp-Source: ABdhPJyWCGNwF/h+GQeALThlCZpGDJ2foEce5mnVm3bpnpgPTrjTgZU3WdDaCcvNyLQuFvVtVHFKlg==
X-Received: by 2002:a9d:7308:: with SMTP id e8mr3653483otk.238.1602784574333;
        Thu, 15 Oct 2020 10:56:14 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n1sm1394096otr.16.2020.10.15.10.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 10:56:13 -0700 (PDT)
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kunit-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        David Gow <davidgow@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Patricia Alfonso <trishalfonso@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201012195649.2047671f@canb.auug.org.au>
 <20201015163806.1c5696bb@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <05a34f8f-075f-87b0-e13f-898399f480ac@linuxfoundation.org>
Date:   Thu, 15 Oct 2020 11:56:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201015163806.1c5696bb@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/14/20 11:38 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 12 Oct 2020 19:56:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>    lib/kunit/test.c
>>
>> between commit:
>>
>>    45dcbb6f5ef7 ("kunit: test: add test plan to KUnit TAP format")
>>
>> from the kunit-next tree and commit:
>>
>>    e685acc91080 ("KUnit: KASAN Integration")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> diff --cc lib/kunit/test.c
>> index de07876b6601,dcc35fd30d95..000000000000
>> --- a/lib/kunit/test.c
>> +++ b/lib/kunit/test.c
>> @@@ -15,11 -16,16 +16,6 @@@
>>    #include "string-stream.h"
>>    #include "try-catch-impl.h"
>>    
>> - static void kunit_set_failure(struct kunit *test)
>>   -static void kunit_print_tap_version(void)
>> --{
>> - 	WRITE_ONCE(test->success, false);
>>   -	static bool kunit_has_printed_tap_version;
>>   -
>>   -	if (!kunit_has_printed_tap_version) {
>>   -		pr_info("TAP version 14\n");
>>   -		kunit_has_printed_tap_version = true;
>>   -	}
>> --}
>> --
>>    /*
>>     * Append formatted message to log, size of which is limited to
>>     * KUNIT_LOG_SIZE bytes (including null terminating byte).
> 
> This is now a conflict between the kunit-next tree and Linus' tree.
> 

Thanks Stephen. I will mention this conflict in my pull request to
Linus.

Thanks,
-- Shuah
