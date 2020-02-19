Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8810A163A6C
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2020 03:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgBSCpm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 21:45:42 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:46160 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728031AbgBSCpm (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Feb 2020 21:45:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582080341; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=+Hnsb9d6PeDSY82BGR34PbCnjCNdf3secKOnbmp9Pfc=; b=tn/mnB60wN5KjmuaxJJ8m+1Z9w9iZb2MiKIMTxNdMt7sTGt9Pwpy6WQuj8Wcju71+bUxycVJ
 KJm03+duvnIKlyhBKOp6qrknLlSwCBZaEsstHGqWqbYTwefYtKL2vNDPtZReq8gzTinfj1N5
 A2NATmQwAEZ9gqkEW6PhKqFzu1Q=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJmNGRkZiIsICJsaW51eC1uZXh0QHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4ca153.7f130836dce0-smtp-out-n03;
 Wed, 19 Feb 2020 02:45:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D4713C447A0; Wed, 19 Feb 2020 02:45:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A38B4C43383;
        Wed, 19 Feb 2020 02:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A38B4C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 18 Feb 2020 18:45:34 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: msm_hsusb 78d9000.usb: failed to create device link to
 ci_hdrc.0.ulpi
Message-ID: <20200219024534.GB10078@jackp-linux.qualcomm.com>
References: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
 <20200219013824.GB8602@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219013824.GB8602@b29397-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 19, 2020 at 01:38:22AM +0000, Peter Chen wrote:
> On 20-02-17 14:02:57, Naresh Kamboju wrote:
> > arm64 APQ 8016 SBC ( Dragonboard 410c)  device running Linux next boot
> > failed due to below error.
> > 
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
> > [    0.000000] Linux version 5.6.0-rc2-next-20200217 (oe-user@oe-host)
> > (gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Feb 17 04:27:31 UTC 2020
> > [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> > <>
> > [    4.439291] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.448891] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.457879] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.467331] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.475636] mmc0: new HS200 MMC card at address 0001
> > [    4.478895] mmcblk0: mmc0:0001 DS2008 7.28 GiB
> > [    4.480629] mmcblk0boot0: mmc0:0001 DS2008 partition 1 4.00 MiB
> > [    4.484719] mmcblk0boot1: mmc0:0001 DS2008 partition 2 4.00 MiB
> > [    4.492247] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.502611] mmcblk0rpmb: mmc0:0001 DS2008 partition 3 4.00 MiB,
> > chardev (234:0)
> > [    4.506949] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.517901] random: fast init done
> > [    4.521420] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
> > [    4.523400] mmcblk1: mmc1:aaaa SL16G 14.8 GiB
> > [    4.532843] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.539131]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
> > [    4.542309]  mmcblk1: p1
> > [    4.561843] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.573481] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.585283] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.592622] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.600074] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.607204] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> > [    4.614679] msm_hsusb 78d9000.usb: failed to create device link to
> > ci_hdrc.0.ulpi
> 
> The chipidea USB code hasn't changed recently. Would you please bisect
> which commit affect it?

Probably same cause as for this:
https://bugzilla.kernel.org/show_bug.cgi?id=206435

> > metadata:
> >   git branch: master
> >   git repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&amp;data=02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927547718&amp;sdata=Hy52nqOnn5nPgLcgSgWWJciwVy73MnHheNAqOi8tX4g%3D&amp;reserved=0
> >   git commit: c25a951c50dca1da4a449a985a9debd82dc18573
> >   git describe: next-20200217
> >   make_kernelversion: 5.6.0-rc2
> >   kernel-config:
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fsnapshots.linaro.org%2Fopenembedded%2Flkft%2Flkft%2Fsumo%2Fdragonboard-410c%2Flkft%2Flinux-next%2F705%2Fconfig&amp;data=02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927547718&amp;sdata=7tuNCoQH2Fu5yDtcfE3D%2F1SDGQg9wSyKKPO8ufmQg1w%3D&amp;reserved=0
> >   build-location:
> > https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fsnapshots.linaro.org%2Fopenembedded%2Flkft%2Flkft%2Fsumo%2Fdragonboard-410c%2Flkft%2Flinux-next%2F705&amp;data=02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927557710&amp;sdata=%2FBbdDiwFV%2B7z01ayzHuKl%2FLMIa6Qv%2BjajgywkhsVrJY%3D&amp;reserved=0
> > 
> > ref:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fqa-reports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2F1223296%2Flog&amp;data=02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927557710&amp;sdata=hXhbx%2FMJ6BDzQkYMUZrc8uRmiCb2YfLluvzjg6uaZ%2Fw%3D&amp;reserved=0
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fqa-reports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2F1223301%2Flog&amp;data=02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927557710&amp;sdata=5zrDqvPVZcgrFEogBjes0NG1uRv7WJnEeUiGUqe%2FB7A%3D&amp;reserved=0
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fqa-reports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2F1223310%2Flog&amp;data=02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927557710&amp;sdata=TWixPlJuzES7AReilcm%2FG4pWTYVy3ku6zetEVmeXB6I%3D&amp;reserved=0
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fqa-reports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2F1223308%2Flog&amp;data=02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927557710&amp;sdata=qSxWLfIWM047jLKjahfDC6luxI9kYr5xPhErkD%2BxiaQ%3D&amp;reserved=0

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
