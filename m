Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9EB2572D8
	for <lists+linux-next@lfdr.de>; Mon, 31 Aug 2020 06:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbgHaEaz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Aug 2020 00:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgHaEax (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2020 00:30:53 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04C1C061573;
        Sun, 30 Aug 2020 21:30:53 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id 189so3284955ybw.3;
        Sun, 30 Aug 2020 21:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3EHX4IFDP9HkXUW+b+ZNzN+U/N5NbUIOOxj43RJQFP8=;
        b=sFgwc5cHHE9FxursU6WRqYcmits9x/HyhItAsmn2E1mo5JX2JKbQ4kWAoVvXqJgHvX
         CEr0Pums8JT3qlyKoAgYpS3yK+ibCQGxWNVbQZgisAMuZdXm9u/InCEZgPYhZMLGZydH
         yd42w67EH6hWqQosjvmCFftCCPPp/at/gd3UhDMhUZJGFRT/JnHsiWGwocA66GWahivh
         pb+Myve0noIccwNerGhDQD/cIEcMlIqPzyLeXsKabrkChvK3nT3re1P10cmNy0cj5lsL
         mGaUjNxaOWScrpJXKjjr3m/W3J9uBUiBJRQe0HNBj0stSxKDZKyPYe+RqER4Imlt+dU7
         iKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EHX4IFDP9HkXUW+b+ZNzN+U/N5NbUIOOxj43RJQFP8=;
        b=sa7OhCbVc7nysSYD8o0v82TShUJyM92sePNQ4qayjapOrcAMPuQ5Qe3Os/kjxXY+Gn
         DMyg7+2TXaUEKJhKGtj+OrxDwwJa3dCqkdioOFJTo3nx1mnbBQWhECHfvUvU0bYFLOs4
         4bSB8MUJyXy2FwvIzHfg4J5TlSCBLxadoZ7ZMujgFrM1IMgcPELRHZrE75+lA6pOUJl0
         BbMMTO7Sx/HoOnboAs7KYWj1x0nPnv+9HikxKI54oURGAvefI8n+SNr61sslNLainobl
         oXwRobd8fl765tn3LkH78Byqd9Nh0jhffh6u2HFQBNp2d2Do0Wb7RNOgH0qQkcGJQUdY
         6w+w==
X-Gm-Message-State: AOAM5309KbqDnq3PlKADiUQ6Y0NSPESWWscmOuUYeL0WB/JpfBXn8Bqj
        7bqZMCKRnF0BNkim3b9vpWXoDxItzqqgUfuIkpQ=
X-Google-Smtp-Source: ABdhPJygqDhnYzGy1ODmzpjWOWvVU0KHozgD8foEW/pFKDAAJ/I2ilsDU+17Efoxy6pCnydvcuH5XqRX2oBauPkkZ+s=
X-Received: by 2002:a25:3803:: with SMTP id f3mr16938941yba.470.1598848253030;
 Sun, 30 Aug 2020 21:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
In-Reply-To: <CAJ1xhMUpqtKMuGUZdComskTqd0oOKCfDuVQT3+c13u=NSJLkBw@mail.gmail.com>
From:   Ben Skeggs <skeggsb@gmail.com>
Date:   Mon, 31 Aug 2020 14:30:42 +1000
Message-ID: <CACAvsv6zUi=3mZTg11Y_6CVYkpCSO0RY-5+GiBZz+2EXCDmD-g@mail.gmail.com>
Subject: Re: nouveau PUSHBUFFER_ERR on 5.9.0-rc2-next-20200824
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        ML nouveau <nouveau@lists.freedesktop.org>,
        Linux-Next <linux-next@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 25 Aug 2020 at 17:21, Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
>
> Since upgrading to linux-next based on 5.9.0-rc1 and 5.9.0-rc2 I have
> had my mouse pointer disappear soon after logging in, and I have
> observed the system freezing temporarily when clicking on objects and
> when typing text.
> I have also found records of push buffer errors in dmesg output:
> [ 6625.450394] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02
> [] chid 0 mthd 0000 data 00000400
Hey,

Yeah, I'm aware of this.  Lyude and I have both seen it, but it's been
very painful to track down to what's actually causing it so far.  It
likely is the commit you mentioned that's at fault, and I'm still
working to find a proper solution before I revert it.

Ben.

>
> I tried setting CONFIG_NOUVEAU_DEBUG=5 (tracing) to try and collect
> further debug info, but nothing caught the eye.
>
> The error message in question comes from nv50_disp_intr_error in
> drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:613,645.
> And nv50_disp_intr_error is called from nv50_disp_intr in the
> following while block:
> drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c:647,658
> void
> nv50_disp_intr(struct nv50_disp *disp)
> {
>         struct nvkm_device *device = disp->base.engine.subdev.device;
>         u32 intr0 = nvkm_rd32(device, 0x610020);
>         u32 intr1 = nvkm_rd32(device, 0x610024);
>
>         while (intr0 & 0x001f0000) {
>                 u32 chid = __ffs(intr0 & 0x001f0000) - 16;
>                 nv50_disp_intr_error(disp, chid);
>                 intr0 &= ~(0x00010000 << chid);
>         }
> ...
> }
>
> Could this be in any way related to this series of commits?
> commit 0a96099691c8cd1ac0744ef30b6846869dc2b566
> Author: Ben Skeggs <bskeggs@redhat.com>
> Date:   Tue Jul 21 11:34:07 2020 +1000
>
>     drm/nouveau/kms/nv50-: implement proper push buffer control logic
>
>     We had a, what was supposed to be temporary, hack in the KMS code where we'd
>     completely drain an EVO/NVD channel's push buffer when wrapping to the start
>     again, instead of treating it as a ring buffer.
>
>     Let's fix that, finally.
>
>     Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
>
> Here are my GPU details:
> 01:00.0 VGA compatible controller: NVIDIA Corporation GT216 [GeForce
> 210] (rev a1)
>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device 8a93
>         Kernel driver in use: nouveau
>
> The last linux-next kernel I built where the problem reported does not
> manifest itself is 5.8.0-rc6-next-20200720.
>
> I would appreciate being given any pointers on how to further debug this.
> Or is git bisect the only way to proceed with this?
>
> Thanks.
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
