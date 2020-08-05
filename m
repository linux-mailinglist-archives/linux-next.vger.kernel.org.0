Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED78B23D059
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 21:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgHEQ72 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 12:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728268AbgHEQ5p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 12:57:45 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60308C001FCD
        for <linux-next@vger.kernel.org>; Wed,  5 Aug 2020 08:52:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mt12so4735025pjb.4
        for <linux-next@vger.kernel.org>; Wed, 05 Aug 2020 08:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3rgPdx4FvPNj3L/b4d9eiz4Lukmw32rT0pYFOATs+yo=;
        b=uhBO0OpFg/LYWCU/5Q95FYkvHAjv/6vqQnVWGZzffuTQK/Qt3glmHzfnFmhjJqC8RT
         N0CiCQ6ukSeX5YVxSKoMGN9Qb1uJBgtNieq4cbiZZSukukLRsN2H4hGfYtlcRiwHyfs3
         BvjqbigytY0sqh3GHRdYZ4Dp0GpMRo6dKqTWxcM19sUN5Y1Yv8qcNnh5Zt+epIcPsJ95
         paI74rAQyMO4signAODc/PF3fcaVtAkg4y87a9W67Jz1Dchst1zaLxoEIQcm/vUWZJQh
         m5f5buRbOnH0sv7xBuqOH/zDcxvvoc1xi8kLJC9YoO8EdYWn1DBBSpoZtiHLLljLBM0c
         azHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3rgPdx4FvPNj3L/b4d9eiz4Lukmw32rT0pYFOATs+yo=;
        b=SLnwFGzkFMZDgbAN/UdgWoTKVKuWhnAqB6jORTyvQvQutR/y2WM9GsgLFqR7fYH4Ah
         bOeREvRaddkJOVskBvCd4gGI594JV+WBtJVxO67ONFCOYOJBIAxu6cjXV6s7EBu9Na06
         agFjzdbJAc46kDo7KVW4dOS8ZohqT3clMiS9Amtu+hNuNGWeybHq6u2JjcE3S6N1ZPvo
         iPnA5idBz2wghw3Z7P8xXH9XKcYEfElJGqsGkVeBOCXCynHYagUV+RSZ5CALl7J2deKT
         K65pEjPpo/YUciZ2+2GT8N6qEwvruYKi4yaAZpuE8FpSXBCynPz1zIUDcTeQdMUrrRxX
         pcJw==
X-Gm-Message-State: AOAM532wFAPeltWmHhWEI6W7yY6icz0C8wCpuqXOcmk83og8/DyDwYSX
        FK72zoNmrh/5kDXwS3wlyUMgKltBJ17tm8iXeOcRmw==
X-Google-Smtp-Source: ABdhPJz+S08tQUWlf0uwerTLvPYHj7weeZ1Gqq2V3WinQnKdQtXh5JjIbGt6HHa9rGmGMGwnT3MhZnsWIgeaF+dLaW8=
X-Received: by 2002:a17:90a:fa8c:: with SMTP id cu12mr4074109pjb.229.1596642731102;
 Wed, 05 Aug 2020 08:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200805142136.0331f7ea@canb.auug.org.au> <CAMZfGtX0a3tui_KQfCXLcARVcev9V-HV6HMkXgVXObq8w-4EQg@mail.gmail.com>
 <20200805111105.081276bb@oasis.local.home>
In-Reply-To: <20200805111105.081276bb@oasis.local.home>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 5 Aug 2020 23:51:34 +0800
Message-ID: <CAMZfGtU7iTFAZVRFgh5vgzB9nSOoDjm7F4Jqpd4uhEe8NListQ@mail.gmail.com>
Subject: Re: [External] linux-next: build warning after merge of the ftrace tree
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chengming Zhou <zhouchengming@bytedance.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 5, 2020 at 11:11 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 5 Aug 2020 12:53:39 +0800
> Muchun Song <songmuchun@bytedance.com> wrote:
>
> > On Wed, Aug 5, 2020 at 12:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the ftrace tree, today's linux-next build (powerpc
> > > ppc64_defconfig) produced this warning:
> > >
> > > kernel/kprobes.c: In function 'kill_kprobe':
> > > kernel/kprobes.c:1116:33: warning: statement with no effect [-Wunused-value]
> > >  1116 | #define disarm_kprobe_ftrace(p) (-ENODEV)
> > >       |                                 ^
> > > kernel/kprobes.c:2154:3: note: in expansion of macro 'disarm_kprobe_ftrace'
> > >  2154 |   disarm_kprobe_ftrace(p);
> > >       |   ^~~~~~~~~~~~~~~~~~~~
> > >
> >
> > Sorry, maybe we should rework the macro of disarm_kprobe_ftrace to an
> > inline function like below.
> >
> > -#define disarm_kprobe_ftrace(p)        (-ENODEV)
> > +static inline int disarm_kprobe_ftrace(struct kprobe *p)
> > +{
> > +       return -ENODEV
> > +}
> >  #endif
>
> Looks like that would work. Care to send a formal patch. Could you also
> change arm_kprobe_ftrace() as well?

OK, I will do that. Thanks.

>
> Thanks!
>
> -- Steve



-- 
Yours,
Muchun
