Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC24C14B199
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 10:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgA1JLl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jan 2020 04:11:41 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45273 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgA1JLk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jan 2020 04:11:40 -0500
Received: by mail-pl1-f194.google.com with SMTP id b22so4838277pls.12;
        Tue, 28 Jan 2020 01:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=unMfPG99T1AKKHKiItdEAt564JyG03P4dOBDlwaWG6U=;
        b=UnmbRH7ZXXMNOcrYNw144+NVTSNLDm4TEzmTiHQ4kjMV6/zMNfWuqhT1GmeFpHWF6d
         rlRqCpAWNyTmEtsnyUYcOMe070tCPaqqepgLaWGi2KG1tGdriEfRchqnSaIUlh5ZOkhS
         h4lcxsCXNK3wnch8ay6sCSlLo5Ks9fub8jErvRE7KT2r/QDLFyp0jscAKFEwCAvRcLUg
         vEOTSO37MuaKrue0pnp1NbdEOL7ufgZVSyqkP/+XyJ8mSpw0H+mJR26IDrGsclMR8LdO
         FVwPxQoIrsxhTwwb15fSP8d0tnFGaxL0G99+lsqJL1U0tfuu4C7Jxj7UFSi+ya+CLSwY
         +4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=unMfPG99T1AKKHKiItdEAt564JyG03P4dOBDlwaWG6U=;
        b=t3/bypwIiYB0BSgkKgCIMvwF/f8jcgKxXy2nsuhuh4PfXT1N9tKMpqvcwMXhwFsJXF
         nUmvzgVbUdIh/+J66kyWYgaL59st8HxbGgpeJKEbtQfTm3jUYud7e3sf+c3EvLEL6XcT
         nAjFgf8uHwmjAmaExOjZLWRLYScsnIk18AXp8SbBjC6+SVWEVPKzmFQgji6J0NMb4uku
         RS+SolNQaiHbZuHyeEv60dYpbsPc1U+H41HLjUVfzg5CyxnP5N8FLqUdfkd1MMC0elpq
         K+kR2luAJa4NZApqCY/SId4dRR11K1FYbNXyLpzUnRYo2doi7eQgkw/j2sQwu/alxl8Q
         sgxw==
X-Gm-Message-State: APjAAAWM49fQJHLdteATe1Rg/C0hi9A/TbZyfXJVOsRUccI9Qc2eiDcz
        NB1BPKxAUoiCJBlOcKoAvVHvMWzHilIuEF3MOqNzfFLr524Jrw==
X-Google-Smtp-Source: APXvYqweRolvFWVz18/sM7wnKCMsZZnHBdEwDqKRPeZ/wvUcduW6V8RHCRetRsDXKNvvy1iEh2A07CmEOANF0U+2tug=
X-Received: by 2002:a17:902:d20c:: with SMTP id t12mr22509768ply.18.1580202700174;
 Tue, 28 Jan 2020 01:11:40 -0800 (PST)
MIME-Version: 1.0
References: <20200124161558.7cbb88c9@canb.auug.org.au> <20200128100311.3ca81231@canb.auug.org.au>
In-Reply-To: <20200128100311.3ca81231@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Jan 2020 11:11:32 +0200
Message-ID: <CAHp75VctM6DBpDFj0eXUo4ipawCpfDgqexBHwjQGQpomjY2YDQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the generic-ioremap tree with the
 drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Darren Hart <dvhart@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 28, 2020 at 1:03 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Fri, 24 Jan 2020 16:15:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the generic-ioremap tree got a conflict in:
> >
> >   drivers/platform/x86/intel_scu_ipc.c
> >
> > between commit:
> >
> >   74e9748b9b21 ("platform/x86: intel_scu_ipc: Drop intel_scu_ipc_i2c_cntrl()")
> >
> > from the drivers-x86 tree and commit:
> >
> >   4bdc0d676a64 ("remove ioremap_nocache and devm_ioremap_nocache")
> >
> > from the generic-ioremap tree.
> >
> > I fixed it up (the former removed the code updated by the latter, so I
> > just did that) and can carry the fix as necessary. This is now fixed as
> > far as linux-next is concerned, but any non trivial conflicts should be
> > mentioned to your upstream maintainer when your tree is submitted for
> > merging.  You may also want to consider cooperating with the maintainer
> > of the conflicting tree to minimise any particularly complex conflicts.
>
> This is now a conflict between the driver-x86 tree and Linus' tree.

I can't reproduce this. Linus already pulled PR for PDx86,

$ git checkout -b test-xxx origin/master
Branch 'test-xxx' set up to track remote branch 'master' from 'origin'.
Switched to a new branch 'test-xxx'
$ git merge for-next
Already up to date.



-- 
With Best Regards,
Andy Shevchenko
