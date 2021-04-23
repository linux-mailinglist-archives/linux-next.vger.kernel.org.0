Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F3D369B5C
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 22:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232573AbhDWUhk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 16:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhDWUhj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Apr 2021 16:37:39 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B067DC061574;
        Fri, 23 Apr 2021 13:37:02 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so46383530otn.1;
        Fri, 23 Apr 2021 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n+Lz2TX+kMzb81cQaVrZn/S3HsQ886ZKObdk4TR8rGM=;
        b=mtUubTCiYbbtl7jdlEhqYee9xYWGtLmQVd4S4ti3uiFf7RNFAxhNToaQ0yBpWsEmIS
         7X3AhI/WrAuco42pB5so245EmeieJ7GNpsc7COlKbr5L9eR95+8y0Nm2dquGuopmg4wv
         0GCVape7MMBAJfE34o5kkcuLxHJ1/r0XDBPP1N/T2DrASZ/2tJADHqNj77tHKqUc7al8
         a9vQIUzYSR6LyoZi1cZ2x56Z6wb4i/mrFiBoxwGnxVIYYlKiscE62M2+Jz/4MYfGwVuR
         ZohYPvIkptMVLvgZGiKdoYKF865X65zf9nEdnAAWPDZAp3XLL4IV4P/Y9shMioYlGdUm
         2c9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n+Lz2TX+kMzb81cQaVrZn/S3HsQ886ZKObdk4TR8rGM=;
        b=Big4n5L8kP9gjNUVf4S5w3sraP7FmYdgZ6eIP5dJsnpn3QyQagWHehYbirGDXKHLVB
         ysdA3z/MXcdFaDXyl3MeCz9ZEjiVLmJobQRljF9vMPGIenwd03qgg6/4ua71AL/Uj1T2
         emTaM0JYUI3l6fHGopgTtaFt95+wnc9kusPa2SV1kWapHTwOug6HGIVapooxv4BTpyjr
         D/naOLQPHI4Agwl+XqfFkUsciT+/AiPYc7yTQ356hF67MMNa3zIXc7mkhOjXsj2oU1O6
         G7pXD+fbI3sFFbY1t3QhV527ZiqpZue2RocrL9WESApSSH2v809BpAKmKdbTAehm2JWK
         K2SQ==
X-Gm-Message-State: AOAM533zFTLgkPQz5ELpOA52hAsC9u0YOB9TKa4rbyM+3o7FsxPeBFUY
        QF1nt2k1iCuKaicZPGevQN7MtyB786GJtTOKcec=
X-Google-Smtp-Source: ABdhPJzC4zx2bb7IiGqj8Z2NxHVgJ1/V4g7any3R9OrebY62e+iqDOGxVUVa2v8coETtkxX7ySnfVX7V4tNPA5HKJ1M=
X-Received: by 2002:a05:6830:15d3:: with SMTP id j19mr4891264otr.23.1619210222043;
 Fri, 23 Apr 2021 13:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210416124044.53d4beee@canb.auug.org.au> <20210421164024.42bc068f@canb.auug.org.au>
In-Reply-To: <20210421164024.42bc068f@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 23 Apr 2021 16:36:50 -0400
Message-ID: <CADnq5_NGLC719T9Mx1wR+aLi8Ybwr8-ocCSYCRe=uNEBvJ+R4A@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Prike Liang <Prike.Liang@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 21, 2021 at 2:40 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Fri, 16 Apr 2021 12:40:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the amdgpu tree, today's linux-next build (powerpc
> > ppc64_defconfig) produced this warning:
> >
> > drivers/pci/quirks.c: In function 'quirk_amd_nvme_fixup':
> > drivers/pci/quirks.c:312:18: warning: unused variable 'rdev' [-Wunused-variable]
> >   312 |  struct pci_dev *rdev;
> >       |                  ^~~~
> >
> > Introduced by commit
> >
> >   9597624ef606 ("nvme: put some AMD PCIE downstream NVME device to simple suspend/resume path")
>
> I am still seeing this warning.

I no longer have that patch in my tree.  Was this an old build?

Alex

>
> --
> Cheers,
> Stephen Rothwell
