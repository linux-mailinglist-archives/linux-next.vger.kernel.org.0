Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD1DD114EDE
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2019 11:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfLFKQB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Dec 2019 05:16:01 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35090 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbfLFKQB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Dec 2019 05:16:01 -0500
Received: by mail-ot1-f68.google.com with SMTP id o9so5374218ote.2;
        Fri, 06 Dec 2019 02:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2PBH/BhuqKwn/tjlVcw6ytYmE1z+/Fbb+PDjpB+mCNI=;
        b=tH1RWrnYqcMf+bs+rmz5rwUGIXOD8+ZT1Ei52PI1dYKOJLMWDZbtqYmuXRTu6Peunc
         7hjUu909uXq/fQAo1faItJUMAvlCTzGXW7tdLUCA4uaEgroot81+z4ySfDKUeOCX72ae
         qSzIUNrfSnLKDOM6PshKAnZuyke/KVoUrZJdReSFQOMz8Mw0WnHb531s+QZmChZKNcQl
         YGZDg8Zj5WkGhSbqP4e5fZ7IJlWfQODqkTdrWmZtHonoQsFkoz/3+i6d4uqia4LgsjbM
         +xU2UQ8Yiu1vm54dUunoSPp5FQ71q2ua3QXbFAW+mmkn/7JCSgPY/viKnmIm8N4Yp8D+
         xQCQ==
X-Gm-Message-State: APjAAAU/ftVv4DPXw0dyThlM0qOFkAJuMbgxfVtELiS0jCblmsOA/6bR
        jyRdLAZ1GtD0ENgMII5O1ZW7MkJLei4YlH/WBvLZ5gDt
X-Google-Smtp-Source: APXvYqzHwmaqIjqtaEHazzlu43UL+2o+F7fc+uZinO82BCqywDsB3yLP6XHGJX0iGFA87S7LH6Rn2aYyWfwi4eD+LQ8=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr5379859otm.297.1575627360277;
 Fri, 06 Dec 2019 02:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20191206135406.563336e7@canb.auug.org.au>
In-Reply-To: <20191206135406.563336e7@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Dec 2019 11:15:49 +0100
Message-ID: <CAMuHMdVHXYhXtyMAR84L5kQTSU8Ds71AJftrEBqepiy_NV88kA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 6
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Fri, Dec 6, 2019 at 3:55 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Changes since 20191204:

Hm, yesterday there was a next-20191205.

>
> The printk tree gained a semantic conflict against Linus' tree.
>
> The vhost tree still had its build failures so I used the version from
> next-20191203.
>
> Non-merge commits (relative to Linus' tree): 1311
>  1429 files changed, 36236 insertions(+), 14987 deletions(-)
>
> ----------------------------------------------------------------------------
>
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

Thanks!

Looks like the next-20191206 tag didn't make it to kernel.org, but the
master branch was updated (so I'm happy :-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
