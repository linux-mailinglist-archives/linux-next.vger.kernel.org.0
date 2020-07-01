Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0C8210373
	for <lists+linux-next@lfdr.de>; Wed,  1 Jul 2020 07:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgGAFw1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Jul 2020 01:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgGAFw1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Jul 2020 01:52:27 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E84C061755
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 22:52:26 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id e4so11486882oib.1
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 22:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RsQWUhxGHI4qfc235hpMf/7Q2ttwpb29HIoPyRwKMMI=;
        b=HrvEj8+kAfMpIVuEg8rKntHthW5PBJgjWjOHDW/5EwGtEb35gdr9WknU9/JdnzmV2q
         pq2XxKb+EYL+6wv1yg+ZzhikjN8a+4K1MFRZaVKGwu7qKKybw6SR5dhcVAkEGeYtRU+z
         HY72d4W/cmjwDoifgZPmGVs3gtw9GEGIBE5t9AlX5ng1gjVCvaiYxhtM6Fo6uAqdNWYW
         Mfa/ExUkAu1cEtj8IG6szT3aHy2m3sfydr687Ek1QhhxU6WbS7aCbPDd/CTRbU10b2kO
         BgTGwTgMfWqpfStoYJtBgGVT+y1xh2cflHTTdh6S4mBUgHreb3ZGuF66wnnVYDslqb6K
         NBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RsQWUhxGHI4qfc235hpMf/7Q2ttwpb29HIoPyRwKMMI=;
        b=EUVWqkpTAUlCSerT6Ra6RmuSiDNc96ZixiF+28mo3d+l0qCMPXJpMrJLzs5lDNdWe1
         tmRzqiUAyqz2mJwAcsJgCZ0IlY7B7/o+46z5n0D4xezryR2yN6I/2SausJoA6LgXTvK0
         68rIW5inCKQHpKBHOqLA2MCYW2WNu2gYm4T4qWXKSWPDXepHY1E8Kbbns5Sw/dhXTuHy
         K6XWHi80b4GAztZsz3QOxtW7APnt1Qx+joHOf8crbLkFO6lGw4vGQwE34yyK8pv3qR+q
         VBfX260E9HKq7E0rXbBmYv0T3V5hpf1gMo6qYOhqx7arn7VqJY1SbxU4RSd6i1BX5/PJ
         QPCA==
X-Gm-Message-State: AOAM533ynWHmTsuftocjvU5Ea1ItBJYpqP0brES3RWPT9j2gQvfoRZG9
        mODDoxVEokpE1+L7ikTLuo0W2zdGQbIDlB9KFnIdvA==
X-Google-Smtp-Source: ABdhPJz7ANpdueEAdE+f31hXBrnPSYVTZC7iD2Dj5fjYx9dxzyDA682ZXvad81d0C1UdShsUEVoVgf9jCNdpgGi5WWs=
X-Received: by 2002:a05:6808:3ab:: with SMTP id n11mr13900356oie.121.1593582745833;
 Tue, 30 Jun 2020 22:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200701113448.3119f64f@canb.auug.org.au>
In-Reply-To: <20200701113448.3119f64f@canb.auug.org.au>
From:   Marco Elver <elver@google.com>
Date:   Wed, 1 Jul 2020 07:52:14 +0200
Message-ID: <CANpmjNMz0rtC7AnXUnZKfg+egqqQ3BKPznsWUdEqJQDLTgAaAQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 1 Jul 2020 at 03:34, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the rcu tree got a conflict in:
>
>   kernel/kcsan/Makefile
>
> between commit:
>
>   f7c28e224da6 ("kbuild: remove cc-option test of -fno-stack-protector")

Is it possible that this patch drops the KCSAN portion? The patch
"kcsan: Simplify compiler flags" does the same, but is part of a
future pull request intended for 5.9.

The KCSAN changes had been in -next for well over a week. Also, I'm
sorry I hadn't seen your patch before, otherwise I would have noticed
this.

Please see: https://lkml.kernel.org/r/20200624190236.GA6603@paulmck-ThinkPad-P72

> from the kbuild tree and commits:
>
>   2839a232071f ("kcsan: Simplify compiler flags")
>   61d56d7aa5ec ("kcsan: Disable branch tracing in core runtime")
>
> from the rcu tree.
>
> I fixed it up (I just used the rcu tree version) and can carry the fix
> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thank you!

Thanks,
-- Marco
