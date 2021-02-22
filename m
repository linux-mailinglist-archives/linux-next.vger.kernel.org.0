Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4182E321E7C
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 18:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbhBVRsv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 12:48:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbhBVRsk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 12:48:40 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADA5C061786
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 09:47:58 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id hs11so30840023ejc.1
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 09:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=fyP7UwKRMN2zq6eNmDTOnJj19G4PIaEbS9WKm7ZygBE=;
        b=PUrINC2SBWq6oLLobOQEgSd5bYjPLN+TttmGuyDxk7mUSCKdaGtum3Bi4TqRO/a+jb
         q2NgYvr80nLicSi0SY2Bm+IJaMvs8io4+QEyMaX1raFxzKrPP7n3UF2l3SgKyblD5w4f
         +jAI+NJzhkTKcy8QZNUTA/HEoZG8yH1Gg1MgnPTt297iQoP+U03RLlIdSQ9cEQOL9+yd
         7fky7ML1RSDuETwD7ZV3YOKS00EB61QH6gRp3klTDET214akipsx+Zdezt716PCdo/kF
         iOpoJNTLOiu83r3Yz0ZAM6bKYr78G42fPLqd/tWfhJyGz1Ii8pdnqsNQvRvwjfGDbQZF
         6v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=fyP7UwKRMN2zq6eNmDTOnJj19G4PIaEbS9WKm7ZygBE=;
        b=e7glDRBI8+pU/cZILFnJ7gdMa0862YLSJ4IqHcy92+IXNlmcVvBw6TFMDfseDiJEcm
         PfTGYSdeCjoLvIGPL+hk7qCShmZ+S/kZW9A7XmZAxjFplQlvJV1PnnwwEY+PydDyuCNQ
         8p3zMQxBMnCxVCrnqUSvOsJO/WyCNYReZLCjI4o2aUVHYZdOtzNfF6BQnLyZUuYhL08N
         BK05hH8DC99EcJ/cw+bqVqhkt/+OTRKLWnKXBkGiT+lBTAWuWu6XyPWwoiPhwfQJXLHo
         QrYuGTlSk47wuP/E11olCJWshpVjdrqFWG/95KIc2Umvt9gdqZYVRV1eZ2ECVm7QFG0I
         Yo8Q==
X-Gm-Message-State: AOAM530kUc4+i3D1yx7i0/MYyVmal6bQAxNgNeYPmNjXgOALrAcIbvZM
        tw7Ofxe/+Ui3qfvxz/a0Qa/oXM8Z3Gt8Yy0Y67JkWA==
X-Google-Smtp-Source: ABdhPJyyV2miN2e5V+Rf7k3+ZmPpPyEilWYcd0JDgLzCgVsL2QNBLJ0aDsCiJ9oUCgCOSwjEAHhgmzWbIhVZy15DIzE=
X-Received: by 2002:a17:906:444d:: with SMTP id i13mr21382620ejp.170.1614016077640;
 Mon, 22 Feb 2021 09:47:57 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 22 Feb 2021 23:17:46 +0530
Message-ID: <CA+G9fYtXHHfLEd7+v05gG=1uMqWskTPof-4mrCnZ=xWZNgfZ7w@mail.gmail.com>
Subject: riscv: sbi.h:150:1: error: no return statement in function returning
 non-void [-Werror=return-type]
To:     linux-riscv <linux-riscv@lists.infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Atish Patra <atish.patra@wdc.com>,
        Anup Patel <anup.patel@wdc.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following riscv tiny and allnoconfig build failed on linux next 20210222 tag
  - riscv (tinyconfig) with gcc-8, gcc-9 and gcc-10
  - riscv (allnoconfig) with gcc-8, gcc-9 and gcc-10

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=riscv
CROSS_COMPILE=riscv64-linux-gnu- 'CC=sccache riscv64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from arch/riscv/kernel/setup.c:29:
arch/riscv/include/asm/sbi.h: In function 'sbi_remote_fence_i':
arch/riscv/include/asm/sbi.h:150:1: error: no return statement in
function returning non-void [-Werror=return-type]
  150 | static inline int sbi_remote_fence_i(const unsigned long *hart_mask) {}
      | ^~~~~~
cc1: some warnings being treated as errors
make[3]: *** [scripts/Makefile.build:287: arch/riscv/kernel/setup.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

step to reproduce:
------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch riscv --toolchain gcc-9
--kconfig tinyconfig

build log,
https://builds.tuxbuild.com/1opbLmoztDBhgUOMidDILjVsQys/

-- 
Linaro LKFT
https://lkft.linaro.org
