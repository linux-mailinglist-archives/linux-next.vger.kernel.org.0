Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17347146140
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2020 06:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgAWFDo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 00:03:44 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:38637 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgAWFDo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jan 2020 00:03:44 -0500
Received: by mail-wr1-f47.google.com with SMTP id y17so1619959wrh.5
        for <linux-next@vger.kernel.org>; Wed, 22 Jan 2020 21:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4/lhCbm7mbpT2mYWJXUhyOoGxS2KvzarDwuTdsAmz2g=;
        b=U35bMboSTCN0GEx7wHxD4JCOroLGozTjJj4pvEoeJ8GgTgPFVXAJihH8JPZ0A4q5Fl
         4rRWvROs8aF7SysnOwl+deXfjV4EwWUB/CFxyipmx8jmcblVkdkOfF8KEdfgis8Ja+Xv
         1L4noowxK7jrqlf8HHL2CXbZ3XTmjXem2LTWDOrFe3ZzV+cj09olqPlHIqTTbOZ+VKy5
         m3rds/CtNNGHFVVDjELrvpUFQK3os9GapELRqYWn2sRXv3iE6euq+2HjmcrJRqTx1sV3
         thSCdUhE5HU9nVOiBwu6jEydfxhaWa1uRnPO3QxiWzrFzVy3N/LXzEvYnv+u28D8h9mn
         B0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4/lhCbm7mbpT2mYWJXUhyOoGxS2KvzarDwuTdsAmz2g=;
        b=gMK6ZwQTVxfjLCAKJ2eD2Iu0lEPepr2OR60sseKdGyfBRX6ATz+BtKV79aqEZSRPzF
         jYOuxjA678l7n6aNIYms43XBPTgz0BnjQNMVxqgbQxAXRNVOtlvk0JaStxKLu2ewQKoc
         vNgwflZWJ+MX3MxU/4YJkJr13xAQwe7h925LLNnFjlteH6Ch2T0hBsBoyFKMvZNosPJ5
         wWJRBaj9Ut6cA4fIHjmkjOJhdOw+KwJA5sdUQ4dqoGPmsx9Uh8cHsW2vcYMOlcmP/58P
         87GQ3zauWIfWw0iQzI4SuBf03OrY7JJTN/5OJVySWZOZpb0pqYsAgZsektVtep89Oyog
         Seqw==
X-Gm-Message-State: APjAAAUF5ECLT/j7ERWdaHZZxHqTMRvHt5W2f3HQi6AVjWc2LWVE8zae
        e9CKJWlXG8n9eVNYlMLRmO2v/NmzLkGKzg==
X-Google-Smtp-Source: APXvYqxKZivz6a78mdHbGLfYAHis5Z3dO5K0t0RddSB5qcfhIzUjz552ga+0l9lFtqJsAsU6CH09Vg==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr15893117wru.170.1579755822182;
        Wed, 22 Jan 2020 21:03:42 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n187sm1135864wme.28.2020.01.22.21.03.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 21:03:41 -0800 (PST)
Message-ID: <5e29292d.1c69fb81.f5ecc.3bbe@mx.google.com>
Date:   Wed, 22 Jan 2020 21:03:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc7-289-g364c2e4beb7f
Subject: next/pending-fixes boot: 126 boots: 1 failed,
 120 passed with 5 untried/unknown (v5.5-rc7-289-g364c2e4beb7f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 126 boots: 1 failed, 120 passed with 5 untried/unk=
nown (v5.5-rc7-289-g364c2e4beb7f)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc7-289-g364c2e4beb7f/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc7-289-g364c2e4beb7f/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc7-289-g364c2e4beb7f
Git Commit: 364c2e4beb7f3657a72d213cfde5cbb4a70c9a40
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 54 unique boards, 13 SoC families, 22 builds out of 213

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: v5.5-rc7-273-g56dd35ec1=
a09)

    multi_v5_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: v5.5-rc7-273-g56dd35ec1=
a09)

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: v5.5-rc6-450-ge24e77e03=
983)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: v5.5-rc7-273-g56dd35ec1=
a09)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: v5.5-rc7-273-g56dd35ec1=
a09)

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
