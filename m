Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD5C316FED
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 20:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233892AbhBJTSh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 14:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbhBJTSc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 14:18:32 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4527C0613D6
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 11:17:52 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id k4so3133537ybp.6
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 11:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9aA6Xw6mT94CNGCxq5f7LuZjLvU8K8LOND95Ek9RQ1Q=;
        b=QejN9RgQSxk9QTKdlljQSpqon3KC8kg8o2twMDVtq/k+yQqB6ZuWi4WiFq5d64REiM
         WilZJvwOmpr3UMBnyk2V7Si+vG1xeH0gqPWSLU6cd7PFWw/XRaafvW2BihPLLUlxH9Be
         bDXH5mwYIsaxHLSDGY7wacost2X4sIGeK187hDuIPnDLk4tazsLjkdx/DvdwrFrE+GVK
         oDxJYVgHnD7863jwqVL9CfZ+WRawtcCQITqBx68DeJpsNUb5y+OuM6NwduQ6tGYsghsw
         odptqfg9ln34LlyAjKurfh1brKHfuaZjycKWMfdKkAa9bqwHsg+q2vb3NDkAlOZqrdM6
         M1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9aA6Xw6mT94CNGCxq5f7LuZjLvU8K8LOND95Ek9RQ1Q=;
        b=qMC0/KHPcvUjgtxITD4vLPNxdSZfaOV0WHjb7BVC6MM/gIIpfCrt9/gTmHKM6Z+X4k
         RYvMclzdwAloCH4ZdkPNsCcJbfqonR2KIJFDJ0eowCA5/VdNrjtnWD5OMz57bmqgt8YY
         3UPZlByexyfzRPq8tP+YNzuJ6Y9pFPy9cSm+ymvnxGtCtnauMYNbE5NvFjctU/8i3Dby
         Ll3CcRw0NKpE5yFBKE1Z8DPGTdU6gQiRFJImuqtTFoS9OivP1y1y5WsE1bbGSwk/Sbhp
         2ioG4gGkiV9Ecb70/PSZKsnqZ7MR51itqipYtcUkCKIMCN/5goAY7HYd8+4BMl3E/pl+
         KDEA==
X-Gm-Message-State: AOAM532GEYhqkpewopMD9MTEEueXyEPqgSGwhLVREI8qxsDMUALgMxse
        TmuddphJodhQbB5kym9aFZ8PY4wnUaEv045kXbRIGQ==
X-Google-Smtp-Source: ABdhPJzxGeFqujTrgxQl2S/dooBR3t3SoMGQpQu/DLZMBcfNvp0oWEY97iKzf/DuXzwAC1XbR9McpLFrB0HSE93rDhY=
X-Received: by 2002:a25:3345:: with SMTP id z66mr6343800ybz.466.1612984671872;
 Wed, 10 Feb 2021 11:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20210210214720.02e6a6be@canb.auug.org.au> <YCQjfqH415zIhhyz@kroah.com>
 <CAGETcx88Ln2XxuLN7P2BVhzB=OQxPLLsBN7WLL1j2JtR4+Z8ow@mail.gmail.com>
In-Reply-To: <CAGETcx88Ln2XxuLN7P2BVhzB=OQxPLLsBN7WLL1j2JtR4+Z8ow@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 10 Feb 2021 11:17:16 -0800
Message-ID: <CAGETcx9zM2OdbNDcC7pXGtY9yqRgb-wt0YzFv6wfNgQi0gM+8w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
To:     Greg KH <greg@kroah.com>, Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 11:06 AM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Feb 10, 2021 at 10:18 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Wed, Feb 10, 2021 at 09:47:20PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the driver-core tree, today's linux-next build (sparc64
> > > defconfig) failed like this:
> > >
> > > drivers/of/property.o: In function `parse_interrupts':
> > > property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'
> > >
> > > Caused by commit
> > >
> > >   f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interrupts-extended")
> > >
> > > CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.
> > > I have added the following patch for today.
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Wed, 10 Feb 2021 21:27:56 +1100
> > > Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()
> > >
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  include/linux/of_irq.h | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
>
> Thanks Stephen!

Actually the stub needs to return an error. 0 indicates it found the interrupt.

-Saravana
