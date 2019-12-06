Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C983114C94
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2019 08:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfLFHTE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Dec 2019 02:19:04 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:52840 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfLFHTE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Dec 2019 02:19:04 -0500
Received: by mail-wm1-f41.google.com with SMTP id p9so6679055wmc.2
        for <linux-next@vger.kernel.org>; Thu, 05 Dec 2019 23:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eCASkgjzFFRK3zpjBuAJkiVxFj5VfcxK4q0rkmlHQqE=;
        b=ZCDnYumWEXXpDPNqvFvK9YHA3kaGHeOwTNGaTwcrYtWdRuu4pzKmKqGN8hts1Q4+rz
         hmkhowlsc8qT7muITuwCizyk3Ap1aQfNJuZ2q0mWP2ckCzMNDk4kiapdi7sDFmDBdrnx
         v/aPbgJaLMAsyRXUoLIeGsVzvF9VM7YGJcYVI9Q9yOBh4u+JqhuX99zy2zLoWFMOqGIO
         N6+xKSNPhYUD982ZfbVrvEY1o0RmxmnIeEg08a8mLaxMpHLMeK2Fx7oCZntp6ZbPPtDz
         Ab7SNj3hWYQWEffFRRjs0wbk9lsy5lq2ZAooJ//AUwRiL/ngE1DfdVJm5yRkQhuSIM8d
         CkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eCASkgjzFFRK3zpjBuAJkiVxFj5VfcxK4q0rkmlHQqE=;
        b=ZUXvywjA3jk52iUAvI1c5riaT6IGr7hqTxAhN64pg2PzOlI+5UrCyROw2jeC99cG+Y
         +jm5ejFzoI4fk7nGnGvUZ9FdWO+yC4ehLSjx6Fr/izbmauDBJpLZHfxt1/bpVB5SHMNu
         eC8PUCV7XArgF4aPB0tQ6Ss/gpN/IEMe5qAjpZUUL8j8QsPDmcAX7UHxMlJ37haawZTb
         6vnh8Ug+FqAGI3X9mJSxJlyp2Wrl6EWhcB6jZ/sT3cwqkDaMUq08Q9mm+0mXG2Du/O8z
         ffs3xUuJk9UXaLzdlNkAu2T5uMHW+NjCBBbT8NB47doXaSEQ/0VC3NrgrOWvOTRpwPy4
         Z0fw==
X-Gm-Message-State: APjAAAWjvqawUAxgXth1prYVAhxkBLWU0KgdzHYEDIznhhO8jf7WExlo
        gi4K4yzA/qf9MwAKjQpWi50iG5kt5fuOcA==
X-Google-Smtp-Source: APXvYqyEOWgacey/UxnUE1FBA33IzBGYCpoMNL1u9EUZOtSRVcH/TFpe4+uhyK9igGaBDT2IqrTPcQ==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr9246250wmi.149.1575616741933;
        Thu, 05 Dec 2019 23:19:01 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id t78sm2000895wmt.24.2019.12.05.23.19.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 23:19:01 -0800 (PST)
Message-ID: <5dea00e5.1c69fb81.7d91a.a465@mx.google.com>
Date:   Thu, 05 Dec 2019 23:19:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-14900-g838333c80c4f
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 262 boots: 7 failed, 248 passed with 6 offline,
 1 untried/unknown (v5.4-14900-g838333c80c4f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 262 boots: 7 failed, 248 passed with 6 offline, 1 untried=
/unknown (v5.4-14900-g838333c80c4f)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/v5.4-14900-g838333c80c4f/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/v5=
.4-14900-g838333c80c4f/

Tree: next
Branch: master
Git Describe: v5.4-14900-g838333c80c4f
Git Commit: 838333c80c4f64a4ef9f5486f8bbc73312cd3abf
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 25 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-odroid-n2: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

---
For more info write to <info@kernelci.org>
