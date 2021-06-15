Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E0E3A7E1E
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 14:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhFOMYl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 08:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhFOMYj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 08:24:39 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F7AC061574;
        Tue, 15 Jun 2021 05:22:34 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l7-20020a05600c1d07b02901b0e2ebd6deso1902449wms.1;
        Tue, 15 Jun 2021 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rKWTQuu8363g92T9KX8cKLcwdkNcgmYyqcaaomIg2L4=;
        b=fAoG1LQXEoZlUNCmxbTFBYOTEdi5O/o7DqtxPotDqp+J149pZPmuLlBhEunCPw2/3t
         S4D6BuJBoFQ4Ea2NqeQZ+8RKuyPtGU6NO0R/ooZnRaI1yhMcI92mFvhQiK6rGUYPFsiQ
         so7i/kfaMJmhQJD2ci4JMmFAuFOfwBYkXvbJ18BuPMC9GN6xqCZe9MpCvQd7HZMyNJ1a
         TZUq8LvOh7Qwqf/O+TVraVx4KQwTUn+E+bdYwhqiXC7A7iFlHYTrO/osAl+WNsVEwHuG
         LNXP3nxvbi3dwGWiwW+Je9OxhV61u0bZx+yC4f95HtqVJL/zNBd0IsrDIZZWh3nHv5i7
         8Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rKWTQuu8363g92T9KX8cKLcwdkNcgmYyqcaaomIg2L4=;
        b=i0LiqwBg0PYDn+uo8TJAfxkVMOnKGlmhWKwxTku751YjOZqI984xEQKSFLx44i1IJh
         E02hdOBzGENa7zEM6aQxEz5EJSD3rMGfoS7jKN8hbkNKoD3RlYh9RsgDs11Rx0HR7wmK
         USPgQVE47kesv46/MFc3BFiAE5fZspPLaoKGCv7iuOigMdiYk6GnqUb5KpQ0RlDInsNV
         g3ePJbQ3qyjjck/PirUgbaXtKJ4aWWG2ZKVPMOoaW/tnrdCDhmYKmQJJA5yJo3FnN5kO
         qjKOUkBzy5qzwmde30A7QvzRogAbXSAIMSKl61edMQ4SIZ8HAG6Sw8tikifUxfPq/csZ
         vl/g==
X-Gm-Message-State: AOAM532Q5u66FVHZLLYVknxhPe4JXRwF81SeAconPXkueaYpkLd1sBxw
        9vo28pKktwZrAxtFVzWeeelWKGhJYiR7O+j1
X-Google-Smtp-Source: ABdhPJzAEXf32QQEpiTAWu4/y/jkrMQkJO/vwoeZV/LkdSugneNRAKBm4l27i/9n6VWun4BxpRGPfg==
X-Received: by 2002:a7b:c414:: with SMTP id k20mr22440084wmi.90.1623759753091;
        Tue, 15 Jun 2021 05:22:33 -0700 (PDT)
Received: from [192.168.8.197] ([148.252.132.209])
        by smtp.gmail.com with ESMTPSA id q5sm15547161wmc.0.2021.06.15.05.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 05:22:32 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210615121314.6b711d8e@canb.auug.org.au>
From:   Pavel Begunkov <asml.silence@gmail.com>
Message-ID: <4193f524-f4b6-9291-aee6-e9c0f91fb34d@gmail.com>
Date:   Tue, 15 Jun 2021 13:22:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615121314.6b711d8e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/15/21 3:13 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:

Will get sorted, thanks for letting us know
 

> In file included from include/linux/kernel.h:15,
>                  from fs/io_uring.c:42:
> fs/io_uring.c: In function 'io_alloc_page_table':
> include/linux/minmax.h:20:28: warning: comparison of distinct pointer types lacks a cast
>    20 |  (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
>       |                            ^~
> include/linux/minmax.h:26:4: note: in expansion of macro '__typecheck'
>    26 |   (__typecheck(x, y) && __no_side_effects(x, y))
>       |    ^~~~~~~~~~~
> include/linux/minmax.h:36:24: note: in expansion of macro '__safe_cmp'
>    36 |  __builtin_choose_expr(__safe_cmp(x, y), \
>       |                        ^~~~~~~~~~
> include/linux/minmax.h:45:19: note: in expansion of macro '__careful_cmp'
>    45 | #define min(x, y) __careful_cmp(x, y, <)
>       |                   ^~~~~~~~~~~~~
> fs/io_uring.c:7095:28: note: in expansion of macro 'min'
>  7095 |   unsigned int this_size = min(size, PAGE_SIZE);
>       |                            ^~~
> 
> Introduced by commit
> 
>   9123c8ffce16 ("io_uring: add helpers for 2 level table alloc")
> 

-- 
Pavel Begunkov
