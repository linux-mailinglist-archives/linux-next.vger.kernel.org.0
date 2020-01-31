Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F0414ED38
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 14:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgAaN03 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jan 2020 08:26:29 -0500
Received: from mail-wm1-f52.google.com ([209.85.128.52]:53274 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgAaN03 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jan 2020 08:26:29 -0500
Received: by mail-wm1-f52.google.com with SMTP id s10so7877151wmh.3
        for <linux-next@vger.kernel.org>; Fri, 31 Jan 2020 05:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0nM3uZBXyjo74bC5A6R7XcGdswANjHHXaSCcgcJxlME=;
        b=wqYPQio5kVUah0Bs5rDtsI6PDMWb17AGI4oy5FD/7eyaNeyWjzyuglAGbCH7oJftFP
         IuCLoyNKMzB7V3QW/A3dL9d3LUSr/HfYAyiaMpxcDg/rXAXSKDUhL6K/Uqqe3RJWUGic
         MqMFVrtciYP+yZuN1//HRYrSUstED81KEaFE4JOC5tmv6ZvsQ2p8JO7uXYClZHwqI08M
         BepocvtdFhAh6w9zOk7B3zsq5E4IxX61/N6EZP/9XhLsHLlYcZ9+KDjrhyM9+JC/X3nD
         GKQ+YGOcQtUe43xo5ypHfnSxWSWQrvAJ9T/wu8QPbb0tqDLjvgaDuhFGlKLalZXRGi8y
         LKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0nM3uZBXyjo74bC5A6R7XcGdswANjHHXaSCcgcJxlME=;
        b=aWarIyLdiuwVwbOH4qGSsMheFzKR6RrNbR28uHKg1gB5sKHYiq5NcbES9Med76lsA0
         /tXS3RJNitJcPHH6sAIIaVTNiGYVFO2hd5eG0pgjICcXvc1JglhS6YZUQ36zmDMvJiav
         8IN0Xto31xOqf2RIHZFQNAcDqly6ba0e2UDjCDcUSwFP8WGWNGAMjEhrgkJ36lQZICmZ
         fY0Pe9mupbC6EsIgW8sw6E+2nKzhgUbFGP3GF/BdcGD42aQFjiadWKtjvWE5a4NRhYtw
         Q8TpJovA5Z2SXapTp/Hq7eCk6AO8xvnrwIZYnv8bpox1BWzDeRWrL3NDzOpfSUN8sHKg
         Jdlw==
X-Gm-Message-State: APjAAAV8GxGEYhG3pfiZHx+Oe78yLVIRzbW6RrfeCQso+Yy/HfMbE/dW
        Y3oNJ+kU4AZB89cszt7nVPTuASQngdMyjQ==
X-Google-Smtp-Source: APXvYqzNnVQ7BMR8AjlEACKq/8IGo7jhBKwZPzKGYVlc+C7WBkXihLqrVEAxFRJ5ag0G5q4DmJcnig==
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr12015633wmf.93.1580477185857;
        Fri, 31 Jan 2020 05:26:25 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o4sm12006711wrx.25.2020.01.31.05.26.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:26:25 -0800 (PST)
Message-ID: <5e342b01.1c69fb81.925c9.5950@mx.google.com>
Date:   Fri, 31 Jan 2020 05:26:25 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200131
X-Kernelci-Report-Type: boot
Subject: next/master boot: 118 boots: 6 failed,
 108 passed with 4 offline (next-20200131)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 118 boots: 6 failed, 108 passed with 4 offline (next-2020=
0131)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200131/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200131/

Tree: next
Branch: master
Git Describe: next-20200131
Git Commit: c8e31a0fc39797784e4b9acae3bd2e0c7bade36e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 65 unique boards, 19 SoC families, 23 builds out of 198

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: new failure (last pass: next-20200130)
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200130)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200130)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200130)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200130)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200130)

Boot Failures Detected:

arm:
    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
