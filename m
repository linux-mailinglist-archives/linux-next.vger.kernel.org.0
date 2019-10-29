Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39C3DE82F4
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 09:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728722AbfJ2IHX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 04:07:23 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:42234 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbfJ2IHX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 04:07:23 -0400
Received: by mail-lf1-f53.google.com with SMTP id z12so9794142lfj.9
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6MF1HoonpLJzEHqalTVV98uvaLDeelGdiBOm5aqWhSM=;
        b=nigQt+T6ckvRRQlrGQ2G3othqLZ968vxPf2cnMizFWuskwLBklnuUsdHBNGccK1wpp
         GnrJpWmzipYzycuw8n+tL66vYjGssjvFugZ9r+8W5hyOnZXosdZP61ADtoJZ0+DyanPh
         TgBN9zx3aIeSgzs9a1V17moZQpp2vt0xQ9qMED0H0teobhXPUhL4iU5vQ9XVxqmHrQxE
         sKffG2aOCR4yNkJZHgoA7PubiybhRUsjltQLPjp1u84jjll1Kfb+bY0Q5fNnIDF7feq5
         C2JYzyKlCiupmA+/0surmmGVRcSAufHmroNpadh/TcvC4hDDUUrQHXQR7CtjJVR7JOCj
         hlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6MF1HoonpLJzEHqalTVV98uvaLDeelGdiBOm5aqWhSM=;
        b=OVvXePTgFo91MiTAjhBjKB0Pbb5iHiqR04pUkAJinWNBoU+vOFAWcUVTUZEFu4ETjG
         FUMfPyy3bW2mli1UOEruDxPqYviTFxpU1j312ARpQeG8UsZ2xYtls6pR+5PaP9S9JtpQ
         toZRRysUoqATAmpHMjCAfZtyoNaYkZeOy1cRHh3vthH71it8Efbknm2IY5Z67kqqlBkE
         ev1M6BO8nQoPSgHh+sX0zTh7/uAR9gTql/XBOIXsQ2vSBqpz9jGlrjOEWKhjqruHLCow
         MIch68zlPyf2/fFS75WbDdBuGAvB5chnRYjb5UJT7pG2nQTlqVdoZM6oR1U9yQ2V585g
         hQJA==
X-Gm-Message-State: APjAAAWR+PyBcHtRT6Cr/001raxkBuOZ2OqXCustZYC0PN0JdN68rXbe
        KzcqP77BRvE4QTw6BAiYJChrj4tpaK2L5x2WHTmDQQ==
X-Google-Smtp-Source: APXvYqwZ9Bv1yW56igUOYNdurd9ysNzNtXG1f8++HMh0+D7kb0IJFnkTnrPI7mXNov+R3PI7ZrhCg3T52A/94hIAWJo=
X-Received: by 2002:ac2:4650:: with SMTP id s16mr1506074lfo.32.1572336440425;
 Tue, 29 Oct 2019 01:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <201910281603.4378C08@keescook>
In-Reply-To: <201910281603.4378C08@keescook>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Tue, 29 Oct 2019 09:07:09 +0100
Message-ID: <CAKfTPtDji9SC6OZ8Aurjn5mxR_bmMnoZN82h=RdC9v-0wTzHSQ@mail.gmail.com>
Subject: Re: Coverity: find_idlest_group(): Null pointer dereferences
To:     coverity-bot <keescook@chromium.org>
Cc:     Ingo Molnar <mingo@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 29 Oct 2019 at 00:03, coverity-bot <keescook@chromium.org> wrote:
>
> Hello!
>
> This is an experimental automated report about issues detected by Coverity
> from a scan of next-20191025 as part of the linux-next weekly scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by recent commits:
>
> 57abff067a08 ("sched/fair: Rework find_idlest_group()")
>
> Coverity reported the following:
>
> *** CID 1487371:  Null pointer dereferences  (FORWARD_NULL)
> /kernel/sched/fair.c: 8319 in find_idlest_group()
> 8313            case group_asym_packing:
> 8314                    /* Those type are not used in the slow wakeup path */
> 8315                    return NULL;
> 8316
> 8317            case group_misfit_task:
> 8318                    /* Select group with the highest max capacity */
> vvv     CID 1487371:  Null pointer dereferences  (FORWARD_NULL)
> vvv     Dereferencing null pointer "local".
> 8319                    if (local->sgc->max_capacity >= idlest->sgc->max_capacity)

Local can't be NULL and will be set in the loop above because this_cpu
belongs to one of the groups of its sched_domain

> 8320                            return NULL;
> 8321                    break;
> 8322
> 8323            case group_has_spare:
> 8324                    if (sd->flags & SD_NUMA) {
>
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include:
>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1487371 ("Null pointer dereferences")
> Fixes: 57abff067a08 ("sched/fair: Rework find_idlest_group()")
>
>
> Thanks for your attention!
>
> --
> Coverity-bot
