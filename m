Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A01C31B718
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 11:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhBOK0P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 05:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBOKZn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 05:25:43 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3EBC061574;
        Mon, 15 Feb 2021 02:25:03 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id z6so3928231pfq.0;
        Mon, 15 Feb 2021 02:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KM7TCDJh8gpTDG5Q8gExFbYPTexcOat3ZceHInBbrV8=;
        b=c3PzPRmaGCtdEsA8zdKsW1imgEwC/GclVJD5S986AFr6tm+OjUZ/TgYrymzD7eSCWf
         7ZIgFWF0M4PE4EoyCLisGu2VnwRKe9Yys0w6tDOwmHGbDnHtU2rGxTYDIKomvYdjDsLM
         xkyDJj1MTkh44wTgqxx4Ghn1hZfPqFG06KEJ41Y8vBlBFM+1wXHVcWlTLbfDOEMzOivo
         Z/pawEs3DFuErC4RjEtWEhQirxX05LB6RELJshvrnotY1/YHOkT1V1YmYBpagRxE5YVp
         BAyK0sccTeP25aX54Q0RnrgdBohiisQU0dTpEg35oVFWSW37NQ4/5GT0sWcfs3gS03o3
         eXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KM7TCDJh8gpTDG5Q8gExFbYPTexcOat3ZceHInBbrV8=;
        b=pCWJP7dkPWlbkmNQWDEDxd4u5wSBFHEQ0MBvJeeKXBdy2N3UbC3gdQX8+tvc17U9pl
         dtXidczCw/AUH6GulHWcsupIyGmsMwBYIN2AFEKYnl7HqlJx1seLZ93xZSbkzp6VPRdz
         NGRzmHoThGThcrA2NgixBO7nrRYgbzdbMWStbzORe1POStV2JUgXhpyYID32XEhaSKi7
         xUUejdoYIc1oqfjpXnugraiiJnjPCp8RgLCoRStiP7YNWbwfmxwMZcvjms5EuBYosjrc
         2nXlM02+QDTN1nUu/3TKkFjzurGHery3A/o5xYQJjGDcbrOLPZEYC736AV4EjFmiWXHr
         0D2Q==
X-Gm-Message-State: AOAM530GTmUUrMer4Wc65RjadVtIMzvALJXh1vS0106Efg1KhI+XyztX
        FE26eMhDWQxJqlfGJGWasXWFRzpVsIRRQMWBV/Y=
X-Google-Smtp-Source: ABdhPJwKr8xtXgDkUwLSIEAkqcbUMWBE/NdHSN1a6AlWcRbzU7jBsVrPkdfP/Wrqrr1+7AhpnxNbVV17sjZSgU7O4r8=
X-Received: by 2002:a62:ea08:0:b029:1ec:a029:c04a with SMTP id
 t8-20020a62ea080000b02901eca029c04amr3471105pfh.40.1613384703064; Mon, 15 Feb
 2021 02:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20210215113939.03e44e3c@canb.auug.org.au> <CAHp75Ve2TyPx4H=7E92tKZ=GV46Y0Vzi-NwGMLrGtiXv-Nv7gg@mail.gmail.com>
In-Reply-To: <CAHp75Ve2TyPx4H=7E92tKZ=GV46Y0Vzi-NwGMLrGtiXv-Nv7gg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Feb 2021 12:24:47 +0200
Message-ID: <CAHp75VfGL_NmkpYxFDGMf781VyYEsvWSkQSaw-qTX8ch_S8cPw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+Cc: Patrik (JFYI).

On Mon, Feb 15, 2021 at 12:23 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Feb 15, 2021 at 2:45 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> >
> > In file included from drivers/gpu/drm/gma500/mdfld_output.c:28:
> > arch/x86/include/asm/intel_scu_ipc.h:23:12: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
> >    23 |     struct module *owner);
> >       |            ^~~~~~
> > arch/x86/include/asm/intel_scu_ipc.h:33:17: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
> >    33 |          struct module *owner);
> >       |                 ^~~~~~
> >
> > Introduced by commit
> >
> >   bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
> >
> > OK, these will go away when the drm-misc tree removes this file in commit
> >
> >   e1da811218d2 ("drm/gma500: Remove Medfield support")
> >
> > So, if you don't want to see these warnings in Linus' build testing,
> > you need to make sure that the drm-misc tree is merged before the pm
> > tree (or the drivers-x86 tree).  Or you need to include module.h in
> > mdfld_output.c before intel_scu_ipc.h (or in intel_scu_ipc.h itself).
>
> Thanks for the report.
> I guess the DRM tree should carry this burden, or they can merge the
> immutable tag themselves.
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
