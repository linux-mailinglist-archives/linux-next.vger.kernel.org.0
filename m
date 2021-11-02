Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D60442EE3
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 14:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhKBNOp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 09:14:45 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54441 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhKBNOo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 09:14:44 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mbj7g-1mCgQr1MkQ-00dFfG; Tue, 02 Nov 2021 14:12:07 +0100
Received: by mail-wm1-f54.google.com with SMTP id b184-20020a1c1bc1000000b0033140bf8dd5so2040402wmb.5;
        Tue, 02 Nov 2021 06:12:07 -0700 (PDT)
X-Gm-Message-State: AOAM533HsBf5Gf9KRJESvzVw9BRYFj72E8D7JPNPfSJiLcKZSYFITutZ
        nxqhe2lnjcq4Z0lq7vVmjHTea+crOv7usbs8hqU=
X-Google-Smtp-Source: ABdhPJxOsaTw5vAetQEOxBosHISPNr1ZsPmnJGi6QG09ny8cY32Sh2+o5ShDcq7ct2r48DahMHC96w/OLFyup0rXrKE=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr6969502wmb.1.1635858726974;
 Tue, 02 Nov 2021 06:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211028212651.57beb05b@canb.auug.org.au> <20211028233844.292e1319@canb.auug.org.au>
 <20211102174400.1aaee22c@canb.auug.org.au> <CAK8P3a3Fx0UmbxP48RnXHcJYf_tU3_NTkMZrFnM42eAb_F4jRQ@mail.gmail.com>
 <20211102231307.6ba98df2@canb.auug.org.au> <20211102231937.2fe27ba6@canb.auug.org.au>
In-Reply-To: <20211102231937.2fe27ba6@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 2 Nov 2021 14:11:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a39gZLWdh03_mL51qj6w+LYSPQ+T+d0t4wn8zgeSPhtqg@mail.gmail.com>
Message-ID: <CAK8P3a39gZLWdh03_mL51qj6w+LYSPQ+T+d0t4wn8zgeSPhtqg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of almost all the trees
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zbmDJHObcocYNg/2oTojVeQfrwcNX0r8lJw1zudsAIQr3dMe+QC
 4lkr1gFOjcrt/gNHuEKRz9jpuiVXmLUZ1Hx7xwAsLP69AqHdEz3L7rSinlOOt9ORZcgz/iq
 rT9Gz7pdU1fiWr9ZNg9meVkdgk8+xEeZHfDaHmsDaGB+20RCnE0b/oA+/pPa0ukW9crA+Dj
 BwLzm4k0ttqiJJIxM/ibw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4abEI/MMx5Y=:dCxK4aOCOj+WgUoJY3HB8u
 5YQxRvJ0ILm+yeJUk4SYQOgx8Bp+lnV2WS8TeJ9GkWauWRud0knTrlvviCEHfmFxHCIeTBdrn
 niblxQMCfX9eBBdfD0IiD12be4uChomtUZXM3SJP8ZUWUZuoyX/jnZeAPuICTocIWeEjzQurk
 T6Gr8eVGpHvmD1Pbm5vy7m0sMphHBqlV4ElzJM/2JVf10gqNN21G6OQAeUQuB4YI9oKG00upO
 3T0Rj5bOTLQUcbkP15+rKXjG1zO/wlfZK6YQ5rA3DJMa2j/yADcrMRgIi/p5NdQoEp0qTwoOL
 wKeYeons1Nwr6Z+B1oYkxiXlHIZnKDqLnucMu4RI4UB7CvqoIMRKpiCYmPwpp2IWRP2dGDC0q
 5u1XX0edoPFrgcPOfjvrOgqO+F3lg6uTMb6mmCXjSenI80skvRRn8CLM9K7mbZsw1NCnydCgO
 KCVJIs8Wji60YYw2wcLlpeUnjGENNz7yWxbaK19j1/qUceuEWo8SQX4y6M5ws5h0oHNFJ/Jx8
 2Zddq8pmwBIRuZHwKCFGdspgWKmdS59QUoGTqkFxdhK0PzdC1mDbv7Dd7jHN9TzN6J3Ver4K/
 s1EJKLrGmVP++DAhs7UPSV9S7qheuBhIpJDQrnS76uV8wC3pCxe+nIVpEliJSqGii8caQ/V5n
 fSA7dQNsKeXxjmGRWY/mCqOElTOxMPEXSyDnLlAFcCpBhnVtU0W+KroFSYlEmcwCPV7umPRAw
 afI485G/eCz/siF3fG+8t48XX9Er/ayG4P6jCDH6G/O4Z/53EPbdawyLZmxYe7kcVHxsQqzsP
 hsqo9G2OdhRvuoH/23jKb8VP8Vg5updT6I4VnbUv4LWZqjr7c0=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 2, 2021 at 1:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Tue, 2 Nov 2021 23:13:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > On Tue, 2 Nov 2021 08:06:10 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Nov 2, 2021 at 7:44 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > It does need to be changed a bit as I realized it depends on a rework of
> > > the Kconfig logic that I had in my randconfig build tree to have a common
> > > page size symbol across architectures. Without my other patch, it also
> > > needs to check for PPC_64K_PAGES.
> > >
> > > Should I send an updated version of the patch?
> >
> > That would be good, thanks.
> >
> > Even better would be to split up the function some how, but having had
> > a bit of a look at it, that may be a much longer job.

Yes, that was my initial conclusion when I looked at the code trying to
redo that loop.

> > I am assuming
> > that allocations (or their failure) are out of the question in that
> > particular function.
>
> Looking again, we probably just need to disable CONFIG_NTFS_RW ...

Ah right, that would work as well. Another possibility would be
to change NTFS_BLOCK_SIZE to 4096, at least in the affected configurations.

According to the documentation I linked to in my commit, file system images
with smaller block sizes should be extremely rare, but I have no idea if the
code would work correctly for normal images after that change.

        Arnd
