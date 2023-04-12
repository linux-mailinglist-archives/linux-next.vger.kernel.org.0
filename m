Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE6B6DEBB9
	for <lists+linux-next@lfdr.de>; Wed, 12 Apr 2023 08:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDLGV1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Apr 2023 02:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjDLGV0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2023 02:21:26 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2E810FF
        for <linux-next@vger.kernel.org>; Tue, 11 Apr 2023 23:21:23 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id y17so9419657vsd.9
        for <linux-next@vger.kernel.org>; Tue, 11 Apr 2023 23:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681280483; x=1683872483;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gJtC3FxClBPF9KjFwCjvXT4lKY0caN5jqIDZIqAIYeQ=;
        b=HWsv5qF4EZh2q9Ub5agE8aOHO19UMcdyYlsxUFZYaE0VvqQ1VP62eOaGoSi4R6f+UG
         s25S6HnnkKPQQ8nus5pRlqKJv156P6La7MMiH7/TYbCmaBpVVQQQZvUMzZAVeeaEe0hI
         rC3v3K9S0WOVPHc08gRfG1hmQvc9v3S+NGompZiZaCwnfuc6jplY4jXX7CiIvFSLJrmk
         0YjDM6PEUtyGVHXFMWFRefRiLJlinxYGXbubMiMzPMui+ZngN+A6J/IHOwU3mwz5QQOE
         v7ziyNnz/MGZrbFZB3ddiLrN7h4OqH92GuMVVhybndo+4RWdWoTpI4VGv+JISijkCxbF
         tdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681280483; x=1683872483;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJtC3FxClBPF9KjFwCjvXT4lKY0caN5jqIDZIqAIYeQ=;
        b=nysd7gdGNf7BiJISdgcdeJHtde9VNgYcCVsctYV7y/XVLzQqTmdITE2/+JAL2nRz7K
         3TN+DlIZZIVNryO2IqqywiYcQ9f6TmODYH7PKiYmoDXbCGIPxRkZ0wH3hrVBwsX6C14u
         koqWd9I1HvT8KtHcaWt1BDA/qoUYbDuyeL9pNSi2MQQXin9LGGIPPWL4QFrmoRnJD5pb
         rJyPcibAfTI1C8C9M+A9dpg/3v60kc4LlcEGl+urBTGWP2biwVjYudMzaGlGq51E5L13
         ACQ5Q0D559yRKZo4TbmDw9Tze+rD52k6MJpvRB9TdWfUUzc7v3opog7fwqsoXGgzpOLb
         nKXA==
X-Gm-Message-State: AAQBX9fwGTvF4DYbeMe+h0xWT3s2NwgHXgysKPPxkpTCPhNE33sVKirI
        3TXBQou3xLc/CHZzQvXtM2+uWDvr+l8wpUTbYcx2Dr0obP6pz3PPNuo=
X-Google-Smtp-Source: AKy350a0vqqap07Vvf2s+L+rkB3Oghui8XnIa1r+4K+6Oa05z431j/fJMkzVKOOIU4n2ReUNHZzwlDr1cuLO86EKDxc=
X-Received: by 2002:a67:d20f:0:b0:426:392a:92bc with SMTP id
 y15-20020a67d20f000000b00426392a92bcmr3551765vsi.1.1681280482741; Tue, 11 Apr
 2023 23:21:22 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 12 Apr 2023 11:51:11 +0530
Message-ID: <CA+G9fYsWEYWjPYLOiSuKfsqLzzbvq8p=mATJLahobEhTWOJ5+A@mail.gmail.com>
Subject: next: arm: #pragma message "The platform is deprecated and scheduled
 for removal
To:     open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following arm build regressions noticed on Linux next-20230412.
We need to investigate the list of platforms that are getting deprecated
 and we will stop building platforms.

Regressions found on arm:

- build/clang-nightly-s3c6400_defconfig
- build/gcc-12-s3c6400_defconfig
- build/gcc-8-s3c6400_defconfig

arch/arm/mach-s3c/s3c64xx.c:423:9: note: '#pragma message: The
platform is deprecated and scheduled for removal. Please reach to the
maintainers of the platform and linux-samsung-soc@vger.kernel.org if
you still use it.Without such feedback, the platform will be removed
after 2024.'
  423 | #pragma message "The platform is deprecated and scheduled for
removal. " \
      |         ^~~~~~~
arm-linux-gnueabihf-ld: arch/arm/vfp/entry.o: in function `do_vfp':
arch/arm/vfp/entry.S:27: undefined reference to `vfp_entry'
make[2]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1

--
Linaro LKFT
https://lkft.linaro.org
