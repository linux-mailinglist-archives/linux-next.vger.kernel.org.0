Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A857C160D6C
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 09:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgBQIdM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 03:33:12 -0500
Received: from mail-lj1-f180.google.com ([209.85.208.180]:37299 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgBQIdM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Feb 2020 03:33:12 -0500
Received: by mail-lj1-f180.google.com with SMTP id q23so1722811ljm.4
        for <linux-next@vger.kernel.org>; Mon, 17 Feb 2020 00:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4o9MpvCnaW7UNrMoDadTvPllbR5hSCdTM1cZtcwAvo8=;
        b=xr36KzVxOPwuOahqFncxjhK4K8zSR2lKO39Cxagp19vpsh2qOcTiJybYRRe7pI/5bk
         3w/XGkmLQjqV3+cwsJlYWlggupIrqmMkzIGJUwGWgZOAR9d7suw7tMrylO3nmBWcc/VR
         qsFb5SzdiVdfppdjWADry9ZGJEUCL9vM5oTQY5woMoZ4u7ENul/znHVmDUPOdzIMW3Qz
         8de77iKP6QtAHDal2JrdZb9FC0nElwJJVG64ZiA03jlZwvrx7TiIZeVWKfK6J0Ltn/xw
         FDNz99SqqBemyvnYIc39cJLNv//6MUgZZuCuw/CQhlQ45AJOSVff8mXvbiKxV8nt/W2o
         JKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4o9MpvCnaW7UNrMoDadTvPllbR5hSCdTM1cZtcwAvo8=;
        b=VgfXxeQQbX/qNWZSLwhrxT61SAt1FF3uCoJ13OY+38bzTwUhjJa9hrFDhaNHmHmNpB
         QinvFmulTWryKtm+bA4Y7DGQ9BUyqrDH8lyqnxq7QfXjM7wKRRgrPOghREjIMKm5/iVN
         E2vV8a0sSienL6YqzjN/W+D0rAQ+1XaWjD09TxT6N/WM1KEAQvVFW55+AiPC000vc6Ey
         JQv4puXawb3Nj8SSasaGpN9t0QuF57Tl4FJtFkFD59ZVEPLPURnTrNcbrnE9vmpA8cOi
         6L9woRX0zitkJwFpzcpxMwcD1aC/XmmVJJuF6/X8hoJRytrW+wjqBwmFevAM0C/9HQyk
         Q/pg==
X-Gm-Message-State: APjAAAWlTNuFrl2fiHD6wdejLDjasXtrFM4/+f7UJlc6LHrBFKOjZsJ3
        D7G+R8dT2h1nO7/vEzVNdj1vfDfMlDP1cJ10ErlDaQ==
X-Google-Smtp-Source: APXvYqx2ueaC/hV8qPE0R05PmQXt8c2Pct9mXAV2SSmrSlMEmO1pjbXcsPd0W1wVCc9TriZVLyqVp/ChAvVZSmdRB38=
X-Received: by 2002:a2e:9008:: with SMTP id h8mr9245027ljg.217.1581928390302;
 Mon, 17 Feb 2020 00:33:10 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 17 Feb 2020 14:02:57 +0530
Message-ID: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
Subject: msm_hsusb 78d9000.usb: failed to create device link to ci_hdrc.0.ulpi
To:     linux-usb@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter.Chen@nxp.com, lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

arm64 APQ 8016 SBC ( Dragonboard 410c)  device running Linux next boot
failed due to below error.

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 5.6.0-rc2-next-20200217 (oe-user@oe-host)
(gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Feb 17 04:27:31 UTC 2020
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
<>
[    4.439291] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.448891] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.457879] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.467331] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.475636] mmc0: new HS200 MMC card at address 0001
[    4.478895] mmcblk0: mmc0:0001 DS2008 7.28 GiB
[    4.480629] mmcblk0boot0: mmc0:0001 DS2008 partition 1 4.00 MiB
[    4.484719] mmcblk0boot1: mmc0:0001 DS2008 partition 2 4.00 MiB
[    4.492247] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.502611] mmcblk0rpmb: mmc0:0001 DS2008 partition 3 4.00 MiB,
chardev (234:0)
[    4.506949] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.517901] random: fast init done
[    4.521420] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
[    4.523400] mmcblk1: mmc1:aaaa SL16G 14.8 GiB
[    4.532843] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.539131]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
[    4.542309]  mmcblk1: p1
[    4.561843] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.573481] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.585283] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.592622] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.600074] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.607204] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.614679] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: c25a951c50dca1da4a449a985a9debd82dc18573
  git describe: next-20200217
  make_kernelversion: 5.6.0-rc2
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/705/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/705

ref:
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223296/log
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223301/log
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223310/log
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223308/log
