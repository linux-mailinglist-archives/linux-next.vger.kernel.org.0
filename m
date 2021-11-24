Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D63445C729
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 15:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346954AbhKXOZe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 24 Nov 2021 09:25:34 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:55061 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346564AbhKXOYl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 09:24:41 -0500
Received: from mail-wm1-f45.google.com ([209.85.128.45]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MEFnR-1mxu1d0rYL-00AIDS; Wed, 24 Nov 2021 15:21:28 +0100
Received: by mail-wm1-f45.google.com with SMTP id 137so2555739wma.1;
        Wed, 24 Nov 2021 06:21:28 -0800 (PST)
X-Gm-Message-State: AOAM532HPUYI+Y9LXerhEb8ly3RReBUGfZOBiA36bhTX8hrqZ+oI25ui
        gi1cn5UmAgupZvLshRoLR2IawF1JmtxKeMPKyUY=
X-Google-Smtp-Source: ABdhPJwfARw5AU5sor77+MXjzxSnoyBb9wgq+wSCMXvtLeO5ULwcoEFbNRkWfs0ykSeaGotWVkfw4rYUdsGIIWXBoOI=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr15627412wmb.82.1637763687770;
 Wed, 24 Nov 2021 06:21:27 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <41206fc7-f8ce-98aa-3718-ba3e1431e320@landley.net> <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <4dd8a108-013f-8d68-b5d5-138d3cf3bff0@collabora.com>
In-Reply-To: <4dd8a108-013f-8d68-b5d5-138d3cf3bff0@collabora.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 24 Nov 2021 15:21:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2FHrrcDZfynjG7BdJVd2wxrWMOMO7dO4wjb1h8_jkRtQ@mail.gmail.com>
Message-ID: <CAK8P3a2FHrrcDZfynjG7BdJVd2wxrWMOMO7dO4wjb1h8_jkRtQ@mail.gmail.com>
Subject: Re: spinlock.c:306:9: error: implicit declaration of function '__raw_write_lock_nested'
To:     =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Landley <rob@landley.net>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:apu1n+cG21Acftl9W7C1wczoo01v5na1HtOsEQ90Zmb+wTNObbI
 hg4nnJIE5hz2d0ZG0OidJA6YhazP8RHnG8jh4T0n3UspE0I4B/aEr2N6DYI+ndWj8WVPtT4
 c8T9XZP5P2zW3C7G9La0YbHCc3N85R3q5aJ4fxjuzdsOEr7ZgNiQ4an3l2uWLqc4TnvuQhp
 1unTwdPIFARPGXMUkS7gw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HqizVAJPfQs=:NoRaSDD/hfk+YfS4PLaYFg
 9DEhZw3y4UbAtwXHjil1KtcsV8krGQfztDDIOGuPyLZ1W4qAJCs9LcTa0GOFydAuPTyUNwKZy
 PDHLBW9gqlgey0iaNCMCNavBMlf3qNQsZaS4HL4dheBqrL9jDeYyuWRQEjILf2syfCBFEyVtj
 TG9BWugBYcztCRcTqeqOWR9s9SBWXEHHIKYzRDukHyJeU9Krp8Iv8HKLl4Wf7XT0eMJTL4lQC
 KD6xDNA9P5Xq6vfz17I9SsgLtOAjOGeBVNDGuSAtR3ltw1+i+MPw2YLfvkI3i9QWMrbdJLR7i
 V6veXy1QqH0n4Lo95/Vub2cwsN01cXpC7Vd+8Vqi9BI9IeyIJu+3a2+vlHxFx2vKHY9yE/DXD
 Uh0pAo8YoNO6zAxg6c+SKlCJR6rRhkjJtfbGpfKlgXSfZSUBKIVS6o59q6V9Oi2zlt/wB3us1
 ekgZ7ppm03EHkKMiihs9whikHDLzD5K6KYqJcIgiqQYyL9MJM0z+n75791CFoJsx9DMuJJSoL
 wB91cWi5ma9xzt2uSTZxu8RalXLKDjeCQoVxP2eutv6fBzwY28yyAxIJQTa4vqwpghJHLzxog
 3DzLibSF+YFq0rXvRbI0cGz6ZT7YF6w8yWvZ6RyYbAkTdCD4ys5GF7ezHH/W7MrMlvcjyGzT8
 Ike8Q/N0glOwTcolksHWMGlPBooXbVEDMEtB5a4z/dniO+1z0cKI03DuDea05F+YKArA=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 24, 2021 at 2:15 PM André Almeida <andrealmeid@collabora.com> wrote:
> Às 04:49 de 24/11/21, Arnd Bergmann escreveu:
> > On Wed, Nov 24, 2021 at 8:31 AM Rob Landley <rob@landley.net> wrote:
> >> On 11/23/21 5:38 AM, Naresh Kamboju wrote:
> >> @@ -451,3 +451,4 @@
> >>  446    common  landlock_restrict_self          sys_landlock_restrict_self
> >>  # 447 reserved for memfd_secret
> >>  448    common  process_mrelease                sys_process_mrelease
> >> +449    common  futex_waitv                     sys_futex_waitv
> >
> > I don't know what's going on with this one, I don't actually see
> > a reason why it isn't already wired up on all architectures. If we add
> > this, it should probably be done for all architectures at once as a
> > bugfix, but it's possible that this is intentionally only used on
> > x86 and arm.
> >
> > André, can you comment on this?
> >
> I've added entries for the archs that I've actually tested, but there
> should not be any arch-specific problems in futex_waitv. I'll submit a
> patch to wire it up for the remaining architectures.

Ok, thank you.

       Arnd
