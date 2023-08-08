Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B063773FBC
	for <lists+linux-next@lfdr.de>; Tue,  8 Aug 2023 18:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbjHHQw0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Aug 2023 12:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjHHQvL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2023 12:51:11 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4664B8D4
        for <linux-next@vger.kernel.org>; Tue,  8 Aug 2023 08:57:54 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5768a7e3adbso98035087b3.0
        for <linux-next@vger.kernel.org>; Tue, 08 Aug 2023 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510255; x=1692115055;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y6sSetytOmUwyBC8vzBUgi7mxtEE0jfVhWzzVyZzcSg=;
        b=Ct3zPH6LaPEBmRtOY1FLMh4cZ/vtNXYKzICstcrMflGtW70Y3PFBJH5KIpW2Y2b1Am
         nJmKYoLaU7UkML0QdpGR3wSASPo8K4fiaSm1psqth9O8mVN9KLKzyXN9cp35g+T3GgIl
         iwwuwvJ9jnAlVCN9ZE9/jCo6K9+4J1FqjmIAH2GxFu4/vde58GNkm2VI0W/L4eIDqR8Y
         I5O/KESsr6YHPhNhdi4Y7niUaS94LTIlex0GpekpmmfEubHohp89vh2THtXzY6sF4CHJ
         G8Dp4tbioxGOPIk/xquVmfbZzcz32vhkTNDJyZ4FgFLRgxvQuAZgmb6BsXI34pcZdNYB
         veuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510255; x=1692115055;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6sSetytOmUwyBC8vzBUgi7mxtEE0jfVhWzzVyZzcSg=;
        b=jpGbzjWcRHKLU6O6UmwJ+cUKBO98CQdNLqDFeVAlFxis5uanMeEm7HnZEZOA4089XP
         G7kIlx7ea95ePLaSk9efcjY3fLLhgPK6ejvTzVa8b5mQKrHW+NhxsyhpsnkPLmog005N
         D7IiQRAKUc7VxZ2drhulN3If/6gC3MC/2Wjzq3NN7JPvRYGL3zn9EW2vNztB8016504m
         RrI48DjID7KS5d02R/pAjALBfdlVRkBcMTBJevQ6f2NeFIexWE8Wj9E4xpUo7yl7iSai
         YHstzbmXjkP4RvasFRx/VQInkQbeT0m+ZjvX+taZTYZImCXZHEsgswibwNnf9o40SjUA
         nJsw==
X-Gm-Message-State: AOJu0YxE3TGFnm5x8LYzPQHa9CogZIK0/I5UhpxvrIbwq8VjMvTJEnSC
        jEjCr6EPDT8zyi0vlJx71LsQQwqee+w+IQunYuFWV6yl4PJgQuc8OGo=
X-Google-Smtp-Source: AGHT+IHtywQ8e8sdcBJ4nEsVchvTc5SRUSLKPPN/CcX+znemohbI6SJix20yoRk10mpcbIo22CBF5AHYdgr0wG7ZGcU=
X-Received: by 2002:a05:6102:11f8:b0:43f:3426:9e35 with SMTP id
 e24-20020a05610211f800b0043f34269e35mr3147137vsg.12.1691478715881; Tue, 08
 Aug 2023 00:11:55 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 8 Aug 2023 12:41:44 +0530
Message-ID: <CA+G9fYspyEdT9wmVpL04J-p0CwqA+_v_L4H+ihY9VYqpCMmQ1Q@mail.gmail.com>
Subject: next: mips: cavium_octeon_defconfig: gcc-8 - dwc3-octeon.c:502:8:
 include/linux/compiler_types.h:397:38: error: call to '__compiletime_assert_335'
 declared with attribute error: FIELD_PREP: value too large for the field _compiletime_assert
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org
Cc:     Ladislav Michl <ladis@linux-mips.org>, Thinh.Nguyen@synopsys.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[My two cents]

While building Linux next-20230808 mips cavium_octeon_defconfig with gcc-8
failed with below warnings and errors.

Build log:
----------

In function 'dwc3_octeon_setup.isra.4',
    inlined from 'dwc3_octeon_probe' at drivers/usb/dwc3/dwc3-octeon.c:502:8:
include/linux/compiler_types.h:397:38: error: call to
'__compiletime_assert_335' declared with attribute error: FIELD_PREP:
value too large for the field
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:378:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~

  Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
-----
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/history/

Steps to reproduce:
------------
  tuxmake --runtime podman --target-arch mips --toolchain gcc-8
--kconfig cavium_octeon_defconfig
   - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TgoAZwerJ28UWHyqfQUiaYYhrl/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
