Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9779B1770D1
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 09:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbgCCIKR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 03:10:17 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34298 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgCCIKR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 03:10:17 -0500
Received: by mail-lj1-f193.google.com with SMTP id x7so2495983ljc.1
        for <linux-next@vger.kernel.org>; Tue, 03 Mar 2020 00:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IrpN0Khyn8F1w21hxzWH/afGTVD23TpSjjqucFl7FDw=;
        b=ywYBJW8uLDNL42qTQ9U0JspTdFYKPpfxz72SXdAOUhpjlgUd7wxjhMY5iXgaLa678Q
         HUFAyVWZbqi3NiWcOrc2Hcu3uKjRWhQ1AvpWF8WhXsOT9IflBiCK7D16gHYx9Ig++426
         Ltwj7ZkihrH+xDKNSfnx9gJ8auSEPilIdxbHYdLca3Qms+l1Zt6zD55cGgEQ9xaCqM5x
         aGah8U5cvou12zbmi/ewmL75AZJytjxtCSC0hO13KIL7MbMHObhI8djdmbWUnyb+qlP7
         SZ80cPbgyoyO++/N/5+eusOi9zApdk4kGurWR5YnU/fsQUrOa53AAB4c0GtRy9I2VFap
         ZV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IrpN0Khyn8F1w21hxzWH/afGTVD23TpSjjqucFl7FDw=;
        b=ZK6sTBRsYWvw9g8pR0uywJb0/msmRzp6yHtVa9OQErbbcV2Ozn2RzF8WmysZfYFX/x
         Cy8or3bu+qa9KN/K8V3vivgLQokC/BEHTvGTlRZjto4WgEcBLQVPjoCnMp6Dd5A7JEKC
         lzWzcDZ0PC9Cnry94kyUgClNkwiwXmfxqrKMwW2d7bI6uBCC8Sz1tUMkmPP1K1Ep6jk9
         YUrAxDLU8OhuPGHYh77nTX3FooCDtfPNx9ajAQJ56DlQz6883tViI3BbJYq5ZxN32xVx
         4euS6VLwg7z/UAQtt0KJvcRBDQJ/pRDbLFJLhpjODKpouTAfMHE9y8F+rPlIZDFnj2y+
         VZ3g==
X-Gm-Message-State: ANhLgQ1zRhbVYCOL2ZD2grBuerLSOF1e1b4UX4e/YRowOs+PGeNi66zI
        TwLaxuXv0MZdKrNvisGc7nz1+4UL3oXSMZRGa+clsA==
X-Google-Smtp-Source: ADFU+vtcf2XGPFtkahhGncITxSY967rhTlnPD1S9kyV1c/Dr1He9t9FKOVYN3msBIiEPycAaIXOvebfpwBgQ6K3phDo=
X-Received: by 2002:a05:651c:203:: with SMTP id y3mr1677654ljn.151.1583223014795;
 Tue, 03 Mar 2020 00:10:14 -0800 (PST)
MIME-Version: 1.0
References: <1583209826-28853-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1583209826-28853-1-git-send-email-anshuman.khandual@arm.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Tue, 3 Mar 2020 09:10:02 +0100
Message-ID: <CAKfTPtB8sfJaOXL9D98ydxWZ76_8FLw4Z5KWWn73fcfkdiB-Vg@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Conditionally enable test_idle_cores()
 forward declaration
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Anshuman,

On Tue, 3 Mar 2020 at 05:30, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> test_idle_cores()'s definition and all it's call sites are enclosed withi=
n
> CONFIG_SCHED_SMT. Hence the forward declaration needs to be conditionally
> enabled in order to prevent build warnings like the following.
>
> kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99 d=
eclared =E2=80=98static=E2=80=99
> but never defined [-Wunused-function]
>  static inline bool test_idle_cores(int cpu, bool def);
>                     ^~~~~~~~~~~~~~~

similar patches has already been sent:
https://lore.kernel.org/lkml/20200226121244.7524-1-valentin.schneider@arm.c=
om/
https://lore.kernel.org/patchwork/patch/1201059/

>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: sfr@canb.auug.org.au
> Cc: linux-next@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch solves a build problem that exists on next-20200302.
>
>  kernel/sched/fair.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 84594f8..827087f 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1521,7 +1521,9 @@ static inline bool is_core_idle(int cpu)
>  }
>
>  /* Forward declarations of select_idle_sibling helpers */
> +#ifdef CONFIG_SCHED_SMT
>  static inline bool test_idle_cores(int cpu, bool def);
> +#endif
>
>  struct task_numa_env {
>         struct task_struct *p;
> --
> 2.7.4
>
