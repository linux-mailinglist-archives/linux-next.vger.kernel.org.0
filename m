Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146EC69C927
	for <lists+linux-next@lfdr.de>; Mon, 20 Feb 2023 12:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjBTLCK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Feb 2023 06:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231539AbjBTLB4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2023 06:01:56 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5240E13D72
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2023 03:01:30 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id ky4so2096837plb.3
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2023 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CO0WqtLSVvbmkDhBkNjJ8JcFQn7aYAWzdbymccL96S0=;
        b=eMZ5mV0rj+Kl1gumByh3YRiFiwEDUpenfRL4NNPL/DxrQv8ekDc368ab8LJwEuYpeI
         aTMha6h41zaaxYGyu4JfQHfka/27M7zPZ1x4gwa71Y+NRHSHlazzG/n2np/TnXBnmNdy
         udkE8skRosfKLnqwMSfZMBbfV2x3uLioVFvFvJgzexZHHgBa89Y1i+rP9LMHoM9WO3Bg
         Tgd4zX68q5NmloaoQL2Bj6ZLITModFTPHXZE8BOym7JtrGegT9aDqioaIF4aaOuly7Tl
         D+whrstZCoaFh2uJ/ipbnkovrsQ5GKeg3bgBrvybd4Uv0/hhFuvMgYWvXaF4wcQbwltK
         fmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CO0WqtLSVvbmkDhBkNjJ8JcFQn7aYAWzdbymccL96S0=;
        b=5arRbTijDrPLRI0eEGYhNzpocbuQuj5mCJPZ+0qPh/Triv8CBPfLpLRTYTxNLyZqEl
         nyaGsxAiZ1/DMXpqMtbLoQawHglqEU/QU1CC2hrhvZ0Qe5oB6LO9biwQPe2YgBLcI4gl
         ZKxGsu+YLceJdhGWWWxscVYgTNJ8MU3U3ih2pKz22awLg4EJ2hY1H2zuWw7Qze5DqLob
         aer+A+3ONU+lmBBxE7ougq/X2MabAE2bmkF0rxNVTZNBKfKY6jCuA5rq7i+ClT44Bj4y
         +iNmWBZEr8KtU8Pl5JtpSDe0BBYJQkSPBWNSchpVfgv0Z+PuG8e3dfmhYZlvz2PGZn5N
         uCMw==
X-Gm-Message-State: AO0yUKUf3OQlOtqVK2E3hKVHFrua9SDq2+L24CCA3Qrro34FYTxfpRVF
        RWsYr030CBfCFdQ0CKSVqXlOctmL9uhfD/s5
X-Google-Smtp-Source: AK7set932lZ75KIZT25H3jrqE3VS0WL23XGxT6c/IgK+FXv57OsimHLBws5nerCbfHyDQWulHm+ZzQ==
X-Received: by 2002:a17:90a:29a3:b0:233:dd4d:6b1a with SMTP id h32-20020a17090a29a300b00233dd4d6b1amr806500pjd.3.1676890889794;
        Mon, 20 Feb 2023 03:01:29 -0800 (PST)
Received: from [10.70.252.135] ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id em16-20020a17090b015000b002349fcf17f8sm1019953pjb.15.2023.02.20.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 03:01:29 -0800 (PST)
Message-ID: <92d33271-4ee9-9cc7-48c7-c45d4af1e951@bytedance.com>
Date:   Mon, 20 Feb 2023 19:01:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: linux-next: build warning after merge of the driver-core tree
Content-Language: en-US
To:     Greg KH <greg@kroah.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230220163133.481e43d8@canb.auug.org.au>
 <896c1146-21bb-35bb-dc25-a12014eb5ccd@bytedance.com>
 <Y/Mh7uA61KMvMHAt@kroah.com> <Y/NCPC3rjOT7dJtE@debian.me>
 <3a449abe-b5c8-cee3-6c2e-bfb79eb51f73@bytedance.com>
 <Y/NQgAXYVDAd20cg@kroah.com>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Y/NQgAXYVDAd20cg@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2023/2/20 18:50, Greg KH wrote:
> On Mon, Feb 20, 2023 at 06:15:33PM +0800, Qi Zheng wrote:
>>
>>
>> On 2023/2/20 17:49, Bagas Sanjaya wrote:
>>> On Mon, Feb 20, 2023 at 08:31:58AM +0100, Greg KH wrote:
>>>> On Mon, Feb 20, 2023 at 03:26:41PM +0800, Qi Zheng wrote:
>>>>>
>>>>>
>>>>> On 2023/2/20 13:31, Stephen Rothwell wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> After merging the driver-core tree, today's linux-next build
>>>>>> (htmldocs) produced this warning:
>>>>>>
>>>>>> Documentation/filesystems/api-summary:146: fs/debugfs/inode.c:804: WARNING: Inline literal start-string without end-string.
>>>>>>
>>>>>> Introduced by commit
>>>>>>
>>>>>>      d3002468cb5d ("debugfs: update comment of debugfs_rename()")
>>>>>
>>>>> This is just a comment modification. Didn't see where my modification
>>>>> caused this WARNING. :(
>>>>
>>>> Yeah, I don't understand either, here's the diff, what's wrong with it?
>>>>
>>>>
>>>> --- a/fs/debugfs/inode.c
>>>> +++ b/fs/debugfs/inode.c
>>>> @@ -802,8 +802,8 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_remove);
>>>>     * exist for rename to succeed.
>>>>     *
>>>>     * This function will return a pointer to old_dentry (which is updated to
>>>> - * reflect renaming) if it succeeds. If an error occurs, %NULL will be
>>>> - * returned.
>>>> + * reflect renaming) if it succeeds. If an error occurs, %ERR_PTR(-ERROR)
>>>> + * will be returned.
>>>>     *
>>>>     * If debugfs is not enabled in the kernel, the value -%ENODEV will be
>>>>     * returned.
>>>
>>> Hi Greg and Qi,
>>>
>>> The simple fix is to drop the percent (which is an inline code variant):
>>>
>>> ---- >8 ----
>>> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
>>> index 58a35afb7c5d89..a7a6a0821605a8 100644
>>> --- a/fs/debugfs/inode.c
>>> +++ b/fs/debugfs/inode.c
>>> @@ -802,7 +802,7 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_remove);
>>>     * exist for rename to succeed.
>>>     *
>>>     * This function will return a pointer to old_dentry (which is updated to
>>> - * reflect renaming) if it succeeds. If an error occurs, %ERR_PTR(-ERROR)
>>> + * reflect renaming) if it succeeds. If an error occurs, ERR_PTR(-ERROR)
>>>     * will be returned.
>>>     *
>>>     * If debugfs is not enabled in the kernel, the value -%ENODEV will be
>>
>> LGTM, do I need to resend the patch with this fix?
> 
> Bagas needs to send it as a real fix so that I can apply it.

Got it. Thank you and Bagas very much.

> 
> thanks,
> 
> greg k-h

-- 
Thanks,
Qi
