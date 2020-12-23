Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806122E10BB
	for <lists+linux-next@lfdr.de>; Wed, 23 Dec 2020 01:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgLWAOR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Dec 2020 19:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgLWAOR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Dec 2020 19:14:17 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27FBFC0613D6
        for <linux-next@vger.kernel.org>; Tue, 22 Dec 2020 16:13:37 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id f14so2116748pju.4
        for <linux-next@vger.kernel.org>; Tue, 22 Dec 2020 16:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KUHswI489TcbSpPmfFtLRQLW+YiGqpECSxLF2vIRidE=;
        b=H+m7bY4dqeOfNUUx9jPfC6D8GqShd3J8SXyMmr+OyLLyje9gVIC5tXj/ChhpKnf8r1
         QmqHQM8wf36WqeeVYPhGvl4Y9igLzTPAk1iCA7w56+WP1JSbPQlsp8QxlLnu4Cb7N069
         7gj1Mo5/83rff5ZWA++IuHUahn2WA6tozp1BemRABHPcLVkj2LyT5/WHH/2Hhpe776+z
         lnUOm42nwH3c4cwwXLrvnY+PV1NIwx6+9q/zvAi+cKKIZqgl7LaAmijF1O/70+r76sIy
         1FzkQch4uBDQ8LDfvRSPsL3WeSTPQe+oksAXJKslXslf954ULPy/KgDblL6tvK5uLXi8
         jc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KUHswI489TcbSpPmfFtLRQLW+YiGqpECSxLF2vIRidE=;
        b=dcajTedu31ev4zX66XUYdLVcC52y8sj6hrFrJ/jCPorLtbBmH/IlF7upM8dt0VesyQ
         bL0WgC6tXJjxOFMXEylttc5yRcJBfsZ2D5Fa8+j8xJAaR7BW6Gagtnb4pQLdmkcXqtHV
         g47NOwx6KxqRAsUg4OT4EmnR3cP7mGzLRNiOpx53h9WxkjLIV2aw/MXUbrY2Uku7KLcH
         qLXnmttQDgyVGfUHpY3BMRn0ju/5X5ffIBKBtJIt4JbqdctdVEqLP1wm94qesznyH19a
         Ss9t5MbDBTnyKripvaetN7T2ElaVX9yKBCYZaS7uLi5SoLpyS3c+boycIDrZU83ypTmQ
         INaQ==
X-Gm-Message-State: AOAM532ff/zMVG2Z3AEcfxMtiXOnrRKUy4RrLmVI/6CznmBylZ4W64mJ
        /3cdNc/mquc1qgi3jjzz58cF+AGTN2Nd5g==
X-Google-Smtp-Source: ABdhPJyL+olbEgdu180tVOEDDVUXc0As3vDfRk74Ysp0prDCLKeMri47yIZL5+asdvjYcny6Q3X2cg==
X-Received: by 2002:a17:90a:72c8:: with SMTP id l8mr24204831pjk.232.1608682416384;
        Tue, 22 Dec 2020 16:13:36 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id k11sm22546135pgt.83.2020.12.22.16.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 16:13:35 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201223104726.36ec2aaf@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <02376793-146d-546d-3bac-32513d5fc88c@kernel.dk>
Date:   Tue, 22 Dec 2020 17:13:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201223104726.36ec2aaf@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/22/20 4:47 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/io_uring.c: In function 'io_uring_get_file':
> fs/io_uring.c:9408:6: warning: unused variable 'ret' [-Wunused-variable]
>  9408 |  int ret;
>       |      ^~~
> 
> Introduced by commit
> 
>   efc2519f427b ("io_uring: fix double io_uring free")

I'll fix it up, doesn't show up in my build...

-- 
Jens Axboe

