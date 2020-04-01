Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3773019A59E
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 08:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbgDAGuC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 02:50:02 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39394 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731741AbgDAGuC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 02:50:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id k15so6515285pfh.6;
        Tue, 31 Mar 2020 23:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tmKJc7NjnxN20fuxF0kGLk0WWkFLy1YBAKU11CgTRL4=;
        b=Ply97XefMOgToljx9G/prcmyZ5K+d4DiZkRr5icJcP1YU0B9AOzcIBAPnXaLRb0P1M
         b0sWz5eRki8aj0w/9YgHdfHjzt/Xuc7GUfdaENJVOD6gZG5jXtgUnBy+jmMerQPPMAeK
         VibfpN6+N3fd/ThOZbzZsB2PSoiuXFz94YpkGqPhBKpu6ZYanEvWw9uL1ZI45KyYQw6Y
         3TGM9UJc47Tsc2CggzCBoElod9uu9B18M4aY432KqgZC2jXo0GtjIOW55jnqj8km9eNW
         Q1QNTOwjFAcF1+sZLfw+cLmqoDhky1fEmMZx8OEnYjhQVdab3x0Nv5m71jjFdk90I5nw
         yDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tmKJc7NjnxN20fuxF0kGLk0WWkFLy1YBAKU11CgTRL4=;
        b=HFFwwyhcVTouufhRJr7qc6U0B08ESAjmMSe8PzF05rleofLvF5xYjmicCpSeF8exJH
         l6MJ4sPdBorvkSZd7HsSvl56amK4Di6/7ZzsySxG9o8cQ1oDjcjxAeL2EOhBpxwX5DS8
         ulfiU8cqIpkmWtx1XDAunoNIyYVHZSxHv5ipcL4fa5TTiyBrmsktMgHb1tSYFjwgNfiQ
         QcxfB86xXC1hkCV63RNrjlTqp/dOJDOIpWCRvpETEGZlK6vRmfWlP/9YNsNsvBEIaLM+
         4Opjq1TU4FDTy+eowosYfrFHkd4cA6JpjB5+HxcPc9iVc021AfNEnWqGlEIK1fZxOkDQ
         S6EA==
X-Gm-Message-State: AGi0PubJodXptgfZYvZbJC+Ycim38dPT/9RU2lUWoVIYslW/KtYqh0C8
        Dqzt7ENP/Qmyoz14LoH2LpffbKRu0kVd1TIybv4=
X-Google-Smtp-Source: APiQypJt8Tz9kYfeUxwq4p2WKLozKFChbs8KbZhYo6DlzntkZ3gcahNcIMJwo0Bl0X052O5PcRgloHA8BSrJZ0ywaYc=
X-Received: by 2002:a05:6a00:2b4:: with SMTP id q20mr8515775pfs.36.1585723800741;
 Tue, 31 Mar 2020 23:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200326150523.02c4ec48@canb.auug.org.au> <20200401141409.446e989b@canb.auug.org.au>
In-Reply-To: <20200401141409.446e989b@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Apr 2020 09:49:48 +0300
Message-ID: <CAHp75VdaCfEBp0co611O8uCpu9fzOaobcE7EmZyHsX0D=4=neQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Darren Hart <dvhart@infradead.org>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 1, 2020 at 6:14 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Thu, 26 Mar 2020 15:05:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the drivers-x86 tree got a conflict in:
> >
> >   drivers/platform/x86/intel_pmc_core.c
> >
> > between commit:
> >
> >   a69b3b1d4cf0 ("platform/x86: Convert to new CPU match macros")
> >
> > from the tip tree and commit:
> >
> >   16292bed9c56 ("platform/x86: intel_pmc_core: Add Atom based Jasper Lake (JSL) platform support")
> >
> > from the drivers-x86 tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.

> This is now a conflict between the drivers-x86 tree and Linus' tree.

PDx86 is in Linus tree with conflict resolution.

-- 
With Best Regards,
Andy Shevchenko
