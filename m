Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF69531B70D
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 11:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhBOKYy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 05:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhBOKYp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 05:24:45 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE4AC061788;
        Mon, 15 Feb 2021 02:24:05 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d13so3486901plg.0;
        Mon, 15 Feb 2021 02:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AG9OeEDo/3JdE44hP8BDfnT3JJC7Oi1S02kLK5AK3ek=;
        b=FzZrFSd5XTW066ME8RWqO1mVPmO6hUrCaIQ0yFwcCCj/jPmlLkQsd6esrQr065Q9WA
         GOCMtCb8mfeKSVYw870MRCgSx9rR5HAID6NpooUmoY157LqRc5QYz9pRS1gv3R2QO0CK
         QD6XW00LTp4P2//WB2woePR7kVehsPBTli+YEjArC/ZU7iR75UJguvSuVl/QGplYsIBB
         Ts3uB2UNHJ1xKWvqw5szyNRNr9ikbOSS3/6aTCBkvsXZj04lypKB/IrLvb/LDf03h6/w
         laT2i1k4Wz2KLoBPIPpxhpTcKIrkEExTeMmIWWv4ElIDI397HmEbuKo9T1gJwhZ2Q98G
         IFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AG9OeEDo/3JdE44hP8BDfnT3JJC7Oi1S02kLK5AK3ek=;
        b=E7YR9xLX4n8SK3m/c5BrpoZ3r9xRovc7d+MHT3LMp1h5D0ocVSBQQTjEqPY0ZogpRe
         ixpRhVmZ5QgI5UMwtRARrKiFoKT7G9fLaquPGeU+F9xxlidjYnZZtI6LNjmbizA0kxfd
         agpbcuW6plQpUMM6ugYHOEeOjRR32hfksbiB/Dn5sFKe1VwZleO1FyYoQOp+5r6yzIt+
         KzUqsJ7+IDwBsN3000NJyhh06AxYmCP/BV6kKp2P4z3Z2SuJMXCL7tSa+dLoNkqZ1nXN
         zwTTHqsstjJlY4Zu49HCV5vYyeufldfV1KdFxt/UawfkaD3tueFF1ORfbY4sevU7Kcws
         U60A==
X-Gm-Message-State: AOAM533Ped9+arV73E5WF+r3SmCZ3KtWm/KR6jZNoLqwE/HdNJ5WCgwy
        RwSZbkBEfwhELb/8uIxakigo7j/iV00VTtTgREs=
X-Google-Smtp-Source: ABdhPJy6fd17nzrxmvBZLNEEyvUfWO1c2I3ULmO+swt4RuS8MLyRy+fsv8X3w+qA8r5rod6I6LpxBy/P4TAkz6g8UII=
X-Received: by 2002:a17:90a:4fc1:: with SMTP id q59mr16050899pjh.129.1613384644563;
 Mon, 15 Feb 2021 02:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20210215113939.03e44e3c@canb.auug.org.au>
In-Reply-To: <20210215113939.03e44e3c@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Feb 2021 12:23:48 +0200
Message-ID: <CAHp75Ve2TyPx4H=7E92tKZ=GV46Y0Vzi-NwGMLrGtiXv-Nv7gg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
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

On Mon, Feb 15, 2021 at 2:45 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> In file included from drivers/gpu/drm/gma500/mdfld_output.c:28:
> arch/x86/include/asm/intel_scu_ipc.h:23:12: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
>    23 |     struct module *owner);
>       |            ^~~~~~
> arch/x86/include/asm/intel_scu_ipc.h:33:17: warning: 'struct module' declared inside parameter list will not be visible outside of this definition or declaration
>    33 |          struct module *owner);
>       |                 ^~~~~~
>
> Introduced by commit
>
>   bfc838f8598e ("drm/gma500: Convert to use new SCU IPC API")
>
> OK, these will go away when the drm-misc tree removes this file in commit
>
>   e1da811218d2 ("drm/gma500: Remove Medfield support")
>
> So, if you don't want to see these warnings in Linus' build testing,
> you need to make sure that the drm-misc tree is merged before the pm
> tree (or the drivers-x86 tree).  Or you need to include module.h in
> mdfld_output.c before intel_scu_ipc.h (or in intel_scu_ipc.h itself).

Thanks for the report.
I guess the DRM tree should carry this burden, or they can merge the
immutable tag themselves.

-- 
With Best Regards,
Andy Shevchenko
