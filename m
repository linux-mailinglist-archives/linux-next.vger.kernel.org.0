Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D2C3E14A7
	for <lists+linux-next@lfdr.de>; Thu,  5 Aug 2021 14:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241308AbhHEMYh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Aug 2021 08:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbhHEMYe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Aug 2021 08:24:34 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D842CC061765
        for <linux-next@vger.kernel.org>; Thu,  5 Aug 2021 05:24:20 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cl16-20020a17090af690b02901782c35c4ccso5166914pjb.5
        for <linux-next@vger.kernel.org>; Thu, 05 Aug 2021 05:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=481kLgNLhz1yneJKKCHLaWwT3IQ2qIrRbMfTuoiWLpI=;
        b=jmzDOOepPLmJiZ/bbOkFEvXBAtiR9fVO4+LNguA3FIU+LGlS+4BFQ2afsIDZ4OIsoq
         NaPN8JX/ivIW/padho8izo3e7YWe1TsQ4CmqZwEhoTHCzTvzZbkJYPJpuMiVdcSO2FIK
         u77wpkFg+fzP/a2yU/bSQLE0e+GT2K6CWKBbrn4600S0D0eKONipSRNlnVymL1BT+o06
         6OM4k8qf7zHKZbhiwsfqI2PFtGKGnYUnEOE1pV3H9GltI6sEthKlqCDgVUSUIOCIoV6Y
         AiJSImRSYsgJ+gzEOpDMkW16tXPCHA5h0JRjTbdy7Q8scmUy9VC4jnL59vl+wP4BX5bU
         c9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=481kLgNLhz1yneJKKCHLaWwT3IQ2qIrRbMfTuoiWLpI=;
        b=NV/Irk+CqO+JZ9f9mCvu4ARTWO4Tvn8KFeIKkAAH7mSqowDPm4kmKvUgJDEuFG32GG
         SfJLCKx8maycQ8cjSXdzjaY5SqKdKD6KMa7/G6HP1V7pxJnfjh//OAVGsSO57LeJPdZl
         RcSXTvAIsuSzFnPgMYllfsg9bV8mGhl9vIumEmXaWJHgsrs+JzcCvu7WsmrjFReSOvzw
         fI5YntgL86+xSUD49NNZKhQlqG5lBFLjY+LJ44t0TkY4rnJi1f0UfFeo6ompx02OiPLd
         Qd5/inkQVKkBMdVvxEI89a6uaahJL9MSMMGQrwpyxk6W25mXVx7DFOWU1QqlEBN8vda9
         scZg==
X-Gm-Message-State: AOAM530FJjmtqJ1vbA7oLinfE6XFDYGWLw55+rQhGxBwTUsqf+GiKb6e
        iGXUe/VRkihub0qPVB+O3cHPpQLbYzT29LAl830Lbg==
X-Google-Smtp-Source: ABdhPJyv8N2IN3o+g5lnf89frWzv3h5tJWYb8BR4N5wI6PHWEX9oKKo+NluxGDDt/UcMG3Y4rwQ+FJP1/Lj6QVJnXi4=
X-Received: by 2002:a17:90a:5982:: with SMTP id l2mr4594903pji.18.1628166260292;
 Thu, 05 Aug 2021 05:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210805120138.23953-1-broonie@kernel.org>
In-Reply-To: <20210805120138.23953-1-broonie@kernel.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 5 Aug 2021 14:34:02 +0200
Message-ID: <CAMZdPi-sKcBmQx99o75ta0DrVnXxaUk=v9j+8BgpE1Jvnz9F+A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To:     Mark Brown <broonie@kernel.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Network Development <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 5 Aug 2021 at 14:01, Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> After merging the mac80211-next tree, today's linux-next build
> (x86 allmodconfig) failed like this:
>
> /tmp/next/build/drivers/net/wwan/mhi_wwan_mbim.c: In function 'mhi_mbim_probe':
> /tmp/next/build/drivers/net/wwan/mhi_wwan_mbim.c:611:8: error: too few arguments to function 'mhi_prepare_for_transfer'
>   err = mhi_prepare_for_transfer(mhi_dev);
>         ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/drivers/net/wwan/mhi_wwan_mbim.c:18:
> /tmp/next/build/include/linux/mhi.h:726:5: note: declared here
>  int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
>      ^~~~~~~~~~~~~~~~~~~~~~~~
>
>
> Caused by commit
>
>    aa730a9905b7b079ef2ff ("net: wwan: Add MHI MBIM network driver")

Thanks for reporting, I see David already fixed the issue in net-next tree.
Actually, we also need the same change for mhi_net driver to fix
7ffa7542eca6 ("net: mhi: Remove MBIM protocol").

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index d127eb6..975f7f9 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -319,7 +319,7 @@ static int mhi_net_newlink(struct mhi_device
*mhi_dev, struct net_device *ndev)
        u64_stats_init(&mhi_netdev->stats.tx_syncp);

        /* Start MHI channels */
-       err = mhi_prepare_for_transfer(mhi_dev);
+       err = mhi_prepare_for_transfer(mhi_dev, 0);
        if (err)
                goto out_err;

Regards,
Loic

>
> That API has been modified in ce78ffa3ef16810 ("net: really fix the
> build...") in the net tree.  I've used the net-next tree from yesterday.
