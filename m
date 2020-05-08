Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A8D1CB3E5
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 17:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgEHPsV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 11:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgEHPsV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 11:48:21 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696F2C061A0C
        for <linux-next@vger.kernel.org>; Fri,  8 May 2020 08:48:20 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id y26so2250369ioj.2
        for <linux-next@vger.kernel.org>; Fri, 08 May 2020 08:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Yj/VWnxuwVscg+Ow0r6vDZvPUhARSnW2zWYKwQkrpg=;
        b=nKgQQLullofD+pnK7JXZAiS3ATo+bky/bI583PXN4MSy5nR/lcFS/WE9d4TqceYGSQ
         vwbmFJK1RFdd+ZyTeBd6sDd8iRLQIMqly96rE/eg/e0dpib+xK5gonq1nzfqsGGTi3cj
         tkpSJL2Z2PLhFzmZFFpNEgCVbrhFAnGTyzU51KrzqgTiPDnLY7+kQfakiJmiXrUfDgTS
         +5Xs4mbMOrqTnCVycdLFSHSw4zJYElSY/m9hFi5B6bNn5zguLK55+PmXSC5cAvGgyv4A
         vzNQjvyo6QKDzwEOLYd0PoaDqP64eIZScGIGoC7O1djDtAgyqpfCAPzcQyCfQeY/7Cgp
         Ap7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Yj/VWnxuwVscg+Ow0r6vDZvPUhARSnW2zWYKwQkrpg=;
        b=l65WTx9ep3T7ADDivSJK2gyiO1DpkNCLKwzddS5kNDyc5Kst0B02j6A9QjzZR8qlqY
         xn4FgJgyVGMuU1hsICQQCIJbjmCTVaYJhpZddtM/kxFdy37oJIFkExlUGAEK6bSeHu4a
         PiU6FxyweantT8vNEn1qnIe0WPmdIJJiavVA+p78TAgUV0Hlks32B6dh0erVU1ChqfP8
         UqMRouR/JKX6aIp8tTxgOmt/ObtPuA7olIEaUAEe+epUd86bZArBKb9kQ/ESKFBgOVv+
         +en1p4z29JMwwL0GxxeweyVj8VSJuvzdkWTPkFHVNryLuZuGr1/zqYwAyqBY6tAvX7JV
         r3tQ==
X-Gm-Message-State: AGi0PuairolXSe80tTjDnwJCbBxS8HX99t1ptxPkk6m7sMs4glLE74qc
        izTt/HElUODsAEJYLMFL3sH0VQ==
X-Google-Smtp-Source: APiQypIwoCayfrJ+5VgfQJCl3htbKpqdhZ706qrKsseh3LXYReBHJ75Lu/8AozesVU13tEq/sC961A==
X-Received: by 2002:a05:6602:2e0b:: with SMTP id o11mr3143321iow.94.1588952899835;
        Fri, 08 May 2020 08:48:19 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id y15sm942871ilg.21.2020.05.08.08.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 08:48:19 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yufen Yu <yuyufen@huawei.com>
References: <20200508152833.7e840076@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <c2c822b9-c5d9-d145-9a05-25ed02f14ad0@kernel.dk>
Date:   Fri, 8 May 2020 09:48:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508152833.7e840076@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/7/20 11:28 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/kernel.h:15,
>                  from include/linux/list.h:9,
>                  from include/linux/module.h:12,
>                  from block/bfq-iosched.c:116:
> block/bfq-iosched.c: In function 'bfq_set_next_ioprio_data':
> block/bfq-iosched.c:4980:5: error: implicit declaration of function 'bdi_dev_name'; did you mean 'blkg_dev_name'? [-Werror=implicit-function-declaration]
>  4980 |     bdi_dev_name(bfqq->bfqd->queue->backing_dev_info),
>       |     ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   0f6438fca125 ("bdi: use bdi_dev_name() to get device name")
> 
> I have applied the following patch for today.

Thanks Stephen, I have added it.

-- 
Jens Axboe

