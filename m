Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 689504315C3
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 12:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhJRKTc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 06:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhJRKTc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 06:19:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0C2C06161C;
        Mon, 18 Oct 2021 03:17:20 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id g10so69078598edj.1;
        Mon, 18 Oct 2021 03:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AF8zJDwkmL3U0dYZWX9w0CywhRwPtYFEXZ0BftyJOus=;
        b=IFo4fUtBz0VHl4u/5ZPcxZHeDfsJd5b3GysRHqmA//ShgahllYmfQCt3VAthx/qSa0
         9oNdqHamhYOUmxbvJSjpL8pqiwg5jap7A49BWktDCDBDJdHwNk82ooyYmbqZ6bnCVoe7
         TnwPwOplcSUj/uz6t3JnjR9z2n6J/HdT1WVLQfkrgbp2rNXlMwlZT/CEvL1YO1gb0UN3
         FQeSkr9J6JS87UHyVvr7veYPlUeA6fuJaXj7HG6EZbJhZnAmT6PTuTpjVnU8YhZhMsql
         IPpUGusFI3SbFSFMQq6/4al2sWBeaqRyII067+2GjgND3f585PewfnSydKia05FWCj17
         o2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AF8zJDwkmL3U0dYZWX9w0CywhRwPtYFEXZ0BftyJOus=;
        b=u9en/d0lFmDbJPMCahuyOqjsm3ML/qVbkiX1CbT4YSs1QqQ5vH4VOFbDDLYjVFfris
         wLcv+JNyzmy+hrCeRpgVqmv3hlMiUbzkNJvT/CcIAcc2dv/ZZ7qRKX5ooqA1MzEeoQRL
         pamm8T09mfJkm2lJ6L2203e7t6s13WojJHKq0cABSnPXC6Y5rw5ba8LiVKJn+IFdjPt4
         p94wPP3Tmxm0YhSLCWFhWnVtI+1RL0jg+hUot/ZEDTYxCjwJEarz0w/bnuj6504L2ncK
         mG3B79rDl3mBgzFdpfNLQuXQrEEH+2i2w3J3SasMPDn0FiNgoX9K3YDAzecLa8mRXQXn
         DqLw==
X-Gm-Message-State: AOAM5316zn1FCydSk3g9E01ThLb9t1T6t7WlaU7BvJaT23h+oLLl5ZsK
        S0AgLeLnYxCM4A0G5RtSHgyyyn4gwcWwYeWjABo=
X-Google-Smtp-Source: ABdhPJz+vyjPwJqWXqIh5bMNONdeWZ8fWw2APyBJxwa8bf9pMTI8bOmtT/xFnuH36hIW0ln7V9KqAwItxd1VODtp7k8=
X-Received: by 2002:a50:e188:: with SMTP id k8mr44789399edl.119.1634552239370;
 Mon, 18 Oct 2021 03:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211015202908.1c417ae2@canb.auug.org.au> <YWl+0PFixaNqgIxb@smile.fi.intel.com>
 <20211018133538.2a0dec43@canb.auug.org.au> <CAHp75VcDwBkwL4+cFmeJt7b-p6V0w283ai9T9K02y0Sej0WLxg@mail.gmail.com>
 <20211018194533.7af364fa@canb.auug.org.au> <e262286b-ce0d-d46f-17be-2b59d9d42cd0@rasmusvillemoes.dk>
In-Reply-To: <e262286b-ce0d-d46f-17be-2b59d9d42cd0@rasmusvillemoes.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 13:16:27 +0300
Message-ID: <CAHp75VdrEdyHg1QNyLx7=FHrSnieWm-o_XufNk1tn354vO7mxw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 18, 2021 at 12:07 PM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
> On 18/10/2021 10.45, Stephen Rothwell wrote:
> > On Mon, 18 Oct 2021 11:01:18 +0300 Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> >> On Mon, Oct 18, 2021 at 6:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

...

> >> I thought that it makes sense to have STACK_MAGIC also in this header. Thoughts?
> >
> > You might want to think of a different name for the header file then.
>
> Eh, it seems more reasonable to leave it in kernel.h, then figure out
> how to get rid of it completely. AFAICT it's only used in one single
> place under arch/ (and I can't figure out how that magic value is
> supposed to get there in the first place... that arch was thrown out in
> 2013 and resurrected in 2015, but that particular line doesn't make
> sense), and then in some i915 code which might as well define their own
> cookie.

It's used in two places and probably we may just move it to these two
users, I don't believe will we ever have i915 together with h8300.

-- 
With Best Regards,
Andy Shevchenko
