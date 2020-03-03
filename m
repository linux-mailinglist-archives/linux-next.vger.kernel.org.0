Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F4146176DAC
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 04:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgCCDtA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 22:49:00 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38614 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbgCCDtA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2020 22:49:00 -0500
Received: by mail-pg1-f193.google.com with SMTP id x7so865239pgh.5
        for <linux-next@vger.kernel.org>; Mon, 02 Mar 2020 19:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZI6xLPqW5KvVhIcnrPvrcxsWU4QVhmFtSfyvD0blst8=;
        b=Y4y9VeQDJKS1FeMHG6fOOIho3lgVdrCsBgnm2f8Y8rh769bayhM7EJxmiECi8a0Maa
         7dYv6zI5o8xsf+FeJJqkjApwAN/Q/7Mw7xmaKRu10xhr4ZTHrcPTqdHl+29DTrrdubNp
         6VoTFn/gy/QG1covURa4YfZa9W2NKEtQpOn1wkCoyrr4SWFcdjDyhQausYfJb8mm+il7
         pRZIZGzLXnqttDYzrqgqSf2GDix2teMkBVj2CZdb+DXIzgx45KEBva1UGtaWyTxGbkCg
         uxmGB58Q9bHm5CegM97/DTERO9OAa0Dz0yJGawuedlpI27acb0M9MG0BshfZGTD8VJvK
         NqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZI6xLPqW5KvVhIcnrPvrcxsWU4QVhmFtSfyvD0blst8=;
        b=e8j3wIGNQ5zejiWMeSg3CZL7DVy6KVHzYNVc17q2ql98lqcVIwAqwa3DptUjOFjisW
         ui8wIlUz84tPjUAAWcwikXbKdZ6eRKbd+LBxY9Bd9pEcUhcxRACZae8fn12QQy2G+rvn
         +MyqAfQpwzUzatxVP6ZIYKgimrjWv4kV6pQ/uzYf6/6AuZHpWt18YDkj/asdn3spQMAP
         tYC0dxKtMVJuVqo3JNF5If+utZ+wjo6evQHrvqzjUPdHqQKfNEpSSKg7gSVmLT9EOd3C
         uXcCdASha3Nssxlq81ni/VF0LGIU6JxHpk2hacaegGzOPKnFb8YxytmXt531+Pgse4L0
         YYpg==
X-Gm-Message-State: ANhLgQ2L+L69uuiOLqcRR0++q4B7wHi86nnvubLfznwfS0CRZ3i7KY1H
        AEVXyW/H1GKDI4sVkz4kaTXswKpGNqs=
X-Google-Smtp-Source: ADFU+vsGs9KOQtpcp0nqn9nsoOAvUR6Gl/Aw7P266oofJWMw/ozJOKIV89pNummzG0U12nRh4wAmbw==
X-Received: by 2002:a63:441e:: with SMTP id r30mr2127180pga.51.1583207338502;
        Mon, 02 Mar 2020 19:48:58 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o66sm8165343pfb.93.2020.03.02.19.48.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 19:48:57 -0800 (PST)
Message-ID: <5e5dd3a9.1c69fb81.530cb.7992@mx.google.com>
Date:   Mon, 02 Mar 2020 19:48:57 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.6-rc4-203-g8f169e319c63
X-Kernelci-Report-Type: boot
X-Kernelci-Tree: next
Subject: next/pending-fixes boot: 143 boots: 2 failed,
 140 passed with 1 untried/unknown (v5.6-rc4-203-g8f169e319c63)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 143 boots: 2 failed, 140 passed with 1 untried/unk=
nown (v5.6-rc4-203-g8f169e319c63)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.6-rc4-203-g8f169e319c63/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-rc4-203-g8f169e319c63/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-rc4-203-g8f169e319c63
Git Commit: 8f169e319c63e8577283198ea35fb333134d3edd
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 67 unique boards, 16 SoC families, 23 builds out of 216

Boot Regressions Detected:

arm:

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.6-rc3-420-gead17be0=
3762)

Boot Failures Detected:

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

---
For more info write to <info@kernelci.org>
