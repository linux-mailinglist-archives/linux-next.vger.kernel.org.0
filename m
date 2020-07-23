Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE6122B094
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 15:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbgGWNez (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 09:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgGWNey (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2020 09:34:54 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C06C0619DC;
        Thu, 23 Jul 2020 06:34:53 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id j18so4978167wmi.3;
        Thu, 23 Jul 2020 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zZ5AbTmRi6SKRjj5jh6jgspAZ8rlBVrCJiQnAL/REKc=;
        b=d8jN0+bLE7DW9ROZe/xGQcyl45MyiLs5bAqePU0cxQUpbV5sUx2Exr4doXTWBj9NRF
         dZCrzZeLTWa/xhrb+UlwSMK5QAZiZBuWhAFH24H9nMac+YuXHlbsamRL5vsjx4Q4yaM8
         ZNGkXapNAu/PAiOCK1mxAlX2uuXKK3QD1MrB5vUWdHB8KG2Qg6g9aaA0yD+kpwa3WrkI
         eqYJZR8/oep/KXvVumH+Uufjky+VnIoVjiJRKflGkhbtva/JryX6rhvx5zaNpzkzWqzp
         YiN0inWSvVsG2nHAD1DEbylUI5hzHq+0H/ekg7sKQ4xE9wBqMiegGgHpL8M5tFhTT/9y
         H8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zZ5AbTmRi6SKRjj5jh6jgspAZ8rlBVrCJiQnAL/REKc=;
        b=kk1mO2TgiiarqSjbQjN4Jw+y+uhTVq6cMjdOmg7UDnTacsPgQN5XCqe0ndzpvysvVk
         0nz6lHxzKei5y6SVBZy1YlQCrlD1WOSgPtu4ndKKk040ZlpQPQRhOzHp1zgJPtdoJmuH
         V2fsmjbpR/Ycok/6EaY7LPRwfttdbGPT4GWCoYV0krIVgPMfriJIytGg8M0IGL3mutXE
         2thXIXMi5nWE+449YAh9IrFnkMYmX72Imowd7sV9PtFCJhZaj5LZ7Hd91pkT497POlCT
         dhcyztD2WBcldg1hp7RM4joy82Aub0sxzkB2kfpb2EOAbSqN2uZqwytB6T2NMOLnXCnd
         sHMQ==
X-Gm-Message-State: AOAM530wz0OZVF5gfzyt/ung0YCa40YocXslqpTCcxwa9PHqU/6eiC59
        k7hFnkn+m7LSi427p7H8AnPJ54Tro6xLhTb0ihua9m6r
X-Google-Smtp-Source: ABdhPJxSQ5Rc5LXMXXqQgZOhc78GrmT88M9AV/Oyw196T+QQbWFOWsH3ZrYwCKGRHKbR9w2pZwrVj1aRey4/YgZ/fqo=
X-Received: by 2002:a1c:2:: with SMTP id 2mr4266406wma.79.1595511291877; Thu,
 23 Jul 2020 06:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200722143417.42b52c73@canb.auug.org.au> <CAKMK7uGZ4qdtkD6r_RzRUiEXrumkdAwENuKfKmfsuscQZtkWqA@mail.gmail.com>
In-Reply-To: <CAKMK7uGZ4qdtkD6r_RzRUiEXrumkdAwENuKfKmfsuscQZtkWqA@mail.gmail.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 23 Jul 2020 09:34:40 -0400
Message-ID: <CADnq5_PFfVONDAQLYLpkOzL5yxdA-0zisN7xdEt6pJmP6ZfQaA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 23, 2020 at 4:01 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jul 22, 2020 at 6:34 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > [I can't find a previous email about this, sorry ...]
> >
> > There is a semantic conflict between Linus' tree and the amdgpu tree
> > between commit
> >
> >   d7a6634a4cfb ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
> >
> > from Linus' tree and commts
> >
> >   fe098a5d6443 ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
> >   836dab851903 ("drm/amdgpu/atomfirmware: update vram info handling for renoir")
> >
> > The automted git merge leaves two "case 12" labels.  I have been
> > reverting commit d7a6634a4cfb since July 3 ... This will need to be
> > fixed up when the amdgpu tree is next merged into the drm tree, or a back
> > merge of d7a6634a4cfb could be done into the amdgpu tree and the older
> > "case 12" label removed in that merge.
>
> Yeah this is a bit nasty, I just crashed over it too (btw moved to
> drm-next now). Alex is this the right conflict resolution for -next? I
> think we should bake this in with a backmerge ...

Yes, you can drop either d7a6634a4cfb or fe098a5d6443.  I just
cherry-picked the commit from -next back to 5.8 and stable since it
was a bug fix.

Alex

> -Daniel
>
> >
> > --
> > Cheers,
> > Stephen Rothwell
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
