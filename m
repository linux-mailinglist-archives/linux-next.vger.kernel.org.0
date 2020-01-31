Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEC714F0B7
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 17:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgAaQj1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jan 2020 11:39:27 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:37788 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgAaQj1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jan 2020 11:39:27 -0500
Received: by mail-wr1-f54.google.com with SMTP id w15so9418752wru.4
        for <linux-next@vger.kernel.org>; Fri, 31 Jan 2020 08:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xb2LTxic4/YtbR+3UHQXrlFlUdN+J5mO1EX86uhUAW4=;
        b=X5c5EgGu6qGQWQve8nTJhKZpIRmyE+VZ3GCu7tv8ArBD+ve5y1sCQOJ03G/63pU3re
         19+fsn28K5v0EWQ5QO7tsahGBYcIHB+uX/zIxJQrAjBi+VwJJ5OxsPxgs60jetEAHg0U
         4tS8STK+s1HWFkWyHpmuKL+/IetvVpQNKxZhyOZuSDlwLOP6Obgh/FpNnsu6aiLGK4mw
         FcnWSfcjVh7Hmj3guaSNzxNu45Gv8eekqqcKEaajNmgY45/99jMS6PaJeKj25jEUCS0I
         zhcCBXxb0HFNllCqn5ZFFCY0JVx2M7dXRLglaZghgUcJ/3EkLna7tBIdorT6PLZYzrL1
         FSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xb2LTxic4/YtbR+3UHQXrlFlUdN+J5mO1EX86uhUAW4=;
        b=izbgV6Ao/wb/KrFTpYQD1heWfCEm5a6xzDSnxm5gbsDGWZ/6hcFxjUFHInENGKRzm9
         vdRz8A2j3bxFIeUGIJEU85Z1n246EsT94ZgA0l69BMTDIgaKnuFmCxhzKM5O2ecMGIVF
         MKWR3smWZ92Xm/3Hm5Srq4H3A7JFHFOflnPHu4+w3nGgq3nncidDfjjKh/nH9stnBdgG
         PGTJaygqNueaPSRH248hLU11FvyofTq3iT4Lgj8rBUSToiFU/Ue+iZK0BNGz8lX0kBII
         ODK/5R/l4yLTcy8Ujg2aO558rgR6SNGQSBx70GUh6PSJmO1UNFoZo/zU+kfBA/W2ZDxc
         D7BA==
X-Gm-Message-State: APjAAAU3xZzO6k8sa8fCIbncLgPd5WJogOM3lJX9PIBbb77u4fK5LzLB
        ik3KfcOjemMhalHH9TVOTBkFHGO30Z9zpQ==
X-Google-Smtp-Source: APXvYqwxjhuxQ/203vMuRlLGhebB0lTSUss2ojZOfCbGQnGMXT5EF9XLRl5B50mFlFxO9crHbBvDHg==
X-Received: by 2002:adf:e5c6:: with SMTP id a6mr5885067wrn.185.1580488763600;
        Fri, 31 Jan 2020 08:39:23 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y139sm11588099wmd.24.2020.01.31.08.39.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 08:39:23 -0800 (PST)
Message-ID: <5e34583b.1c69fb81.6f742.3f6a@mx.google.com>
Date:   Fri, 31 Jan 2020 08:39:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-7780-g420617c9e573
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 62 boots: 2 failed, 56 passed with 3 offline,
 1 untried/unknown (v5.5-7780-g420617c9e573)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 62 boots: 2 failed, 56 passed with 3 offline, 1 un=
tried/unknown (v5.5-7780-g420617c9e573)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-7780-g420617c9e573/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-7780-g420617c9e573/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-7780-g420617c9e573
Git Commit: 420617c9e573e02af57c38d767b63ca4fe4461e2
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 46 unique boards, 15 SoC families, 21 builds out of 182

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.5-5439-gb111=
1a46ce07)

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: v5.5-5439-gb111=
1a46ce07)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: v5.5-5439-gb111=
1a46ce07)

    sunxi_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: v5.5-5439-gb1111a46ce07)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
