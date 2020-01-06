Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE799131716
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 18:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgAFRv7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 12:51:59 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:34042 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFRv6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 12:51:58 -0500
Received: by mail-io1-f68.google.com with SMTP id z193so49477038iof.1
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2020 09:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qy8kmkp8a0gmcpulrYZGNAm7gLvS5DkjoDa1dT+iaq8=;
        b=jzrof668V7p7TIEBZmcBr7HsXeQHx4Y/82FDTr/eUsL2QuB+qyXSDZPa7kUuOW4p4V
         aQDgWoEHRRaMXH2PbD5aNjNwR4/aok96ojD23mByECE8J/9RVT5Qxcx1m+Nzu+10gkjE
         SnmQYwRYzPnX9blWGY3RBLpqxH9HNLy2+U6YVhhVSoBfFvzZlepNx/ajOLI29PDltHmI
         GUn/LnnhMEFQquexorSKg8FbdHrsVah6Ucn5QZvBeqI9DkJiBJDMiXlIecF01kRGlfbz
         bmiJ6ex6i/ZJgeTsQQ9i//PmTbQha9ze3n/iSkJf1V1vwxHCqgjWmbnX7S2xll8o81aQ
         W21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qy8kmkp8a0gmcpulrYZGNAm7gLvS5DkjoDa1dT+iaq8=;
        b=gn7FJ7l0rBTgiP8jhWRx3FJYuLXhNFnzBS7351p0106ETu8a7+e6uz+M3koyYzf/HR
         J2gL2xRhtXN3gmsKh7IcwuMqEC+r8mC/YeaEUx1Jiizt1hD8nwt5tvHn48C9C2sQ5puP
         nFh8kJDB+8ER/Q4hXHDlSgNUcnNIw2wImleQnGU/qCYBTlq6sTRqPT53YnxCpBA3OQ13
         jKaEOz1tUweWZBIJ4B4wry9GQA+ePk8mkRpqK07DpLS7fImh3O0iARqr3481vua5Qu1m
         NmHB/rJtCCx8MArA96ydy/pKLmI+N79OUwn5nnh7YaY4ba4J1oHq4CDuUtCcT9O6w8OP
         Jiow==
X-Gm-Message-State: APjAAAVZRNOa1LETD7UT2ewkLTkh9PxWE7t+T7CdSiH7xbVX70u3vfmT
        4snn9gKwJHtpI6ABIWj0IVH3js/5L2Ow6C0GUb332w==
X-Google-Smtp-Source: APXvYqzxsugGn2yxQHaeUuSSUV2TAe/3zs6sdz/iqVons8XXpedlHaNhKZESuFkh1KRYRsPmdvlmPUWnayfpHU/1dgI=
X-Received: by 2002:a5e:9907:: with SMTP id t7mr69813324ioj.72.1578333118209;
 Mon, 06 Jan 2020 09:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20191212160622.021517d3@canb.auug.org.au>
In-Reply-To: <20191212160622.021517d3@canb.auug.org.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 6 Jan 2020 09:51:47 -0800
Message-ID: <CAOesGMiabP7nAPYKrmP=j_8bSj-UfUSFoiD0W+kqzaBp-6J2hQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Wed, Dec 11, 2019 at 9:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the rcu (I think) tree, today's linux-next build (x86_64
> allnoconfig) produced this warning:
>
> kernel/time/timer.c: In function 'schedule_timeout':
> kernel/time/timer.c:969:20: warning: 'timer.expires' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   969 |   long diff = timer->expires - expires;
>       |               ~~~~~^~~~~~~~~
>
> Introduced by (bisected to) commit
>
>   c4127fce1d02 ("timer: Use hlist_unhashed_lockless() in timer_pending()")
>
> x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130

This is still there as of last night's -next. Any update on getting a
fix queued together with the offending patch?


Thanks!

-Olof
