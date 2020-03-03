Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD0C41775F6
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 13:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgCCMea (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 07:34:30 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:45122 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgCCMea (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 07:34:30 -0500
Received: by mail-pf1-f171.google.com with SMTP id 2so1379059pfg.12
        for <linux-next@vger.kernel.org>; Tue, 03 Mar 2020 04:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CPj5N7imu27rF8A4KRHvvAsY7sq+SvO10gKuGK9otMI=;
        b=D5NJLkthUib3Y2ClaH1W6qbs67Bl7R/cXN5f9UQIMVwcS5eOlXBd9m1bkaOm9RnVRY
         JMzjYbX0RMxJSVVayE3Cg/yb/jDXVAbm5BfjqnwK8OQu3WvBfN27ovjtcnHgaU4pjClV
         epPoBj70afEaQAZ6IPJvj+CnYBTdvFC1yqfsmOcDhxF3eEMGVjag2MHj0vp1LfEdzcBu
         P2t265lFJnWZBcFl3oW9l67AGtm0uWVvq1lNnyHkrEtMgINlVio2fohrzc6NZXZeJYz+
         +48FqeOUcVeLwwmZtOCx0eeA9oTydgglorsIGs1K5Rv9hxfBz+IpDURIMuBxZ3Ejw0kl
         M/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CPj5N7imu27rF8A4KRHvvAsY7sq+SvO10gKuGK9otMI=;
        b=Y6B11B1t+ipbPHXT9UJlZqyxS0v95JgctnlS/zYXTJFxaYm0HzMtU5VW/AZqbOw/F3
         91TL6AqZLplypRlQq7lFUsJwrEG6HvYZSG/41OcSUeB2zWgiE/E2Yrrd48CSu4NLt7CB
         Tisa/5axoMjF70/D6GP5StoxbedIemhYSdK2qE82V8krgGLgOEHJ+lzu3Ou4vb2VjHx6
         /CS5qTGHjebGY/Z5O6DMjnVXD9SCpE9+qPKGKmEb+qRQE5IzeAmpH/3IY19Pl4tbH9qg
         KhwaknIcnQWPkHlgv6D4uw38CVyUrSvkuJwRkpzNl8XIrT3eKuMw1CI6+C4XuK526k5Y
         gP9A==
X-Gm-Message-State: ANhLgQ3N0TCBw462s/dQuJVBkd1T7pICy7Ytn7n7LfjI12UYjv1S8f2n
        ry+0zSSmcsA+vgDXTiEMUIA/HyqAdkE=
X-Google-Smtp-Source: ADFU+vvfhMHTV6iezbaUrf+SJoi0DMZmkSpxP4e3Hjm7tlyBrX8apFs0I8I0gk/gceWIAMO7yy+a0w==
X-Received: by 2002:a63:dc0d:: with SMTP id s13mr3732978pgg.129.1583238868956;
        Tue, 03 Mar 2020 04:34:28 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z22sm3922768pgn.19.2020.03.03.04.34.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 04:34:27 -0800 (PST)
Message-ID: <5e5e4ed3.1c69fb81.da127.a7cc@mx.google.com>
Date:   Tue, 03 Mar 2020 04:34:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200303
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/master boot: 109 boots: 6 failed, 103 passed (next-20200303)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 109 boots: 6 failed, 103 passed (next-20200303)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200303/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200303/

Tree: next
Branch: master
Git Describe: next-20200303
Git Commit: e78aa714e3261e23c7413fd6e719820e271ff128
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 59 unique boards, 13 SoC families, 21 builds out of 329

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 14 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200302)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-baylibre: new failure (last pass: next-20200302)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

i386:
    i386_defconfig:
        gcc-8:
            qemu_i386: 1 failed lab

---
For more info write to <info@kernelci.org>
