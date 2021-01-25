Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D62B301FCF
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 02:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbhAYBFd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 20:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbhAYBFb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Jan 2021 20:05:31 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CF6C061573;
        Sun, 24 Jan 2021 17:04:50 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id u4so7527185pjn.4;
        Sun, 24 Jan 2021 17:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xX8VWA+7nT5CEpFCru8GObYbwrFXuzrIhcJFF/KDqTA=;
        b=EdhKgawU4LCq3WC27iQcTDd0lwWLA/Wg5hsYzYlWs7wNPEWh0EQuXFVSyQUvY4EPDo
         +s1gsmzrFFCk7pMOuKQhyrmIMA07WJ5h3lEUL+lQd/lcUoBT8iZV7R0Xbx14lUQ69nAO
         hddvmwL20/f2XPNPzv1nXbKe0EznpV1tIr5gly/1YcaKwPNc0MIqez4CAEl7o+GvGwIs
         u17LSO/B9zGg3KQgf0O6necdMFIARtyQFrnYkBVxO5dTFr6Z4Wd1fhAZQLrIr6ovyTlu
         KC8XBa+JZ27hsUTvUyMf+adE9dXp9+XEI4HK/x+wt7504X2mSJmxlLRMDGpDGcWejfK0
         y4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xX8VWA+7nT5CEpFCru8GObYbwrFXuzrIhcJFF/KDqTA=;
        b=QL1m0A40rAXGkRzetYss9mC6QXqjeb3kVLb5msqwTBrEr7QQQ7LamzukRj3y5AMAPI
         Gu+o1p52cMJeKI0trQKvUnemyTNx0dGQaP21b+HopXzfH1HkPQRmwZGTeiPSaNSL9eHr
         vUhMBTrikQSuDxCzYqnb4Eb9VXdeBxAvzcn1JsOmGRIRciTSKX9xnjVAGyVHwF9F3bhv
         7yYDDAHwdwcj1g1GYrfO0tyFxrqNdoYuDqDNpRAbFbBVNesoCXFkJx71ajxfkamt1zlc
         rYh2qimu4pvuCcuj0Lm+g3Sl47zyWg9KmotZzscfxKARb9xYaYjeil9EoSsKolTj/9N0
         VxLg==
X-Gm-Message-State: AOAM5324JzpZXwOkes/QDjgnlU+kPFfmWdYTEDhQYGI2deGJKa3ETGz3
        qZBubum3fMCBd8qgYuNjnH0=
X-Google-Smtp-Source: ABdhPJw3BebydYhRs7Q0XQLCeCL8oBTkmsHOW0UjY7bdOPaA0wDAuwmQedqGSUIrecLiZ1/eqv7G8w==
X-Received: by 2002:a17:90b:34b:: with SMTP id fh11mr3653329pjb.225.1611536690246;
        Sun, 24 Jan 2021 17:04:50 -0800 (PST)
Received: from localhost (g54.222-224-210.ppp.wakwak.ne.jp. [222.224.210.54])
        by smtp.gmail.com with ESMTPSA id z13sm14885602pgf.89.2021.01.24.17.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 17:04:49 -0800 (PST)
Date:   Mon, 25 Jan 2021 10:04:46 +0900
From:   Stafford Horne <shorne@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the openrisc tree with Linus' tree
Message-ID: <20210125010446.GS2002709@lianli.shorne-pla.net>
References: <20210125090506.35337fa2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125090506.35337fa2@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 25, 2021 at 09:05:06AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the openrisc tree got a conflict in:
> 
>   drivers/soc/litex/litex_soc_ctrl.c
> 
> between commit:
> 
>   e6dc077b7dff ("soc: litex: Fix compile warning when device tree is not configured")
> 
> from Linus' tree and commit:
> 
>   3706f9f76a4f ("drivers/soc/litex: Add restart handler")
> 
> from the openrisc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Stephen,

Thank's I knew about this conflict but I was not sure the best way to handle, I
was/am going to rebase the openrisc/for-next branch onto 5.11-rc5 once released.
I will resolve the conflict during the rebase so you should be able to drop the
conflict patch after that.

The issue is I had a fix that went straight to 5.11.  Should I usually put these
kind of fixes on my for-next and my fixes branches in parallel, that way I can
resolve conflicts on for-next before hand?

I don't usually do that as in my mind for next is for 5.12 and fixes for 5.11 go
straight to 5.11.  Also, I don't like putting the same patch in 2 queues.  But
if I got any advice on how to avoid this in the future it would be appreciated.

Thank you,

-Stafford
