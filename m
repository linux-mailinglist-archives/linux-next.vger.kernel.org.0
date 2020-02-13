Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7059815B779
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 04:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgBMDBF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 22:01:05 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:34904 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729378AbgBMDBF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2020 22:01:05 -0500
Received: by mail-wr1-f48.google.com with SMTP id w12so4840167wrt.2
        for <linux-next@vger.kernel.org>; Wed, 12 Feb 2020 19:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=J8Gy+6wKtQ4kx1s1ogB7AOU64wgkwzHe4XBqoy5NeZo=;
        b=vKVVMifxVHB4ck8aQOAx9/MBLT5bmY3x61AVZpy6WMyVYm45ygmvj29xuh6lWZSMt1
         6mNQrALz4/EEr3SyA0K39ngapbJbZhn8xVILGPUR4Dwx7Oq9ky0tmzKUvh/Zn6W4FHzK
         P7asWCjaURaV3qKZeTnyZXRZJZpaQO5ums5xntVgj/pJBFMQCIBfM3NnFZ96w2KRwbsY
         +By8YFLOFoTH5xUzio39W0w0+JdqnJCAYZoM56GzSXHGdYJiyAsXHfXC3/GHwvwSLcC4
         0qk4uwWCq3hfJwOtdLMCw3ciQr5scLxf2t23So11G4gNeF0v9u2ds2o+siY/y9KN5MLo
         SuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=J8Gy+6wKtQ4kx1s1ogB7AOU64wgkwzHe4XBqoy5NeZo=;
        b=UsBGSiHgAHF3hBhTD7dd61Ei85Fkpzmw2zq0LG2b3WcpnCyI+OAQzfBhGoHc/pZLIl
         X6vVa9s2yY35QjfoiKzp0SY+9FXYLKbuW9+UdeFXQF3/POxrifM4P5DoBBZnVPLvIeCf
         HqdQN7lv/IoNQF1eVAKfprbArBnZ+ynl39O7Y5A7wNJ7UXqBfqhGdTBh2CeNAMy61ChO
         GVVQ5hb/TWSx3lfqRf7YVJZLJz26Ay0scZNF5vOLlAPJyeQX7FKwypmw0s4QqKlOITdd
         qgBKL9yWPS2laQvjSb4JrsvDRTGOgxVrExuBK6IeqHsT39adv4TTmLPczShDhOwGc3vn
         MR2Q==
X-Gm-Message-State: APjAAAU/r12ydqAWu2BlbbAPsw99ahzmYbX6zmvFHaWHUq4AYiask1/U
        NPWsB6sB/5ru+3Z4NNmiHUwGDG0fX5/r6Q==
X-Google-Smtp-Source: APXvYqwA4UAnvEyDYxa+XygEpH2JBlPTxBNEf4X7Fzhu3xCU1BOfaj3XVMiIYwM2h3+kq8K9MPeb1A==
X-Received: by 2002:a5d:5263:: with SMTP id l3mr18405628wrc.405.1581562862419;
        Wed, 12 Feb 2020 19:01:02 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v15sm1040434wrf.7.2020.02.12.19.01.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 19:01:01 -0800 (PST)
Message-ID: <5e44bbed.1c69fb81.b5371.3a7b@mx.google.com>
Date:   Wed, 12 Feb 2020 19:01:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc1-279-g2e409d6664fd
Subject: next/pending-fixes boot: 154 boots: 3 failed,
 144 passed with 6 offline, 1 untried/unknown (v5.6-rc1-279-g2e409d6664fd)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 154 boots: 3 failed, 144 passed with 6 offline, 1 =
untried/unknown (v5.6-rc1-279-g2e409d6664fd)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc1-279-g2e409d6664fd/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc1-279-g2e409d6664fd/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc1-279-g2e409d6664fd
Git Commit: 2e409d6664fd6178aba837697b4d1060f796e5bc
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 22 SoC families, 24 builds out of 179

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          mt7629-rfb:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-120-ge=
3ed5d1c150d)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 6 days (last pass: v5.5-9475-g7c2eb3=
712de1 - first fail: v5.5-9670-g2c46fb8a6882)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-154-g2=
c2a150a97e7)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: v5.5-11478-g1433b2950fa=
9)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-154-g2=
c2a150a97e7)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            msm8998-mtp: 1 failed lab

Offline Platforms:

arm:

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            mt7629-rfb: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
