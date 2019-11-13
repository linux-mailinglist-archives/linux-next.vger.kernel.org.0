Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAB9EFB334
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 16:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfKMPIQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 10:08:16 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:36135 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKMPIQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2019 10:08:16 -0500
Received: by mail-wm1-f51.google.com with SMTP id c22so2404580wmd.1
        for <linux-next@vger.kernel.org>; Wed, 13 Nov 2019 07:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=K1LerRac+fLTqAvK67Bi+bZhGIZd15zO8EXYZ65aN20=;
        b=VKx1Mtr9L+BqwKuBjcpaZSa+U/hl6LGHXqwr0koaNjNrG8aSwngGnB+m1zgsJr7h51
         LvM6wKWrgD3cTDLTEeAzyfJmZxsMRARkB1RZv/nnuML2iXx25T4PgTGN/YXwz68YRoxO
         Hjy3g7o/osbqH9ASxAh7qUN9Vnb2JJSIwUw1JoTEaTTysF8+VYZe7BTWo+smVnUM19xi
         JAVX/wtz6l2BGWfXPvOe1IHzqxe4k1v9lZNsEbccw00Vbok1IDbUITO7dbQOk47nDy9L
         5sbfi5XSs0b9zYI+Vuai0sLbxAjc2O4zqI4V7F40RwH7aMXz1WaZxBfZxb6WoPdrAQze
         QeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=K1LerRac+fLTqAvK67Bi+bZhGIZd15zO8EXYZ65aN20=;
        b=tUFjjL9EDIDh+hZQu46cz4AH6tITquL8gTU251GpMLNMg6gLH23x7C9NZUMX5cOz6X
         px21o2IbG4esYH5LzXBguoktJJ13ljD52AX5WYJuIerBIQlauWFZimVUAFmhXQDhz4LO
         Jy8EUPU++Fadu8VV2sosuAtgpySGXVl7er4KzfCIdFkMBawyRqCU3X42LpxviwvdS52i
         oK+FqXr9Z0cxghh/s5iVKZJguGN+3T7UMFoLc7k5YboH/wag80+0GcLcsNezr1wnbuLa
         t12C17KfMAUK5dVXJ1Y4hHvHhO3qxkR+t5Yg8uT4x909hmdYSXSdYZALjp/HxphUJ9xZ
         DGYw==
X-Gm-Message-State: APjAAAVN66tMGLPkkl6vA+7D2GSZjmq0oV9BHAt3K7+75sTrk848DPwD
        cKJhDcPRzuL509aNPNW8FpfQ8QATz9Yshw==
X-Google-Smtp-Source: APXvYqyXQUCwxg+VdthXhtwwIdIe+LQSiFayGtb84DEm7vmqsPOuR7vE2MdUkJOv2GNPg9LikleC+g==
X-Received: by 2002:a1c:96d5:: with SMTP id y204mr3115664wmd.63.1573657693759;
        Wed, 13 Nov 2019 07:08:13 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a16sm2731447wmd.11.2019.11.13.07.08.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 07:08:12 -0800 (PST)
Message-ID: <5dcc1c5c.1c69fb81.e28e1.c8d2@mx.google.com>
Date:   Wed, 13 Nov 2019 07:08:12 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191113
Subject: next/master boot: 234 boots: 3 failed,
 224 passed with 7 offline (next-20191113)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 234 boots: 3 failed, 224 passed with 7 offline (next-2019=
1113)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191113/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191113/

Tree: next
Branch: master
Git Describe: next-20191113
Git Commit: 4e8f108c3af2d6922a64df9f3d3d488c74f6009d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 89 unique boards, 24 SoC families, 27 builds out of 212

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

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
