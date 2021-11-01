Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7715B441B8E
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 14:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhKANR2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 09:17:28 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:39195 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhKANR2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 09:17:28 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MwQKr-1mxYb23BRd-00sJks; Mon, 01 Nov 2021 14:14:53 +0100
Received: by mail-wr1-f48.google.com with SMTP id d27so10135796wrb.6;
        Mon, 01 Nov 2021 06:14:53 -0700 (PDT)
X-Gm-Message-State: AOAM533s8k7ZqV0t+c2ST+ZwfGd4vykT5FZqfEjWvl+SZb62E2kiYBzx
        qvSLaU3BCrtjRUFF5hvDJ1I9q2afBek67fLqJ54=
X-Google-Smtp-Source: ABdhPJzpWFbBs5LReHmsOSHL59O2Hg/a7/rcTD5GBdw1L11HPapnNtLhdT5ZhBcP7gH509L4NF9tl/a3TPa1TKlMZa0=
X-Received: by 2002:a05:6000:10cb:: with SMTP id b11mr25906015wrx.71.1635772493438;
 Mon, 01 Nov 2021 06:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYso1sBLRAMpc0bdPiim8GvMhmwuRDaEZ0xbP1TZz864ZA@mail.gmail.com>
In-Reply-To: <CA+G9fYso1sBLRAMpc0bdPiim8GvMhmwuRDaEZ0xbP1TZz864ZA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 1 Nov 2021 14:14:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1mP_ZvigBj5+pRSSf-OsvX70BSJByGfqcDjE5pXLD9Yw@mail.gmail.com>
Message-ID: <CAK8P3a1mP_ZvigBj5+pRSSf-OsvX70BSJByGfqcDjE5pXLD9Yw@mail.gmail.com>
Subject: Re: [next] Error: selected processor does not support `isb ' in ARM mode
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Juerg Haefliger <juergh@canonical.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VI/Q0NhC8heL2WTD69kFySv3l1/sxFQZr5ZTYegOabDg4O7T3Hd
 V52c/JVaecaEoL3z0XJWRWtqo4dH86T7My3buMCxMzmO9CJk3bXg9n+j1/UEAKiJ2PAU2yi
 LWyyLXLrGiFQQASw1fR3hRavsUaY6IQGxbVaodqKSAWipTjR/13wJG+k50QV17Xr+4FkQQA
 knkwjVTStWV1ZpQ7URfGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QpzV7X+lIzg=:xe9wWKIzs+cV6kKrhoVKUd
 bA3v5YA8Ifz1qmKnb0cMJrjG04q64cKWbbnbcIfv2EjT9LPqiuVCNMYXTYXPcbx2V302D5jYj
 Zz5UKGFc++nhhE8fmHhD/w89XwNF1hoO4SNMAeKbKYZv92CuCeVXE93OYRvrwpzwyg/pusmZ/
 NeEUgHNJhHSvRgu6ebIq6PNjOvA0ErqnzL6rfPz8h8ONVfZGzEdpLSeJeHV+dg/2/JZtBGHji
 uPY7i89O0oqyAzT5ZpYgUWmEK7GFxjbbEqJk8h895f5S3ERKuqVNxhcPIw62UFSLcHlpiTXub
 2+fqSJpnpjUGiE8FW+fHlbs8/MpyXMUCeoP+AOu1mzE7YoHwf/dxktGxhD2soMGZ72ysN8aZR
 J0RRMHIC/1Um6ZVvyFFq1zCbl3G5fG/Zl0qGGr6qFrbZTdWob2l4i5zZMHWKJ8Qz8QMyL1a3W
 Tlrm0Gm/x3vcZYXNsUET3pBHzejyt6i3oFVKrNaKSOScpvhNWbVhrLzkmvjAwsZ1Lan7NVvui
 1wIlalaMkydpQ84gHRQDVAjg3an9CzXC4S+k4Z8F3uAjeXIS0hf6e27uLvg6xt5uyLwRwM7MD
 adfKFo8+ydfo0YqIhirtsiurhAGzIPFyXOWneHVpIdY9n4o9RX/L+H88lnCh34mnGufPyFbRq
 jvfT7GQ8jfKSt/S7pkd/Uv6Zz6szdFvtZUqQcE1J8cwnJtWJ0KvEN488heh/7iWlkzI4=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 1, 2021 at 2:00 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> [Please ignore this email report if it is already reported]
>
> Regression found on arm gcc-11 built with following config
> Following build warnings / errors reported on linux next-20211101.
>
> metadata:
>     git_describe: next-20211101
>     git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>     git_short_log: 9febf1194306 (\"Add linux-next specific files for 20211101\")
>     target_arch: arm
>     toolchain: gcc-11

Is this a Debian gcc? If so, this one should fix it, I need to send
that to Russell's
patch tracker:

https://lore.kernel.org/linux-arm-kernel/20211018140735.3714254-1-arnd@kernel.org/

      Arnd
