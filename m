Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52D33C4B75
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2019 12:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfJBKbQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Oct 2019 06:31:16 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:35328 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfJBKbQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Oct 2019 06:31:16 -0400
Received: by mail-wm1-f51.google.com with SMTP id y21so6411749wmi.0
        for <linux-next@vger.kernel.org>; Wed, 02 Oct 2019 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oD3W05Jc4GNkBzlQvezKO4GozR6ImlTkkuhMli9qugg=;
        b=hss94sny1b95hHC00zkj/SXevgtODBK398ZNgLcayU27nmYzY6eQ6Z0bQ8VMvej/tU
         OBxEEjjhcKwY9PJpN3MLwhhZ9Zhy1ZIMwJN83o8Ip0dcmDUWg+XL4M2mJtt6qKZ7EbjN
         scD5zniXybbRYP+QNkyMDo4KTmEk7bDBV1C2KqK+gdKfEmrdavw0pbsONLkqUFsMOCmf
         jYoVx+nAeSX2BzLN250int5TUrZEkO5N8OBmJHCnEIuOHSEVgoctGGY+I7i9uNKHhfjg
         W5hdyX/UEYmWaiO6DWQI63E8Nvi/NjmwHwE2zG4Ie4DRZwc+xPiZJp838SNpw5QEnZ+o
         b46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oD3W05Jc4GNkBzlQvezKO4GozR6ImlTkkuhMli9qugg=;
        b=OQ/+bRRRjHMdo8RvsXSCjrhZvNKI2nM7He/K+J+xqQ8JXq8clgghRN3VGQyQXPuatG
         TcD3o7WVnWuwrecxyLv/hwZ/182LFN9rlqQUuxvSDhXjEkbkTK32fuWqEdgUCeJhag+/
         D2GXQKZUDsQ5ISemHLITiuwTkbEm56hF3vv5YgUj6mNLzcnv9/1R+JSSwALsiq8GvvNV
         iwgu+pjXFJKJ2AXaJ5I9yNNl1qoJPA4W8ohzrxJu1boqSR2IXu5UnxqCmy4AIw9iY3US
         oDbKi49+SQU74IHWhRBhcc1QLQUvJdYKNAQmYPXkc41UpB9afiEViymXkL9J6FSbIvMf
         97Kg==
X-Gm-Message-State: APjAAAUXZNio9Ctt2HCXbfkTuC05SPGNA6aF9kdokX0lpZvHB7OCV20A
        LalmnYdaMgpLLOdIFwH8cbc7cnMzRflmRQ==
X-Google-Smtp-Source: APXvYqxnMZwAsfFbl/hX6SHqZpivdIaqJYJBJmhq4Nk7RQ6TVyg00VZPQSpcIdWa/kjDL8vuughGKg==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr2203725wmb.158.1570012273724;
        Wed, 02 Oct 2019 03:31:13 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b7sm15921125wrj.28.2019.10.02.03.31.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 03:31:12 -0700 (PDT)
Message-ID: <5d947c70.1c69fb81.eb894.6f02@mx.google.com>
Date:   Wed, 02 Oct 2019 03:31:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191002
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 258 boots: 10 failed,
 247 passed with 1 untried/unknown (next-20191002)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 258 boots: 10 failed, 247 passed with 1 untried/unknown (=
next-20191002)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191002/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191002/

Tree: next
Branch: master
Git Describe: next-20191002
Git Commit: a32db7e1172439240202b843642465618498170d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 57 unique boards, 17 SoC families, 22 builds out of 218

Boot Regressions Detected:

arm:

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20191001)

Boot Failures Detected:

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig:
        clang-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
