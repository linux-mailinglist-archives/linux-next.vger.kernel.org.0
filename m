Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF5F11CCDD
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2019 13:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbfLLMOe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 07:14:34 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:52051 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729004AbfLLMOe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Dec 2019 07:14:34 -0500
Received: by mail-wm1-f48.google.com with SMTP id d73so2127197wmd.1
        for <linux-next@vger.kernel.org>; Thu, 12 Dec 2019 04:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Tv6dHqBkBPgl9z3ceHqB4AFZ+7hgyg++/TBBMMyK/co=;
        b=WCidlDDy0tAYy/yPB4XZCwWK9Ow5ip4t8dndd9KuYaMt3tWSOwVR0ShcyDzHq9HZh0
         7W7Ocn1EdqS5Y9ygGwW0F/30KBLZw9ngEU+/MmLk5h9G1g++wgiVExyObqRZqEvQNjMQ
         WIw0VuLiawMod/WrvgY63udYELTRV6FfuPOZjsnrMr6ZIFCE6f+dUWkJqDpcQYUW74Q2
         V0z8mJcbLvE/N6X3y+HVixcL2m/Sz6VloCI/kSzihl6wZl/4pqzwuIfJgnKG3FyqauRh
         F8yOMd6NvfmTXn5dp8UTwHcTvd+Pwn/hKBI5Y6HbdTWw57P9Z1UclTnT5Qce7WkC9Hax
         CaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Tv6dHqBkBPgl9z3ceHqB4AFZ+7hgyg++/TBBMMyK/co=;
        b=ekNMbkwjsO68qvfRxgYrbBGuRaK1wnPK9oOwoLO5+Hlyy4uM9VlHleA1WCVhD+AC7V
         jSjPFXTlA/fas7jEaE+pJeR9bUwihyne0SK+4zMOdjdGL7MOSRwiViHpa8kTUilA0BZI
         xF/pyZUFKCm9NdKQjyFJNlQZc2/ztqu9YwPnXTKR8PTpA9AXxrQ+sdVkgxOzblqQzBfJ
         KZhoiEh9bR3GheaaGbdAYEsLo5zhGeAIEDJGWEl1mtDgprDxin5lHJvu5H4zu08Wa75T
         xrZ/16p8fqHlxeTEbL/8xjoTBn6hx48O4QWmrT5VAoiZTJG7N7LX4BritBL8O7VP3t4s
         Mb6A==
X-Gm-Message-State: APjAAAUNBrSxDCHkJcn8d3swGC9xWiod0i8WoR4ON5Yo6iGv+QA+Gw5o
        7nnUGl+aHHUJ4ZMXdWYSFTj6SocxacV4NA==
X-Google-Smtp-Source: APXvYqyCdfYqV1ZK66fe1CyteCrn1Wa6EU76tC03AaOBu8uYE5SnqT6y3QlzygVnL3eKLZ3Ric3v9w==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr6215862wmh.82.1576152872150;
        Thu, 12 Dec 2019 04:14:32 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j12sm5984521wrt.55.2019.12.12.04.14.31
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 04:14:31 -0800 (PST)
Message-ID: <5df22f27.1c69fb81.651e3.ddf5@mx.google.com>
Date:   Thu, 12 Dec 2019 04:14:31 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191212
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 156 boots: 3 failed, 153 passed (next-20191212)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 156 boots: 3 failed, 153 passed (next-20191212)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191212/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191212/

Tree: next
Branch: master
Git Describe: next-20191212
Git Commit: 78adcacd4edbd6795e164bbda9a4b2b7e51666a7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 61 unique boards, 18 SoC families, 25 builds out of 214

Boot Failures Detected:

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

    defconfig:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
