Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9A5102399
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 12:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbfKSLur (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 06:50:47 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44375 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbfKSLur (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 06:50:47 -0500
Received: by mail-oi1-f195.google.com with SMTP id s71so18593419oih.11
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2019 03:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6H3XfOBXtIiDw4txYzYCJc8lZpqHl4icgBSK0hl1HNw=;
        b=Hyz83QNB+ZAMKm/a/WM+zhXVhLZEcOqNiX2CpGkJylJwBOQBkfslsAevDP4t748NOk
         asre3wGP56oqrVg+XvV1vLI2Y0vkiyvKJw6E97M6OFG744CW0lqLTFyUxHhDhfKDqjJs
         HAInYQQrg5BuruatKj0YY8OKQx8hXyCg6SH9JmHzuOQZWWet/Me8TOxM5tUttPKtUvpK
         E5nioQ3zEA6le4dD9uy4TXgxYNflARtWVL8/x2ylI7qtiorT3EeXRI/10fwBR3qblJMn
         pImhU2z1t2pHgyPlwJtUWmOMxC1K0SRF3+79Y47SDElFR4DHrfU/2mCY7+Fp/KWKCMcA
         XTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6H3XfOBXtIiDw4txYzYCJc8lZpqHl4icgBSK0hl1HNw=;
        b=FL8UoYU8htxv+cbJVv3iBnlKQEW6GZSaXnVtG+fxpIH3r4tK+IPIdr6QRgAgSWUTCW
         Tl6kvbjmMJWgSFDSMW020ma8G2lGr4jnIvs7hzD3dBYGQU8fHqGtQ/d3wfHFGpjaKC9g
         S2z0JI138cO56bQTt/XbdM8cZJl/OozMIzpOObS6AbHE6EvpIAqAVVzyQoVnnNU3ffRw
         TqGTfUZ5jIpniip21WcfL/JeDMtQ8vOUjogY6QhfoYAqe3q17VThHXLHWVIBcsSiogN7
         b7CxR5QhNxASrBU8dAe1tAkfHzkIUTTg7wIBl/fMD+3dnwSakcGd8JRtBdsNTK/ZR+pS
         SDjQ==
X-Gm-Message-State: APjAAAUqQAd2nyygk1y6X8ILC3ECLtuWSz0Rs7aFMmn2My21DeZ7XPWT
        igz6l6MyQtnjeVhEViZATTK345l2outKzO5hluVDpMUg0tQ=
X-Google-Smtp-Source: APXvYqw68/73yXEhDgoAzdeN8F8gTfkjq9l6Cb55BvKoGJJr3Einswr8zpoKZ+WdDZs7uOZVtuAqoQT7mWM5BmFyikE=
X-Received: by 2002:aca:5413:: with SMTP id i19mr3800567oib.121.1574164246147;
 Tue, 19 Nov 2019 03:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20191119183042.5839ef00@canb.auug.org.au>
In-Reply-To: <20191119183042.5839ef00@canb.auug.org.au>
From:   Marco Elver <elver@google.com>
Date:   Tue, 19 Nov 2019 12:50:34 +0100
Message-ID: <CANpmjNO8=F1-FzUSTr0LAv8uYdQXKO3MT9yqHRGboCfOS1RPiQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm tree with the rcu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 19 Nov 2019 at 08:30, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the akpm tree got a conflict in:
>
>   lib/Kconfig.debug
>
> between commit:
>
>   dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")
>
> from the rcu tree and commit:
>
>   fa95a0eadaa7 ("kernel-hacking: group sysrq/kgdb/ubsan into 'Generic Kernel Debugging Instruments'")
>
> from the akpm tree.
>
> I fixed it up (I added kcsan into the above) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks, looks good to me -- makes sense to also move this into the
'Generic Kernel Debugging Instruments' section.

Many thanks,
-- Marco

> --
> Cheers,
> Stephen Rothwell
