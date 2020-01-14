Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2FC513A108
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 07:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgANGex (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 01:34:53 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:55507 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgANGex (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Jan 2020 01:34:53 -0500
Received: by mail-wm1-f43.google.com with SMTP id q9so12395295wmj.5
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2020 22:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=p4bUjEfw1WIeqAuJaKa7T/fIiHUjZMKJ1JfamdgsIiM=;
        b=VcARqIgpqZmDLDtTS9mVnzu5zhUpbW3dGbLwPAUp/0wRyyLH6wTO2+wJyRdSs/04So
         JcVX8F1WTZoahN+JC+HtREFIn1ltuUZ0rPUEE7GEPdr2Eo6It1YnYKgzOwbpAAU3btow
         W6ranC1kPKsOET3f78PtDATQuGpwRQhiQSGYoST8O1ylOHH2O/m0BGm4jp2F0cWKGiWA
         U7zKBZ63cukAhLTPVsw6AuLqtf9CznjSEqd9wRJnCGMAujRRkO5l3a2dzO4l5NTCo7Pv
         1JXHgEpkcnN7W301AwuNIqEvEjrV5AxVnRo7oceXge6kcE+RtqRYxsbTcOFj3OTJiOP9
         fSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=p4bUjEfw1WIeqAuJaKa7T/fIiHUjZMKJ1JfamdgsIiM=;
        b=kZOdALN6NW1YApJsRsMzMV1NogWnhiefQpwoNrBsvLbaQRQMEgg+a5NTjJN6CmJf3s
         pEWqpltGuP+/jaufF67vuvNAPmh0aXruONFEipw/T2wdtULzd/Ua2gvu/ogIBUGCKEh9
         P//3/K/zl1K1sL5uTWI10IIIOjGlnsb9S2gBHsGR67Wz+p2Bf135Zj9V7HOw8dUWdinR
         na2fHYRo6zgEYMiL3Labp9qN32KqJcGUqbjZAPbfbyd3+bTZ9U1WzhfZkPnvSe9n+9pc
         RviIHxbeIZx9bqO0ceySpjUo6lseqiWWGlsm+lwJfVjcZhi9WIOf66/Cc4nFAfdMClpZ
         XnAQ==
X-Gm-Message-State: APjAAAXwEY1EKBUxHLr5lCYMVZsLVRr/EnrK4awRF+xDRHFaNuuE8Jfu
        lUw2El2PS06/9HoTVOYDiCtwGZLzM8815w==
X-Google-Smtp-Source: APXvYqxtJBlSNjwaYdS6h96B/RKha2QjLknIzPFD6GNIfm1SYatpa4vqAdN5Hqo/SrmmRCf0jh5HJQ==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr24103293wmf.133.1578983691162;
        Mon, 13 Jan 2020 22:34:51 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w20sm17111324wmk.34.2020.01.13.22.34.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 22:34:50 -0800 (PST)
Message-ID: <5e1d610a.1c69fb81.add1b.7693@mx.google.com>
Date:   Mon, 13 Jan 2020 22:34:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.5-rc6-313-g456d2c0a369d
Subject: next/pending-fixes boot: 134 boots: 2 failed,
 132 passed (v5.5-rc6-313-g456d2c0a369d)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 134 boots: 2 failed, 132 passed (v5.5-rc6-313-g456=
d2c0a369d)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-rc6-313-g456d2c0a369d/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-rc6-313-g456d2c0a369d/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-rc6-313-g456d2c0a369d
Git Commit: 456d2c0a369dff8ad98efabf9ef9331581fb5e92
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 56 unique boards, 13 SoC families, 22 builds out of 214

Boot Regressions Detected:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: v5.5-rc5-558-gd3abf62b4=
f01)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
