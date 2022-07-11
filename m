Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0B2457006A
	for <lists+linux-next@lfdr.de>; Mon, 11 Jul 2022 13:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiGKL0h (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Jul 2022 07:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbiGKL0B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2022 07:26:01 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F5593F308
        for <linux-next@vger.kernel.org>; Mon, 11 Jul 2022 04:02:00 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id u6so4374217iop.5
        for <linux-next@vger.kernel.org>; Mon, 11 Jul 2022 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zZThk4si2Df2oCcklrdiFPTJcwReEc+65EKNL0Y3jcA=;
        b=hEAtnyVmAaVw4hGQPfDNKMFHfWf4jgRpP6t4mIOeQ1ii1bvWwarph3IkjYrIp0OHcM
         qqzhukxCRTsCy2RVueuQQQ471HbVEMfojJarVVyC+rLT8dl3eICYvnz7xoC/mrSDKGV0
         DRCf/BUiKfzxT3KKEiQGdL9tCVlRRL1ZEXVkdvmKXlbLCYPvw2TsXYP+Mi5YSQlDhyZh
         6IbCzUrXnPovc6SlPMeeaDkvS1/MhIuOdTlUe+Mfz1qx1AE6kwOIMVhF1IYf5/Sey43z
         My6U9MNYp4hNZW2paUpegGjCM3lsWb4BMbzKL5nyqTSA8a/2whpRXJBDNTWMURGttMGB
         uCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zZThk4si2Df2oCcklrdiFPTJcwReEc+65EKNL0Y3jcA=;
        b=jPRyw6qOe5wFi9riH25GA0R3NEPKatjcK873gFNqm6qVccENOZB9poxTwBOb8kkTeb
         jHYtDDWRqR+xlgbZcx6CMtTdgqnAYUd/ra5RXfw+7I2fddkm1uCSY+kduWRFdeGwpGs3
         MWvAU3CCMwyntwxzh7Zy/4jGno7xx9FrcfctpZhJEf09rNopzj7BHw1OvYREL/t4G2h+
         dHNcyVdSwlPwxP1MpM2xCP3fcq90N+3WlEuLEl8Jj1AZqnTtSZsk1SE+2EmmWTBZF46E
         5LTLEj3ccqFbyr/Qon0iI0fEaCf/IspmOZA7Fh+WJl3oiCmQeB0dTJYqlCJAeahDRNRv
         U9EA==
X-Gm-Message-State: AJIora9W5Y6qJsNZQ5Ni4NAIDG/1Rz7/vw/2yAxbXjnBKIcoQVHfHxqv
        v7SNfteSudOzh38zDMd6+IC7cNK3kO1/8Z0SIjZlMw==
X-Google-Smtp-Source: AGRyM1u0MaIJ0uypZPWBkAr2NPKGat9OktcIuoHO3nP77sJq2pHTDV3AU8nizI+RjOYBzF88RInvbapcqca0SsR3g6c=
X-Received: by 2002:a05:6602:2ace:b0:678:d781:2984 with SMTP id
 m14-20020a0566022ace00b00678d7812984mr8968851iov.186.1657537319833; Mon, 11
 Jul 2022 04:01:59 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 11 Jul 2022 16:31:48 +0530
Message-ID: <CA+G9fYvh7Wocueo0hb_q17xaEsnY_qLO8sFnEQG01GpK4rcwYw@mail.gmail.com>
Subject: [next] arn: PM: domains: Delete usage of driver_deferred_probe_check_state()
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Saravana Kannan <saravanak@google.com>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next arm BeagleBoard x15 device boot failed due to the
following commit. The x15 did not event showed any crash log
on the serial console.

Anders bisect this and found the first bad commit is

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

commit 5a46079a96451cfb15e4f5f01f73f7ba24ef851a
Author: Saravana Kannan <saravanak@google.com>
Date:   Wed Jun 1 00:06:57 2022 -0700

    PM: domains: Delete usage of driver_deferred_probe_check_state()

    Now that fw_devlink=on by default and fw_devlink supports
    "power-domains" property, the execution will never get to the point
    where driver_deferred_probe_check_state() is called before the supplier
    has probed successfully or before deferred probe timeout has expired.

    So, delete the call and replace it with -ENODEV.

    Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
    Signed-off-by: Saravana Kannan <saravanak@google.com>
    Link: https://lore.kernel.org/r/20220601070707.3946847-2-saravanak@google.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 739e52cd4aba..3e86772d5fac 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2730,7 +2730,7 @@ static int __genpd_dev_pm_attach(struct device
*dev, struct device *base_dev,
                mutex_unlock(&gpd_list_lock);
                dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
                        __func__, PTR_ERR(pd));
-               return driver_deferred_probe_check_state(base_dev);
+               return -ENODEV;
        }

        dev_dbg(dev, "adding to PM domain %s\n", pd->name);



--
Linaro LKFT
https://lkft.linaro.org
