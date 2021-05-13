Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B0937F301
	for <lists+linux-next@lfdr.de>; Thu, 13 May 2021 08:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhEMG2p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 May 2021 02:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhEMG2d (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 May 2021 02:28:33 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F98EC06174A
        for <linux-next@vger.kernel.org>; Wed, 12 May 2021 23:27:23 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id l70so5686152pga.1
        for <linux-next@vger.kernel.org>; Wed, 12 May 2021 23:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e9/24ZqOHq0mWMNAFsZovxhc8ehFUN+8KHcERY7gBtE=;
        b=Sop7xPVghlzrdPEzHeiFoVTql348kBCsba0EcdMAB6y0VosC8D2PNfe4LiSPTWfHrM
         7peZwTCZ6h+ifAHx6Pu6iwBpkWgeHduAJPoJpABijbiGh1yR7J/ezwhAN6dczpJtNjO5
         g7oReuSL7GCRsNB6x1ke85Hb4A2Oy/JGOo5JpqcpG7pcWU+n6Y1KCjjSbuTBdYFMSSYW
         WY9Rt+AhBZQTG5gRapq6A7EvWcx99bgVVTg75t9xPb+8NzkA8O6lzZvQDDSMHfPZzX9c
         4iHQHcHjpB5tE5FIa0Hf9fIu/rUFY8sIpv+6DACCjiZOh5zl1vuNeyOE4T0FqbN2HYEB
         LXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e9/24ZqOHq0mWMNAFsZovxhc8ehFUN+8KHcERY7gBtE=;
        b=N88+TiiyNgSaG3kwXsRbp7Cb6Jj79lWnQ72FUk8utlIaYEI4HSAquMJzgLvApTGW4F
         q7brqhYV2Y4VMwfU7+dt2Qb9FjlqEVcm8QNa6P1jyBd0OxFkcCUtGElWoN6bzSIa7toL
         ir8dSjI6E87J07ZjPlddwkL0GmpFLQdBOW6gbEJyHtdqmScX4dVHq2t7GI2ZD0PcOotG
         v4WCp4OnBW/oCc6Lu6zXC9YVDY9DDOmxKbb/croBa7C/seg11nnW+RpIgLN59DJ7wgRR
         TE/I4fMDEzhM5hB7jOLe87+TWBD9Ith8sIo0Cd1JKVgvfZLOYyeRAttNgS2N5CnN1CSV
         H0zg==
X-Gm-Message-State: AOAM531DP6GuwyP58aFjV4+CUtaxrbXe94SYehFF4YHI4UDnIU6cYnsx
        5HjceKhU8jqlYtI1R5XAtEkrIb5B8RhvoXopivg+Hg==
X-Google-Smtp-Source: ABdhPJyH9pXtbuhm1ReTHZ+7I7nWY87RzqLnMwvcFTwO/XW5FFbFDqwSj/CUv+ERtllZimPONoT8PoVA6OqvDTXi44M=
X-Received: by 2002:a63:9d4e:: with SMTP id i75mr39062119pgd.443.1620887242631;
 Wed, 12 May 2021 23:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210512095201.09323cda@canb.auug.org.au> <20210512095418.0ad4ea4a@canb.auug.org.au>
 <20210513111110.02e1caee@canb.auug.org.au>
In-Reply-To: <20210513111110.02e1caee@canb.auug.org.au>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 13 May 2021 08:35:50 +0200
Message-ID: <CAMZdPi_CtyM=Rs+OEdRoscqr55qNxmG70AgUckzvyAMvY-amLQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>, Greg KH <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, 13 May 2021 at 03:11, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 12 May 2021 09:54:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Wed, 12 May 2021 09:52:01 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the net-next tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/usb/class/cdc-wdm.c: In function 'wdm_wwan_port_stop':
> > > drivers/usb/class/cdc-wdm.c:858:2: error: implicit declaration of function 'kill_urbs' [-Werror=implicit-function-declaration]
> > >   858 |  kill_urbs(desc);
> > >       |  ^~~~~~~~~
> > >
> > > Caused by commit
> > >
> > >   cac6fb015f71 ("usb: class: cdc-wdm: WWAN framework integration")
> > >
> > > kill_urbs() was removed by commit
> > >
> > >   18abf8743674 ("cdc-wdm: untangle a circular dependency between callback and softint")
> > >
> > > Which is included in v5.13-rc1.
> >
> > Sorry, that commit is only in linux-next (from the usb.current tree).
> > I will do a merge fix up tomorrow - unless someone provides one.
> >
> > > I have used the net-next tree from next-20210511 for today.
>
> I have used the following merge fix patch for today.  I don't know if
> this is sufficient (or even correct), but it does build.

Thanks for working on this.

>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 13 May 2021 11:04:09 +1000
> Subject: [PATCH] usb: class: cdc-wdm: fix for kill_urbs() removal
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/usb/class/cdc-wdm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index c88dcc4b6618..489b0e049402 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -855,7 +855,7 @@ static void wdm_wwan_port_stop(struct wwan_port *port)
>         struct wdm_device *desc = wwan_port_get_drvdata(port);
>
>         /* Stop all transfers and disable WWAN mode */
> -       kill_urbs(desc);
> +       poison_urbs(desc);
>         desc->manage_power(desc->intf, 0);
>         clear_bit(WDM_READ, &desc->flags);
>         clear_bit(WDM_WWAN_IN_USE, &desc->flags);

AFAIU, each poison call must be balanced with unpoison call.
So you probably want to call unpoison_urbs right here, similarly to
wdm_release or wdm_suspend.

Regards,
Loic

> --
> 2.30.2
>
> --
> Cheers,
> Stephen Rothwell
