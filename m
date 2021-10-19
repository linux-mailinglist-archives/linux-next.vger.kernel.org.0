Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6C3433A37
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 17:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhJSPZr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 11:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhJSPZq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 11:25:46 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C825C06161C
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 08:23:34 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id 21so13877013plo.13
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 08:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x9fyrK5+0g1SOmpN7/Hwij3y3Nn+xyaxR4sFoLvwHf0=;
        b=WmY0Ht0+A5UsT3D9LH/TY+goPcsIsRRoYId6M3Gyr2hIu0vuj8WPTcJkuz7SpoTHYI
         fS+H6PgpaI4sZWwaHoiirH8G5vBJbRvWy/YETLgUuS5pg0qhYst+zwSDQCFDD5lWyMcf
         rtWwtyU8kb98pS+F5wGTCkgGrMZbWyKEFp4O5VHkEjRfrM5HNG5bEwzss88gvhq511MJ
         3ysnk2InEzDdP156djHtaSlDC8YIYa5snswwwAEfu4Pi+D1PGe0Ji5/aUtLBfAYTaIrD
         g0X6PizoQWcnR+5TprHpUR1TzSS/i8LLD888/eZnXWpODar9yVZDKr6n0tI6C5gxRvOu
         466Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x9fyrK5+0g1SOmpN7/Hwij3y3Nn+xyaxR4sFoLvwHf0=;
        b=qhMk/zNRVhyedk+7/MKoOBysByqBJHaTiX/D5/ErXl7Bwwabvcu1O1/i/2KsVeKx+O
         62ffFRBw9nXZRfQKnR5JIHgKkg0xmYeSyBFs1AxkZwI15wvP5eAN0PKA6ZJRLS8N4iHm
         OQcl/rQl+zxujbYI1HDigHDoIE48KCwEtmOGI2fXbjnxWnuzGwgxwbl7fBd2/Ak5TJ6a
         QJx5pfQ+CHNxRqDaYEQk/yYTEnHKVBoLr5cjeJt+7LlqsU35YIvB2ATF5hezdFDaWuZg
         VVDKv8wGkR0Xn+Nnw1U1m6XsOEKiObHNx/j5jsMKa1oPFq9ccBguwHuloRiDAIiT78/9
         C72Q==
X-Gm-Message-State: AOAM533mnT/Ai1zSODYGv2h/WMX1GEZ0dSVGaucMLQjNF2MccBho4SlC
        BJZ8IRhe9RI4jFri49984KnE/rqME9KWjw==
X-Google-Smtp-Source: ABdhPJywzIH0iOF/X3iSk2R9I5VV7AYfkXSDurEqxjZZQXYnoHd0+RQXEQS1ZHn6eXNK/VhGTpNQHg==
X-Received: by 2002:a17:90b:4b89:: with SMTP id lr9mr467752pjb.11.1634657012148;
        Tue, 19 Oct 2021 08:23:32 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u193sm16079577pgc.34.2021.10.19.08.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:23:31 -0700 (PDT)
Message-ID: <616ee2f3.1c69fb81.eae97.c445@mx.google.com>
Date:   Tue, 19 Oct 2021 08:23:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20211019
X-Kernelci-Report-Type: test
Subject: next/master baseline: 431 runs, 122 regressions (next-20211019)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 431 runs, 122 regressions (next-20211019)

Regressions Summary
-------------------

platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2      | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2      | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2      | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2      | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2      | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv2-uefi | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3      | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3      | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3      | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3      | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3      | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3      | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_arm-virt-gicv3-uefi | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =

qemu_i386                | i386   | lab-baylibre    | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-broonie     | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-collabora   | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-baylibre    | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-broonie     | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-cip         | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-collabora   | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-linaro-lkft | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-baylibre    | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-broonie     | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-cip         | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386                | i386   | lab-collabora   | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-baylibre    | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-broonie     | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-collabora   | clang-10 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-baylibre    | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-broonie     | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-cip         | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-collabora   | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-linaro-lkft | clang-13 | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-baylibre    | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-broonie     | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-cip         | gcc-10   | i386_defco=
nfig               | 1          =

qemu_i386-uefi           | i386   | lab-collabora   | gcc-10   | i386_defco=
nfig               | 1          =

qemu_x86_64              | x86_64 | lab-baylibre    | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-broonie     | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-cip         | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-collabora   | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64              | x86_64 | lab-linaro-lkft | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre    | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie     | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora   | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-linaro-lkft | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi         | x86_64 | lab-linaro-lkft | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | clang-13 | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config             | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+ima         | 1          =

qemu_x86_64-uefi-mixed   | x86_64 | lab-linaro-lkft | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
211019/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20211019
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      5b27c149257d83558d9a7fae927be822673be230 =



Test Regressions
---------------- =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea942273d1e860b335904

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea942273d1e860b335=
905
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ecce45ba901cb77335911

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ecce45ba901cb77335=
912
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea97ba33b6e22ee3358f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea97ba33b6e22ee335=
8fa
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616eca49fdcadff0493358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eca49fdcadff049335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea64d50715957fb3358fe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea64d50715957fb335=
8ff
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616eca9f9901843917335907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eca9f9901843917335=
908
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea62699bd44c5d43358fb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea62699bd44c5d4335=
8fc
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec7eb09010bcf413358f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec7eb09010bcf41335=
8f3
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea946278bef541f3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv2-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea946278bef541f335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ecd33d5d8fb74e3335902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv2-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ecd33d5d8fb74e3335=
903
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea95827a52711843358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea95827a5271184335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616eca724b26e49f523358ef

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv2-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eca724b26e49f52335=
8f0
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea64b4d0f51280f3358f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea64b4d0f51280f335=
8f8
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616eca8bad8a8b8e423358e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eca8bad8a8b8e42335=
8e6
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea60bea1753af1a335907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea60bea1753af1a335=
908
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv2-uefi | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec7b1eb11fedbe73358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec7b1eb11fedbe7335=
8e9
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea940273d1e860b3358f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea940273d1e860b335=
8f8
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ecccf3fd04b701b3358f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ecccf3fd04b701b335=
8f6
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea93f273d1e860b3358f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea93f273d1e860b335=
8f5
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616eca16ab5127a9873358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eca16ab5127a987335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea5f9086f5750293358f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea5f9086f575029335=
8fa
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616eca63152afc44723358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eca63152afc4472335=
8e9
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea62099bd44c5d43358e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea62099bd44c5d4335=
8e6
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3      | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec7889d5ef8ae6133592d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec7889d5ef8ae61335=
92e
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre    | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea9454fe5abd218335925

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-baylibre/baseline-qemu_arm-virt-gicv3-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea9454fe5abd218335=
926
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-broonie     | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616eccf889bc9e4de33358f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-broonie/baseline-qemu_arm-virt-gicv3-uefi.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eccf889bc9e4de3335=
8f5
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-cip         | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea971b922475ee23358f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-cip/baseline-qemu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea971b922475ee2335=
8f6
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-collabora   | clang-13 | multi_v7_d=
efconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/616eca4c4b26e49f523358df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig/clang-13/lab-collabora/baseline-qemu_arm-virt-gicv3-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616eca4c4b26e49f52335=
8e0
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-baylibre    | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea6974de9046fee3358f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/baseline-qemu_arm-vir=
t-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea6974de9046fee335=
8f8
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-broonie     | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ecaa0747d1532243358f3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-broonie/baseline-qemu_arm-virt=
-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ecaa0747d153224335=
8f4
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-cip         | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea6797b69988587335905

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-cip/baseline-qemu_arm-virt-gic=
v3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea6797b69988587335=
906
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_arm-virt-gicv3-uefi | arm    | lab-collabora   | gcc-10   | multi_v7_d=
efc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec8186d99b5bcc83358f9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-collabora/baseline-qemu_arm-vi=
rt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec8196d99b5bcc8335=
8fa
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-baylibre    | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea81715d78aa71e3358e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea81715d78aa71e335=
8e3
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-broonie     | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ecb0381200b89683358f0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ecb0381200b8968335=
8f1
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea813f7a77328f33358ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea813f7a77328f3335=
8ee
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-collabora   | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec82c6d99b5bcc833590a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec82c6d99b5bcc8335=
90b
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-baylibre    | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea095b0f8672f753358ed

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea095b0f8672f75335=
8ee
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-broonie     | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec4aef80c3e053233593b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec4aef80c3e0532335=
93c
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-cip         | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea0ac5ffb96bee63358fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea0ac5ffb96bee6335=
8fe
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-collabora   | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec2081052df9f523358f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec2081052df9f52335=
8f5
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-linaro-lkft | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ee2db0b0c9444bf33591b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-linaro-lkft/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-linaro-lkft/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ee2db0b0c9444bf335=
91c
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-baylibre    | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea440bb0f93c95d3358f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea440bb0f93c95d335=
8f3
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-broonie     | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec85b9268d5c89333594b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec85b9268d5c893335=
94c
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-cip         | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea46f4f0e5960573358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea46f4f0e596057335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386                | i386   | lab-collabora   | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec5bf88627d22703358ff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec5bf88627d2270335=
900
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-baylibre    | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea81815d78aa71e3358e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea81815d78aa71e335=
8e6
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-broonie     | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ecb172015b403d93358e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ecb172015b403d9335=
8e4
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-cip         | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea82e15d78aa71e3358f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea82e15d78aa71e335=
8f7
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-collabora   | clang-10 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec85ed13e2a61ae3358fc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-10 (Debian clang version 10.0.1-++20210313014605+ef32c=
611aa21-1~exp1~20210313125208.190)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec85ed13e2a61ae335=
8fd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-baylibre    | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea0925ffb96bee63358e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea0925ffb96bee6335=
8e1
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-broonie     | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec438434f805f063358e7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec438434f805f06335=
8e8
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-cip         | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea093b0f8672f753358ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea093b0f8672f75335=
8eb
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-collabora   | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec1cf1c9505e0e83358f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec1cf1c9505e0e8335=
8f7
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-linaro-lkft | clang-13 | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ee2b4e85f54676e335901

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-linaro-lkft/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/clang-13/lab-linaro-lkft/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ee2b4e85f54676e335=
902
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-baylibre    | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea43fe8c704db0433597a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-baylibre/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea43fe8c704db04335=
97b
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-broonie     | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec832951c54e684335903

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-broonie/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec832951c54e684335=
904
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-cip         | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea43fbb0f93c95d3358ea

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-cip/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea43fbb0f93c95d335=
8eb
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_i386-uefi           | i386   | lab-collabora   | gcc-10   | i386_defco=
nfig               | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec5ad9df6ed684b33591f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: i386_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/i386=
/i386_defconfig/gcc-10/lab-collabora/baseline-qemu_i386-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec5ad9df6ed684b335=
920
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-baylibre    | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1ad0f97c31694335932

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1ad0f97c31694335=
933
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-broonie     | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec576f33ad91808335930

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec576f33ad91808335=
931
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1ddabc429918f33590d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1ddabc429918f335=
90e
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-collabora   | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec2a5c782b770573358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec2a5c782b77057335=
8e9
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1721f6f2c29043358ee

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1721f6f2c2904335=
8ef
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea20eb7104071c43358e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea20eb7104071c4335=
8ea
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea24ddeb02fd79b3358e5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea24ddeb02fd79b335=
8e6
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea3503d0af66b2e335901

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea3503d0af66b2e335=
902
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec51153216d99f0335912

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec51153216d99f0335=
913
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec59e46ad0f488333590f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec59e46ad0f4883335=
910
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec652ecc5486af6335918

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec652ecc5486af6335=
919
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec6ca72895e8de933596a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec6ca72895e8de9335=
96b
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1be0f97c3169433595b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1be0f97c31694335=
95c
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea22d5ddc1442b1335901

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea22d5ddc1442b1335=
902
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea278d184ee23e8335902

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea278d184ee23e8335=
903
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea36904f0964b1f3358f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea36904f0964b1f335=
8f2
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec24d4c23033dd63358f1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec24d4c23033dd6335=
8f2
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec308b0dc1baee03358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec308b0dc1baee0335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec390564a8f1dc63358f5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec390564a8f1dc6335=
8f6
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec3dc632daac5873358fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec3dc632daac587335=
8fb
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64              | x86_64 | lab-linaro-lkft | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ee2e00b0c9444bf335932

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-linaro-lkft/baseline-qemu_x86_=
64.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-linaro-lkft/baseline-qemu_x86_=
64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ee2e00b0c9444bf335=
933
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre    | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1aad342bf589f3358e4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1aad342bf589f335=
8e5
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie     | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec53a065c053388335910

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec53a065c053388335=
911
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1ab0f97c3169433592c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1ab0f97c31694335=
92d
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora   | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec2a324c32629813358dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec2a324c3262981335=
8de
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-linaro-lkft | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ee2e20b0c9444bf335937

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-linaro-lkft/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-linaro-lkft/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ee2e20b0c9444bf335=
938
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea16e2c891dc5043358eb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea16e2c891dc504335=
8ec
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea212b7104071c43358f2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea212b7104071c4335=
8f3
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea24bdeb02fd79b3358e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea24bdeb02fd79b335=
8e1
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea3513d0af66b2e335904

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea3513d0af66b2e335=
905
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec4afc757f7cbce335900

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec4afc757f7cbce335=
901
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec5ee2dcfdbe29d3358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec5ee2dcfdbe29d335=
8e9
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec63fecc5486af6335915

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec63fecc5486af6335=
916
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec6f272895e8de93359e0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec6f272895e8de9335=
9e1
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea16ff66210c9e3335903

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea16ff66210c9e3335=
904
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea24adeb02fd79b3358dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea24adeb02fd79b335=
8de
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea264deb02fd79b3358f4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea264deb02fd79b335=
8f5
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea3695603602c993358df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea3695603602c99335=
8e0
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec21a65aa1e80e53358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec21a65aa1e80e5335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec33fc340c54b2c3358e9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec33fc340c54b2c335=
8ea
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec36c5b3b7f8b703358e3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec36c5b3b7f8b70335=
8e4
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec44ca17880c3cc335928

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec44ca17880c3cc335=
929
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi         | x86_64 | lab-linaro-lkft | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ee2dd0b0c9444bf335921

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ee2dd0b0c9444bf335=
922
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1ae0f97c31694335935

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.t=
xt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1ae0f97c31694335=
936
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec58a46ad0f48833358fd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-broonie/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec58a46ad0f4883335=
8fe
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1e7a60fe8cd9a3358df

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1e7a60fe8cd9a335=
8e0
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | clang-13 | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec2dd24c3262981335914

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    clang-13 (Debian clang version 13.0.1-++20211015122903+cf15c=
cdeb6d5-1~exp1~20211015003431.9)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/clang-13/lab-collabora/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec2dd24c3262981335=
915
        new failure (last pass: next-20211015) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea1701f6f2c29043358e8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-baylibre/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea1701f6f2c2904335=
8e9
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea210b7104071c43358ec

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea210b7104071c4335=
8ed
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea24f99b45800c133590c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-baylibre/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea24f99b45800c1335=
90d
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-baylibre    | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea3533d0af66b2e335907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-baylibre/baseline-qemu_x86_64-uefi-mixed=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea3533d0af66b2e335=
908
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec4c10d51e7842c3358dc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-broonie/baseline-qemu_x86_64-u=
efi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec4c10d51e7842c335=
8dd
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec5c688627d227033590c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec5c688627d2270335=
90d
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec6a3f60bb739943358fa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-broonie/baseline-qemu_x86_64-=
uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec6a3f60bb73994335=
8fb
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-broonie     | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec71af60bb73994335915

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-broonie/baseline-qemu_x86_64-uefi-mixed.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec71af60bb73994335=
916
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea189775c9b384933590d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-=
mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea189775c9b3849335=
90e
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea2292586572cb9335965

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea2292586572cb9335=
966
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea2c2e9ff8adb193358dd

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-cip/baseline-qemu_x86_64-uefi=
-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea2c2e9ff8adb19335=
8de
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-cip         | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ea3815ecbe7c6ff33590a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-cip/baseline-qemu_x86_64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ea3815ecbe7c6ff335=
90b
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec23a270d565fa33358e6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-collabora/baseline-qemu_x86_64=
-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec23a270d565fa3335=
8e7
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config             | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec30bb0dc1baee03358e2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixed.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec30bb0dc1baee0335=
8e3
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
con...6-chromebook | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec3d9632daac5873358f7

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86-chromebook
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86-chromebook/gcc-10/lab-collabora/baseline-qemu_x86_6=
4-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec3d9632daac587335=
8f8
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-collabora   | gcc-10   | x86_64_def=
config+ima         | 1          =


  Details:     https://kernelci.org/test/plan/id/616ec44f8327fa219733592a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+ima
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+ima/gcc-10/lab-collabora/baseline-qemu_x86_64-uefi-mixe=
d.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ec44f8327fa2197335=
92b
        new failure (last pass: next-20211018) =

 =



platform                 | arch   | lab             | compiler | defconfig =
                   | regressions
-------------------------+--------+-----------------+----------+-----------=
-------------------+------------
qemu_x86_64-uefi-mixed   | x86_64 | lab-linaro-lkft | gcc-10   | x86_64_def=
con...86_kvm_guest | 1          =


  Details:     https://kernelci.org/test/plan/id/616ee2de0715eab4733358f6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig+x86_kvm_guest
  Compiler:    gcc-10 (gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi-mixed.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20211019/x86_=
64/x86_64_defconfig+x86_kvm_guest/gcc-10/lab-linaro-lkft/baseline-qemu_x86_=
64-uefi-mixed.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/x86/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/616ee2de0715eab473335=
8f7
        new failure (last pass: next-20211018) =

 =20
