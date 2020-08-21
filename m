Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0238C24DC9B
	for <lists+linux-next@lfdr.de>; Fri, 21 Aug 2020 19:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgHURFt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Aug 2020 13:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728251AbgHUQSr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Aug 2020 12:18:47 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2312AC061573
        for <linux-next@vger.kernel.org>; Fri, 21 Aug 2020 09:18:42 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id h4so2266314ioe.5
        for <linux-next@vger.kernel.org>; Fri, 21 Aug 2020 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=luUAi1TbOa9Dnc1tIwWCWIIp6OXw4Q4Gp7/3zvZWN+4=;
        b=ahSuHdM/nkUJ6JtkBGtFBeRVfzbonjEc/j96YRLEJ4vtmgg/KKihM/7sXJPF+cxzsp
         QAV3Vt2rftE+yFPlN3N9m9EO0Q3Hto7nzTNZzODiCr5quN7ecOhjw9W9+c9BmYLGabVu
         E257jRzn/TFc6+q8S1SliMsuyT+g5ggI0Wq4nsEiLaXf0oxG8Za4ala0j1N8BM9LU4kh
         5R1yY5XWkQh5JRWT1nTTfhm7+z8qkA/rAv9wlXqFEiUn2wJKGX1I4s0Tw9kozND2q7vL
         N5Rn5ptnxGRFDutvd0+GGNwT+yWVBwQ6bT8s+/djlP7sY3x7ga+3SVfN2hoA+YqCoBF6
         PzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=luUAi1TbOa9Dnc1tIwWCWIIp6OXw4Q4Gp7/3zvZWN+4=;
        b=OYbZGGxkUq0yKYkI67F80KnmFaAh57hTfrccLPa5VcurT98Zq8HrRm9LVH0rRAx4bY
         33Qp+XoR8KaPt+Iz6MgXzCSfqXGgUNRMeRtStBmTVQzd+i1vk9A5JU3ErbQNOfGZqlZU
         3msyEZsPFa3Hwg1QzCHZ0qR+an4J05XsNvUEmYvrk2kGx7jA2e+3teDzqhQJqvx2/oiG
         76u27rr8b/sq5oPRBWZIfyxOr+m8C4gyvgdGVVXGEtc9fwHnKIDrgVbaew2z4SNtcEU1
         GlFiOl9lIRWgdjxNtL9l3Z7V0H3M41vD9dnsrRyrx+cEsKv0a0OrCwFlWdVYfQBsqZ8m
         Nw1A==
X-Gm-Message-State: AOAM53043C52rZKN5yOhqSR7GtFKHd1Qmiqj76tlnRWtcl0UMisFRyil
        mu0QPOta7cIth/Nu6TuDjzV9ORw1H9mWnC0Q3BOb6A==
X-Google-Smtp-Source: ABdhPJz5jpr2DxnMaG9eqJjbyNPm6jyyHc64mTSoHOxOHhYYkgi7vT1uWhdnCIVnP0s7oboMggBGb9m0MGs/KT7TKYo=
X-Received: by 2002:a6b:b495:: with SMTP id d143mr2998016iof.61.1598026721446;
 Fri, 21 Aug 2020 09:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200821151942.6b01dbd8@canb.auug.org.au>
In-Reply-To: <20200821151942.6b01dbd8@canb.auug.org.au>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 21 Aug 2020 09:18:29 -0700
Message-ID: <CAOesGMhHhBBdXdEAM+P5orFz56bdQTk8MP20k4UZ2rh53Ge6XQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the
 arm-soc-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Thu, Aug 20, 2020 at 10:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   8d53ecfbf231 ("arm64: dts: xilinx: Align IOMMU nodename with dtschema")
>   b4b6fb8de8dc ("arm64: dts: zynqmp: Add GTR transceivers")
>
> are missing a Signed-off-by from their committer.

Ah, I see what happened here. I've been relying on some of my
semi-automation scripts for catching this, but I had to use regular
manual git merge for this branch due to GPG signatures not capturing
it in patchwork.

Since the committer was Michal, and the pull request came from him, we
still have the chain of contribution documented, but I'll keep this in
mind on future manual merges.


-Olof
