Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBBE45CAD9
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 18:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbhKXR1B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 12:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237361AbhKXR1A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 12:27:00 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9C2C061714;
        Wed, 24 Nov 2021 09:23:50 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id l25so13525432eda.11;
        Wed, 24 Nov 2021 09:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ccJMIpDP63AsSWP0+gJpsJishWCjmMXQ0SENwgrm5zo=;
        b=LPQIsg+fnQjP+GIjcU+s2UMMyjwiLbLz29SB7qHmon0OqWk06zH7knq6feBANLCkBL
         i+O6SprIXvZ/RMchNw5acYJ9uMkd508g1WcEDkla4Ao/ZDtmKCSaEIOCy2BS48JnD6eZ
         eeJrqZuQva7WkELPIdub8lRIf/sL2XOOBWo1kY07QXJydijSe8PceQm7ghukbsZsXEvJ
         uTIZScnEmTsw7dp6imxmSBAeZV7cV5J7Ob229ctIQbA9R+O2pki82r+BhKZf9nOgVP3w
         p3BqEV6FrEZJK/3S3ghUyyumlvAqmGtD401bgDgsomSwG5ofZf3kcRFfKYo3ZIwOKFj9
         TyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ccJMIpDP63AsSWP0+gJpsJishWCjmMXQ0SENwgrm5zo=;
        b=IHZ6f1AsBxCJVo7eiA3vrh/2rJcXmVrGSvaPJXiLb+FfXIvSu5BtWlo0SkkipmxRj8
         ndbrb60iaGVvXWb4we9k2wIiMUMf6VcD2ab4W72dGTPL5qEBexuIc5+5M/c12l6CmkQ4
         5yyYSvAAia0arFGEmyTM6NrsghMOLwUjj+hz0YBAwUyph/wEmwIH/NJazaa4X1SEyreb
         yPncQ9hwiqv5q6J5/SYJDHu/ZoIIlrz8YCkYwTMqzaRbEtNodcBdR1b5iuMYoiuBbK0R
         7nMBsGTTddlfVNnw9aCg3d9N+cxVXpiESrVt2qAUTwbH5sMikwY9S8GefHqmfyUwuuRF
         1Brg==
X-Gm-Message-State: AOAM531Keb3aQc6LGUunFgj4SJiTrCfE0WCO6leVRD9mQOpRpOn4VDX0
        yeb2Ik4/CGUPY0+1n6FudUB5dEHQfh3RGcT0bTk=
X-Google-Smtp-Source: ABdhPJxCkUPK2xGVGQ8pQVAH6s4Q6tpFbqatbbYoPoAC/pb3AwqZ/UUH4ORYdYtNjszU1n1TDfxAVTzojZYvfCqJ1Zg=
X-Received: by 2002:a05:6402:40d3:: with SMTP id z19mr28561357edb.185.1637774628721;
 Wed, 24 Nov 2021 09:23:48 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
In-Reply-To: <20211124132112.11641-1-andrealmeid@collabora.com>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Wed, 24 Nov 2021 09:23:37 -0800
Message-ID: <CAMo8BfL18MQah-Bsf3NUUH+U5inLyErMfHoqr2vdwzUzCc=dyA@mail.gmail.com>
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
To:     =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
        "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev@lists.ozlabs.org,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        boqun.feng@gmail.com, Linux-Next <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, longman@redhat.com,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, naresh.kamboju@linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Landley <rob@landley.net>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        umgwanakikbuti@gmail.com, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 24, 2021 at 5:21 AM Andr=C3=A9 Almeida <andrealmeid@collabora.c=
om> wrote:
>
> Wireup futex_waitv syscall for all remaining archs.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@collabora.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
>  arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
>  arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
>  arch/sh/kernel/syscalls/syscall.tbl         | 1 +
>  arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
>  8 files changed, 8 insertions(+)

For xtensa:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
