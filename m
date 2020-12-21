Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0FA2DF9BB
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 09:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgLUIIA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Dec 2020 03:08:00 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:33192 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgLUIH7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2020 03:07:59 -0500
Received: by mail-ot1-f46.google.com with SMTP id b24so8163502otj.0;
        Mon, 21 Dec 2020 00:07:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QI8P9CKl3LPKq2RL19LINv5ciOLxW3eYGg5f3b48Bj4=;
        b=awpEWc6hdzspnQtKi4aSYEcTJppfwk2fPgdI+Uo9TjJefW6OhpAm+2gzSLiTrgVCKC
         z5VX7VBKgR76PwfWqmHMVsUdrHwT6H+3mnbF6MG1NtegrxOb21K1A45mNNL4wfFsOM36
         3KOnPZVfObppOWgxiGTV00HX5xSNLPNcMRLLlmJuUDwRwsWD2xIfpNZ7Rz1wEX9kt+iV
         QHu7IzlMQx3MiWQRi8RwOsfpOF6f89RwIKQnSl6vlhBNEA/HVPuT9wgSjClG6PxetfJN
         Kc9lR1jkO/2SYCMITjDWE6LQtUOMxAGQitYDZZaPkJcO+XJrBnC8DLyfvYgKG6BuncXh
         fn9A==
X-Gm-Message-State: AOAM533vREQo5ywpn/NVjPv4WGmJlKkAOWuQgs7O8dT9nhM4VcDJlrQC
        W/kKBxwFx/X/nvJtchm9aFHfwN2JZqy9WEoxz+ietbrs
X-Google-Smtp-Source: ABdhPJwfdrszaIJsvhS0Dwc0w5EkeZgO1qQYgqfN7DuxCsP83bhqkdclHthN8zimUW4GLClUdsviIxUo6ins4/S8ZQs=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr11197687ota.107.1608538039234;
 Mon, 21 Dec 2020 00:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20201208090555.7159b138@canb.auug.org.au> <CAMuHMdVYoxUOUL0zNAPzTJUSR3vGzcJWMzvtCKK=ZxyM=8hk+A@mail.gmail.com>
 <160753498332.1580929.15118515893187584689@swboyd.mtv.corp.google.com>
 <CAMuHMdWAtUK6qDOAXZ3-qy69ZzbfZb_Z=bSvx-0S-42dfUiw9w@mail.gmail.com> <20201221083518.5ef7357c@canb.auug.org.au>
In-Reply-To: <20201221083518.5ef7357c@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Dec 2020 09:07:07 +0100
Message-ID: <CAMuHMdXbeFfGAkbVqA-EY4_2P7UDdh8Civb+M_nAjL4YNmQ17w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Sun, Dec 20, 2020 at 10:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Thu, 10 Dec 2020 08:52:41 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > trees can be pulled into linux-next? That would find this earlier.
> >
> > That sounds like a great idea, also for pinctrl.
> > Can you please add the following:
> >     git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> > renesas-clk
> >     git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> > renesas-pinctrl
> > ?
>
> Added from today.  Called clk-renesas and pinctrl-renesas respectively.

Thank you, the result looks good.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
