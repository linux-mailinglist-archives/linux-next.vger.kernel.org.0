Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67D5817AD50
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 18:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgCERcq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 12:32:46 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40334 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgCERcq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2020 12:32:46 -0500
Received: by mail-wm1-f68.google.com with SMTP id e26so6629861wme.5
        for <linux-next@vger.kernel.org>; Thu, 05 Mar 2020 09:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKve1FzC0bUeOwmZph4lB5S6WHjrFbK8ta6DQAIinis=;
        b=S/Z0lJckipqa5hqxTOLLVLnw63asKRFvzFZCb1Wa4R5561zKoAhZUf6I8sn2VY5pQj
         9MAcPxu4Iuvr3cdkLXm7C3Vj8tOBMCiS9BqDP8OQlZQelJycidGJiQ/rTOMi612IVyjT
         0ekvGti7mX/YkMGSqVspVoglef9rF+3ZAMUTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKve1FzC0bUeOwmZph4lB5S6WHjrFbK8ta6DQAIinis=;
        b=KBHkWecRj5Fuu0eAtTyZoUOpDdmT3RXRAP7zbnaYqJwSFUyd2NXzRHoeM2BiskBEAe
         f+0ohpAnR2yaNtgQGic37s6jLmzC6A/8rB527SYyJpT/dU4qbmC7gLmVtnUDgJaYsFtv
         yAO2AY7ZAN9EP8dBnhPBNNQekq0MVp4jl7ahh8Zfk7p6KdNyze1Ue6n7IS974BYKDz31
         OdcxBqisBDObG+CxdOZ943KFcTIvyfRX98b+a0E8tw0qrGtqeyYHkOFHHHWxwEZKEoF3
         VlIcOIJhZ4pyxRQcr5NwqApoQ85YYtc6WJW/Cg4KCz2588qui/kYvEdes8ntl4pwKia0
         MwEw==
X-Gm-Message-State: ANhLgQ1BbJ6BnM40VZopu48BhV+qXDIQk1TSzDAJ7foLEXmkL/Llzket
        l0WygSBy/4Pv6Yehh9CZY+v5eY9vaZyarr4via/0YQ==
X-Google-Smtp-Source: ADFU+vuWp699fZXvPlnYzdSTJu6gqW8QE9Dy7HEdvkWGiDovYo6X7AdXdsYYM9mLGXcgc1GTGtt4/xsmq7w6ol/Zg90=
X-Received: by 2002:a1c:f610:: with SMTP id w16mr10529527wmc.136.1583429564761;
 Thu, 05 Mar 2020 09:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20200305175528.5b3ccc09@canb.auug.org.au> <715919f5-e256-fbd1-44ff-8934bda78a71@infradead.org>
 <CAADnVQ+TYiVu+Ksstj4LmYa=+UPwbv-dv-tscRaKn_0FcpstBg@mail.gmail.com> <CACYkzJ4ks6VgxeGpJApvqJdx6Q-8PZwk-r=q4ySWsDBDy1jp+g@mail.gmail.com>
In-Reply-To: <CACYkzJ4ks6VgxeGpJApvqJdx6Q-8PZwk-r=q4ySWsDBDy1jp+g@mail.gmail.com>
From:   KP Singh <kpsingh@chromium.org>
Date:   Thu, 5 Mar 2020 18:32:34 +0100
Message-ID: <CACYkzJ5_8yQV2JPHFz_ZE0vYdASmrAes3Boy_sjbicX6LuiORw@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 5 (bpf_trace)
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This fails as we added bpf_test_run_tracing in net/bpf/test_run.c
which gets built only CONFIG_NET is enabled. Which, this particular
config, disables.

Alexei, if it's okay with you. I can send a patch that separates the
tracing test code into kernel/bpf/test_run_trace.c which depends
only on CONFIG_BPF_SYSCALL.

- KP

On Thu, Mar 5, 2020 at 5:22 PM KP Singh <kpsingh@chromium.org> wrote:
>
> On Thu, Mar 5, 2020 at 5:18 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Thu, Mar 5, 2020 at 8:13 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > >
> > > On 3/4/20 10:55 PM, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Changes since 20200304:
> > > >
> > >
> > > on i386:
> > >
> > > ld: kernel/trace/bpf_trace.o:(.rodata+0x38): undefined reference to `bpf_prog_test_run_tracing'
> >
> > KP,
> > Please take a look.
>
> Sure. Taking a look.
>
> - KP
