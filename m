Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B055758204A
	for <lists+linux-next@lfdr.de>; Wed, 27 Jul 2022 08:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiG0Goh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jul 2022 02:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiG0GoW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jul 2022 02:44:22 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECDB3B94B
        for <linux-next@vger.kernel.org>; Tue, 26 Jul 2022 23:44:10 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id j22so29858655ejs.2
        for <linux-next@vger.kernel.org>; Tue, 26 Jul 2022 23:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7iMcplvFrFuS0xFVwfzryrkAohaVYhMLEybsQJs2rsA=;
        b=wdNXLAVsJZXFL2rKCa3aEnt3bq3gpHY9nBUggNpE8tRM8PxMeNxMk/ZwyuT71cBCtZ
         rTugaTBqG8u902DbJmnCeCRsDXDNc4JYq/CxgSRXx55cTVXN/uEU8DYRnmEhrv1IThR8
         AG1awXakW1QzpqwZsNlS7sbL4ekY2yRJeq0STmDhS1oxJDaIR05WFq2H1f8xFWSg+hmB
         wZjuUG4uVj+LPb7oAMyFhmaG3SEA2388vp06upiX8Qd01YdZyzYgPkTPezl3edWRvP3q
         GA0yzKIm/jifVprE02zD3rEpbeCLPB1+DIwtrXQF4a74fW6TY3jV2nP6bQRqoAczVtGz
         u/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7iMcplvFrFuS0xFVwfzryrkAohaVYhMLEybsQJs2rsA=;
        b=QyEH4lZiExhvi5pBA7w3NVfvaDQagRS6BRG9AlFFcqdYMRZrk4njdd7DyF5Ifmk3r6
         TDlDCgkne+W8sLxXMalAuL7OQXGujUPTksYKvHddZkJDjhHDh5iBsDGczFl5bOv4+Mp8
         reeCuPjeVSfWqGVvvenFT4NKQbSRDWEkd6K3byGtnYyHoL0ok9Jujb8RVhnaiuMpx7Z7
         pg877hpjUoeoVtX0PJ/vcTKSWmWg8jn8KAE5VF12D/KWbC2J7GSmX+bHjfmCMwStH9TL
         j8AQ8wLsLoLc7KBTfDuACbljQPTH8VDlVg1FYfrRGZlxsGQQfGi0lV2zdIXEhBNbAwlS
         vV8A==
X-Gm-Message-State: AJIora8ocobN17rRX7keov/uNTkow3qpKLbf8CPWJkqJVaA9RPAFWWCv
        ROwpIKe2IqcHvH1zmvYew+r85/S5erLPnp1xFDoImw==
X-Google-Smtp-Source: AGRyM1u0gHfYntmhyu/g5NBuMnMaO3JTwpA7i3/SJp0/ZkN1NFrHb7F3bDasWB7vs6g716IDu0ABdqfE6xZ0h4Zwkmk=
X-Received: by 2002:a17:907:87b0:b0:72f:ceb6:5fd2 with SMTP id
 qv48-20020a17090787b000b0072fceb65fd2mr12586914ejc.448.1658904248365; Tue, 26
 Jul 2022 23:44:08 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 27 Jul 2022 12:13:57 +0530
Message-ID: <CA+G9fYt_cc5SiNv1Vbse=HYY_+uc+9OYPZuJ-x59bROSaLN6fw@mail.gmail.com>
Subject: [next] arm: PM: domains: Delete usage of driver_deferred_probe_check_state()
To:     Saravana Kannan <saravanak@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next arm BeagleBoard x15 device boot failed due to the
following commit. The x15 did not event showed any crash log
on the serial console.
whereas, Linux mainline kernel boot pass.

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
