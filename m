Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C992B433C46
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 18:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234333AbhJSQe0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 12:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234326AbhJSQeZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 12:34:25 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B196C06161C
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 09:32:12 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 5so14512246edw.7
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xUa4jDp8wEq2+KyjYLUoyDAf9haNG/CAH7QLO3lCFg=;
        b=Rk3hPiN1Cgn4j+zmGpM0dENIhRnzhwt3kwrJw0dXrtwRIVtz33CBjd1xw9nFoz4Y54
         orSrK+/3veW61o8sx5I9LiM2oX+VL9+WV8tNCkfSFeACCFxjFpO8cuGdJWAtcl/R/iyd
         JSllRqHrbTYt0SodjJZCokHVxZoY+roP3verKxSMGZha5nDo8UundCHVvMKz1yLlLX+A
         Yv2x2RPOb7INYdlisfjqVAAnylzMCH1JejmnWqjvrI9KZfd5Z+AdFC3UQVR1xC3YrEtN
         +oo8OMgQVykkiHbVa0UEw91IZP1jygwfZXxmIv3yzPWsmS4pbb1XvJ2GC/68Aw6XihBt
         Rcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xUa4jDp8wEq2+KyjYLUoyDAf9haNG/CAH7QLO3lCFg=;
        b=uJU9Rk/L00twvwpzUY9N+o43a5BsKaRWxehqjhzgW2IddRkHLJgJKQSY6FOmI5wCsu
         EYEAUsHZSwsrByv6OigEWlTuwZyqajt1ouDdOJ1RPeKcnyAaZ+s11kVl/khfR1gvQnDk
         KV13nnYtSI6QhMMFdFts3D9Ddmxsf4pb6qG0osNpEZlcNd8HGTkVYEUEdekfAhBc7wIf
         ovBYeDTcgm4yhxtOn/WPaQkvSm5QF90g5Oa2QS9mkTTc5AFTq0ek9HLCHL/i3sTZ81HL
         G6vjNqtkuK4BsO2I02pDnIwU7V9oHzbuzQ5Z3Pz0lldtSkK54FMOiMHjh+rVMRWpKRcq
         nARQ==
X-Gm-Message-State: AOAM531iOUn49pT/Is4ImXoj45sDrfqRDW2iv0NLf2/Mp9m7xXgw0Os4
        UWJtMezZ0O2A+XmFDDMdwd4WAVY4ybHOMqLNYpSJRKkjYA==
X-Google-Smtp-Source: ABdhPJx2DygXOAUIL+ZmjqAeaXSLbDoYpIDmg/VlX8my35/hQmEKkmgE44G+Jhusz2tWvG+Y9ihUjD2QYXGPH0taDhY=
X-Received: by 2002:a05:6402:22d6:: with SMTP id dm22mr55776304edb.209.1634660962615;
 Tue, 19 Oct 2021 09:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuY3BJ9osvhwg0-YG=L+etgCBfCq0koC9BEkvK8-GR3ew@mail.gmail.com>
 <20211019131049.GE28644@breakpoint.cc>
In-Reply-To: <20211019131049.GE28644@breakpoint.cc>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 19 Oct 2021 12:29:11 -0400
Message-ID: <CAHC9VhTobH9ExRt5fLx+S9ibRipeA4pj8yFhjDKb0Buq6naD5A@mail.gmail.com>
Subject: Re: [next] BUG: kernel NULL pointer dereference, address:: selinux_ip_postroute_compat
To:     Florian Westphal <fw@strlen.de>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        selinux@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, lkft-triage@lists.linaro.org,
        Eric Paris <eparis@parisplace.org>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 19, 2021 at 9:10 AM Florian Westphal <fw@strlen.de> wrote:
>
> Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > Following kernel crash noticed on linux next 20211019 tag.
> > on x86, i386 and other architectures.
>
> Paul, this might be caused by
> 1d1e1ded13568be81a0e19d228e310a48997bec8
> ("selinux: make better use of the nf_hook_state passed to the NF
>  hooks"), in particular this hunk here:
>
> -       if (sk == NULL)
> +       if (state->sk == NULL)
>                 return NF_ACCEPT;
> +       sk = skb_to_full_sk(skb);
>         sksec = sk->sk_security;
>
> state->sk might not be related to skb->sk.
> I suspect that this should instead be:
>
> +       sk = skb_to_full_sk(skb);
>         if (sk == NULL)
>
> See 7026b1ddb6b8d4e6ee33dc2bd06c0ca8746fa7ab for the origin of this
> additional socket pointer.

Sure, I'll patch that up now.

-- 
paul moore
www.paul-moore.com
