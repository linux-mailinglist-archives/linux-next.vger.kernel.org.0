Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4294442E57C
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 02:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbhJOAx6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 20:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbhJOAx5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 20:53:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982B1C061570
        for <linux-next@vger.kernel.org>; Thu, 14 Oct 2021 17:51:51 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d3so31164156edp.3
        for <linux-next@vger.kernel.org>; Thu, 14 Oct 2021 17:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NcRK/FMVq0d7lZR4RgJDlpzm/0Nvfg5lOqEnDV14pGI=;
        b=HML4pD7AnS2Vr6k1owyyANHoletVzaGLhW97xCsJ5G3v9Wcm1tNIRMIsPjILEAjWlI
         +mZTYKkzN9IK/swYK3PiuYyQUigHN1ZNAAtr6FdDp49PIRmqN2euUNXvHrE4i1BJjLGx
         GqmGMCXg/KaXwLRn7WyQGBYbo2ngUpngQtP+Oaj1uAKz5PuqGJ8wBILJ0wzSHAMNH3cq
         +cKmvTz1eHfameLcaMU3ke95r/iPrbUWXIM8jy1KN6ixYtwcp9HjIqGyk/2Gi7nBo/13
         9oycwknqH06imOZDYRGABe8BDK79p81Kv7ZFw6IlfPleRh6V8qJ0WfLiqNq+BffhG4dh
         zrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NcRK/FMVq0d7lZR4RgJDlpzm/0Nvfg5lOqEnDV14pGI=;
        b=rRwJfYrt/HLpJCz/d17Qp6mTUsRyO2yRNSxWf1tRInL8DMoDSEuOvl3PWYe79Rlypi
         d1BWErEeL4b/F0d4x1tL9bNpt7EvY2gYQJ5Hj9fUoUlY1kMBmwvs4bFPHt/BXeA4ktFl
         ETIAjdO52EfXCnVJ2jUrL4XulyNTBjVSA8QKX0N/ezOd6X9dW4HMXHIQhYJgPxlfkPjg
         leYyE9yxdWjcDfnuma01c93BYVNEcfEsOLB/uqBTZrpWrW5MF45y+6fSlJNVAjOCn5Za
         O3UhoGRX2lEUL6ub37cMYrKnHl9MIPbqtSSmFke38KuAKn/y8OY9QYVmm0XhyrFSV78H
         7MBw==
X-Gm-Message-State: AOAM5317pcs+AjO8I04fv8lmx2FYTCn5v8Uxlr/6GxbFWxIP8UM/TS4w
        oNOZShSYns6GS7RjcGFAUXeDcy55ziEMnAm+cPEi
X-Google-Smtp-Source: ABdhPJyN18BWWGLLUDpiphSW+3Z/VIWJ/mmcSvKDvqZF8BKKyiTackXdTeu9WpZbjK7c0Y4Ro+yX/INJU8pwDjqLXuE=
X-Received: by 2002:a17:906:3d22:: with SMTP id l2mr3016297ejf.187.1634259109991;
 Thu, 14 Oct 2021 17:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211015095327.42344a21@canb.auug.org.au> <CAHRSSEwR9c1jV_Hy6DbH9aZ5Q02AeR_dkay9W9od0RpiYKdgLg@mail.gmail.com>
In-Reply-To: <CAHRSSEwR9c1jV_Hy6DbH9aZ5Q02AeR_dkay9W9od0RpiYKdgLg@mail.gmail.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 14 Oct 2021 20:51:38 -0400
Message-ID: <CAHC9VhSsFzMxBdJHYOgq4X-PwQWLX2+UP5_T_U38mYd1_BeSHw@mail.gmail.com>
Subject: Re: linux-next: Fixes tags needs some work in the selinux tree
To:     Todd Kjos <tkjos@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 14, 2021 at 8:21 PM Todd Kjos <tkjos@google.com> wrote:
> On Thu, Oct 14, 2021 at 3:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   fef994d85ac9 ("binder: use cred instead of task for getsecid")
> >
> > Fixes tag
> >
> >   Fixes: ec74136ded79 ("binder: create node flag to request sender's
> >
> > has these problem(s):
> >
> >   - Subject has leading but no trailing parentheses
> >   - Subject has leading but no trailing quotes
> >
> > In commit
> >
> >   d1c927fb8b52 ("binder: use cred instead of task for selinux checks")
> >
> > Fixes tag
> >
> >   Fixes: 79af73079d75 ("Add security hooks to binder and implement the
> >
> > has these problem(s):
> >
> >   - Subject has leading but no trailing parentheses
> >   - Subject has leading but no trailing quotes
> >
> > Please do not split Fixes tags over more than one line.

Thanks Stephen, my apologies for not catching this during the merge.

> Stephen / Paul - do you want me to upload a new series for this or is
> this something you would normally do since it is a simple change?

I fixed it up and did a force push to selinux/next, it should be taken
care of now.

-- 
paul moore
www.paul-moore.com
