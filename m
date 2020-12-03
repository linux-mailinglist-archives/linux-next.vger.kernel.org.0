Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECABE2CD5B6
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 13:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgLCMp5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 07:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgLCMp4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 07:45:56 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10894C061A4E;
        Thu,  3 Dec 2020 04:45:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a16so3266792ejj.5;
        Thu, 03 Dec 2020 04:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ua2t1e5AwG+8Whsthixj6dJL63Xm4ciJTr6SvcxO+VE=;
        b=tq2HpIvz2T+iWc6SwIgX+ENFuDhiFtTYbk1yehIivW7DytCmof17H6VHIka+KLA3AI
         hW6IAv1IoRTRnvgvEuwkrGK93nXkgpjGFG9KDiuVaa1ykchQVY7lXdJN1qXvsWVE754/
         oGfeB6r4/m1cWR1opvyYhCq2uNKQOFQNiDNAHGcZX0AqTNQ+jz5fH7vFiY3cD68nbfdJ
         85F31GLzFNMpfX1GndGkLRybPGpzeryLwwvFA1/+NnUL6hqt8yytb3I8tIteyZUIwSFH
         xyw+/WEccXkRFjtHEHHDArQtsjrcjaKZQ2LX5VggubhCh9KzCd+8e3bLQ97fA1E9Tdmr
         aa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ua2t1e5AwG+8Whsthixj6dJL63Xm4ciJTr6SvcxO+VE=;
        b=Ef4zzI3wE6d75FUGiskrulBTBVVhPdpWZirOOrPRKMnZFbTtsUudVpwxvT7t0TDYZ2
         GmM4kPTqux/vNBIdQAbaZOJMhC+fSvqHXhejmaGi98JuhiKtT/mTAxVjuM8WBJnAo9AF
         cpLW/adwX2ZtPgdCQABzFu8oxd34jrHLPS6uCM67jfnuBxFKuBmnDL5dinFTwUW27iy5
         eclKaO3i9G1VgcJX0K1xp9YS7lYUZc4GjmYF2PTpDhIBjWJGZFbH3/vxwrMGk3t5pzSr
         jhGiRTYP+vFqSHojssyuBfYvNePxe9qJ5i95Wrq+Zmyx3hP14ujmTGEO++jMKk7MGhTD
         r4gg==
X-Gm-Message-State: AOAM532e9fWfaptlLLEedHmHHLxH1Tshh5mgVaqZrgXdsUosh8AtD0Vc
        HUGe6wCxnNXucJnVFBjHgK0RNlxzEOCTX9iH8Bg=
X-Google-Smtp-Source: ABdhPJxHFFCie/ax3UXHBk55fHUvmgnSPhYP3vdgsahjV/nwul6L+/1gWEvPCEQS31CLYyzZFiot/wacnqM7w4SbgJs=
X-Received: by 2002:a17:906:d8a1:: with SMTP id qc1mr2278901ejb.294.1606999514839;
 Thu, 03 Dec 2020 04:45:14 -0800 (PST)
MIME-Version: 1.0
References: <00000000000056f29e05b58d448f@google.com> <20201203122354.GI751215@kernel.org>
In-Reply-To: <20201203122354.GI751215@kernel.org>
From:   Lorenzo Stoakes <lstoakes@gmail.com>
Date:   Thu, 3 Dec 2020 12:45:03 +0000
Message-ID: <CAA5enKZ23Fy3KsHbR3cOxRm6+=JLfU3Lko+JFn7DKM951B_mMQ@mail.gmail.com>
Subject: Re: linux-next boot error: kernel BUG at include/linux/page-flags.h:LINE!
To:     Mike Rapoport <rppt@kernel.org>
Cc:     syzbot <syzbot+86800a8349c0f3f9466e@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 3 Dec 2020 at 12:24, Mike Rapoport <rppt@kernel.org> wrote:
> Yeah, the change to initialization of "unavailable" memory missed pfn 0 :(
> This should fix it:

Tried locally and it fixes the issue for me :)
