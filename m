Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A333AB508
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 15:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhFQNll (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 09:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbhFQNlh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Jun 2021 09:41:37 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4ADCC061768
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 06:39:28 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r7so4026867edv.12
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ESEPPl9d4dEAVLZa/sUKUFHN4c28wM7cE+41nav9L7Y=;
        b=lUtLXBpt4NLsbS7Pq8vw6rZO5Ymafm7ihGaD5x554aAjZSb6HNaxIyh7IqrTB9oZh9
         SK6fKKx5c8nKoSkBpeFqBz8D9xsSKoEOnGarV+feen/EaVLB6WOk5Jg/09wnb/BM3QE2
         12FRnZFooqQPUeQuv9Fp3r//vyrkcghByj8mGovkjjioZZy/giMM94B1UNsZGJayIVrH
         US6NQJTxjOG4LT1cKdeaQaHGrTWuTUreD75NyBkXmdleUM7vNKhK8HdhcUiHCxHcVHcT
         cc68JIMNceRjHh7qYw/KStTfuVzZWjnohvctnEcU2EK2IsSrmrovSVovp3bEgfkGjGvg
         CUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ESEPPl9d4dEAVLZa/sUKUFHN4c28wM7cE+41nav9L7Y=;
        b=rqmK0arLrQJpiFQyg4SmHgdt+h3bb5bk7gWzDTxZVXfmoK+RD6GUI1pwEJIX882rVE
         g47u2OzvUwNpUiITWutyAreh/BA1j/rdKM80MS7IqSSLi8O4dyZPkxBxRANDajIfTxme
         fk3Tjjl1E/Dj5Yr6HpUreW5x2u9E9vXVqo1BVkf3VKtIgrkkqRkJvr3Gk1PDBdnXoa9t
         ffH/YvPIDHw8D6vqlcSo7OI8h+JdXC2cPwSgP4K6gnK4X1Pki+xEQz0Q8gqqLBwQwZCR
         b0vP4Cwt6jjH84iodfG+SxEHorOcADDBexBaNgloWz2lH/InhG1CXUhRFC75KE3ugl9G
         QYoQ==
X-Gm-Message-State: AOAM531AcG6GQZweVmvID7IZ9JsCRJ8sYjhvUJTHU4yoF/BIc0cyhK7b
        Z/J/W2UTbuk80hZxwUyfd8OzraNY14jVZC9OvePjaJ0LTKC462lD
X-Google-Smtp-Source: ABdhPJy8zOR+7A2Z5OnmE05NwL+BiKr3dgm+2j/ug/AZ/jlG4cI68SkBuiJ4ynNuGURvVChxeepIuo7i3TGTjxhf2nM=
X-Received: by 2002:a05:6402:22fa:: with SMTP id dn26mr6438897edb.230.1623937166788;
 Thu, 17 Jun 2021 06:39:26 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 17 Jun 2021 19:09:15 +0530
Message-ID: <CA+G9fYu6er1nZ602gCnrY+-JNtDHrUJk-RH2biPmjRoe06_m4Q@mail.gmail.com>
Subject: [next] [arm64] allmodconfig build failed - xhci-plat.c:427: undefined
 reference to `onboard_hub_destroy_pdevs'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.or, lkft-triage@lists.linaro.org
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The arm64 allmodconfig build failed on Linux next 20210617 tag due to
the commit,

c950686b382d ("usb: host: xhci-plat: Create platform device for
onboard hubs in probe()")

build error:
------------
aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
`xhci_plat_remove':
drivers/usb/host/xhci-plat.c:427: undefined reference to
`onboard_hub_destroy_pdevs'
drivers/usb/host/xhci-plat.c:427:(.text+0x82c): relocation truncated
to fit: R_AARCH64_CALL26 against undefined symbol
`onboard_hub_destroy_pdevs'
aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
`xhci_plat_probe':
drivers/usb/host/xhci-plat.c:379: undefined reference to
`onboard_hub_create_pdevs'
drivers/usb/host/xhci-plat.c:379:(.text+0x131c): relocation truncated
to fit: R_AARCH64_CALL26 against undefined symbol
`onboard_hub_create_pdevs'
make[1]: *** [Makefile:1252: vmlinux] Error 1
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:222: __sub-make] Error 2
make: Target '__all' not remade because of errors.

steps to reproduce:
--------------------
tuxmake --runtime=podman --toolchain=gcc-11 --target=arm64 --kconfig
allmodconfig KCONFIG_ALLCONFIG=arch/arm64/configs/defconfig kernel
modules

Build:
--------
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 7d9c6b8147bdd76d7eb2cf6f74f84c6918ae0939
    git_short_log: 7d9c6b8147bd (\Add linux-next specific files for 20210617\)
    arch: arm64
    config: allmodconfig
    toolchain: gcc-11

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
