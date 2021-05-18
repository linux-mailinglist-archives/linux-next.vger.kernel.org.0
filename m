Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCB03876EA
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 12:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348668AbhERKvG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 06:51:06 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:36630 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348669AbhERKvF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 May 2021 06:51:05 -0400
Received: by mail-wr1-f52.google.com with SMTP id c14so7885020wrx.3;
        Tue, 18 May 2021 03:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZSwYihIZGpbb45n4wypWBPVOrCv+O4B/E07Xsw1csmA=;
        b=MS2ImmnLz9CkW6gdNmQ0/Hp4Je4jGO5q4mEORVQFwBtRpPNfuX3xbtjDJTTPoYcaWk
         j0BQwjB9ER+7NRt2dpPgMrpX0eTQQGmxZIQ5ywLdJpzCqsrZttyx/CsMyNIDKjX2aUZM
         JUsKtJvyhVqTDsKuxnWnJX5jmgKXRWKOtwL24fzjlFKVH55PmjMEsD4Cz35a3nPd3jDS
         E3+roUV12MqLyAFVEvy3tnt7XG0icSRHAckOfhVxTnE0kWmREjfsYTOFPLfORAozElvD
         Azx6VpySWVtTHfC42tTJ0EakeO2KFsUCv5F5GAny1N5K4RMA3dgYd85iB+XfAXmbnakF
         VINA==
X-Gm-Message-State: AOAM532p5M93kKhzNb2klCSFXxGNeywJV5mSNtS+vlxfwtktMQJdq4wK
        +5D/1zCPMceqmoeZ1XJ+9cs=
X-Google-Smtp-Source: ABdhPJxudnR2AVzoDLYV+oR7mHwqvlDcMddWZHzcZmA3dsiPJoNl+SJPpPmh5z3YQ09Tz/mqgPNxcA==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr6123486wrn.335.1621334985907;
        Tue, 18 May 2021 03:49:45 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id x16sm20835526wrp.6.2021.05.18.03.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 03:49:45 -0700 (PDT)
Date:   Tue, 18 May 2021 10:49:44 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wei Liu <wei.liu@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hyperv tree
Message-ID: <20210518104944.itnusipj755gsr5m@liuwe-devbox-debian-v2>
References: <20210518170421.584dc0ec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518170421.584dc0ec@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 18, 2021 at 05:04:21PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hyperv tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> In file included from include/linux/printk.h:7,
>                  from include/linux/kernel.h:17,
>                  from drivers/hv/hv_util.c:11:
> drivers/hv/hv_util.c: In function 'hv_timesync_init':
> include/linux/kern_levels.h:5:18: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'int' [-Wformat=]
>     5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
>       |                  ^~~~~~
> include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
>    11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
>       |                  ^~~~~~~~
> include/linux/printk.h:343:9: note: in expansion of macro 'KERN_ERR'
>   343 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>       |         ^~~~~~~~
> drivers/hv/hv_util.c:753:3: note: in expansion of macro 'pr_err'
>   753 |   pr_err("cannot register PTP clock: %ld\n",
>       |   ^~~~~~
> 
> Introduced by commit
> 
>   32c0ff83550e ("hv_utils: Fix passing zero to 'PTR_ERR' warning")
> 

Thanks Stephen.

PTR_ERR_OR_ZERO returns int while PTR_ERR returns long. That's why this
warning is triggered.

I will fix it in hyperv-next.

Wei.

> -- 
> Cheers,
> Stephen Rothwell


