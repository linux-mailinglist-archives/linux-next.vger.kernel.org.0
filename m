Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59EFF9204
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 15:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbfKLOYa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 09:24:30 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:34304 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfKLOYa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 09:24:30 -0500
Received: by mail-wr1-f42.google.com with SMTP id e6so18802674wrw.1
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 06:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iCoJmGryOjG4lhNNTEyXUxkhRrZ8i7aKde5t7v19AAY=;
        b=YmwM9QFkHFu0u3OkVODIWUQDWnzGnoRdbhu1A2howxW1JK9C7tFZKXqnNmDxuvoGuk
         U3maWxD4CqPAHZ3Y2DQza0Dmc9RhfyqAi5fUSsRC5PsoxkM7mxVT2UDlXL8e+SqqXMtW
         nyOptoxQyXik1b4fFWbv1bQrvthumUAb9Zjn1KDUW45SrvljKHoqp3rPLd7zWPl2orRG
         BAWGYIvgDB7G86JddBsFOYcPh/9OPqXFzp5wz02+Oq9GdR9zOZGfjCtV4vwpVK08FyDs
         kcJypMjdBrvMTskrLFknN9dzPTnWEoPRt9sIBius66FqZjhcN//KkqYHapDnjXRmqpU1
         mfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iCoJmGryOjG4lhNNTEyXUxkhRrZ8i7aKde5t7v19AAY=;
        b=qPC0hqXoQt+Wd7Fy5/jKd1nytBwUYbEIgf1K47eek+Jc3L0B8mmkXTznhDHFTIJqDn
         JStYOsErYUJ7n+abH6zlMym8eTTJoFhEK2mK3nJMzVKX4uY7vBT55lZmmvqSgiiqmQa9
         8LrJZBZmGGky81qf0snH7xTlfzlletDnR9L+AALuYI0ahpSnKisnI0/i/yKrrYydmgzs
         qwP2hwc5X6iIxrkIUZhlWKaKRChUiHvYZK639bo96FRRP/tDA/THjbwHjLN60fAAvChX
         G/eAy5TEqIe7st1YcGI7IveCZDNDk/PQGOIF1rd9O0b0HiEUGyVdQ7r9s4XAbfqnSfUm
         cW0w==
X-Gm-Message-State: APjAAAVeJYRPRf10l6xUXHkLCNUkx9lIQjfl7TaZ2HYO5wSQ791zN7zs
        MkYj2nVcZ+1e/6ymzOZszg5ts4X4FDxSEw==
X-Google-Smtp-Source: APXvYqz09VwNtp0TwbLEH6F4iietqHfVJb/fBzfzqDOAveJXFNCjjtdApdxYQfrpPeej8fNS0pVrCA==
X-Received: by 2002:adf:e701:: with SMTP id c1mr17976491wrm.166.1573568667959;
        Tue, 12 Nov 2019 06:24:27 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t24sm45245601wra.55.2019.11.12.06.24.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 06:24:27 -0800 (PST)
Message-ID: <5dcac09b.1c69fb81.8ea1b.478a@mx.google.com>
Date:   Tue, 12 Nov 2019 06:24:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191112
Subject: next/master boot: 229 boots: 3 failed,
 219 passed with 7 offline (next-20191112)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 229 boots: 3 failed, 219 passed with 7 offline (next-2019=
1112)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191112/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191112/

Tree: next
Branch: master
Git Describe: next-20191112
Git Commit: fc6d6db1df2cb11bbecc542d67885742e75b4b07
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 84 unique boards, 23 SoC families, 26 builds out of 216

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
