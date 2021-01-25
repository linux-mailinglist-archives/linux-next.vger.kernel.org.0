Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DAB302030
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 03:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbhAYCIE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Jan 2021 21:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbhAYCHG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Jan 2021 21:07:06 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20280C061573;
        Sun, 24 Jan 2021 18:06:18 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id cq1so7396241pjb.4;
        Sun, 24 Jan 2021 18:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dJotwfyRiNvMA2JUWu/JdXPCefXCZhv30V+8f8cWdbc=;
        b=JZVXM3B0nywR9s6BtSUdcVekC9BKl92Ivhxa6IwhBdJRMuNjbijJUt6V2KjrKzJ0/E
         bgTk5GB0lwIsNPeRbSqZuc9xanAzEzB+bqlsvsGwYygx/wVh4ntqeOX+u2u4yZcIaYdd
         sqC1QgJ8BuGD5mjVTylvLzyKD7QYkxmNe+K8wwWJr4abG9Javr09s/Cd71yPNN75uVKT
         oJbxQf1T3/oDNT5+m0U90nzhVgy2KWg8P292uiXsd9SSB53XxDlSPGRZQyprVs/K48SM
         ViqTuYEk/+qLU/+g5chYYamO84wKVIBEJLrGHqZChQGHgQJgib+loWHcLH+CtacCIBrW
         WGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJotwfyRiNvMA2JUWu/JdXPCefXCZhv30V+8f8cWdbc=;
        b=RjQHAT1Vd+0m5ftE95n7oIysJpX/KQqq0N3my7FNElLPd/DGp9cGqZkt1XQ43L1OaG
         3kxMI2xSrK0i1eShR1uU9QSAf6waWINkyifxJ3nIfEi3dKQwUdAi5ReXc/IMABeTBBSI
         S9uFkPCoqfK1V9iAydKd7P6jrqbBYi2ROXpGc9U0NTyb/sbT01NTAxoqP5eM1ddUdXQY
         L/OqB2RwNnVfb398g5Vah/nAU08BuULb7LJtzYnfwa5p1oJFDJ4V0EenCpDxMJjuOwOH
         wTZRR1Be7WgCzmBmNEqRO59THcYRyauxMdqnWPFtg7FR6JP/4kjowpP4DNFo6Muo8cog
         ilmQ==
X-Gm-Message-State: AOAM531qAzzDWHaYK78zKbr5KLr+3jbYCOssEPN06NoDCFctk42hfftj
        XYDjf9mKiDAwleQY75F95OIt+Af6JpE=
X-Google-Smtp-Source: ABdhPJytq+LS4ij4D7XRl5F7Ax/WUiGR4m6QVCZjCrYHJIIfoULzrZLDv3NMSlEGS7/n+eQ/rhnVGw==
X-Received: by 2002:a17:90b:2286:: with SMTP id kx6mr6555938pjb.92.1611540377603;
        Sun, 24 Jan 2021 18:06:17 -0800 (PST)
Received: from localhost (g54.222-224-210.ppp.wakwak.ne.jp. [222.224.210.54])
        by smtp.gmail.com with ESMTPSA id b206sm14417100pfb.73.2021.01.24.18.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 18:06:16 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:06:13 +0900
From:   Stafford Horne <shorne@gmail.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the openrisc tree with Linus' tree
Message-ID: <20210125020613.GT2002709@lianli.shorne-pla.net>
References: <20210125090506.35337fa2@canb.auug.org.au>
 <20210125010446.GS2002709@lianli.shorne-pla.net>
 <20210125124746.40e2638d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125124746.40e2638d@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 25, 2021 at 12:47:46PM +1100, Stephen Rothwell wrote:
> Hi Stafford,
> 
> On Mon, 25 Jan 2021 10:04:46 +0900 Stafford Horne <shorne@gmail.com> wrote:
> >
> > Thank's I knew about this conflict but I was not sure the best way to handle, I
> > was/am going to rebase the openrisc/for-next branch onto 5.11-rc5 once released.
> > I will resolve the conflict during the rebase so you should be able to drop the
> > conflict patch after that.
> 
> Its a pretty trivial conflict, so I wouldn't do the rebase just for this.

Alright, I will not rebase.

> > The issue is I had a fix that went straight to 5.11.  Should I usually put these
> > kind of fixes on my for-next and my fixes branches in parallel, that way I can
> > resolve conflicts on for-next before hand?
> 
> I notice that the version in Linus' tree was merged from a separate
> branch.  The easiest that to do is for you to merge that same branch
> into your for-next branch - that way you only get your own changes, not
> any other stuff that might be in Linus' tree.
> 
> > I don't usually do that as in my mind for next is for 5.12 and fixes for 5.11 go
> > straight to 5.11.  Also, I don't like putting the same patch in 2 queues.  But
> > if I got any advice on how to avoid this in the future it would be appreciated.
> 
> Like I said, just merge your fixes branch into you for-next branch
> when/if you think the fixes are important for further development, or
> the conflicts become to great.

That sounds like a good idea.  Let me do that.

> I can also add you fixes branch to linux-next if you like (I already
> have 86 other "fixes" branches).

I think that should be alright for now, I'll maintain merging the fixes branch
myself when I think it's needed.

Thank you,

-Stafford
