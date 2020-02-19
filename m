Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF2A16404A
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2020 10:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgBSJXe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 04:23:34 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35822 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgBSJXe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Feb 2020 04:23:34 -0500
Received: by mail-pg1-f196.google.com with SMTP id v23so9019981pgk.2;
        Wed, 19 Feb 2020 01:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Htpt6hc+U4jo4mvJTHmuoosdO86KCt7hpmhoJ1OllKc=;
        b=A+oniFcopSeS7/z7U8aO7Kzd+s5dqq3cODDtSQatqjv2wnCdJaoUvD+6myGsB/RJbe
         hUxktseNgkTOtHJAAiH7/yLdPeXsQ+7rH0PehbIQkuysv/b/0xovFdw+zJl0qxRrZ1Ff
         jtBLSrSM5Q1fYFCJT3lsti6sbNKZnEr4vjAaU9t5y/QgbgqbKyox/3vXNpc4XS/0HMFj
         ykaCNJGzHOY64OzvjQMw2tGV9fSKcHELOAsMgndF/lkqBrq5pnNrqWZQO/zFMt4PyTDy
         5o9bfCShHs9ncMRDmC/Iwns5PmDGoHGPSs54wjldlp4IDOSOEMKVnEea7bTI7vvjEJLe
         w3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Htpt6hc+U4jo4mvJTHmuoosdO86KCt7hpmhoJ1OllKc=;
        b=AM4yWwsfUUt2XSHb/ldaTgU7ulnXU2AdlTb+OSoxDQa9kZ1/oLB4Oe7TB686Ox8wMH
         1Y5n1U8IGoYiBqgZgGxzV76RAK3a4AJmkuebL0o2MsXwOIacczUCRkZumP1yM/VVr8Rq
         gYovhkYhZE6T3iDi5e0xZKuHzyzCsQ18rs5xAlj2DX3tmHd1E1Dz0cc1VkV8KyUu0UPh
         Lnuxyro86K2vo9SKJrzg9Lo3QrKTWAGc0lfTz4NR64hHJwVZN/m6Oa8Cdod/UntJAUF8
         I5E9/+3/cifr2wqEK0lOs7ciFov5J4PCEzXNimBzCaOS6hvbYZtPJOCtT/5yxKezhgHm
         8p9A==
X-Gm-Message-State: APjAAAXJ6sL+oxVJmAW1pfg4wTlQqaac33OmDRadJ3ccvU+7mljd1RHf
        HamY7A59o63H+x2oiGDyx1ALY9EhNY+jYIIv/RLPG8bYArI=
X-Google-Smtp-Source: APXvYqyZB8y/PoR6EyWvk2I2q3P6m+Qxy2sBfmbxGBYaiQKh8j/+PEjxZUkjgviLMNTrR7qlh4S3/ToK8sJu4Tu82FM=
X-Received: by 2002:a62:52d0:: with SMTP id g199mr25153719pfb.241.1582104213420;
 Wed, 19 Feb 2020 01:23:33 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
 <20200219013824.GB8602@b29397-desktop> <20200219024534.GB10078@jackp-linux.qualcomm.com>
In-Reply-To: <20200219024534.GB10078@jackp-linux.qualcomm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 19 Feb 2020 11:23:25 +0200
Message-ID: <CAHp75VfY1Y-jNr=YTfAO+eUOy3xUy9+AgtyJuhEk2ngrxMg5JA@mail.gmail.com>
Subject: Re: msm_hsusb 78d9000.usb: failed to create device link to ci_hdrc.0.ulpi
To:     Jack Pham <jackp@codeaurora.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 19, 2020 at 4:46 AM Jack Pham <jackp@codeaurora.org> wrote:
>
> On Wed, Feb 19, 2020 at 01:38:22AM +0000, Peter Chen wrote:
> > On 20-02-17 14:02:57, Naresh Kamboju wrote:
> > > arm64 APQ 8016 SBC ( Dragonboard 410c)  device running Linux next boot
> > > failed due to below error.
> > >
> > > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
> > > [    0.000000] Linux version 5.6.0-rc2-next-20200217 (oe-user@oe-host)
> > > (gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Feb 17 04:27:31 UTC 2020
> > > [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> > > <>
> > > [    4.439291] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.448891] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.457879] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.467331] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.475636] mmc0: new HS200 MMC card at address 0001
> > > [    4.478895] mmcblk0: mmc0:0001 DS2008 7.28 GiB
> > > [    4.480629] mmcblk0boot0: mmc0:0001 DS2008 partition 1 4.00 MiB
> > > [    4.484719] mmcblk0boot1: mmc0:0001 DS2008 partition 2 4.00 MiB
> > > [    4.492247] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.502611] mmcblk0rpmb: mmc0:0001 DS2008 partition 3 4.00 MiB,
> > > chardev (234:0)
> > > [    4.506949] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.517901] random: fast init done
> > > [    4.521420] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
> > > [    4.523400] mmcblk1: mmc1:aaaa SL16G 14.8 GiB
> > > [    4.532843] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.539131]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
> > > [    4.542309]  mmcblk1: p1
> > > [    4.561843] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.573481] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.585283] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.592622] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.600074] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.607204] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> > > [    4.614679] msm_hsusb 78d9000.usb: failed to create device link to
> > > ci_hdrc.0.ulpi
> >
> > The chipidea USB code hasn't changed recently. Would you please bisect
> > which commit affect it?
>
> Probably same cause as for this:
> https://bugzilla.kernel.org/show_bug.cgi?id=206435

Yes, it's the same. I dunno why no fix yet available.

-- 
With Best Regards,
Andy Shevchenko
