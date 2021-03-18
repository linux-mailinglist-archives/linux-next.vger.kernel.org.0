Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F21534108C
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 23:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbhCRW40 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 18:56:26 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45143 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbhCRW4I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 18:56:08 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N17l4-1lotDg0UlG-012ZqQ; Thu, 18 Mar 2021 23:56:06 +0100
Received: by mail-oi1-f173.google.com with SMTP id n140so2742027oig.9;
        Thu, 18 Mar 2021 15:56:05 -0700 (PDT)
X-Gm-Message-State: AOAM533efNNV5cf8edVY5uOMMr885pkbswE9vvU2Pq3SDQQnwmvLrQfG
        y2Lej9DK1PpuqO+vBwBAlXrl40TpCT6YbKuJaxU=
X-Google-Smtp-Source: ABdhPJzF+BOjv5UApfsqhmVhd0NbItbf2o91DJI9ybHCy3fIIrAnZLbN8+p0+u6MltDrASl16jwBg8tCH+5O81fvSlg=
X-Received: by 2002:a05:6808:3d9:: with SMTP id o25mr4812049oie.4.1616108164854;
 Thu, 18 Mar 2021 15:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210308185741.56900784@canb.auug.org.au> <20210316084342.13b804f3@canb.auug.org.au>
In-Reply-To: <20210316084342.13b804f3@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 18 Mar 2021 23:55:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a31py=31dMgb+XKOwJo70v6Cab1yUJAB5zaF-0_ReP4sw@mail.gmail.com>
Message-ID: <CAK8P3a31py=31dMgb+XKOwJo70v6Cab1yUJAB5zaF-0_ReP4sw@mail.gmail.com>
Subject: Re: linux-next: error fetching the arm-soc-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VNKPocAmQmiVayj+NcUtQcLC1/k+0+WBmw/m6OyWT+KGmeAMtN5
 TWc9YUzblY5vCFvgc2l57NElPscM3sLyCCEgdM3FGO6mWWPvNki8Um2ZTUqr5IU8UMx5L7s
 8QFwcrhgPuZwgfssNfXGB214NsMOIt/tXWGkMjWfdiSS66ZhL8YqYbOY1PVUWKTQ/4ERQvk
 0AllGY4QjbovJjO/ZCkeQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y7dEi7I/Wzg=:NK+DXl17R/n01B5jX5lDJs
 vRvrCcIc2StbuywHxBVEZ5sMbx1sV1+41GDU+8uJ3vlove72nyfTTiDizGTArNXFEc4IGcprp
 z88G4YuzkNAwm4BO6sxfxKPod0WryHqABG4A+NgjuNugA7TqEjQfgIIJgK8oavk1FCUPxG0U0
 lGhGYwDdUtljHEau3JuDm/XRPcEOYuSxYwQxk3Sc0TqRT53ngdWJkca4kAxvyqQAxtN/4/Y6b
 uihh9AaKzREXQnw/s0Tf3lJdCBile+V30K5tU9+Zq6krIffKD7Aykz/ZL1aR8GhX9TD6HavNs
 maSPT6F126+Ax2t2oZfYvj8ZVLh/PgprS64g0JG8Z9byaOuAkY5V0H4Nf6d0PTq5IuoiMGFpd
 mS3cOg01utbjBx49XPUcBkJeIe1rhgUzxyNo2E8vDp7XcicmWbCM+8vU8RjPvW5RhrYlqvYjd
 GFGcMdkQ4ZsVaJAEtvysQp7tpxbhCewJTitSCzWKb+WshcZ4PuvewGmArXjAtyRoV19yc7NlD
 qYwDSplyK0Rsn1xbB4sey+n/QtMgYlFknszfkSXSPCzyXefQyM72q9ovVtomxClsg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 15, 2021 at 10:43 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 8 Mar 2021 18:57:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Fetching the arm-soc-fixes tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#arm/fixes)
> > produces this error:
> >
> > fatal: couldn't find remote ref refs/heads/arm/fixes
>
> Ping?

Sorry for the delay. I had cleaned out the old branches while updating to -rc2
and forgot to upload the new fixes. I just pushed the branch with the latest
fixes.

        Arnd
