Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838C221B7C2
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 16:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbgGJOEq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 10:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbgGJOEo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 10:04:44 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746E6C08C5CE;
        Fri, 10 Jul 2020 07:04:44 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t18so5163530ilh.2;
        Fri, 10 Jul 2020 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PTBjDKX9QGpcuX3s/VdchDQqYEiz3TYMGZbErPooqCM=;
        b=dsYMmc5ESfc26TsVEcETFHP1dEWIp0DgWNJMHhBXPlqWIAeycwi8nTlj+G/mo+GFsb
         ZQqtGQdXNxSN0PMwAIkFz4sEqVRnXT99p+X3a6xyip7Q44v6pZL3ueWkfrKzShVHokEy
         UoBXTzwI93Yr5wYPyJhj2wzM74CiJaUvO9uiiBotmaqyZYUrO1X6BoDhZ0re5ltGSWWs
         MyTi3GXg5NQni9wjIxStPPp8imUmXM1B6xtErm4x1kwhDmD9rTeqgG1v1nDjWgXdjxvq
         evlFkM2afcPt96UGdNYN0aVDvNKT1III5YcFkqVDCuomtAcuZQngauZMnABFNi4Va08i
         X5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PTBjDKX9QGpcuX3s/VdchDQqYEiz3TYMGZbErPooqCM=;
        b=SU2ejiUBWTt0RbWYOy0jVxAouxoqifTRiFkYkhDybNtWWGZW0Xk+PM8JYqRHVTs8Zu
         GP0fXVKc0VUnQ+bwgecqFLQq/UuLOlbP7T1RAIbOXCfENBSM28Yw8aBTqU1v15dKIb1f
         aOIt3W9f/nqFK5ma01Zj6G7fIs+51VLe/WwmMYgBIfMuiwa5mS56eb0upTjOUzrPC+ww
         EB0pZXpVLE6v7AcqKYSFY2dFkm8vUALpTzzhSWKbqY1Y08pvKYQA+z3VY9wvbXQLQAwJ
         +4z+ZJeSypRgmedvMkHMnfohD6q4NSMavGuIjwuDYDC7oDogjheUvdjRxkmy09xQD2Er
         hOGg==
X-Gm-Message-State: AOAM531KcE+oDbwYslccGTJJ/EEzDb9+o0XY78Z3ZU6ZEoeqLxI83JBI
        e6nCQnO7bnfWdRcsGZReORaY1WUwOpuFz5SVTn0=
X-Google-Smtp-Source: ABdhPJxIbAyUa3bPZYLNXzNpF2ldPD5y93hhQQAnFQkwKXGvH95xcg2wRO+ogn/HrcfKmzgZlFFYG/HC7DwGTggSVUM=
X-Received: by 2002:a92:404e:: with SMTP id n75mr11630820ila.203.1594389883807;
 Fri, 10 Jul 2020 07:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <1594309987-9919-1-git-send-email-laoar.shao@gmail.com>
 <20200710124253.GA1125@lca.pw> <20200710125852.GC3022@dhcp22.suse.cz> <20200710130724.GD3022@dhcp22.suse.cz>
In-Reply-To: <20200710130724.GD3022@dhcp22.suse.cz>
From:   Yafang Shao <laoar.shao@gmail.com>
Date:   Fri, 10 Jul 2020 22:04:07 +0800
Message-ID: <CALOAHbDW88hbAv8iPa=PqnXZ_k2phYFDys28QRAfbERLWBzi+Q@mail.gmail.com>
Subject: Re: [PATCH v2] mm, oom: make the calculation of oom badness more accurate
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Qian Cai <cai@lca.pw>, David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>, sfr@canb.auug.org.au,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 10, 2020 at 9:07 PM Michal Hocko <mhocko@kernel.org> wrote:
>
> On Fri 10-07-20 14:58:54, Michal Hocko wrote:
> [...]
> > I will have a closer look. Is the full dmesg available somewhere?
>
> Ups, I have missed this:
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index 2dd5a90f2f81..7f01835862f4 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -306,7 +306,7 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
>  static int oom_evaluate_task(struct task_struct *task, void *arg)
>  {
>         struct oom_control *oc = arg;
> -       unsigned long points;
> +       long points;
>
>         if (oom_unkillable_task(task))
>                 goto next;
>
> Does it help?
> --

Thanks Michal. This should be the fix.
I did it in our in-house kernel, but when I posted it to upstream I
missed it. That's my fault.


-- 
Thanks
Yafang
