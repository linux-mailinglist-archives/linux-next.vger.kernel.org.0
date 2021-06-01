Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D2F396FFE
	for <lists+linux-next@lfdr.de>; Tue,  1 Jun 2021 11:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233571AbhFAJLq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 05:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbhFAJLp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Jun 2021 05:11:45 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B62BC06174A
        for <linux-next@vger.kernel.org>; Tue,  1 Jun 2021 02:10:04 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id k16so14445777ios.10
        for <linux-next@vger.kernel.org>; Tue, 01 Jun 2021 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=1EQ7MJidus+zd1vSi36boWoSco2HUCYyNMAuhLySHdo=;
        b=nAqGW0rv0vLb/EEjZ9CGKdRvJYzioH/TkKipmvva9d1weHd96fZy5/UMXiUFy21A5D
         Kau+N2HOeAygpGrZ3k2uI1JxhnRTx79j4kat57E4sAGqGJaxF7xnpDXpfUJ/+G0Z70P+
         KgMxj5H/MWx1On8FgVGTc48quuPGuLdFuo+hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=1EQ7MJidus+zd1vSi36boWoSco2HUCYyNMAuhLySHdo=;
        b=mSFwcxbD3mFcEUeIpU2Ni79wV4paopKcMF3uS+Np5NEtMw7euvRWIC+aoJWXeTg+9l
         E9OqJoR+0UqIApfiqGj2MUr51soAV3GDcK/5UDGL5Asths206c3iNj9kvjTKIpSedcNd
         yLutEAjyWizBS1i9JB7f++oDCplV0vNkZ2A4LHEHYWZNFtFLc0zPnovqo2Jg2sMN/vBT
         ZxKzcTXsvAHBOWu1FGAZkP8Y7n/dPiZ+MqInw1+m8RedhskvYGNhKUjWg7kEDUUZlMSa
         FvZ0ZvxCBbkeWTHqwQqHE1zqWLCVHeGe3w65AM0qO5A8Nv0S5pJNHXTSpI8Ico4UtUiC
         KnQQ==
X-Gm-Message-State: AOAM532PgH9MgLKKOBig7DXorF3m5ZchALRaq2Md3UVASttBQ/4e33dy
        tPlMtc1ck7ryELku4JWjueOLCE+z/U4JuQGKspHKRA==
X-Google-Smtp-Source: ABdhPJxkxWViiR7+vNwBsf/JsSJSnGBvwsAoK0L0khytjCMALZZE3DhVgkcsjlOdiCEQeze9wTvqED+Hg5lgHKAj1wQ=
X-Received: by 2002:a02:ca0d:: with SMTP id i13mr23985823jak.98.1622538603578;
 Tue, 01 Jun 2021 02:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210601103250.07301254@canb.auug.org.au> <YLX176D9oD7ZTSkT@ninjato>
In-Reply-To: <YLX176D9oD7ZTSkT@ninjato>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Tue, 1 Jun 2021 17:09:37 +0800
Message-ID: <CAJMQK-j1YKfquvY55HgTQ6zfDkE5btmRZKdjjOQ3rcq04QgKKQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the i2c tree
To:     Wolfram Sang <wsa@the-dreams.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 1, 2021 at 4:55 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi Stephen,
>
> > After merging the i2c tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> >
> > In file included from drivers/gpu/drm/i915/i915_gem.c:1250:
> > drivers/gpu/drm/i915/selftests/i915_gem.c:97:13: error: conflicting types for 'pm_suspend'
> >    97 | static void pm_suspend(struct drm_i915_private *i915)
> >       |             ^~~~~~~~~~
> > In file included from include/linux/regulator/consumer.h:35,
> >                  from include/linux/i2c.h:18,
> >                  from drivers/gpu/drm/i915/i915_drv.h:39,
> >                  from drivers/gpu/drm/i915/gt/intel_context.h:14,
> >                  from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
> >                  from drivers/gpu/drm/i915/i915_gem.c:44:
> > include/linux/suspend.h:331:12: note: previous declaration of 'pm_suspend' was here
> >   331 | extern int pm_suspend(suspend_state_t state);
> >       |            ^~~~~~~~~~
> >
> > Caused by commit
> >
> >   5a7b95fb993e ("i2c: core: support bus regulator controlling in adapter")
> >
> > interacting with commit
> >
> >   3f51b7e1f36a ("drm/i915/selftests: Add a simple exerciser for suspend/hibernate")
> >
> > from Linus' tree (v4.20-rc1)
>
> Thank you very much for taking care of this!
>

Hi, this issue is fixed in
https://cgit.freedesktop.org/drm-intel/commit/?h=drm-intel-gt-next&id=5b11705608898c31a1cae5340555ee60d5a4fa45

And I think the pull request is in
https://lists.freedesktop.org/archives/intel-gfx/2021-May/267588.html

Thanks

>
> > I have added the following merge fix patch:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 1 Jun 2021 10:25:49 +1000
> > Subject: [PATCH] drm/i915/selftests: Avoid name clash with pm_ global functions
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Looks like the proper solution to me. I think this should be added to
> the i915 tree. D'accord everyone?
>
> Reviewed-by: Wolfram Sang <wsa@kernel.org>
>
> Kind regards,
>
>    Wolfram
>
