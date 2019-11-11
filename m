Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9A2F7664
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2019 15:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfKKObD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 09:31:03 -0500
Received: from mail-wm1-f49.google.com ([209.85.128.49]:54935 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfKKObD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 09:31:03 -0500
Received: by mail-wm1-f49.google.com with SMTP id z26so13539052wmi.4
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 06:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s32o5iqlFCiCPLwlI17Uyk2B/dWDMCE/hZI19mnufrY=;
        b=JlzvC2n0oiDRNgH/PndPL+EdoTT32qg1R5PkJxrT/pLPryM3e23nxPHx70IQTgjOqG
         Mr/gi6H6p6RDB0qUg4ZK6XRhrp8mUTkATJti+B9LorxZsvkY/MsxKWyAaSSJT3gk9rYB
         4qM87kgOOJ3Ws0upYDTmZUpbxe2O2LQbXAmScu03VhJw7XfW80fBPG2YDiuooUzFZIWQ
         lDsqvC6Bp7+Ku/fmNCbfXCzZZ8D0LfdIHTQmvIWrrNzbK3EPdaKzTuL9gDHyO2/BG/Oy
         X8EN6F4MT17CLA9r2//w6WiT6rNN3TwDTLZM9Pf+QnxalQSA7nr8Kp06W3E5ECmXPrZ7
         eFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s32o5iqlFCiCPLwlI17Uyk2B/dWDMCE/hZI19mnufrY=;
        b=QgLt3REiJbq8Eec3irqe7roNcxIBtAe5uYzHoEY3YtbnKet9QhIMT3T0UK+lI+Lq70
         yRaMVM+qxOve6lALq8lXF/NVemABxnElcLz3/TMvrzueVpaY056NdlUtX8ejMMAIPPVP
         fotEXYc1seVPksVjLMjKONSu12TFtnem+uzElIqHTnJQJdDm9uJD1HqbKnA5hi9xBB5f
         aFg+WE4wMWkGag5pU682DTNsTxzACXiCf6u8hKwo8xdETrJqj6NXKVlFcM8tdYqzOXtD
         UPPY01cmM7BGGcmJZ9SYvkfqDmhl0Jv30vdhvyncsWiaZvFbTNnkqC1ej/sTW1450Rnb
         zwqg==
X-Gm-Message-State: APjAAAX3LNfHxx/6p2Rtpg2+bIqFuSCtnuGIjYmx/ZqnoXhfGiWlqVoG
        MqE/CgDkP4FARVPwwNWXc4Y0QTX52kERCQ==
X-Google-Smtp-Source: APXvYqwiB2CJUnLKZGr/iuYJlmbOGR67G+Vv/X6lDSUqUO+wko4QJeJmiWJZt/teJoXhCKDPlk44hg==
X-Received: by 2002:a1c:7d95:: with SMTP id y143mr21749926wmc.143.1573482660807;
        Mon, 11 Nov 2019 06:31:00 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c144sm18861719wmd.1.2019.11.11.06.30.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 06:31:00 -0800 (PST)
Message-ID: <5dc970a4.1c69fb81.51fc1.8812@mx.google.com>
Date:   Mon, 11 Nov 2019 06:31:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191111
Subject: next/master boot: 231 boots: 5 failed, 215 passed with 7 offline,
 4 untried/unknown (next-20191111)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 231 boots: 5 failed, 215 passed with 7 offline, 4 untried=
/unknown (next-20191111)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191111/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191111/

Tree: next
Branch: master
Git Describe: next-20191111
Git Commit: 6980b7f6f9db7d5f344ae202012460e9d8869d89
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 24 SoC families, 26 builds out of 216

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
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
