Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC289F295A
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 09:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733173AbfKGIlT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 03:41:19 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:36026 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbfKGIlS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 03:41:18 -0500
Received: by mail-wm1-f49.google.com with SMTP id c22so1416282wmd.1
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2019 00:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=R/Y0R6Elbo/fHFysf8GWTnTuLl6CcLuKyCrzmCZOhaY=;
        b=vX4PcbHrchHPNtiSDLUEnz+ygug9zUkVTLYyTQEjRzptNiDwad096vHBVDIRIjggak
         Bea4oIDh2OMuDvAE6GeWvwY99LeJdn/HLz3oHZkv+pyh+Q39WzEJB9ZYUdzVxOp5ImPM
         gGq1HT0j2BWeGJ8F+TbuZAcYxmai13Y527MiOlqazKqpagCvSNVk7hvQBgCTOiilLXhL
         XIIzPyeybw5K0ZobCCkGpb1fRdpmjf9gQk7F9ilNMMeUvnmD7n2cB4xl6uARCI6Awl3Z
         ArRIDHADXICXmIz1W8qQ8/D6NDTuJRiwiK8HRowKCL/fG3VjqMxVZgOAJwlHVENUw80t
         IfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=R/Y0R6Elbo/fHFysf8GWTnTuLl6CcLuKyCrzmCZOhaY=;
        b=o9jp6987RyQmKMDEFtncEParrA79ZWPzNX7jqZAlxK7GV0rGu8FRrStFbB9ci0pLC8
         vAF6wuIvdu+hFb6+HPWYlpYRX07A3Zg6mobSkbA4JoHAmKqtIhUovqZ9Y//lFIMvr4d5
         3j+qpEEAK6weAu194sXb2dNLxG7RkRFsC4aNABbkspUBsPQqr2z2nH5NdYdbIyqvBwF1
         MriRADXLvSM8yKs/INQZACvxImLsOieNOuBskn/FGLldi3cL821uBbaJvPkf6UX70EUi
         PkOhvrvw4w8yzyxUmgrFGHh+LU/JXv9VXYbx/HFEzIg32pzni9JKdJ04HxIReI8yeltC
         PoIw==
X-Gm-Message-State: APjAAAUWfaWa7OlsaeV0tIlpEfI+934gsBzQgJjcC7TGOxxyxzh8cu+C
        K2NrnZA05b527Ahgp8w1v0b/PnnI0wQVGA==
X-Google-Smtp-Source: APXvYqyH8bJFEgwI/ftGsPBfeAWGKtKLggYUkcl/udPTAmOuzNbqsWjp+i9WBfjgTdh4do1Co4y3Cw==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr1716741wma.140.1573116076424;
        Thu, 07 Nov 2019 00:41:16 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a1sm1518516wrn.5.2019.11.07.00.41.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 00:41:15 -0800 (PST)
Message-ID: <5dc3d8ab.1c69fb81.c0f2a.7652@mx.google.com>
Date:   Thu, 07 Nov 2019 00:41:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc6-234-gcca61a91295c
Subject: next/pending-fixes boot: 230 boots: 3 failed,
 219 passed with 7 offline, 1 untried/unknown (v5.4-rc6-234-gcca61a91295c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 230 boots: 3 failed, 219 passed with 7 offline, 1 =
untried/unknown (v5.4-rc6-234-gcca61a91295c)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc6-234-gcca61a91295c/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc6-234-gcca61a91295c/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc6-234-gcca61a91295c
Git Commit: cca61a91295c5ca599a17d2b74ce79feca429a49
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 25 SoC families, 27 builds out of 215

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

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
