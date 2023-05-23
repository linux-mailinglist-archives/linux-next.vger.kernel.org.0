Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3852870D8E8
	for <lists+linux-next@lfdr.de>; Tue, 23 May 2023 11:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjEWJZm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 May 2023 05:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232211AbjEWJZl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 May 2023 05:25:41 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E082E6
        for <linux-next@vger.kernel.org>; Tue, 23 May 2023 02:25:40 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4573697b2cdso840652e0c.3
        for <linux-next@vger.kernel.org>; Tue, 23 May 2023 02:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684833939; x=1687425939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uN17lpJppLHyVvY0f+t4p7dd0oKu5S+/bhEzLex37ec=;
        b=bjDycL63N88EGlG+VX8Yx8Montns5WyvjfTAETehrRtpMHEdbJ9l5ha5ciCAWI5yEF
         c/Gae83DGvRDomSt0mP9Dh5YizBIcdkDGwpOjGKSEsnKrzQJ/lfcLoxnjJLK4r5rlVG3
         n0g4Ga9qLHcSnPOAueKzgXPaY63+fihE9RVTrx3jCrvwXkuZ787f5RI8JEDKmsPyAOJ2
         nbZCz1ItMzhQZwfheO/z7HA/GgaM56Go/jDV15kQfGyHPRp3aHijezl3djSLN2jqmlY/
         mMh7Hgay2ZxvLPSm8Ip2L9/ZYcpMmpahhMw//++tG2BYqVPQdTvANjoljJ9dw9NEZB2B
         Pg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833939; x=1687425939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uN17lpJppLHyVvY0f+t4p7dd0oKu5S+/bhEzLex37ec=;
        b=J99GoM00NE/mnwVpjiMNbYeJ1OMkStTmA65eDj9K9Ts/2a7IcfZvVm/s5iZpxfafCA
         5mDP3rCb90hBOyD1SfyAhgYcAuoExycvJeX+/xxvCbSr5G7ST2RCtAuRgdQTgPawrYBn
         e8RO3XXYRI/N3Wienunq5j8L35K4nNfONwy78+Kd4n3r+ptrcwggp5seDPcp61OsC+b+
         zej/BxPnb7Y8Ud7ro8N+6gRGQziFz8MSGRMqR6Ra71EqC0SrR5A8b+jLWBdLVN2r+RZL
         LdixvJykp+GxiZoy6s0u+8IU3Q00ymIgd8IlDtW54JsqTmFu61V1IzE/Sq0ujk2dqG4g
         Rdcg==
X-Gm-Message-State: AC+VfDxS9ea03xdvfVKCtLka9mQWu8w52bhZtffojaIK7C2GwWFr/WQa
        GkFEl+PHS/n4TngmbMAs/+v4XjYaGG5C2/pswnObrA==
X-Google-Smtp-Source: ACHHUZ7ny/5EqZ30sVNJAfPXNTsNLZu4nr4f64yMukVnu/zcnPUCISy1uz6X5BezKtD1XxrPR6AVVXA83L9hha8txto=
X-Received: by 2002:a1f:3f88:0:b0:457:1a8:9ea4 with SMTP id
 m130-20020a1f3f88000000b0045701a89ea4mr4738542vka.3.1684833939092; Tue, 23
 May 2023 02:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYud2YH1c9Hxekd-pi8VsD4HmA4v9g-mr-vRPqaRQd2F5w@mail.gmail.com>
 <CALm+0cXew-QX9gkHkL7majJuENP1C_WLVG=pQ_6RGZ1UgQ79Eg@mail.gmail.com>
 <ZGuydp0KToLf55vY@slm.duckdns.org> <ZGvap5qi0OKAOfqX@slm.duckdns.org>
In-Reply-To: <ZGvap5qi0OKAOfqX@slm.duckdns.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 23 May 2023 14:55:27 +0530
Message-ID: <CA+G9fYs8Oa8sS97H8LdAOv=k9tJVuikekbqh_E57vEUVcvk_4A@mail.gmail.com>
Subject: Re: next: WARNING: CPU: 0 PID: 63 at kernel/workqueue.c:1999 worker_enter_idle+0xb2/0xc0
To:     Tejun Heo <tj@kernel.org>, Anders Roxell <anders.roxell@linaro.org>
Cc:     Z qiang <qiang.zhang1211@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        clang-built-linux <llvm@lists.linux.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 23 May 2023 at 02:42, Tejun Heo <tj@kernel.org> wrote:
>
> On Mon, May 22, 2023 at 08:20:38AM -1000, Tejun Heo wrote:
> > Hello,
> >
> > On Mon, May 22, 2023 at 09:24:09PM +0800, Z qiang wrote:
> > > diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> > > index 9c5c1cfa478f..f8d739fef311 100644
> > > --- a/kernel/workqueue.c
> > > +++ b/kernel/workqueue.c
> > > @@ -1060,10 +1060,9 @@ void wq_worker_running(struct task_struct *task)
> > >          * and leave with an unexpected pool->nr_running == 1 on the newly
> > > unbound
> > >          * pool. Protect against such race.
> > >          */
> > > -       preempt_disable();
> > > +       local_irq_disable();
> > >         if (!(worker->flags & WORKER_NOT_RUNNING))
> > >                 worker->pool->nr_running++;
> > > -       preempt_enable();
> > >
> > >         /*
> > >          * CPU intensive auto-detection cares about how long a work item
> > > hogged
> > > @@ -1072,6 +1071,7 @@ void wq_worker_running(struct task_struct *task)
> > >         worker->current_at = worker->task->se.sum_exec_runtime;
> > >
> > >         worker->sleeping = 0;
> > > +       local_irq_enable();
> > >  }
> >
> > Ah, yeah, this is correct. Now we're modifying nr_running from timer tick
> > too, so if don't block irq, the timer tick can ruin the not-irq-protected
> > read-write-modify nr_running update from wq_worker_running(). Naresh, can
> > you please confirm the fix?
>
> Z qiang, while waiting for Naresh's test result, can you send the fix as a
> proper signed-off-patch?


The proposed patch applied on top of Linux next and boot tested for
more than 100 times and is still running in a loop by Anders.

The reported warning did not reproduce again.

Tested-by: Anders Roxell <anders.roxell@linaro.org>
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


- Naresh


>
> Thanks.


>
> --
> tejun
