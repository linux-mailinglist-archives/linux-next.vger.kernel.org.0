Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C43C1A56
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 05:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfI3D0o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Sep 2019 23:26:44 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:50456 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbfI3D0o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Sep 2019 23:26:44 -0400
Received: by mail-wm1-f47.google.com with SMTP id 5so11614800wmg.0
        for <linux-next@vger.kernel.org>; Sun, 29 Sep 2019 20:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PWKeCvaaWPTdtHnbFMpG+twDlP8TNNff7RjO/KGrfgo=;
        b=CVdSRVoxlE2riUDTfQDFvI8/VPKEvUT9wl0N1WAaijlFu9iW7OVA/6qub/8fsSQo3K
         04lkT6+AHdNIaASMf15dxyskT7FmuLC/5rnlrtNB6z5+VADEuqO6Z8uv9j1VxLKlmowJ
         l9ifpKK59rGesJGhPrhj4WLkfu8f5QNMYK7A4YLYiG4QqB5JvcjnGbqxhhhZVEShj8R8
         42cP/EETEOiM3ElSQcWOCV1x/0dWN5MNqjTZKP6v5X+OoOrxZu1YcpY0xC7NY4ggdKV1
         OtY5kzz6bOFaGSmopkFCNPS2i+NGN/JHOmaSuI+zgum8gxvM4U6pkd0W2RLgui69YrRK
         wydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PWKeCvaaWPTdtHnbFMpG+twDlP8TNNff7RjO/KGrfgo=;
        b=K6YQECnHFVPGvkWNcvDNgF0PJRtZ+pdCqPVyQDrM7PpRMNTZf2XbUNw0eagQzyb27P
         0brCOtQ8tRl+vfC6z0rNZgSnBoOnrfUaq06jStYHB9CAaR1tEn7IMMJ52/3S/Ejfwljf
         bvLXnpdoMrbVLFqnFzdvFqpg8utE7oiESXEduB0ZsNcIu/2I8HKJI4uZaO02IZ5W+lyT
         kSvMyWdnRYyvnCjyviYKo2GEKn1U66u5quAa1W2x2lHwaP9Auae+sJsoohdLrLqbBA6R
         lHVBUXLp/GiMR0yr0DN6e+JJepcXvNqCh/7x2/ORkjnD/9kbCS8S8fbMTP3gprinzEw3
         ZRnA==
X-Gm-Message-State: APjAAAWWAyy9oFAJlrckI6Q4nWwuXJOgfvNqpbYFjb4kVCbBfz+GJI5g
        ltpf8Su+xAsUK+6fbM+rmhq5VJKyXoI=
X-Google-Smtp-Source: APXvYqxiSv/k7NVrOhDhJq1Nf1gVyc+RdBRxSCodXNbfFDo6gcma0mu998dYnVv+9xgoXbiU7URKcQ==
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr16238345wmd.100.1569814002316;
        Sun, 29 Sep 2019 20:26:42 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w22sm11834367wmc.16.2019.09.29.20.26.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Sep 2019 20:26:41 -0700 (PDT)
Message-ID: <5d9175f1.1c69fb81.63829.2be7@mx.google.com>
Date:   Sun, 29 Sep 2019 20:26:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.3-13311-g8d0cc3a7f82f
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 230 boots: 9 failed,
 221 passed (v5.3-13311-g8d0cc3a7f82f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 230 boots: 9 failed, 221 passed (v5.3-13311-g8d0cc=
3a7f82f)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.3-13311-g8d0cc3a7f82f/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-13311-g8d0cc3a7f82f/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-13311-g8d0cc3a7f82f
Git Commit: 8d0cc3a7f82fcdc3db2980db674581fa85e5408a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 54 unique boards, 16 SoC families, 21 builds out of 214

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: v5.3-12689-gd20eeb1432=
2b)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: v5.3-12689-gd20eeb14322=
b)

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
    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

---
For more info write to <info@kernelci.org>
