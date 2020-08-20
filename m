Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F46724AC92
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 03:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHTBVn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 21:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgHTBVm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 21:21:42 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692A6C061384
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 18:21:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id d6so675157ejr.5
        for <linux-next@vger.kernel.org>; Wed, 19 Aug 2020 18:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=clSRpeeAhBeOa1Z/EGoW+BCJ0W1c3rpm/3iMv3CQBEg=;
        b=XxgsNqxMJXLMCQt0hvVtovYPMv5lUeVtNbekV18RPRgTSr0lhWryi6qkLfR94gGEFA
         PztV185NnjB+IYrEZe/xikgYrOfWzJcB4lRxCVUsGayaD7bm8YHeNDsf/DamWw8BVs2k
         +C5RLMsYP77t9xELeLr7BZ8TE9RPDTxUtbOCnIfrcwrBw8y3WSH+0ZHY3lxyoFNYInmd
         TDJMfUOKVrH8E2/fkwXZ0LCI2QSnPDsF872t5RLF6bYhssrqv69dNmVY8+Eghelm3/l9
         teR8GTfWk0l6Uls7pTmAylPqw9UetBvz7mVqC+Lfnnr+ldA5FBptPQ9RJUdzYhBT78hX
         yNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=clSRpeeAhBeOa1Z/EGoW+BCJ0W1c3rpm/3iMv3CQBEg=;
        b=j6dh6AEaIoNK83QzZvgqQjLdoBE5JJ6Tr5REf31YcYnzJH4u204LQbqwMj8ruOcAgC
         6ZvltmfdnVv1dWpshcxnEXPXXGelke2BhPtGIdbOuOwhr6nft4msKaDIWneQJrCAJ87b
         zWUHzMyvKAnn3Y4SrexkVaxTwKV5b8tCa4HBqRuRp/naWVJtcdLmmI7P1Qv360zsyfYp
         BGfplAw8+nHloCCujQAdmov2FF0wmJGDDEBDYgmmToNOrLhf0b3DmOiZo5a9OeGrpf5S
         5fjCGXQve2ERB9U9aGela5BhAvXAD6gu9MLhqL30ELu/NNpCIAD0pldWoSJH/B8n/sZS
         y68g==
X-Gm-Message-State: AOAM5325CECSU2ePxQveulWOLN7UOPII8XLk9qvazEqvcabLt41H8ugN
        B5I2cRX5K4nW24Sl9+9i3+42H87Ehz7IkYf8lqeZ
X-Google-Smtp-Source: ABdhPJy5YCNpJnv1Y/CpvGqmyFX6PcYJ+U9KLCqrkT4JqKRby0aWCLgHjSuUt8brRGEdtFouaOnueCCnkewqCmUMGeo=
X-Received: by 2002:a17:906:c1d8:: with SMTP id bw24mr998580ejb.91.1597886500276;
 Wed, 19 Aug 2020 18:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvdAUWHw7SUF6Da1bgDJ2Q=59nJLovrxz8Ke74DSFnG1g@mail.gmail.com>
 <543834b1-9e7e-187d-4f98-e8484362105b@gmail.com> <CAHp75Vf_3cb51UPXqiPspo4pa5AhU7xTvwAk6Z2+FtzNfmogDA@mail.gmail.com>
 <fdffd8f2-ea67-4bfd-f75b-9ffd56dfbbde@gmail.com> <20200820083111.46e81b4c@canb.auug.org.au>
In-Reply-To: <20200820083111.46e81b4c@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 19 Aug 2020 21:21:29 -0400
Message-ID: <CAHC9VhTR7b_p3rdiQ8q07OMoY3fXgU4kH=bH5URVgVS6kH5r5g@mail.gmail.com>
Subject: Re: Linux-next: Kernel panic - not syncing: Fatal exception in
 interrupt - RIP: 0010:security_port_sid
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        X86 ML <x86@kernel.org>, selinux@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>, rgb@redhat.com,
        Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        YueHaibing <yuehaibing@huawei.com>, jeffv@google.com,
        Kent Overstreet <kent.overstreet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 19, 2020 at 6:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Wed, 19 Aug 2020 11:12:44 -0400 Stephen Smalley <stephen.smalley.work@gmail.com> wrote:
> >
> > Fix can be found at:https://patchwork.kernel.org/patch/11724203/
> > <https://patchwork.kernel.org/patch/11724203/>
>
> Thanks.
>
> I will add that to the selinux tree merge in linux-next until it turns
> up in the tree.

FYI, I just merged that patch into the selinux/next tree.

  commit 37ea433c66070fcef09c6d118492c36299eb72ba
  Author: Stephen Smalley <stephen.smalley.work@gmail.com>
  Date:   Wed Aug 19 09:45:41 2020 -0400

   selinux: avoid dereferencing the policy prior to initialization

   Certain SELinux security server functions (e.g. security_port_sid,
   called during bind) were not explicitly testing to see if SELinux
   has been initialized (i.e. initial policy loaded) and handling
   the no-policy-loaded case.  In the past this happened to work
   because the policydb was statically allocated and could always
   be accessed, but with the recent encapsulation of policy state
   and conversion to dynamic allocation, we can no longer access
   the policy state prior to initialization.  Add a test of
   !selinux_initialized(state) to all of the exported functions that
   were missing them and handle appropriately.

   Fixes: 461698026ffa ("selinux: encapsulate policy state, refactor ...")
   Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
   Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
   Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
   Signed-off-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com
