Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 278B8166B20
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 00:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgBTXon (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 18:44:43 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35934 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729234AbgBTXol (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Feb 2020 18:44:41 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so8439wru.3
        for <linux-next@vger.kernel.org>; Thu, 20 Feb 2020 15:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JND3fDcmDGV+LOuOc+MELgsbHkbd9A/S1d4P55At3V4=;
        b=JG0tnAIOd7aktwBZsysuBUFcBpECsP35+OXKFI70Zm/Jbyk8b7AKhlzsavPwe//lDf
         GColtgj2fpk01oMSObpUZi5Zu9tVZBdq65GfSYrJcu8Wl2T8UcEqtNz7Isi9bvA6LKfH
         hzfEY+38Jm7cCcamdH/aqMq92seb4XJ0No/NJ/O+rbqig5Xz9zrPE6IG4n8Ds3YWo80n
         uroJ95Ho2RX2BBMmOjyPpEVOl9GlQ7M/ryQNuje/rnB+IZKBKPLgKw/O17iKSCmutY0G
         0y3xk3F4epw87mQ6trjyyvoMJwkJS8EQfrqfhmoDjwgBZWBz6fcpsfGpzYDT5thcuwvc
         N3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JND3fDcmDGV+LOuOc+MELgsbHkbd9A/S1d4P55At3V4=;
        b=P0PnLjPQiEWaB4mBXw1dBrvZIi1VbS8IC6BuWu9ssBLt/c4wpVH8rlnQoQGaI5c+M7
         ypVrQ/gIjsIwHz//fR6i/rclEbxfuzE+FLnyAVOfthLfaOLaM6LEOl5YcZUoKBEm5GHl
         /md53Tabmk4lTfEMMVdWD443AwJmj7X6OtEcv8wc6zwt6UADhZMqafuU7/V5Fx0+PIUb
         5do+4zhGOdp42BFEyxHh6XNodwHc8ktLzoY9bcY31jpPbC8aEKFOSDF1/UvLnVL6vVFb
         7S7s9PjyUGuiBofrJVsjS1UGDEadYXxyUndP5Ljgtv08mCks0vsfYJr/0eqbQHKTkblC
         CVmA==
X-Gm-Message-State: APjAAAXDtrKtbAFpHNd7N0Ij4D1KelDK4l0EERXw1G6p5qihEHMiFwGP
        t3xjxOjvyixkEt4gwvHwchw+mxIgQkOvCh0SrVtB+Q==
X-Google-Smtp-Source: APXvYqyEBpsj9nEa56zgIwEIS3Bvz2+c3Gfexs94e6PgMzrjyA2GWPzsjrN3KBbl1wSTBIfBcyq39yVDT+D0OUlHUXY=
X-Received: by 2002:adf:e692:: with SMTP id r18mr45012733wrm.413.1582242279439;
 Thu, 20 Feb 2020 15:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20200217145711.4af495a3@canb.auug.org.au> <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
 <CAOFY-A3q_pmtHKAoOJdbB09wy=dxs9SdpXjCsU1wBxU5EDHVmw@mail.gmail.com>
 <20200221101845.21c0c8c5@canb.auug.org.au> <CAOFY-A2ndGCSEDstOmXs-u1XjNsaj8wkLezYsMbzeZeVTJGC5g@mail.gmail.com>
 <20200221104328.0f897efd@canb.auug.org.au>
In-Reply-To: <20200221104328.0f897efd@canb.auug.org.au>
From:   Arjun Roy <arjunroy@google.com>
Date:   Thu, 20 Feb 2020 15:44:28 -0800
Message-ID: <CAOFY-A2tK5=eFt2AQx+FOjyHXQ85XE-N8gdbb49wJphjAAgFUQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 20, 2020 at 3:43 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Arjun,
>
> On Thu, 20 Feb 2020 15:22:04 -0800 Arjun Roy <arjunroy@google.com> wrote:
> >
> > I have a possible solution in mind, but it would involve a slight
> > change in the SPARC macro (to be more inline with the semantics of the
> > other platforms).
> > If you're open to such a change, I can send it out.
>
> Its not up to me :-)
>
> If it is not too much work, I would say, do the patch, test it as you
> can, then send it out cc'ing the Sparc maintainer (DaveM cc'd) and see
> what happens.
>

Certainly, I will do so.

Thanks,
-Arjun

> --
> Cheers,
> Stephen Rothwell
