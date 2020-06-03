Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C10E51ED389
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 17:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgFCPiD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 11:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFCPiD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 11:38:03 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D2BC08C5C1
        for <linux-next@vger.kernel.org>; Wed,  3 Jun 2020 08:38:03 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id g5so2206571otg.6
        for <linux-next@vger.kernel.org>; Wed, 03 Jun 2020 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wUY7nP7Sv66k98sXJa54neuqzOTWObAW2W4PIwzpdcI=;
        b=Hce2Huj/z7Q9ek11o7cfKqDoLMsSsJAXdHOkeMya7IDa47PFfpzfcOXAPi5rcOieca
         v9U1Bqb3LMEcnUxPIJ5oIx04J/4He+bRR2kTRpQXcmAVGJoIPde08eNEvMrjG5A1mXug
         f9ueB0QDHqEG7cC0XzKQs0lgBVVWU67s90C74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wUY7nP7Sv66k98sXJa54neuqzOTWObAW2W4PIwzpdcI=;
        b=NgRqbfoKphSGGrA8mS55JjAYGA6A2IEFNJNw1jAqV+wl2xdw9xe7P8XyRAMMT7YNtW
         wHaPZY6LAhiO0QwibcDLLvr872ed+aN3rpe7tu47MY2Up7GDQAajgCz/wvQYDmPa5p8l
         Uh3CrPGWd9iu4juKhDIdcTpGM5GGiS3aJU3h77iHQatIpq6/4WS96GmEZDzIM8x9NUmV
         mlIUoYzAyokmahLa2+q1lDuOORuz1v/Equ4bz5uE3mi66/WGHgoqGqmjxoZNoanwStUJ
         +TQd26MVbeK+jXHmVXpdfCRdZ/989H64OwyDD4q4r84tJmHMKblq8n68NsfeYPh20aMZ
         nIug==
X-Gm-Message-State: AOAM531AeyT6CDgBUquLj6rMXLzqRu6aKflDdvX/Moz2Z8RVW3MPYHAH
        6xcXMW8UIMUQjqvIrQJHZMLzmA==
X-Google-Smtp-Source: ABdhPJwUE2JcDDB2tkm5OymS16GFKtI6YuzIrfZ/noLq1PEptK66UFd9p/iuw4Js3aPAutSewiV5Fw==
X-Received: by 2002:a9d:a71:: with SMTP id 104mr472689otg.40.1591198682698;
        Wed, 03 Jun 2020 08:38:02 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y197sm655155oie.58.2020.06.03.08.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:38:02 -0700 (PDT)
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kselftest tree
To:     Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, skhan@linuxfoundation.org
References: <20200603182901.63dfec97@canb.auug.org.au>
 <20200603190306.bd85ea37629210c8642f7bd7@kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0137f4b2-78cb-bd87-056a-aa44ac474637@linuxfoundation.org>
Date:   Wed, 3 Jun 2020 09:38:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603190306.bd85ea37629210c8642f7bd7@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/3/20 4:03 AM, Masami Hiramatsu wrote:
> Hi Stephen,
> 
> On Wed, 3 Jun 2020 18:29:01 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>>
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>    tools/testing/selftests/sysctl/sysctl.sh
>>
>> between commit:
>>
>>    eee470e0739a ("selftests/sysctl: Fix to load test_sysctl module")
>>
>> from the kselftest tree and patch:
>>
>>    "tools/testing/selftests/sysctl/sysctl.sh: support CONFIG_TEST_SYSCTL=y"
>>
>> from the akpm-current tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Thank you for fixing this confliction, at least this fix looks good to me.
> I think this (Vlatimil's patch) should be merged via Shuah's kselftest tree.
> 
> https://lkml.org/lkml/2020/4/27/921
> 
> This fix seems an independent fix.
> 
> Thank you,
> 
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc tools/testing/selftests/sysctl/sysctl.sh
>> index c3459f9f2429,ce1eeea6f769..000000000000
>> --- a/tools/testing/selftests/sysctl/sysctl.sh
>> +++ b/tools/testing/selftests/sysctl/sysctl.sh
>> @@@ -112,10 -122,9 +112,10 @@@ test_reqs(
>>    
>>    function load_req_mod()
>>    {
>> - 	if [ ! -d $DIR ]; then
>> + 	if [ ! -d $DIR -a ! -d $SYSCTL ]; then
>>    		if ! modprobe -q -n $TEST_DRIVER; then
>> - 			echo "$0: module $TEST_DRIVER not found [SKIP]"
>> + 			echo "$0: module $TEST_DRIVER not found and not built-in [SKIP]"
>>   +			echo "You must set CONFIG_TEST_SYSCTL=m in your kernel" >&2
>>    			exit $ksft_skip
>>    		fi
>>    		modprobe $TEST_DRIVER
> 
> 

Thanks Stephen for the fixup and Masami for verifying this looks good.
Please carry the fix. I will make a note of the fix in my pull request
to Linus as well to keep us all on the same page.

thanks,
-- Shuah



