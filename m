Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A342463EED
	for <lists+linux-next@lfdr.de>; Tue, 30 Nov 2021 20:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239998AbhK3T7j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Nov 2021 14:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbhK3T7j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Nov 2021 14:59:39 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF174C061574
        for <linux-next@vger.kernel.org>; Tue, 30 Nov 2021 11:56:19 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id o20so91004090eds.10
        for <linux-next@vger.kernel.org>; Tue, 30 Nov 2021 11:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GXymcf20/tyU64faJ16HT7GhE7oUgqqtxROPuK/ehk=;
        b=Kk+HtvsBgApjEoG809LTSaTw/UcktgbjMizo5afACpOsUDneCupa5hXEtLKn/WL1db
         SuBVMQNyu3egNaJBS84GnAGTTUxucDrYlYXuHkeKyxXZnebJsuxoCNWkTepsK3qy7pcu
         DLwIkv+RKGpZNAVs3gu9NCJvL/dFqAZUD/VX99JRM++FXgZJEa9JjV9qYHquckpDgYZB
         AK6xjSxoaj47ZkER6jbwHxnl1MdNwhZsdAlj+LjIWDKRVKpWW+tMIYBJblfVjGwv8eQS
         G8tdVKzjOF8D6Gl35Tn8Nx9CDYTeGob0Fkb12AyNYoAOHAPqOIgalmmCX0+1NmGbjzHt
         kDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GXymcf20/tyU64faJ16HT7GhE7oUgqqtxROPuK/ehk=;
        b=q2PsSHK3b0g2WosrHU50fouf2wH2Yi466WvEeHkboSnD9newb9QP5XxxJIWurU7EZm
         NF7a0UUvJso517QDipIjjS8Nnqxd94sHdZvYIJkLu83JswUVDOjsIjYqasIvXAlthdad
         rpW0CkO1lODsgWAUzjeYx2LYfmEHhjJJVJc/7Tza4ywmb+bhqgUUDY88xXwOt/EaGPoT
         t9hYjw3CdsNv0/CyzJ7psQGnFM11ljvtWubYIQ888UDmRWNFDG/xjW9KfaDwtP7Wg3t1
         Tg246ghpgPwOjL5cM/USFEmqFTVE3I92v8iVRTyWDCWLjbLyxkSPX3YaLJqItBJARkKe
         lT9w==
X-Gm-Message-State: AOAM530p2N085yMKZSu6w3sEmunjr5hVVgfUhF7uq2cvcCCSBhVU/4nK
        quWyZmbaEJJqmv40cp4nyZAm9pLpBWHBLaCrNFCLWw==
X-Google-Smtp-Source: ABdhPJzV7BV0kvUwM0hXGcUm6xt7SqCLH5KtYdocnCw24q7a0rJ4gq9JD0XXvtE7r8PV9l+lUyMbvZFdp+a2yo8C9p0=
X-Received: by 2002:aa7:c30e:: with SMTP id l14mr1559237edq.370.1638302178502;
 Tue, 30 Nov 2021 11:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20211130140621.29261096@canb.auug.org.au>
In-Reply-To: <20211130140621.29261096@canb.auug.org.au>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 30 Nov 2021 12:56:06 -0700
Message-ID: <CANLsYkwA-5Yz55eYJPSNrT_NQrHu4YGcDuQJDA2EBsbYFxRLLw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the coresight tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Finn Behrens <me@kloenk.de>, Gary Guo <gary@garyguo.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Mike Leach <mike.leach@linaro.org>,
        Sven Van Asbroeck <TheSven73@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 29 Nov 2021 at 20:06, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the rust tree got conflicts in:
>
>   samples/Kconfig
>   samples/Makefile
>
> between commit:
>
>   ede5bab874f5 ("coresight: syscfg: Example CoreSight configuration loadable module")
>
> from the coresight tree and commit:
>
>   2218f3460793 ("samples: add Rust examples")
>
> from the rust tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Stephen: Thanks for addressing this.

Miguel: I have created an immutable branch that you can pull from [1].

Regards,
Mathieu

[1]. https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git/log/?h=next-immutable

>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc samples/Kconfig
> index 22cc921ae291,8cbd6490823f..000000000000
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@@ -241,19 -223,6 +241,21 @@@ config SAMPLE_WATCH_QUEU
>           Build example userspace program to use the new mount_notify(),
>           sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
>
>  +config SAMPLE_CORESIGHT_SYSCFG
>  +      tristate "Build example loadable module for CoreSight config"
>  +      depends on CORESIGHT && m
>  +      help
>  +        Build an example loadable module that adds new CoreSight features
>  +        and configuration using the CoreSight system configuration API.
>  +        This demonstrates how a user may create their own CoreSight
>  +        configurations and easily load them into the system at runtime.
>  +
> + source "samples/rust/Kconfig"
> +
>   endif # SAMPLES
>  +
>  +config HAVE_SAMPLE_FTRACE_DIRECT
>  +      bool
>  +
>  +config HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>  +      bool
> diff --cc samples/Makefile
> index 1ae4de99c983,291663e56a3c..000000000000
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@@ -32,4 -30,4 +32,5 @@@ obj-$(CONFIG_SAMPLE_INTEL_MEI)                += mei
>   subdir-$(CONFIG_SAMPLE_WATCHDOG)      += watchdog
>   subdir-$(CONFIG_SAMPLE_WATCH_QUEUE)   += watch_queue
>   obj-$(CONFIG_DEBUG_KMEMLEAK_TEST)     += kmemleak/
>  +obj-$(CONFIG_SAMPLE_CORESIGHT_SYSCFG) += coresight/
> + obj-$(CONFIG_SAMPLES_RUST)            += rust/
