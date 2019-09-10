Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E69AEED1
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 17:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436629AbfIJPp6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 11:45:58 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33189 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfIJPp6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Sep 2019 11:45:58 -0400
Received: by mail-qt1-f196.google.com with SMTP id r5so21321219qtd.0;
        Tue, 10 Sep 2019 08:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mgWzDzaplnc/d23D8NMX6EnM/r2A1Rxq4yqexQ5ZW4U=;
        b=V4nCxWpn08hKC/92SvncwaKyuOPRtIKFzf8yh7SWP/60qxuvG9Tkda0lhSfUheRV9T
         nkEHeJ0rQnt/ndd0UrXvj6GIXKRRygnxgPQHpp3K5qkWQMK+zb9s9RKuRNSHV94vVM+U
         kZFuSEMJiR2w6bUikvFX/g6zBiiCmhObDeKhaHdAXrqR+b3iPNvLXF4ogKvp/lgjtKWb
         jiARDuzKElo88dS5wdVahxe2u6cVIhSaJSfsIeZFIiQTqV+lihnTB4BOWbfxBQUZ0Tyc
         WkkvL6YNCXGFfOIsUKEvMzqLnVh2QOMJqNeihz8eMYCDj3cjuic5O4AgDUEyjsUUBWiV
         O6Fw==
X-Gm-Message-State: APjAAAXB6oLPCgLENdKpOE/I7J/WscSo+UuP7HRTKqQj02nIMgX2snU3
        XJdiyGhkwjNSfdqvxWgtJN59O7gAC+Vumrl+HqxZ8r+I
X-Google-Smtp-Source: APXvYqxQH8ZG7AlztTu020V7wjuwxg54PlPvvwrHVe4CjyTXMgRX8ktupMOJ/s108I0Fkf/NWKSaIdVENYYhSYg1Luw=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr29717314qtn.204.1568130357213;
 Tue, 10 Sep 2019 08:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190911011034.3bae9ee3@canb.auug.org.au>
In-Reply-To: <20190911011034.3bae9ee3@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 10 Sep 2019 17:45:40 +0200
Message-ID: <CAK8P3a2h1CcfhVDgmhhMna4q+6rx_eFyUE_zMo7cF1HmM_Es8Q@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the y2038 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 10, 2019 at 5:10 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   e83dd16c24d8 ("fix compat handling of FICLONERANGE, FIDEDUPERANGE and FS_IOC_FIEMAP")
>
> Fixes tag
>
>   Fixes: d79bdd52d8be7 54dbc15172375 ceac204e1da94
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> So (presumably):
>
> Fixes: d79bdd52d8be ("vfs: wire up compat ioctl for CLONE/CLONE_RANGE")
> Fixes: 54dbc1517237 ("vfs: hoist the btrfs deduplication ioctl to the vfs")
> Fixes: ceac204e1da9 ("fs: make fiemap work from compat_ioctl")

Fixed, thanks for the report!

      Arnd
