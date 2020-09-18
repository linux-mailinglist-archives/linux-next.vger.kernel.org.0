Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAD326F4D2
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 05:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgIRDwR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 23:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgIRDwR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 23:52:17 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE83C06174A
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 20:52:17 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id x8so3310706ybm.3
        for <linux-next@vger.kernel.org>; Thu, 17 Sep 2020 20:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nme931I5f1UOsrOsO4Rb7WHHBrdHAMoy/1dfpIEkmUw=;
        b=S4SaM1NGJL7jkwHvKbSHmLJtNecMzgaGWgtOhwJ5PvGNoEFS9whv2xwQUVYUUt7Y+c
         0Wlnmc1kw05G3htSrglqn2XjmqLNmqGbWoAINAzCVMtut0L8lMK5L7cGNUfwYy3SaOQs
         dKXdsv49srMvy5uV1fYnwxcR5cPazt1PH9h2nrMMdd8SfsmxuCpxk4Knk3m6yKUmRP6Z
         mft9aSK0zGa/6BBSu14M60iv9T7PutIyn081Ez6mUV/IH80E9i0hHSB7KBnJXk09CxZ4
         WA4zIXuYP+lhCXo3fHmjwDl8ExTmcuqSOeLsdmbaOIoASBZTc5ocuQYG8fEWvaVBctgL
         TSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nme931I5f1UOsrOsO4Rb7WHHBrdHAMoy/1dfpIEkmUw=;
        b=AABkTQmxbwA4dgkBp08ZidwcdLjeq9/ftEjZSCQ1O2dFrjwBK3bd5pXwdevRe2PYYK
         TIDOOzi5zLSuw8/MSEoQg7LoLhcjbgO7lFKhckU8Yz1c79u0KNWxN4hJWDXxYWI/fzl5
         DkJcn3MqGg9xYmWfYXjx5LNqsMM+uUB6p9YuNVz6YXagDWzznLZvb1qH6gcbU2fd1/7P
         GxEjNwiRQr/N3FWSIlg7Vz6Ny0V65632ZKeVopjVy/ovwqJonybuvkLcCYIKgZDIUxjb
         cN9f8w8ux+/TegBow3l93Ce7OQjoKVHSwK42EuHUHAQ56g84p6Ojle78eQV40zPEXjjH
         e2xA==
X-Gm-Message-State: AOAM5312iY4nxm4gu2aRMCq5O28Sm3o1lexZTXMn/WJF2S9GWFj0yKch
        Vb/cBUkX7W7Z37w0mRlM/ziY/LZHWxXArtudmjjt5w==
X-Google-Smtp-Source: ABdhPJyLJTvEF5MXENMyCWAwK46pIB/PtI8Z5niW+AWW7qz0g5gvUjB4hunEZyEPL/VdhBZoP/lGOSsp/yKYtNBY3rY=
X-Received: by 2002:a25:7606:: with SMTP id r6mr11568379ybc.42.1600401135999;
 Thu, 17 Sep 2020 20:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200917202313.143f66f3@canb.auug.org.au> <20f0b8f7-bbe8-fd31-819e-998054e41766@infradead.org>
In-Reply-To: <20f0b8f7-bbe8-fd31-819e-998054e41766@infradead.org>
From:   =?UTF-8?B?TWFoZXNoIEJhbmRld2FyICjgpK7gpLngpYfgpLYg4KSs4KSC4KSh4KWH4KS14KS+4KSwKQ==?= 
        <maheshb@google.com>
Date:   Thu, 17 Sep 2020 20:52:00 -0700
Message-ID: <CAF2d9ji_ueJyMgwqfKxzsEjMaY09DxYboymELCNnEhJQGZDHPQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 17 (netdevice.h: net_has_fallback_tunnels
 when SYSCTL is not set)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 17, 2020 at 1:33 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 9/17/20 3:23 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200916:
> >
>
> I am seeing build errors when CONFIG_SYSCTL is not set:
>
> ld: net/ipv4/ip_tunnel.o: in function `ip_tunnel_init_net':
> ip_tunnel.c:(.text+0x2ea0): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
> ld: net/ipv6/ip6_vti.o: in function `vti6_init_net':
> ip6_vti.c:(.text+0x1b56): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
> ld: net/ipv6/sit.o: in function `sit_init_net':
> sit.c:(.text+0x4568): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
> ld: net/ipv6/ip6_tunnel.o: in function `ip6_tnl_init_net':
> ip6_tunnel.c:(.text+0x27d6): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
> ld: net/ipv6/ip6_gre.o: in function `ip6gre_init_net':
> ip6_gre.c:(.text+0x3a5e): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
>
> due to 316cdaa1158af:
>
> commit 316cdaa1158af17250397054f92bb339fbd8e282
> Author: Mahesh Bandewar <maheshb@google.com>
> Date:   Wed Aug 26 09:05:35 2020 -0700
>
>     net: add option to not create fall-back tunnels in root-ns as well
>
>
> This was first reported to netdev@ on Sept. 02 but Mahesh was not cc-ed
> on that report.
>
Thanks Randy for the report.
Probably we shouldn't have removed the !ENBALED(CONFIG_SYSCTL) check.
Let me cook a fix and send it.
>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
