Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D12C47E2
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2019 08:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbfJBGlf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Oct 2019 02:41:35 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:44013 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfJBGle (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Oct 2019 02:41:34 -0400
Received: by mail-wr1-f50.google.com with SMTP id q17so18169539wrx.10
        for <linux-next@vger.kernel.org>; Tue, 01 Oct 2019 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2KKp/MWu/NhrEMOB2LGLku8/fnkxOc7hqBNMVWuw1BQ=;
        b=kp6IWQ6P+SYfnuZAVcYHvCNPA/zhf8H8C+h++DeO4A5cjTlQ4i/vz3bwziKAw42se9
         HGKbWyRzYdgB/K65XB1evg2pOotfCbQBtMNtwjCAhvXeSPAetj3pcLaRFTw250curP6L
         VLCVNLg42DkNK+6IEtOuu2K4VcNTY1vgqFy336kgaZFNG7DDlTTnYD9U3lxtQxUEmEo0
         bBBQo+eqddyQB0T+D1s/y7VM6K0NeEDJtG37+nmLbfcJ9n3Tdc577GAx79W5KqJJ497v
         aXyziBuMGEcHZoZmoZJJgsz1XU7EboKU0gLgf62DL0AptWS26BbT8wkbyF741icqS+ij
         AQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2KKp/MWu/NhrEMOB2LGLku8/fnkxOc7hqBNMVWuw1BQ=;
        b=kuQ4HyQQTYAXJp2sfjtoeF+B5v+9x3R3dO5gJ1ZOF0uXv49bitELsNbUdhFFPxOvjP
         0g+t+64Er2GzgN9oRXB/8W2mQo22Fats5qwYRZdyCfMVqZqMnQt1vWyWwqWob6TOz8yV
         yJIcIZ963wHsPanBp2HvHrQg6uAyP3TWRksJ4GdWEUsY6afTO3Fh0roOLsqe9WE+XSb3
         teGAdQP7cx/1QzAD6wPIitJ8Uo9gKOjZlsbOl3U6jJu+b0ZykaJ4NBSy5lfSs7fgki7o
         LqCqzTYul4OlT+PYGUWUPLkymYbvO6oU0N5boDjfdTfA036hxFfB5aPE4e1fEJ7MCutT
         Wr0Q==
X-Gm-Message-State: APjAAAWPGb0kxzTcg6mfEYHJKg+DG2Ifndz/9fOtmCCjvxWF/bqr3BSj
        OP362D3lHGL9Ullw59mcpExtu9sRMI0hxw==
X-Google-Smtp-Source: APXvYqzOdjiHABwNwk4z4OAHTpKy5HIgmwO4C5Xejv+1iQfs8e8o4H2ugI1AXorKoENotE7ntVs5yQ==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr1255896wro.14.1569998492599;
        Tue, 01 Oct 2019 23:41:32 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g3sm1819660wro.14.2019.10.01.23.41.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 23:41:31 -0700 (PDT)
Message-ID: <5d94469b.1c69fb81.8d7f4.7cf9@mx.google.com>
Date:   Tue, 01 Oct 2019 23:41:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc1-197-gcd6b2766cc1d
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 232 boots: 11 failed,
 221 passed (v5.4-rc1-197-gcd6b2766cc1d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 232 boots: 11 failed, 221 passed (v5.4-rc1-197-gcd=
6b2766cc1d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc1-197-gcd6b2766cc1d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc1-197-gcd6b2766cc1d/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc1-197-gcd6b2766cc1d
Git Commit: cd6b2766cc1d12e6342a6f09626ac82974aecc50
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 55 unique boards, 16 SoC families, 22 builds out of 214

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 2 days (last pass: v5.3-12689-gd=
20eeb14322b - first fail: v5.3-13311-g8d0cc3a7f82f)
          bcm2837-rpi-3-b:
              lab-baylibre: failing since 2 days (last pass: v5.3-12689-gd2=
0eeb14322b - first fail: v5.3-13311-g8d0cc3a7f82f)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: v5.3-13311-g8d0cc3=
a7f82f - first fail: v5.4-rc1-91-gae083b2a11c7)

    defconfig+kselftest:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: v5.4-rc1-91-gae083b2a11=
c7)

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
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
