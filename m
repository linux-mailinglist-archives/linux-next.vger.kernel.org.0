Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0673975EC0D
	for <lists+linux-next@lfdr.de>; Mon, 24 Jul 2023 08:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjGXG4c (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Jul 2023 02:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjGXG4b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jul 2023 02:56:31 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E52AF4
        for <linux-next@vger.kernel.org>; Sun, 23 Jul 2023 23:56:30 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b890e2b9b7so18932275ad.3
        for <linux-next@vger.kernel.org>; Sun, 23 Jul 2023 23:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690181789; x=1690786589;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q4tuatl9rjslbyslL2L2ghCzx3XVBOKIw9ZPqPxe60A=;
        b=JNQUWNdhzR3PgiCrvYru4GV4SQf2EDab8ZWT92JPX5iwly1eLeZVInLm56SRcqnj3Y
         wP9IEhxY78WU0xJuvi/vvaLm9X27+ZzUyUdl8yaEnxM3tR2eDeuUtkxNUzBcDVMe0nzc
         SORPEREcN7yQrJYSXmIWVPRzhflVEOCDL55j9YmDES1b0ujPoRHSoq4+hVVDwhv98ue/
         s2bdy9gyzCkifdkAvcVQN7LM8LYvE9oYE43bslXFj2bchqzLs3SmeTJT+DtoPZHR4S9u
         BA/E8l5kR2/din/WkIVorZaT7mCD2PMbVYn2gmgIlzgfGhx5ubhnnSE7rE/48/engH0K
         ocOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690181789; x=1690786589;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4tuatl9rjslbyslL2L2ghCzx3XVBOKIw9ZPqPxe60A=;
        b=hDwCO/Q5ppXuQ5CIAXSGSHNV28GhXo7rrSA3wiqe83XJjfUXcg3FGWzuGqLD5MRrdE
         tszuoXkZeN00pACct24JuoG3XjF8zIOmuIUgWZq+I5a7mAW0e/v78DSDjCYCG9H4LWuk
         XReNgK8O33GYkY558Gtn7irmv77OI4itg07w60hE1jLhEzE8tWxvIVqEPlcn42XYHi4B
         WJRqMJGqcpPtGBDfD1sEB4MVIcCnlqAWJv5MGHLjPNl3rl/8vi0755gCWG6bS2VHdW/o
         ceaLKKtmt9scgWDiVqQ1jbZLI30HvyvUQMf7aMcyEte0phYEG1sXnoCoyR3ek4HmKhqt
         LsUg==
X-Gm-Message-State: ABy/qLZsNEaXmyW8wLNadezqPIJvbNKniQmzhawSkVn7oRo3d/9VFm7X
        uu9cE0au/3crrmAAR+mUCh1ijZwQ/kdbStO6NCI=
X-Google-Smtp-Source: APBJJlFQZ15FUPV5cIjl5fsnjLcNbMpwrcPT6aSP1IQJNHmiUf4AYMHP+rDLZyXjGeosOUmBBiAiGg==
X-Received: by 2002:a17:902:f548:b0:1b6:80f0:d969 with SMTP id h8-20020a170902f54800b001b680f0d969mr7152905plf.11.1690181789244;
        Sun, 23 Jul 2023 23:56:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902eac600b001bb739e220esm5264892pld.230.2023.07.23.23.56.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 23:56:27 -0700 (PDT)
Message-ID: <64be209b.170a0220.eb4d8.8ad6@mx.google.com>
Date:   Sun, 23 Jul 2023 23:56:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230724
X-Kernelci-Report-Type: build
Subject: next/master build: 18 builds: 0 failed, 18 passed (next-20230724)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 18 builds: 0 failed, 18 passed (next-20230724)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230724/

Tree: next
Branch: master
Git Describe: next-20230724
Git Commit: 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 6 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
