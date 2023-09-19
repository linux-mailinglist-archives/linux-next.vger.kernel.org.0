Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D997A5842
	for <lists+linux-next@lfdr.de>; Tue, 19 Sep 2023 06:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjISEBc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Sep 2023 00:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjISEBc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Sep 2023 00:01:32 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BF48F
        for <linux-next@vger.kernel.org>; Mon, 18 Sep 2023 21:01:22 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c3bd829b86so38507515ad.0
        for <linux-next@vger.kernel.org>; Mon, 18 Sep 2023 21:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695096082; x=1695700882; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5lmfviX7zQN9gyAEyCHf73sjUJvZFJebjIzihgkPBHE=;
        b=HzIFEzEwcMN3B4pY0Q1LeWX3rwx4vubeQ3k/BAjbc0KGH8dhksxsOgwQt9I4Kn2wuZ
         wZ+rLOsJF2+7yKW70Z/0AM0iJ0npK73XNpAuRcMRT97C/KQ+KPLWDpsQ+NcJzNAAgFpV
         PSVrqq5iAwXsaSgLhc/ATAI2icEi2bpnwniPdHPHJc595AvwhPsvz+fWctQQ49sh75fR
         9PhOIjIBd0/2RWp6VYGfjWdPltbjBX8ueJ6ABHRAJtMBPqqjj3mLbq2FmWMcfEPfi5Ie
         nXsCh/x9W8Q76F/Fg6ytNYCUZI7jdCOzyAJUF6pJZ3a9LLlwRVz7A3o42uvUUwXiiciE
         01iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695096082; x=1695700882;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lmfviX7zQN9gyAEyCHf73sjUJvZFJebjIzihgkPBHE=;
        b=B23eLRD0X1489wkpjn8cT2Kmw7pkPVlJnsKCtQtpLI1x0U4mLKo9uYWvyyn1+eU/46
         9LikEj0hRlQNjhOmU14Uxnx4wIEeV341thMp6EAAKOC/lqkUxLJeKiA/rpXhAfHVmqGE
         jbJC4CaQ0Vh7dszhrxW3No4FviUAwApzVelp1aSxV889ppxMzn7f5CWPjInr312BPKU+
         CFRbsb8ABwBKVBet/CPvhok2zjL2WewXKfr1sIj9ZpCdBaLZaQ+IP4hCW9ZdPcS8CDcz
         bYvxr3D3Crs/nRrKMNszYHcrTw/VOPuJYo8jz6VTepBGtdfO3G258Nw8OgLIOTeVlsCC
         aZvg==
X-Gm-Message-State: AOJu0YyPmUAsI+6oBSP9LpkyP0v7Mpmlkot2rQSBv2uvamoRnHtQ0Pks
        ueli2dTeL9C7q0vkBvUS2Inda1xi1DjhpD3sxdA7OA==
X-Google-Smtp-Source: AGHT+IH6qUbOKYJxCCX6bS+T819uu6jFVaRrvAVuUU+5YwBpRbIMCQkrZjHn6is1u87gDZul4KWm1Q==
X-Received: by 2002:a17:902:e88b:b0:1c5:634f:b36c with SMTP id w11-20020a170902e88b00b001c5634fb36cmr5619146plg.30.1695096081714;
        Mon, 18 Sep 2023 21:01:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001bd41b70b60sm9002628plh.45.2023.09.18.21.01.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 21:01:21 -0700 (PDT)
Message-ID: <65091d11.170a0220.75e19.1124@mx.google.com>
Date:   Mon, 18 Sep 2023 21:01:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.6-rc2-378-g8b1a1f0d8311
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 8 builds: 0 failed, 8 passed,
 4 warnings (v6.6-rc2-378-g8b1a1f0d8311)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 8 builds: 0 failed, 8 passed, 4 warnings (v6.6-rc=
2-378-g8b1a1f0d8311)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.6-rc2-378-g8b1a1f0d8311/

Tree: next
Branch: pending-fixes
Git Describe: v6.6-rc2-378-g8b1a1f0d8311
Git Commit: 8b1a1f0d83112d21cc4216344b11ebcc06c293af
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Warnings Detected:

arc:

arm64:

arm:

i386:

mips:

riscv:

sparc:
    sparc64_defconfig (gcc-10): 4 warnings

x86_64:


Warnings summary:

    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
