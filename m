Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060CA7B2CE2
	for <lists+linux-next@lfdr.de>; Fri, 29 Sep 2023 09:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjI2HMG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Sep 2023 03:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbjI2HMF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Sep 2023 03:12:05 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F2B01B8
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 00:12:03 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4525dd7f9d0so5732148137.3
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 00:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695971522; x=1696576322; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FmZRKIigA0ykCxEY+0N4Kzqi58uY5WB+JX2QZumaAss=;
        b=N2j3Gh7Ty2BGeKtfvJ7txtjEUeQyQFGT9stn4jg9FeHuXXVMTUbLB7awbwMXhK6ywh
         zxOaZrrk/gmOMPD7HpLJiPRE5pZHu9lwsdAV8iZkZDsj6JDwcXBCQV38DPrbZiszzS2+
         ihtXTPWKCy42p+H3ZWEjr7GvGweiXARKPhbvOq7A1bwOwcxjuPSTF2PmauwMsnvK7lrK
         D7YYgVYdieYIA1j+HUcMJGb1noI4GPhal0/GT5ZlkX5PluFF77akR3R/4M2GfJhWoRKA
         0S4B6USRZw0q0dVpz36Dy6bQsvtAscDtSU5w+uM15YThg8EABOVvrZiRUNfUPHuO5wtP
         h4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695971522; x=1696576322;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmZRKIigA0ykCxEY+0N4Kzqi58uY5WB+JX2QZumaAss=;
        b=AXgQTVsQ9ajUyn5PqC0fa6lTBm6pHbjU8IDx1Zd3A6mccUZjiXWF2HPe/D/K1GhyOY
         +GGg+ORb1EpO6IEkY9vOA7k4lfh30dFv9Br5NqYgA4O+s7FC6ZDwzjVOoWY6zXXEoMRp
         DMYkr9CG8KORF6qDq468vD4nxRlHuJxcdMhvlj7HZNIDJo3P0PqJSdCqzBZUnFB1W2+A
         Iik0UJPbFhiCF8pe0N+yBIZSZrYrm79SpzW1bseV5cUuhY4xXX+zcVl0X6tHnwCo0ZMD
         63FGkSNgzZPUQGBCesm8SzUe2bYWSPtLEaxDwgDiUGQcY8/ACL2+lvmh+ddyhbNUSnjn
         C4fA==
X-Gm-Message-State: AOJu0YyHgEUSXKJK8qQDs6vowm3e9zN7HHs+pi0yOoWMolHYNyP4mdje
        r8kVL23uA7VCEVCGGqU/xdKubCoMMxIrFyEhRze0VMRCXg6vGHGH1IJV0g==
X-Google-Smtp-Source: AGHT+IG10QdAXHqWImprqOK2ab4qL9hNrpt7NoJ9tjYopqvquES3U0KG9GK4LYgWv/fxOAXFbhWSv2DwMh5uRl9UW2U=
X-Received: by 2002:a05:6102:d4:b0:452:94b8:2fe9 with SMTP id
 u20-20020a05610200d400b0045294b82fe9mr2543051vsp.21.1695971522079; Fri, 29
 Sep 2023 00:12:02 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 29 Sep 2023 12:41:51 +0530
Message-ID: <CA+G9fYu2DKDxOEFTeJhH-r_JD8gR1gS8e4YsSrW3rfGegHR4Sg@mail.gmail.com>
Subject: arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined
 reference to `crypto_has_aead'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        linux-snps-arc@lists.infradead.org
Cc:     Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The arc defconfig builds failed on Linux next from Sept 22.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
-----------
arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
to `crypto_has_aead'
arc-elf32-ld: net/xfrm/xfrm_algo.o:(.rodata+0x24): undefined reference
to `crypto_has_aead'
make[3]: *** [/builds/linux/scripts/Makefile.vmlinux:36: vmlinux] Error 1
make[3]: Target '__default' not remade because of errors.

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145384/suite/build/test/gcc-9-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145384/suite/build/test/gcc-9-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230928/testrun/20145384/suite/build/test/gcc-9-defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
