Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6E5731A9C
	for <lists+linux-next@lfdr.de>; Thu, 15 Jun 2023 15:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344642AbjFON6B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Jun 2023 09:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344740AbjFON54 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Jun 2023 09:57:56 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140872121
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 06:57:47 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-43f5fbfe64cso109487137.1
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686837466; x=1689429466;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gJ7qB9Ep7tkRFvnY4tP6xBdv/LSo3U9AM6agsmPVBBc=;
        b=X1jLzDcwobiSNQVfkgy0tKX2PShVc1mY+QfrQwOUHE3B5ytCla39+sgCglp8OyBtat
         x94JdoGc6u5FqAc8uAJLlBCfJhz7xFlo3Qmm6oA6fyME+Jx0MKAIO0wmPE+RXgU83a33
         DTslpSkjGVhRvBaiTHoujhsfZJmwAqUEPqIiJinO/wAXHSLOLSyxe8pX9A8bhdcO78Dj
         FEDOwz+GBvCsgyGIMSnKodh96o1ILw/+d+YpqCCcu7GtOOqp4q8WfCHMJ9MC2/dfA6dA
         EOCHuOrh+e4pMckEtA9uzHrBB2qI1/LInpGnwgTXFOH8cH3xE6GmRxQrLcB2RKD0PReB
         mVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686837466; x=1689429466;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJ7qB9Ep7tkRFvnY4tP6xBdv/LSo3U9AM6agsmPVBBc=;
        b=N/qd88XDkH5FxliVBPVYjGvurIl4EsLak8xP+EfMe09ltbFhT4XL2JC23UazXud1F4
         MQcjbNI+CIr5bQz7ZUEiNNbOvTdbM3ECBy15Rw1DO7Fbci4l7BACBtomlJ3ZbByTCE+D
         FUK2RbEGHm4XPwsUNOoF+peKEQ8FkWEFDa2+0OJxkXzE7zG7lMHaKXGm8W2YbWlfLADx
         G2PSZkPdNH0rJRivBE2JCDW2GxWkYJcpc1sbvzJmapwsPa5fQKMUZUY8oIzuWM0UMeqk
         D7G16MYY5uPtlEXMOxKHFmo8uOwpGyIu/MyYIoQ1Lk/IKjUqgfg7m/MYJKMyRLtim6CB
         yoQw==
X-Gm-Message-State: AC+VfDy3SAeDLBMVQWKiXOxfFwm5kxXlAchpQFIUeyfyCZBA1uw/Wxz3
        OPSXMV9qk8rHSdOiPvACeuCl4NntBSM/VHLdJsb/8nJlDkt/7O3oUFuw1A==
X-Google-Smtp-Source: ACHHUZ6V6XJA88EStQsUft9YesOuyH69+RyFcPgZWb8Fev65Xgxl95jyWAcJNgJ6pLsIXD14Ui8afmCKgpEET/u6DMw=
X-Received: by 2002:a67:de0b:0:b0:439:5a25:2e39 with SMTP id
 q11-20020a67de0b000000b004395a252e39mr9005440vsk.34.1686837465649; Thu, 15
 Jun 2023 06:57:45 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 15 Jun 2023 19:27:34 +0530
Message-ID: <CA+G9fYsAvbqVr+W4=17sxwguGSQi6cU+9WZ_YQzg3Wj96e70uQ@mail.gmail.com>
Subject: powerpc: ERROR: modpost: "efx_tc_netevent_event" [drivers/net/ethernet/sfc/sfc.ko]
 undefined!
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        habetsm.xilinx@gmail.com, Edward Cree <ecree.xilinx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build regressions noticed on Linux next-20230615.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Regressions found on powerpc:

 - build/gcc-8-ppc6xx_defconfig
 - build/gcc-12-ppc6xx_defconfig


buid log:
====
   ERROR: modpost: "efx_tc_netevent_event"
[drivers/net/ethernet/sfc/sfc.ko] undefined!
   ERROR: modpost: "efx_tc_netdev_event"
[drivers/net/ethernet/sfc/sfc.ko] undefined!
   make[2]: *** [/builds/linux/scripts/Makefile.modpost:137:
Module.symvers] Error 1


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230615/testrun/17530875/suite/build/test/gcc-12-ppc6xx_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230615/testrun/17530875/suite/build/tests/

--
Linaro LKFT
https://lkft.linaro.org
