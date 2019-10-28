Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 979F2E6C6C
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 07:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730469AbfJ1G2v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 02:28:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34231 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730466AbfJ1G2v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 02:28:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so8551760wrr.1
        for <linux-next@vger.kernel.org>; Sun, 27 Oct 2019 23:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=gAZWyUhdSAtUKZC2ASCnYLuasXGvLk5A6zGpk4PmBLg=;
        b=o8IqJM6Xpcbw4TMndnxIzI6gEfU1R9X5Y3Ys/LC3knnoLJcgW8p/6gh0zsIULAguu8
         a1yNk3l5vPbsN+gZHUbhpu6IRYRoLmvzMaknIsTs1Cg2yIAcTsxicLEA8Bm6AxprRbZ4
         y90nD5z1BdNY2D4JldLvRpjTw5Vay7Q+ns3T879X2mS+FbyQpl43uJXMRF3uAfppkb3y
         W/ENr95pduD6X0PtEL+ZaF8yC68SFRqoJZUSaqm6X1ovlnf/3SpqzZXFxlsP72pky0w4
         4xAhfP4lLaoz5v1i+JwVoR8DBu0hySKFxAnqKhaOS19HLVTXsQOKM82wYGyCB7hCsnE/
         nCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=gAZWyUhdSAtUKZC2ASCnYLuasXGvLk5A6zGpk4PmBLg=;
        b=BTe+5YFRhgQpBffC6E8eVXGeneAOv+bAKnYo+b7UddKrMCHqw6jxDgXElVA/797UI1
         P/xUTmKCNumRy5X/jSczPuKqfR39P4P3c5QzxixMm3SNVjZIPZA4Foik159K1S/qnlpy
         PksSdrJbOpY+fDPQ9JIOnbcjhO59cdX/AUM/QYxC1fpNkQfVh2ERABdLxgMlzfvVs7HP
         TdPtP56Nkk4AS8orbYzGe///zlM0mHWUJAlowcAGCR1VcwqRff/Lj0+0Q5VGUhrDOl9K
         xbIdYOVRlOR3BjgkmRlY8A0onhMdSxC8Xn8CwA9pw+HrADd4LhWf3s/MqPMFMXDgkP6+
         Kd+Q==
X-Gm-Message-State: APjAAAUiOvd1zmLzZzsW1V0jRdmosHMII9i9zd/V7f3tzFA8lpiqPgIy
        GNfLY2G2XgwH5592+twG1AibJHBZtRM=
X-Google-Smtp-Source: APXvYqxwbfp6MMLqHW1LlCc2dZGiTjzuqHAuNTM9qdYGEg5Ad7DkyuF2qsdwVrjJOnNS4rlTKk/1Ug==
X-Received: by 2002:adf:93e1:: with SMTP id 88mr13251417wrp.198.1572244129311;
        Sun, 27 Oct 2019 23:28:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u187sm12156500wme.15.2019.10.27.23.28.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 23:28:48 -0700 (PDT)
Message-ID: <5db68aa0.1c69fb81.be33b.ce3d@mx.google.com>
Date:   Sun, 27 Oct 2019 23:28:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.4-rc5-221-g3d437c59b0f4
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 254 boots: 1 failed,
 246 passed with 7 offline (v5.4-rc5-221-g3d437c59b0f4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 254 boots: 1 failed, 246 passed with 7 offline (v5=
.4-rc5-221-g3d437c59b0f4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc5-221-g3d437c59b0f4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc5-221-g3d437c59b0f4/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc5-221-g3d437c59b0f4
Git Commit: 3d437c59b0f472a312cb68f8e5a5a8f654df6b6f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 25 SoC families, 28 builds out of 215

Boot Failure Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sunxi_defconfig:
        gcc-8
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
