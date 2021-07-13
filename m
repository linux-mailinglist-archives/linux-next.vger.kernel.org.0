Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65B03C6C28
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 10:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbhGMIrm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 04:47:42 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:34464 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbhGMIrl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 04:47:41 -0400
Received: by mail-vs1-f48.google.com with SMTP id a22so5282930vso.1;
        Tue, 13 Jul 2021 01:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GFKmfYD/nq2s2kUBoq5cQahfH3Ptn/14mS4Xud4XnlA=;
        b=E2Z9cMkT0ZBcYEqZ1aqdgaDVn/N9xQM70AZSAwYHuMJrNOCAq4EWplLXBHClD3tWUi
         MPWFFhdzh5/nbhKctYeKeMQ5KNnNiDzVKEFpSk0K3+tBYQHDpnMtyev2P6tzHsyic7Wz
         mIHUBbiF+i0Zr8mSuzTgAexQTkEafOMCPK79WkgM6z5HKRn1MQkFE6JD0WenUROBNwtP
         /dAEB2ky7MSogLg0pBopaZXfjoSUdtiNPhI1yNWtq5QKiZyVDz98CmfozfqAzbHHppzM
         QwzqSMZgp5yCoLiP1757RGV4ej4TYdWxBmgq3hGmPcSp3gySK3F/cb5yn2o8AAh4XBie
         AQUw==
X-Gm-Message-State: AOAM53309x5R9h3ibYTA3vQdcXPMBbPUwMTo3FwdI17ONo6lCwEf+/l4
        E84vJhenMf80uQK0vFS90ZEz5I1uGyeE9k9h7uD2xomuQlQ=
X-Google-Smtp-Source: ABdhPJxuJlLmnUFrkqbkH9MmViiRSbNsyOwmQvUy5mJcA92QylebJ1xOiKwMyT1lHxWBlo8k/D+HtkGz09X12iyPlT8=
X-Received: by 2002:a67:8702:: with SMTP id j2mr4853830vsd.3.1626165891880;
 Tue, 13 Jul 2021 01:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210713180305.5ba41f10@canb.auug.org.au>
In-Reply-To: <20210713180305.5ba41f10@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jul 2021 10:44:40 +0200
Message-ID: <CAMuHMdUb_VvjGZUsnKuGpSwQfJMa0pqQ-tN5HCwi_-Am7angJw@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 13
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Tue, Jul 13, 2021 at 10:03 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log

I've just noticed you don't have

    renesas-fixes git
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git#fixes

included yet. Can you please add it?
This branch contains fixes intended for the current release.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
