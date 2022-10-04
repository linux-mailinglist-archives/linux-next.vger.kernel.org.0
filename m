Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF34B5F4BB9
	for <lists+linux-next@lfdr.de>; Wed,  5 Oct 2022 00:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiJDWPC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Oct 2022 18:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiJDWPA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2022 18:15:00 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A0120184
        for <linux-next@vger.kernel.org>; Tue,  4 Oct 2022 15:14:57 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id w2so14321481pfb.0
        for <linux-next@vger.kernel.org>; Tue, 04 Oct 2022 15:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5L01wecfli+mbpc2reA9sYX86GK31JmxkVaD77jT208=;
        b=tx0mpRPVbWB2tbZ5dEJJrMPJ2+Nc4lEHC0shmxNtCSS6FagmNv2w3S0bWvTi/aZgxy
         vG5cZsCR70+8nyrcLUZf+8lB/+7DOJk1lP4skbXJ+FcqZwxIwAZSOvxJkZOVn/+WhTUJ
         3oUNkCeAwXzlz7WjqFmyPZiX1poLE326R3XpuMbSAvxswchVfLhpkWWHGQCYPp1Pf/pf
         WbUrJiVTi8CbUW3QUsnvVa4JLx6lcZgDYLaPwSAuEVUdg+ZzHKEUGe7HCzOpyV7v0Su8
         VmIkAgfSIIfADOi5DPqvfNm/jJqWVTWqjqkN+QSv71HAO66tFmCzVj5zjfHo9Wmm3jb9
         1QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5L01wecfli+mbpc2reA9sYX86GK31JmxkVaD77jT208=;
        b=OK2ihyI38gXq5MF8pi9XMTOgxv35GUYpgK61YCOaLq47xXoh4ldtghpRfcRTtuF7dM
         S7sQI++vE0XaYwCEttjFEdrWTNZZF84mh5HV8G8VjHEUfI9vTUrOfAGMKvLoti/+QBJg
         481zV05DowqvgkLF97PLCnCRac5h1c/PJPpYyrNwZTJ/dlFLXVJo0yroMEQpaR2bKGFs
         P6TDh6pWgA6uAJKFSGs87hSdiYVHrhH5HbUS9Puru7Hm+FXUuAEttJf1zUjPqTc+Zhwd
         861syShJ/3M7URdNvJVWuXy7L56TxCI9dvwTvzGtSIA3ueBMwGiL8gkeXXt0GCLMggUD
         kUhA==
X-Gm-Message-State: ACrzQf3CsUad3rTmzKxKCVoD9YudlUfLNjkPtW2iCf5ekTBCaCudXsZ6
        3C0W8iKSZ3w94V7WQwvyx2tyfg==
X-Google-Smtp-Source: AMsMyM557Y3Ml2t31BNEn1s1Jmf8Up6yq+hdDSraVclt2hzN9xsg77NdjSwXVnWg7KdtzJaEn4lhTA==
X-Received: by 2002:a63:8543:0:b0:44c:be7c:78a9 with SMTP id u64-20020a638543000000b0044cbe7c78a9mr12289218pgd.221.1664921696449;
        Tue, 04 Oct 2022 15:14:56 -0700 (PDT)
Received: from ?IPV6:2600:380:4b7a:dece:391e:b400:2f06:c12f? ([2600:380:4b7a:dece:391e:b400:2f06:c12f])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090a930200b0020669c8bd87sm30720pjo.36.2022.10.04.15.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 15:14:56 -0700 (PDT)
Message-ID: <080c1152-1965-48cb-5834-d521bbf316e2@kernel.dk>
Date:   Tue, 4 Oct 2022 16:14:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: linux-next: build failure after merge of the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Anuj Gupta <anuj20.g@samsung.com>,
        Kanchan Joshi <joshi.k@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221005085046.1adefcfc@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221005085046.1adefcfc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/4/22 3:50 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (when
> CONFIG_IO_URING is not set) failed like this:
> 
> include/linux/io_uring.h:65:12: error: unused function 'io_uring_cmd_import_fixed' [-Werror,-Wunused-function]
> 
> Caused by commit
> 
>   a9216fac3ed8 ("io_uring: add io_uring_cmd_import_fixed")
> 
> "inline" is missing.

I forgot to pull in the branch post adding that patch... Pulled in
now.

-- 
Jens Axboe


