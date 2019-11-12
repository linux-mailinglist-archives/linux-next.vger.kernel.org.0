Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD4DBF970B
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 18:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfKLRY2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 12:24:28 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40562 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKLRY1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 12:24:27 -0500
Received: by mail-lf1-f68.google.com with SMTP id j26so6420651lfh.7
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 09:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4wdGyRQgBTKLVRYANdE50BemFLHkEtcXoKBH3Fi07AY=;
        b=qYNkz9guQpKqa4XqTXgE9zEX+Hzp1N3JdyINOr45byU9ANdOk2QAsVlVMnjeRjAh0k
         Ehv4Z7t11DsoR9JjSLovqy/3+ANxhR6pmcfPlTlFCW4h1RKoxECPoYD46oKDzc/DwnFZ
         VrIpigSqCmMjnEOh2GKgBN72d7UyRHg/gZ2jPxRVuF1dBpmAxHDkkjg9FGlNmjT5+YJW
         tmeQ6PSYgKV4w6TCuVzyLeAVQ7yL0F9hE7OBssRjnGiwoBQSlWLNON825FWcDHq0BhB6
         n5W5b2vPbCflNRIZHnous7CAsWQUiWi00U+8NspihxUOMHhFPbDo20jPRus2WexYUhK+
         UZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4wdGyRQgBTKLVRYANdE50BemFLHkEtcXoKBH3Fi07AY=;
        b=pYQPCBdRMA0b86yyrgrkigyVKPOHOXMXIulxeHw9Hb4UoeoA6iZgZxhkOoL7t8bqCF
         1+hBAhQHKkxHvljQHWWA/g7j9qdkLfJ7/2R2pE9PFuSw0WGKWgMkaSvlmzGMuMxcI1mh
         ggr3u+8iEdLJRf5ysFnN1FhWeQRR9sdx6c4oTXK0sPJYZsx5XorwV8DxtThVCFs4E9vi
         vi5lPM8pYQNcMh+0WWgZHEquhCUOh7Lmpvrb/NtFwV2X6aXQJ/3xbwbEKvBmJwtt1ExQ
         1FYXmTiTjA8VRurKkUs+2KozBv8ue9wQPG4ai9YNVf4W3Sv/o1i22iCOQXyW2w3rygmx
         yB3A==
X-Gm-Message-State: APjAAAW7fEan3hVtsbr8n1UO9chJ/uoNFp83OPHhVh9dLJ13bvSlbpP7
        wucWMDYQ+TQBI1QTtTtdDpRpSq2D6aSIndah9qHGvvGA+tg=
X-Google-Smtp-Source: APXvYqwMwDjZxnLBPohjX76oEr9gZX1IrP0TqyPjZhuJ1qAuNNj6NF7hg0PfALISo5W2TxPD9wQ/qb4deYvce5lggrE=
X-Received: by 2002:a19:c18d:: with SMTP id r135mr13094080lff.75.1573579464179;
 Tue, 12 Nov 2019 09:24:24 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtJNyMOw4rkfHMv+XxwhVPbqdsCHoCkn4aL2TsofyCfvw@mail.gmail.com>
 <20191112171834.GH5195@sirena.co.uk>
In-Reply-To: <20191112171834.GH5195@sirena.co.uk>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 12 Nov 2019 22:54:12 +0530
Message-ID: <CA+G9fYuN8QjQALfNPCkcXpXk1JY4tAwVRovAOe_6Edp-_GQ_Vg@mail.gmail.com>
Subject: Re: Linux next 5.4.0-rc7-next-20191112: rcu: INFO: rcu_sched
 self-detected stall on CPU
To:     Mark Brown <broonie@kernel.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        acme@kernel.org, linux-perf-users@vger.kernel.org,
        mhiramat@kernel.org, Paul McKenney <paul.mckenney@us.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 12 Nov 2019 at 22:48, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Nov 12, 2019 at 10:38:10PM +0530, Naresh Kamboju wrote:
> > INFO: rcu_sched self-detected stall on CPU detected on Linux next
> > 5.4.0-rc7-next-20191112 running on x86_64 device and continuously
> > popped up kernel
> > OTOH, arm64 juno device boot failed without generating any kernel boot log.
>
> Juno is booting fine in -next in KernelCI:

Thanks for confirming that.

>
>         https://kernelci.org/boot/id/5dca98dd59b514e08a138e08/
>
> Some config difference perhaps?

Yes.
There are extra kernel config fragments from selftests, LTP, perf and few more.


Juno build metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: fc6d6db1df2cb11bbecc542d67885742e75b4b07
  git describe: next-20191112
  make_kernelversion: 5.4.0-rc7
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/juno/lkft/linux-next/644/config

- Naresh
