Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7DD041358C
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 16:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233689AbhIUOqu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 10:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbhIUOqr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 10:46:47 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2773C061574
        for <linux-next@vger.kernel.org>; Tue, 21 Sep 2021 07:45:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id v5so73503488edc.2
        for <linux-next@vger.kernel.org>; Tue, 21 Sep 2021 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3UQshi3eC1CKDj9DpZic1/oFHuAGOMwFKYcnq7T63EM=;
        b=OG5vn4UI5RWsGMr1kSBoNDGRlRw2LXTlKq1DIf6AmZWN+iVXzm/Zsh6yK8A8TzdWlU
         eun6yrJyMN2FIzGmOwTJ+YDEc6+8+5mHRCYi0FRDW68A3fFoSCuausFEcdkOstSog478
         OciPCf84A316/tJS3mVuouFRQzqoWKtOtWpoGXwwkz/xJ6ZNkyDZvsB+XN8GkdE1tW+B
         dy1J/+uwBYgz0bvk/EkLDZkHaNOylom1ZzYHydImFgppnlFYiZTfgdsotWRKI4OwEs3/
         33WfNod4J1xK3YyTysiBNEIFuObRT0TfbkuGbREhsr1XR/lWIGap1X18RvqenhSOvevj
         xzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3UQshi3eC1CKDj9DpZic1/oFHuAGOMwFKYcnq7T63EM=;
        b=NEKs73+LanqpRjoo9kgu5GaFc+XRAJAX04DvMWVbPvjh15rWuxlO1eEveREep+iGfS
         8D2qalY4KpNV9SzXqiCsHbGty7gUgR16nVi/LXEGG6l7Oe0tZogRttS7tm/9sAzoLeZG
         dzGyr5scnczL3zULdg5IIcIM4o5lv5FlGr8IxCUDKpD5y8bfmLNGtpeaDqqt7P7Y94/a
         VUJP6pmAcO+bPeuIChWErroCjHcQfXANLRg2fLsvtymXuzTP1Lm/5hDQ1sb340pVpKWf
         rgJIqtXdRLwsc9v9IQT+rRvAOH+06WT/8Z4OqjR4s8Q1KcX/KA9iKbs6g28La0eTZm67
         dqpg==
X-Gm-Message-State: AOAM532ZVR59CjAHRhQfrouaTk7/NazaRAB/Yrw8u6OFp75aBZW4PDM0
        oF+vA24AgaSbhg7eW5VKFWVBFffzWq0TCaESbPyr
X-Google-Smtp-Source: ABdhPJy9s3S5skeCDh7vuYtu4bb3p3FjHSjnXBc6dLAhH2npPXxat6uok6Ikcn1ihgxmvttcAijBDQf3pwZyJ4FMb3I=
X-Received: by 2002:a05:6402:3587:: with SMTP id y7mr35691132edc.362.1632235394068;
 Tue, 21 Sep 2021 07:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210921111750.6f7bd218@canb.auug.org.au>
In-Reply-To: <20210921111750.6f7bd218@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 21 Sep 2021 10:43:04 -0400
Message-ID: <CAHC9VhTFp6uj+bBhiEhvd2v346qOLx-t0bs=mv==8rCY5Zq+jg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Eugene Syromiatnikov <esyr@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 20, 2021 at 9:17 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the selinux tree got a conflict in:
>
>   fs/io-wq.c
>
> between commit:
>
>   dd47c104533d ("io-wq: provide IO_WQ_* constants for IORING_REGISTER_IOWQ_MAX_WORKERS arg items")
>
> from Linus' tree and commit:
>
>   5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
>
> from the selinux tree.

Thanks Stephen.

I noticed the same thing while doing some additional testing yesterday
and applied a very similar patch to my testing kernel.  I'll be sure
to mention this to Linus when I send this up during the next merge
window.

-- 
paul moore
www.paul-moore.com
