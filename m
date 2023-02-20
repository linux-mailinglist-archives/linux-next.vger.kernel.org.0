Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFE369C85F
	for <lists+linux-next@lfdr.de>; Mon, 20 Feb 2023 11:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231273AbjBTKQG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Feb 2023 05:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbjBTKQF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2023 05:16:05 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F90A1420A
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2023 02:15:40 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id na9-20020a17090b4c0900b0023058bbd7b2so790973pjb.0
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2023 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDD8xziudShyN84cQ723X8XCrACsB7T+hEhcyNLXyo0=;
        b=4+ALj2DyLn3QBTGFnRp3NSe/gkeRUbssOGPBdbv1QlhqCciZ3R9I2c7fVyRobMBOpS
         w6D05jNJGRn+FNdeC9GC3TmNIsDSw04tEv/9G7H1CqF4mqVJylYQRNX7u8GMaXfecbYH
         3UHngZw8oUj9eJdUtG3pWx/CjfrhHm0O+JYQVV8ne6CL9pweK+Prp0x76Rdx2hDE5Ign
         tDi0VuPwhjm0fxuUwetk35GADaaOIL0+u4AXHjEAdgmcbxHH0vq1Y/P0PVcOIvfcBo0S
         GwCxVbbmm6VELN9B5AFk8TNMUA9dlDV/DY6HNLvXlhN16jhYHTHkIPyoMyID2JZvjbY7
         S9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDD8xziudShyN84cQ723X8XCrACsB7T+hEhcyNLXyo0=;
        b=gdWpUnx4e0CQ4or/s2G7B9CdDcVtHJUQji/Yymmx/nlsHoQmO3vRNmOVE+lVyEFSQU
         WIop3RiEEOmrSJPQJlWjGko2oRH2o8difEYTg9Bex+SwI+jj9HTlnXZlTO9Y5qWJDRng
         x1mNFltHzjnmGc0QtQC8Rk/ulhZZcLaGJLCn8+hg0Y/ZE3QpZEIEGedmHfc7mDZFMS4q
         qpraEta90XeT0ecKyoQoH+sNhQPyHn21NLfkqXVB604mJUrVO2zlk0bVWB1snM4GPIVu
         pNEhLfjuc92fEkBQfyrQvGO48lxC9EgruBp2izl1xDfVnXWymrQbGjbs4Zg7Jrzk47yn
         nPRA==
X-Gm-Message-State: AO0yUKUyDzeQVeNsTYtt8BVfzRYO9+VDeXX79NUzTjPQ/FOCQPk7mtXR
        z3oQ2NSxoN0TYzoXYFMYMZWNAg==
X-Google-Smtp-Source: AK7set+Yu8mpux2UxJJt06JUgc5iypBoah90YWGwuJ3I/6VEFM9NK+FDrj5uHvE/iztN/OxgDvYAVA==
X-Received: by 2002:a17:90b:397:b0:233:f0f3:238b with SMTP id ga23-20020a17090b039700b00233f0f3238bmr965122pjb.1.1676888139733;
        Mon, 20 Feb 2023 02:15:39 -0800 (PST)
Received: from [10.70.252.135] ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id k7-20020a17090a3cc700b002348bfd3799sm706715pjd.39.2023.02.20.02.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Feb 2023 02:15:39 -0800 (PST)
Message-ID: <3a449abe-b5c8-cee3-6c2e-bfb79eb51f73@bytedance.com>
Date:   Mon, 20 Feb 2023 18:15:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: linux-next: build warning after merge of the driver-core tree
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>, Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230220163133.481e43d8@canb.auug.org.au>
 <896c1146-21bb-35bb-dc25-a12014eb5ccd@bytedance.com>
 <Y/Mh7uA61KMvMHAt@kroah.com> <Y/NCPC3rjOT7dJtE@debian.me>
From:   Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Y/NCPC3rjOT7dJtE@debian.me>
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



On 2023/2/20 17:49, Bagas Sanjaya wrote:
> On Mon, Feb 20, 2023 at 08:31:58AM +0100, Greg KH wrote:
>> On Mon, Feb 20, 2023 at 03:26:41PM +0800, Qi Zheng wrote:
>>>
>>>
>>> On 2023/2/20 13:31, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> After merging the driver-core tree, today's linux-next build
>>>> (htmldocs) produced this warning:
>>>>
>>>> Documentation/filesystems/api-summary:146: fs/debugfs/inode.c:804: WARNING: Inline literal start-string without end-string.
>>>>
>>>> Introduced by commit
>>>>
>>>>     d3002468cb5d ("debugfs: update comment of debugfs_rename()")
>>>
>>> This is just a comment modification. Didn't see where my modification
>>> caused this WARNING. :(
>>
>> Yeah, I don't understand either, here's the diff, what's wrong with it?
>>
>>
>> --- a/fs/debugfs/inode.c
>> +++ b/fs/debugfs/inode.c
>> @@ -802,8 +802,8 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_remove);
>>    * exist for rename to succeed.
>>    *
>>    * This function will return a pointer to old_dentry (which is updated to
>> - * reflect renaming) if it succeeds. If an error occurs, %NULL will be
>> - * returned.
>> + * reflect renaming) if it succeeds. If an error occurs, %ERR_PTR(-ERROR)
>> + * will be returned.
>>    *
>>    * If debugfs is not enabled in the kernel, the value -%ENODEV will be
>>    * returned.
> 
> Hi Greg and Qi,
> 
> The simple fix is to drop the percent (which is an inline code variant):
> 
> ---- >8 ----
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index 58a35afb7c5d89..a7a6a0821605a8 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -802,7 +802,7 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_remove);
>    * exist for rename to succeed.
>    *
>    * This function will return a pointer to old_dentry (which is updated to
> - * reflect renaming) if it succeeds. If an error occurs, %ERR_PTR(-ERROR)
> + * reflect renaming) if it succeeds. If an error occurs, ERR_PTR(-ERROR)
>    * will be returned.
>    *
>    * If debugfs is not enabled in the kernel, the value -%ENODEV will be

LGTM, do I need to resend the patch with this fix?

> 
> Thanks.
> 

-- 
Thanks,
Qi
