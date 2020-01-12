Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC2813881A
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2020 21:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733277AbgALUAK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 15:00:10 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:34389 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733272AbgALUAK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jan 2020 15:00:10 -0500
Received: by mail-io1-f67.google.com with SMTP id z193so7371620iof.1
        for <linux-next@vger.kernel.org>; Sun, 12 Jan 2020 12:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4mB/pHZUD7pjqdY45Y5CDvGVoduZ0ZQ2r5DCq1x4iog=;
        b=UPPSeWIa8hQFLkbNLWRaxUgSYb7TwmCHtvRkLp1TpTRt4i0ahGu0JrwZmLsSVBtxef
         fOvWys6QfXgKHL5I6BAgz+e/whyHzQjbg5WP8MI2J7qEjPtaYm40v/8CsdeIbs/F3CNF
         zK1T3MvNTJ2UPXusLsfkZ3t4FlycfJoxPvPS6jErw5AFU7u1dy62EgZJllR4weH/vj/R
         eoI1j+iqmk4ttbJ1xX9uvw/SyCaZ2Fcn52DUxkynHOwRMpo3HVnzt6QdJ0a5pgWphPln
         pFkXqHo1ud5kQrIU1zlHrq4w86zzD6u2vo2/HEjtTEF5PVcJqJVKqRhGiZc8wAhojoTW
         183Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4mB/pHZUD7pjqdY45Y5CDvGVoduZ0ZQ2r5DCq1x4iog=;
        b=lwxTsVMby/DmkJR1zkPkjdwM7ii3yB5OmTLIqlouyvtXIl6GgVFzZlomOnXuFs3xko
         ggDOsOJNODQ8oKKNnYeJhvGVILZbpY5kmzHSZ5ynRcMMPYgLwQt8H9p4s3K8oSw61gpj
         XAeVqJIVGYw4GXU70C54iriBSHvb8EXuOnGhf3heyNVG2e2B6+AaMRCiz/byvJQNjUXZ
         Cu2UzU24P7IefI1UPENH5AUGu7DA7EYY9AFG8y9juxrYFErF6iY+sYrKLy4Sz6wqEDuB
         3Fb/b3De8uDvZuh/PWSPESSzXURjJlio/2NE/qeO+QsGuKwocr/GNqI5dpaVxZ3BQqcZ
         tOSQ==
X-Gm-Message-State: APjAAAWm5NGS48xPrLCIVXg5yXDllriQOsvt1Npb3IJJ6a4eGgILY3px
        mqh4bPp3EjzXLoLzAu7d1zkmpdNttRN+7eEFb1khfw==
X-Google-Smtp-Source: APXvYqyqtIdNVp4dAlM2o9n7nX85aZbnej16a5k16emsTD5losR5+msLRBN07golodtkhQMVuCOh2ZGuVt7FoBUusA8=
X-Received: by 2002:a02:7fd0:: with SMTP id r199mr11669542jac.126.1578859209969;
 Sun, 12 Jan 2020 12:00:09 -0800 (PST)
MIME-Version: 1.0
References: <20200113065808.25f28c40@canb.auug.org.au>
In-Reply-To: <20200113065808.25f28c40@canb.auug.org.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Sun, 12 Jan 2020 11:59:58 -0800
Message-ID: <CAOesGMifHn6DbNgYm6YUbdKjSL5rNgdWrq+HX9dEusrOr9xX2A@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Ludovic Barre <ludovic.barre@st.com>,
        Yann Gautier <yann.gautier@st.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

Thanks for the report. Time to automate this at our end, we've had a
few too many of these slip through all the way to you lately.

Where do you keep your scripts that you catch these things with? Do
you have a writeup of the checks you do? I should add it to my
automation once and for all.


-Olof

On Sun, Jan 12, 2020 at 11:58 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   7e5d83981911 ("ARM: dts: stm32: add sdmmc3 node for STM32MP1 boards")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell
