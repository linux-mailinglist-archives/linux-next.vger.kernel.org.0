Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C2A20BAF1
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 23:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgFZVII (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 17:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgFZVIH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 17:08:07 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5D0C03E979
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 14:08:07 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g67so4566310pgc.8
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 14:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5QZafrBOHReSAigLeQLaB8dHFcFb66791XFnIdiUaS4=;
        b=HykgGlBZz5r44Jrelk4LBTxug9hBtN340JGZEKohdio9yzd7feI5yweIlsuQ1vtm47
         jNWofa2w5mVPzhJnl0AS8ccR3gk1vRVSNzrA3/UmNzuV67NDtOGzhJ1OIiNBbbyDhN/9
         q9yZsDBk+04uuDc3GYEzPyMIirFlthojK6kjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5QZafrBOHReSAigLeQLaB8dHFcFb66791XFnIdiUaS4=;
        b=TBnTaK4zEmf8lX31Tyjo56iGtc48r3ec2a4C1RUmP0bdMyPT2SP3014laIVA1iTD9k
         zqg75qBkQUEpgK5bufZXuAfdc4svInbMv+Nkv/NLF6SuT1O7p7/St3GYHuj89AJULcUO
         vPF+yWy/dClv9FN81F0g16DqB71w5Mkaa3BXzROZxMaRsX5JMTkMRMq80n3RiZb4MuyO
         gIGPDzKX9SmZMqgDsoxCrrRgXpROrRFSZ64OJPFOwibavFHUUmg8AHk/yo20w1NkqNsX
         KpURrSoPA8brNXqdub5ik2IhaIYrFLCIYHPrFRGSanR5sb3sPmZJ3KribT4+6g++vbBP
         N40A==
X-Gm-Message-State: AOAM533jDTmmQ/ecIvI41SV7ddfQ/GCnTnzb5UacP3EEoe+iUZgg/M8T
        kkVmtMt4lANx/XV+pKRwyTq2tTbHYLI=
X-Google-Smtp-Source: ABdhPJzFsFB/Cbqr/aK6fGHvmGyKXEaW+XrPiL4vutbiKFHT7jNkqp2PGPWXmLlHaJpxIotgSqEOhg==
X-Received: by 2002:a65:664a:: with SMTP id z10mr580379pgv.352.1593205686932;
        Fri, 26 Jun 2020 14:08:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i191sm27542104pfe.99.2020.06.26.14.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 14:08:06 -0700 (PDT)
Date:   Fri, 26 Jun 2020 14:08:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <202006261406.4C2ABC2E06@keescook>
References: <20200626170514.13f9cd5a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626170514.13f9cd5a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 26, 2020 at 05:06:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (sparc
> defconfig) failed like this:
> 
> mm/slab.c: In function '___cache_free':
> mm/slab.c:3471:2: error: implicit declaration of function '__free_one'; did you mean '__free_page'? [-Werror=implicit-function-declaration]
>   __free_one(ac, objp);
>   ^~~~~~~~~~
>   __free_page
> 
> 
> Caused by commit
> 
>   1420b22124be ("mm/slab: add naive detection of double free")
> 
> __free_one() is ony defined when CONFIG_NUMA is set but used more
> generally.
> 
> I have reverted that commit for today.

Thanks! Just to close the loop here, Randy also pointed this out and
I've sent a fix:
https://lore.kernel.org/lkml/1de6b098-a759-dd96-df5d-9a282b2a991b@infradead.org/

-- 
Kees Cook
