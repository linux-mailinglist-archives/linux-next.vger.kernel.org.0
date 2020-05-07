Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0501D1C93AD
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgEGPHa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 11:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726445AbgEGPH3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 11:07:29 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D16BC05BD43
        for <linux-next@vger.kernel.org>; Thu,  7 May 2020 08:07:28 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id i19so4155127ioh.12
        for <linux-next@vger.kernel.org>; Thu, 07 May 2020 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SHRn/AqyN2Wqz7da637h4mmPxr97Ywx7k4M9JqW4nHk=;
        b=ElhwNjqa/0syLQu1a/agXoWRdq0LQ/eMBsydLPEKpf0OSOLTf4Y7WcWp22U6/IAN/L
         eluFYftLOssFxPA2/mOOL6Cls3FnUIIEUENj/FOSC12j7BesHLCqcR4KRanHQPxz1Zqu
         +tCvKjytbjzikfHOJjNdCcDuSlxwMDoFzeL3haSdLe9ZcD80tBCVdZlW/dPwD6EUhVmW
         VKL4Qw1q7o/CidcZlFinV96Qm7+5uAz9e5NA+STb66FQCIDICvPWVkizJnusGmnHSOTc
         PZTofFQ6puEAzcvIRKjNpsUGaq2gxmNsVHsIdDfAFkswbxGlTACNgdHPXa90+Yonxkd6
         YA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SHRn/AqyN2Wqz7da637h4mmPxr97Ywx7k4M9JqW4nHk=;
        b=TrtP6yzzHJpSmskr7UnFPFqtsdywvKT34fEo74Dj0FhupiClaGI2LcjJoz+wU004i0
         QY31qkp5RMz9fen7tgQfkOqzNdaQEqrv5j1iAX8vt9boT4Mj1xGzfl/cYBI85M27KDJe
         OY7P4+5atyrFRw+trycmP27bKJQ0Zfy4q4wmnJwrmpry30ix0GjOkcaN6CMJnXKgx/5p
         Hkv9PynCc0v/uZZnQtQ2mvo/RiPdnOnH94uHomONW0MMuLF689HFlAJhBkQFxkwUbcTs
         iO5CPsAJ01wQx98xqarzFnyz374xAIG4idZh+NBbz5E4/Eo99/UDjzWc14heJIgkIRHt
         1aLg==
X-Gm-Message-State: AGi0PuZ1w3bAxjIcWfLlUPreaIvj+8mZTk2AkuRlbueMJysMCk84AAgf
        lXN5iGgP73GzPxyRUjBgta/n6Q==
X-Google-Smtp-Source: APiQypLTvceLOpdV64DT9FCT0wC4Me7ZNIVYfs3Ua6uqfy4lwpy3CTED8HJxAygYU0F7NtmvU5YjLg==
X-Received: by 2002:a6b:d10c:: with SMTP id l12mr3232541iob.44.1588864047589;
        Thu, 07 May 2020 08:07:27 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id t1sm2830963iln.4.2020.05.07.08.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 08:07:27 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the vfs tree
To:     Al Viro <viro@zeniv.linux.org.uk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200507103921.371b1329@canb.auug.org.au>
 <20200507023557.GE23230@ZenIV.linux.org.uk>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c8db44e9-b040-69ba-52e5-9e31842bb799@kernel.dk>
Date:   Thu, 7 May 2020 09:07:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507023557.GE23230@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/6/20 8:35 PM, Al Viro wrote:
> On Thu, May 07, 2020 at 10:39:21AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the vfs tree, today's linux-next build (arm
>> multi_v7_defconfig) failed like this:
>>
>> fs/eventfd.c: In function 'eventfd_read':
>> fs/eventfd.c:226:6: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
>>   226 |  if (iov_iter_count(to) < sizeof(ucnt))
>>       |      ^~~~~~~~~~~~~~
>> In file included from include/linux/file.h:9,
>>                  from fs/eventfd.c:9:
>> fs/eventfd.c:257:15: error: implicit declaration of function 'copy_to_iter'; did you mean 'copy_to_user'? [-Werror=implicit-function-declaration]
>>   257 |  if (unlikely(copy_to_iter(&ucnt, sizeof(ucnt), to) != sizeof(ucnt)))
>>       |               ^~~~~~~~~~~~
>>
>> Caused by commit
>>
>>   a6515b3a7410 ("eventfd: convert to f_op->read_iter()")
>>
>> I have applied the following patch for today:
> 
> [snip]
> 
> folded and pushed out

Thanks Al.

-- 
Jens Axboe

