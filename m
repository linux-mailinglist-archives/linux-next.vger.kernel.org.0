Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2137F23284B
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 01:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgG2XnY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 19:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgG2XnY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 19:43:24 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B86C061794
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 16:43:23 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q7so26924670ljm.1
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 16:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLb39v1oq5FRSvzH9bhk1WYh4C3cI/mPlFpmehg+P8U=;
        b=bJY1IJETI9mZ6ooPJU+FDg9B7jzap0h2Yz93SPYM9zKJ9Wdg5rhq1Q38+uqHFUftp6
         yXS3OWEtQE+ECx5vOXCBAGIp+ZFWxHA4xV5cJeTIyP54f59CP+/hvMrC1NPhC8s3Ij31
         Sk8Hf3X7mT+6eSMW+Rv2JLhvzWZAuA8ve65jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLb39v1oq5FRSvzH9bhk1WYh4C3cI/mPlFpmehg+P8U=;
        b=OwJzFFXK12ROZQiXdtr1n9KljABlSDShfhyxoGy+XlJg9nZRXIjhwKwYY3uLqnCnMA
         9RB4VEsuxfgx1aLKGCajH5yJATtHOrh80LYpRVSDm6XidWKSmbgarMQoWiTHRm18CRZU
         P4tUsmgCcbDkgSXUDSV6u8bvw93EYabo8AxDJGCYuLBhyNxbZZryVOXV2iKzJh4c+z4q
         eBxuVxHUkhMW0On6pWpVX+flFjjs0C2O8se+CPG50D8WEJUSa/fOtd/GCkeHapbEywfJ
         mDYVrtCaZgw7QuSKbCIxZzzg2vNt3yKxVL/eAO/rwT9r9F5jhxqFj7tzeQ3TVIpobRJt
         Stxw==
X-Gm-Message-State: AOAM533ATlqEUnJwC64fL2YrIr45dj+h2iiBjTNQXlmNqjAWalV2AA5H
        HG9pRWshak/V5sdbqUR6E8rQ92Jl0aw=
X-Google-Smtp-Source: ABdhPJwjpisJUz0omJChIbAx+c1TG/jjsIN4mu52QHkQLWyzAGIXpMw8Bu+gaBPgpn05VfR388cr1A==
X-Received: by 2002:a2e:3015:: with SMTP id w21mr146539ljw.30.1596066202140;
        Wed, 29 Jul 2020 16:43:22 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id g2sm796394ljj.90.2020.07.29.16.43.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 16:43:21 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id b11so13980732lfe.10
        for <linux-next@vger.kernel.org>; Wed, 29 Jul 2020 16:43:20 -0700 (PDT)
X-Received: by 2002:a05:6512:241:: with SMTP id b1mr171970lfo.125.1596066200379;
 Wed, 29 Jul 2020 16:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200730090828.2349e159@canb.auug.org.au>
In-Reply-To: <20200730090828.2349e159@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 29 Jul 2020 16:43:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
Message-ID: <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 4:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> include/linux/random.h:123:24: error: variable 'net_rand_state' with 'latent_entropy' attribute must not be local
>   123 | DECLARE_PER_CPU(struct rnd_state, net_rand_state) __latent_entropy;

Hmm.

Ok, this shows a limitation of my allmodconfig testing (and all my
normal builds) - no plugins. So that problem wasn't as obvious as it
should have been.

That error isn't very helpful, in that I think it actually is very
wrong. The variable really isn't local at all.

I think what the plugin *means* by "local" is "automatic", and I think
it uses the wrong test for it. IOW, looking at the plugin, it does

                if (!TREE_STATIC(*node)) {
                        *no_add_attrs = true;
                        error("variable %qD with %qE attribute must
not be local",
                                *node, name);

and what I think it really wants is that it has a static address - so
a global variable is fine - as opposed to being an actual static
declaration.

Also looking at the plugin, I suspect it is going to be very unhappy
about the fact that the attribute is there both on a declaration and
on the actual definition. The code later seems to really only want to
work on the definition, since it's creating an initializer..

IOW, I get the feeling that the plugin is confused, and it so happened
that the only variables we'd marked for latent entropy were static
ones. But I haven't done gcc plugins, so...

Adding the gcc plugin people. Otherwise the only option seems to be to
just remove that __latent_entropy marker.

                    Linus
