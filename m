Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9758F19D1EE
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 10:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390494AbgDCIP1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 04:15:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46445 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390493AbgDCIP1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2020 04:15:27 -0400
Received: by mail-lj1-f195.google.com with SMTP id r7so5983780ljg.13;
        Fri, 03 Apr 2020 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xULmbnigaj/k48l6kNwyFcGwHPYsq90A4ICZ4qM/NnA=;
        b=Ves+3435IKbJxDL7FRv9swcqnzkV4kRiqpXzMND9PHZfJr07xy/BSPJ9N8mMrPF7Py
         GpcqqWz5qMmtk17989l45cMJhU+6t8wnOy2ezo3l3IiY2DZ8OxFeTg1aYwyY6L9gEjc/
         kVFsq9qZHGDHfEw57r2lbFcYxXvsbgviJ53aAi0bJFje6k8RiVw+oUNTk/b17TRVIvJI
         ItQLgB4p//nq4JUJL4Ts3xaBrrwTmLJYIZtvOGJOQwetnaEsTY8V+Apa9HwBf+2S37mR
         XVImlUuZ1CfuLVlPNgD4VunZZu3KoXhrsrIiEQaxbzrsHAfFMgV+ujSQmxjH87wnUtRV
         HulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xULmbnigaj/k48l6kNwyFcGwHPYsq90A4ICZ4qM/NnA=;
        b=q9uYVY8D8Rq+XVRn8ISYdod5wmRgGBXG/k6eRlJ/GTpk7tCIdJnLG0lW/Mib+dB/Ad
         oDsH3h8aBZFY6XiUqjXoxuj4FuJmjEZY779J5F45CG66+qU4+OrEpxXfiI+O4IcXHTze
         4+CfjNfTsq35QaaXnsNonFroDSXed6aAH0dW1WmP/ObR2W6ylW3Joraj3xu8tVFYgdn8
         w3mlMdHhp8t2yZMtw1oJ9NmY2C5w0xVrLownzDgl25NzsTx9G8OPmjMGHymQfOFyu/x5
         4Q02FtwAsY026arldPOWAnkBcsDC2gOY7lrR7OeMVlJDIMDoJIkfCUwEz9SUcYHW7cTg
         vdrg==
X-Gm-Message-State: AGi0PuZk9IlAsRU/fhy08MY4YzFyXgmhjVzB4F57q9uuhlw9uTKvIS8H
        /N6ZPCl6p8L1POQ4ptiDmp5yeeHvSgzHZgswCt0=
X-Google-Smtp-Source: APiQypIFN3V/gBbR2aRhH32fQnbna2itH9wMXLg0XTnMezep0xFxf8nb1vibli9SR0XIwTtyBKw8J/OWkox62p7hygs=
X-Received: by 2002:a2e:9b07:: with SMTP id u7mr4094550lji.110.1585901722773;
 Fri, 03 Apr 2020 01:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200326135258.2764f0de@canb.auug.org.au> <20200401121431.6a996244@canb.auug.org.au>
In-Reply-To: <20200401121431.6a996244@canb.auug.org.au>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Fri, 3 Apr 2020 16:15:11 +0800
Message-ID: <CADBw62qar4qPJmjZj1+9tb6sgqUcCrjei6G62wPaH=YVf48=zA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Reichel <sre@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 1, 2020 at 9:14 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Thu, 26 Mar 2020 13:52:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> >
> > drivers/power/reset/sc27xx-poweroff.c: In function 'sc27xx_poweroff_shutdown':
> > drivers/power/reset/sc27xx-poweroff.c:38:4: error: implicit declaration of function 'cpu_down' [-Werror=implicit-function-declaration]
> >    38 |    cpu_down(cpu);
> >       |    ^~~~~~~~
> >
> > Caused by commit
> >
> >   33c3736ec888 ("cpu/hotplug: Hide cpu_up/down()")
> >
> > interacting with commit
> >
> >   274afbc3ad33 ("power: reset: sc27xx: Change to use cpu_down()")
> >
> > from the battery tree.
> >
> > I have added the following merge fix patch:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Thu, 26 Mar 2020 13:42:00 +1100
> > Subject: [PATCH] power: reset: sc27xx: use remove_cpu instead of cpu_down
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/power/reset/sc27xx-poweroff.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/power/reset/sc27xx-poweroff.c b/drivers/power/reset/sc27xx-poweroff.c
> > index 69863074daf6..90287c31992c 100644
> > --- a/drivers/power/reset/sc27xx-poweroff.c
> > +++ b/drivers/power/reset/sc27xx-poweroff.c
> > @@ -35,7 +35,7 @@ static void sc27xx_poweroff_shutdown(void)
> >
> >       for_each_online_cpu(cpu) {
> >               if (cpu != smp_processor_id())
> > -                     cpu_down(cpu);
> > +                     remove_cpu(cpu);
> >       }
> >  #endif
> >  }
> > --
> > 2.25.0
>
> This fixup is now needed when the battery tree is merged into Linus' tree.

Thanks Stephen.

Sebastian, could you pick up this patch to avoid the compiling issue? Thanks.

-- 
Baolin Wang
