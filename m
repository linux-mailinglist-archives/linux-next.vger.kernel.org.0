Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1DD2773F9
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 16:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgIXObc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 10:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbgIXObc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 10:31:32 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D768C0613CE
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 07:31:31 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id j11so4858948ejk.0
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 07:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odhMshJGjGRGkncEgkE0TiVhjyT1V5xcM/UN8xcWlk4=;
        b=zQFEGHjU8PSYvc/cGGcdRSCXMSYcEXRRFLXlPxuLiPG1IdULSV2BWPQrVxcadmR2pN
         eP/eLf/175tPVgojsaSO7q4jtEWLKZLFUKgnYNYgzXsha22gu0phMArGUEUk2o2U3vMt
         /C9ctYMJz2lmj+vjABIr/PAvZK3U4q5blS3ZgYgP3Yb9sAkkBh6ToH7wtxLo4Ahel50V
         kGA2XTsY7suzd+kK3euJrgSK/YfoAMVldk5bFAuKgJDP7TU6NjXlGaA5FPbWY7GH+ZB2
         HUGSTjq0GI64ZlzlSP9GCSSFololq6GDyKcX9LhCfzqMoJ4K3EdipwVhkw5RwyPnAbh3
         Pdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odhMshJGjGRGkncEgkE0TiVhjyT1V5xcM/UN8xcWlk4=;
        b=gVEvQE3+20eC9Gf9CMG0S+smYnatdc1nHw75xtM+fRJ3kgDX4alVMTVEKqNPAT8Qma
         6CGCnIJw6l1WYR1drQtj/rOCP2O34NwFuf+us5cMQYfGz3iEn0Vg1kWkClHzzOQXcH4/
         hNT89sz2qeAcR/KOMTJyoMs7eQbBRgxVi1Lnmc2m+wbD2wj8P9N5kA+3+FqjnkyfutPk
         /q7wKN81L1Z+F97GVA5x2x8q6MqBbP9UOdNlQlrwH0CsPSOGCgKv0bbOQCgeCUiM0MJK
         86nKSPic3eMZuvSK8s8gLnS4SwUz6nJc55i6mIIiLkDpbeb8MFoz8NsX7TAIw2lrmERl
         8HpQ==
X-Gm-Message-State: AOAM533Mk/gxXzKlAbqVaSMOPRIA5IBRFzdn0v6/ZKWx45/6vfV6gisw
        cRMgtPhSzWJR5Gk5ts1poQvcdQxOxBdu4CrzeihlLA==
X-Google-Smtp-Source: ABdhPJytdILVnAZpcUfqna+99yzNyKUHkkoDhdW6cGK3PRDmE1fD566jjwMJcMiVOrrInsFO9ddJQ0lpRRRvL/cE+EU=
X-Received: by 2002:a17:906:8143:: with SMTP id z3mr146237ejw.323.1600957890033;
 Thu, 24 Sep 2020 07:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200924164529.61ea980f@canb.auug.org.au> <CAPcyv4ifCnbY_b_0J3O4U-N5ZcDUkEycqztDi75W-fyApLq6zw@mail.gmail.com>
In-Reply-To: <CAPcyv4ifCnbY_b_0J3O4U-N5ZcDUkEycqztDi75W-fyApLq6zw@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 24 Sep 2020 07:31:18 -0700
Message-ID: <CAPcyv4h2iWKn-QWXp-RdizX2NNT9uxM5ko2tYSNs-XA7ZPmw9A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the vfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[ add Ingo ]

On Thu, Sep 24, 2020 at 7:10 AM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Wed, Sep 23, 2020 at 11:45 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the nvdimm tree got a conflict in:
> >
> >   lib/iov_iter.c
> >
> > between commit:
> >
> >   e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess speculation")
> >
> > from the vfs tree and commit:
> >
> >   0a78de3d4b7b ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()")
> >
> > from the nvdimm tree.
> >
> > I fixed it up (I just used the latter, but I suspect that more work is
> > needed) and can carry the fix as necessary. This is now fixed as far as
> > linux-next is concerned, but any non trivial conflicts should be mentioned
> > to your upstream maintainer when your tree is submitted for merging.
> > You may also want to consider cooperating with the maintainer of the
> > conflicting tree to minimise any particularly complex conflicts.
>
> I messed up, this shouldn't be present in -next, yet. Will remove.

Oh, wait, this isn't from a new push this was back from the v5.9 merge
attempt and is only just now causing conflicts. Ingo, how does tip.git
usually coordinate with vfs.git? Should I rebase on vfs / work the
copy_mc_to_{user,kernel} patches through Al, or?
