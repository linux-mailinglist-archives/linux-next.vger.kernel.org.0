Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4102E4BFD7E
	for <lists+linux-next@lfdr.de>; Tue, 22 Feb 2022 16:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbiBVPvW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Feb 2022 10:51:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233659AbiBVPvV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Feb 2022 10:51:21 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1F549240
        for <linux-next@vger.kernel.org>; Tue, 22 Feb 2022 07:50:55 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id t14so20225989ljh.8
        for <linux-next@vger.kernel.org>; Tue, 22 Feb 2022 07:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qAtUVXfuLaxgguW9c3Kzo1zkxg5Z4oMn3pkavgpv2h8=;
        b=vr9I9na0IxZ0Cu2c/ubqaTiDT+30oJX1JutjDUqv9l/YV4Cm3i+xrfFaLDll1cEDUP
         6HiHMx4Un5Yc5zf5Z2BrZu9SlYItpXreSUsVvNRBoGET8kijMHcPsL/xYGYa0zOt28NI
         kQ7O4JVUckjFSuEwnsG7bwFkaQheja2tut17JGr+5lFQBVQ2PApfMHZl0f9ZC9lusn7s
         Xmv/2Aq00lh3FAlTP1uEVgPG2ZfyjRN8rcMIQ4Q2xE5kmJuVFoLHAGZMD+SnpSGDq74/
         IB7JKYAcB5CapiFUY7YO2AkPPx5PnOIk1794Xd0BWlY+sad2YyQDzM+iEItDMcz7DzMZ
         RT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qAtUVXfuLaxgguW9c3Kzo1zkxg5Z4oMn3pkavgpv2h8=;
        b=YZYSr4c07f3yMmcTrIPhtjMB6/sqjXVxEmw2eylLQf4E6NVcTw6pXtq9+HYz0LlECU
         Ra/E45fvoBddK/2T7txZTuZLc+F5GEZFGg6TCue5fVbcTDw8++MeWIP4AwcqGb6eefo9
         fW9xbYmDjK87C9vmDNrM7q79obHMl1QWcfNXPNfMhpp6hjC11sErdN5QYbCmFfl08TOo
         Md8DuNpEe5GHD9+Qoz1HooYwaG7d1i06BhOJ+E5KCUG5HVsxHe8zytoB9KGIgUmNWafb
         CbATNW/LFRLLz4Jsop9b1nNF6/NNnUhSxqQrRXvL82aaG80stpaVhA53FqFkqNeCxUge
         9hsA==
X-Gm-Message-State: AOAM532gsW5t+qMgsUJEC4AOi9zUpezuHYP1LyQ8Jkyey+cGf+OBiUEG
        NvkpZ1qtx9/k4RHFNET+1w9b+/PAYvJMgMrXKU/9Yg==
X-Google-Smtp-Source: ABdhPJy0zqzkv4lTl8d52Q+rYooqr8hRnAQDzruDQjDHWj4SOnVGa8sqMlQ6yRCJbm2ixwYTDCCGPyyw4g6Ysitk7pE=
X-Received: by 2002:a05:651c:1594:b0:239:9df5:f447 with SMTP id
 h20-20020a05651c159400b002399df5f447mr17743000ljq.463.1645545053983; Tue, 22
 Feb 2022 07:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20220221165508.2633962-1-broonie@kernel.org>
In-Reply-To: <20220221165508.2633962-1-broonie@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 22 Feb 2022 16:50:17 +0100
Message-ID: <CAPDyKFpBfZ3-03Tdm=cTcV7Rzwo6Z6bR1vKOJnexrrGupODQvw@mail.gmail.com>
Subject: Re: linux-next: drivers/memstick/core/ms_block.c
To:     broonie@kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 21 Feb 2022 at 17:55, <broonie@kernel.org> wrote:
>
> Hi all,
>
> After merging the mmc tree, today's linux-next build (x86 allmodconfig)
> failed like this:
>
> /tmp/next/build/drivers/memstick/core/ms_block.c:158:6: error: implicit declaration of function 'bitmap_weight_eq'; did you mean 'bitmap_weight'? [-Werror=implicit-function-declaration]
>   158 |  if (bitmap_weight_eq(msb->used_blocks_bitmap, msb->block_count,
>       |      ^~~~~~~~~~~~~~~~
>       |      bitmap_weight
>
> Caused by commit
>
>   5f8d171cd8a93f ("memstick: replace bitmap_weight with bitmap_weight_eq where appropriate")
>
> I used the mmc tree from 20220217 instead.

I have now dropped the offending commit from my tree. It turned out to
have dependencies to additional patches.

Kind regards
Uffe
