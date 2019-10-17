Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77F34DAABB
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2019 13:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391784AbfJQLBw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 07:01:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51233 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732658AbfJQLBw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2019 07:01:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id 7so2102696wme.1
        for <linux-next@vger.kernel.org>; Thu, 17 Oct 2019 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tAeXhaZrr9FeMU5ZGRWlRe2gD5dfoHBNznJN6lL92Ls=;
        b=NHmxwcjj0offuGaSaNvk66grNNCzjd7NbmB7CRfQWlIimP+XTAvmLCAsZjb1Dqy4uw
         gUTaL4edaXF+wAGUIDzi2SS0lXKPEaaqdQYYOjpkoLtPtvu2ruSMrrCaE+K2cbXwXIIu
         jPVKMk33gPeItNd0aKaR9ED92GyA9u3IZlku/+4+zeU11gxay82F3XTwcDK3Sib/wLBX
         kPlOneTSQTSMLnc1S/Pm0Rehc2P/Z2zqynLi6A0Kec6lCYDkAjC6V3vJA9Z7St6pFkLU
         A3kj6SgluooP9O3FFoFYCulquWOngysJE1UejqxPzxa+PMOcb4AmGlPJcTVeOVA3P6Fz
         CkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tAeXhaZrr9FeMU5ZGRWlRe2gD5dfoHBNznJN6lL92Ls=;
        b=D0adyNEbpLoKaFSblVelBVVIIphAl2G+NcuR+woO/Z035uOG6M5o7blM3sYTZMRDdt
         rc5apd6RIYRs1q82U5Xm7MpgW7T8hoy7pPbwR5JeQvCY269xu5JUxWTsrGOwJvjrLUAX
         UiUM/jVRZOajCNWL6dW74ZjocQehXV78gSGpFjpsgh6fIIE43X+LioFf86ONof/oUxyE
         j9aT5o65YYug44zl7+bUF8o4E211w5kpallJwvkxIrpyti7dKQIRBVIo6GnFaHFBxkZr
         ry/Qzu2XbRl8hf1J/bA546HRX/bfb48PZgsNk75dB/AVgNQRlRRmTY2FIChSMM8vE7xB
         vwLg==
X-Gm-Message-State: APjAAAUYIBJI0GfCF7ft366Ort0Mzm1wrJpszjBgx/EWnodA18LLy0da
        PTRD4ECucCk2OcKE9p750gloP49sTh0=
X-Google-Smtp-Source: APXvYqzgk3lpH/YnVzZ8vMeddhCZFOQbUAndFEu60WYAzrC8yRzjQ+JqPDD8+828G/1koBH7v0xsIA==
X-Received: by 2002:a1c:99cd:: with SMTP id b196mr2365207wme.105.1571310109886;
        Thu, 17 Oct 2019 04:01:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u1sm1924310wrp.56.2019.10.17.04.01.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 04:01:49 -0700 (PDT)
Message-ID: <5da84a1d.1c69fb81.beba2.950a@mx.google.com>
Date:   Thu, 17 Oct 2019 04:01:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191017
Subject: next/master boot: 249 boots: 5 failed, 237 passed with 6 offline,
 1 untried/unknown (next-20191017)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 249 boots: 5 failed, 237 passed with 6 offline, 1 untried=
/unknown (next-20191017)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191017/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191017/

Tree: next
Branch: master
Git Describe: next-20191017
Git Commit: 3ef845da3c3b180ddd386e228ac3228d84a522d3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 88 unique boards, 25 SoC families, 28 builds out of 219

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

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
