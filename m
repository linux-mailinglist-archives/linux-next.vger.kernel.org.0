Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B32BE198A99
	for <lists+linux-next@lfdr.de>; Tue, 31 Mar 2020 05:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgCaDnK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 23:43:10 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46806 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbgCaDnK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 23:43:10 -0400
Received: by mail-pl1-f193.google.com with SMTP id s23so7590632plq.13
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2020 20:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4SMeVJ5f4B4s1ToaIKtg2JtcZucXykoohFDsUv04+9w=;
        b=VPdr+2AhP32m/ro3nglzgpdglRXoyZV5H1xA8UV1Z/+akCgqHoBJnp/c1U/t+3MnKY
         9GXPCMG/R/CN2sA2Sqcs6mrlhNRq9Cfafl+0/ArF/0Vqo2Kd+zOD24hJHaPZ9QB/KbjN
         Etfzp/w26L759BKS4zvUTtPtPCelx4unPyyTMWTPBMvWm7Yw77pbh4CG7rYB1B5nTTjj
         NBCkGqEtY9Q7RPnFo6EEHozuScz57z1B1nd5rjn2wzt4p1/WZMLG7xudphzwBcd2QEQ1
         7voPyHlc7gs5i7mgZnFVbsrnMfJqOBNgp9ABDo7/EA2uoxjgRX5ZpUalRGKda7sEez18
         83OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4SMeVJ5f4B4s1ToaIKtg2JtcZucXykoohFDsUv04+9w=;
        b=JU/ESwuB4e4CUjohLH0Mg6/2RqyUIPMEKc8x2gEhFssxFqxjpWQPMlxGw8TmkqyR5F
         2EQDN/5pmw0l3d0Nppzb3s2hlGk/1O5FOwFOhMLIfYt9XNPR5tu7lm2mgNWyzIjoSL9X
         J+lxR7MdjrC/6OJZZoX0UDz1O9nMOLr8cIpu1W3VjqK8HjEY6fUni85URA8D9kRmttKp
         n7JPLajYB0GIxAm148JqLl4hznrdgf3HSIXsi7IDl4wMeaZ7whIxX1Z7WSYVraezpjRp
         5iZw19RJYJd/NTj3aRN3sVPHdTbEbPJaRR6krza125W9DUt9cTu8n2vRMDGGalgoyJ9g
         7vig==
X-Gm-Message-State: AGi0PubBIYzAD79v7oFzN7IKMsiz919Map8O0qSeO9Wt8WX79RzCJE/I
        fnY9X8tPxMUoMXU56fKxmIkW5CSWK78=
X-Google-Smtp-Source: APiQypKL2TmXIjrt7lIIn0RtSNuzAe+mjGrLYyG4tsvXtslcGt32s0vutgHZs1JLHZ7mvc9aVPZTkA==
X-Received: by 2002:a17:90b:400a:: with SMTP id ie10mr1498854pjb.46.1585626187532;
        Mon, 30 Mar 2020 20:43:07 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o20sm770815pjr.35.2020.03.30.20.43.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 20:43:06 -0700 (PDT)
Message-ID: <5e82bc4a.1c69fb81.3a22c.412f@mx.google.com>
Date:   Mon, 30 Mar 2020 20:43:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.6-1227-ga325aefb3560
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 216 builds: 0 failed, 216 passed,
 37 warnings (v5.6-1227-ga325aefb3560)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 216 builds: 0 failed, 216 passed, 37 warnings (v5=
.6-1227-ga325aefb3560)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.6-1227-ga325aefb3560/

Tree: next
Branch: pending-fixes
Git Describe: v5.6-1227-ga325aefb3560
Git Commit: a325aefb35605c718cc79da13d74977bd13029a8
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:

arm:
    allmodconfig (gcc-8): 16 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 6 warnings

i386:

mips:
    malta_qemu_32r6_defconfig (gcc-8): 1 warning

riscv:
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning


Warnings summary:

    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    8    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    2    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/sched/cls_flower.c:331:1: warning: the frame size of 1032 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    /tmp/ccPzRWFY.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccPzRWFY.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1160:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    1    WARNING: vmlinux.o(.text.unlikely+0x3a40): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x36e4): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

---
For more info write to <info@kernelci.org>
