Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FB0161CBF
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2020 22:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729016AbgBQVXF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 Feb 2020 16:23:05 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46116 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbgBQVXF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 Feb 2020 16:23:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so21414351wrl.13
        for <linux-next@vger.kernel.org>; Mon, 17 Feb 2020 13:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=O567mvCA+yazzfh/RMHw88iQ3meEjD9ib39JrzlWcHk=;
        b=Jn0Twtfa6IZ2hw4h/HHiUVoC5ZBTG+rbLRrQw+0aySqvNRnlJa1GH/lj5YOPwyIDo9
         4bZT4wdaBv2fpHlYKIrHCYAgkU+Fo0Ad6LucuLONr4jxBzII5ST6UijKCIQW8XvdZ7e6
         CoVhSdp099qrdxhY/8gClQrg7q3NeQzSuqC6fdXDaVfV24n0DfdSRtXrrPLRmxmyh4BY
         xsDXxRBcLf3FQ/fRmdBZuPV2Uhg0dsHp+gBD0tBYZ5jbWt2w9CPz2WIzGWcfLCo8wJkr
         IaTkBMJLXDv7iQjvamUr/Jcy5DsFj6f+T3/7NzhFgJo1uTCvJWR39fqGulcsM2xN8hxK
         1NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=O567mvCA+yazzfh/RMHw88iQ3meEjD9ib39JrzlWcHk=;
        b=JvlYTRvXLa/vWRjgh+DEb/23DDzhavdYA8YABcoSatSRxL2JQvAGBgwd6FF1Vf3u3F
         +TleHgNmOYPEl+p44o+dNBcndWOUdgrQ0SE/ikgOZ/HtqZebaLjM6GNr5yc/AsH3uRc+
         u3YOz8B7s8uUgKZ58CVvwhAxKVmJBDyDhGQk5eyQsqhGvRhe9Xck7hUiOoPHLXl64hcu
         6YfatzxW1vMPPmvuw+jeBQjJ1eaiGj6/6V+8KH+/1gQOWxjNDhfZNPg46+DD7wiPVVi6
         ELYR8TYTSuL54NDBtnFF3xvo8PgHiQhe1NNHAkshkt24OqWG1vpHR7Ct5rt1guyB5X5k
         95AA==
X-Gm-Message-State: APjAAAXQxubeIb64hwDZHjV+V7EO/Gf5/YeH49NkHei7UFiN5wVC6Eb+
        AfWPzAClEeRITMU+zoyqxQeqSiiR0A6CsQ==
X-Google-Smtp-Source: APXvYqwC5rftLl0KbCZUUjgWe6+xEH49eWD+n9rtompArUSGSnAFIthL8jZaaMSxSarzeM/ESeExsw==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr24315673wrp.1.1581974582690;
        Mon, 17 Feb 2020 13:23:02 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k7sm801126wmi.19.2020.02.17.13.23.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 13:23:02 -0800 (PST)
Message-ID: <5e4b0436.1c69fb81.ebc94.4151@mx.google.com>
Date:   Mon, 17 Feb 2020 13:23:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.6-rc1-553-g98fb8f80927f
Subject: next/pending-fixes boot: 87 boots: 3 failed, 79 passed with 4 offline,
 1 untried/unknown (v5.6-rc1-553-g98fb8f80927f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 87 boots: 3 failed, 79 passed with 4 offline, 1 un=
tried/unknown (v5.6-rc1-553-g98fb8f80927f)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc1-553-g98fb8f80927f/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc1-553-g98fb8f80927f/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc1-553-g98fb8f80927f
Git Commit: 98fb8f80927f8f95c1022542f50c1f15176e8316
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 55 unique boards, 20 SoC families, 20 builds out of 155

Boot Regressions Detected:

arm:

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.6-rc1-279-g2e409d666=
4fd)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: failing since 3 days (last pass: v5.6-r=
c1-279-g2e409d6664fd - first fail: v5.6-rc1-311-ge58961fba99f)
          sun4i-a10-olinuxino-lime:
              lab-baylibre: new failure (last pass: v5.6-rc1-279-g2e409d666=
4fd)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: v5.6-rc1-311-ge=
58961fba99f)

Boot Failures Detected:

arm:
    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
