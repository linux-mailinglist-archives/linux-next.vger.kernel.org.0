Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C54F0CC8
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 04:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730606AbfKFDPM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 22:15:12 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:38674 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730562AbfKFDPM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 22:15:12 -0500
Received: by mail-wr1-f54.google.com with SMTP id j15so3298363wrw.5
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 19:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TbdbAleLQ8LbOOTqBnMZW7Afv6iLUCpX8jvEbJLwI8s=;
        b=NA0gMNenh9keVsSzr9fc7crrsky8nqGukzEvOZJgncWs0ZvJEYeU5I9d+msV5bYfLM
         Y+o/4zSbEiKqAkWuvLxtYv6AWTjtge7GuEIg2rcNntish1XIsSxq2Cs363N9xrcR2JaQ
         bw7B4ksMaQhQcvmNGb2VGMHHaQaNl8jgeelYe4YLiyUOpnLpP6beiiOV5VO1OfnxOQG/
         vIYRZ/xLdyXyNbQ43g98JTClzHtdwgJLEAvFYTP7ngm5auTZM5YqlwI6HYRUbctxXeh+
         ytkwy8eD7KKJOyH5ySL9zmVVvRzDKFz50V1CQTi9cQXtqmmfBi0cwaRl619dfQ4El7gC
         0+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TbdbAleLQ8LbOOTqBnMZW7Afv6iLUCpX8jvEbJLwI8s=;
        b=k0U52MIzGlgqZhHin/sop+vvnWaie4bR+yArmv6wKFA9gxH2CFSdBBoUo4+mr8vrVv
         ftmBXikR38SbRsAoPtCio8IL08hxtqDIPF/S4q7hqFo6iLok4gv7GEM3aFGol9VVsPPa
         WOQKu8HZcTHUvgQG56URI4PgnOmLkyrbrJdpbcrGe6H3Nz0MvIhpW59ItyB8HzCYRceK
         oiuTkHUVBJmgFLLNOfrIuz/PqfKJBCRnVMzTK9xSS3ydeikVOe5k5IZg638GtryxjNdd
         Rrp2qPS3mVeUJ93iihQbFXZt9/tQQUAMVcuCid2q8G5X+YVu1EN2qPLo9gdxFBbIL4kp
         /ggQ==
X-Gm-Message-State: APjAAAXzUoHzXv8/ICOKz9cmUyIrJPJv+4qUW7brPpVxLRvlphhzcn9f
        K2nKbONLVkopG4pz3ZdRW5GRH5gATmeMIg==
X-Google-Smtp-Source: APXvYqwwZqMV80+gdkQPc896Rx05gdOeY3brn//LRqSe471sNEQV1sZWsdGPHJv5ZcNzOTAFiaeIeA==
X-Received: by 2002:adf:ee84:: with SMTP id b4mr454209wro.31.1573010110274;
        Tue, 05 Nov 2019 19:15:10 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j6sm869782wrr.34.2019.11.05.19.15.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:15:09 -0800 (PST)
Message-ID: <5dc23abd.1c69fb81.81b95.40de@mx.google.com>
Date:   Tue, 05 Nov 2019 19:15:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-169-gb258bc9facf7
Subject: next/pending-fixes boot: 228 boots: 0 failed,
 221 passed with 7 offline (v5.4-rc6-169-gb258bc9facf7)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 228 boots: 0 failed, 221 passed with 7 offline (v5=
.4-rc6-169-gb258bc9facf7)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc6-169-gb258bc9facf7/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc6-169-gb258bc9facf7/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc6-169-gb258bc9facf7
Git Commit: b258bc9facf78f918196a3babfef616345c20cbf
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 85 unique boards, 25 SoC families, 26 builds out of 215

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

---
For more info write to <info@kernelci.org>
