Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2F749F202
	for <lists+linux-next@lfdr.de>; Fri, 28 Jan 2022 04:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbiA1Du7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Jan 2022 22:50:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbiA1Du6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jan 2022 22:50:58 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036F9C061714
        for <linux-next@vger.kernel.org>; Thu, 27 Jan 2022 19:50:58 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id d15-20020a17090a110f00b001b4e7d27474so5255137pja.2
        for <linux-next@vger.kernel.org>; Thu, 27 Jan 2022 19:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=klnI03UIPzGCHCOdFLreKN60etEOe3aPe48TwfpT1Us=;
        b=dUpcpg5/RgjfTIJ1X88Qvv8u5kxcg8gwFVDEn+LJJ6w/7SojMQ1cojruYp3ddKTT1l
         JsquDTDWwGao+uHusBizLAH6bH38NutkxNai7qgf/CLaiBMcuCSI4eh6erX3jnjG7WeH
         2IEqtm1UaR304caRg5t7MyfRveszw0M2ue1IiI3UNvszPdqbRwRy8T98LIxN4+n2X4vL
         NPhiXmhw7XzwkcgPwKOexw5H7nky9UEr4fnVNTxQzDlOZegYoR1wg2Ef8N1Qq8yS4toO
         5jZVOCCcDDugkNT1Fy5wZNNormS+pOE2RHtEHuhwvq6fKsBPClP9iUznNZFx+gsy3yKy
         K1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=klnI03UIPzGCHCOdFLreKN60etEOe3aPe48TwfpT1Us=;
        b=Wb/71FAEYR/ACT0vtfJi8UkT2H//iPudjlnxbQe4sWR7CmriJEM1t6Z+qXdA1lF6Vj
         9xp7fPLa69783awa/sDKDm3sUYqx9Uw1qHpDO+E5QHKQvfJfs3T2JxNMRF+1H2125f6V
         ea1/G2geO0aZPV7Dve26Chlboyl41EWlqzWR6qDft+T67nuX+0g1GSZ+JeLLzCxTC2sq
         565zjUVwT7/sb7ZwbWEuRoJpZuocXMoPUYvIlNbEluqUJ/cYb+RUO+haPi/bsf6oDZWv
         wSMQ76DvWtuy96PEtDzxbsyMqC0w0REfSvm45HEwR1pJs6/m8iTYvoNufvuhmyetLBOF
         K5HA==
X-Gm-Message-State: AOAM531TIkWpZWIxPwpCbTqgumwO+EWBX7YH15KKyf+AiDA5684Mewzt
        Au9CGdxdXd1dbv815KPbhJTrc4/NZ+8cOg6m
X-Google-Smtp-Source: ABdhPJxc0ZcdGHi6AqkTLnTM/xaebFzkzZXP8WQFM0OchZd3cJ9XC/zr9BssOTX+vD/Fjpgw1A39Lw==
X-Received: by 2002:a17:903:1c6:: with SMTP id e6mr7010000plh.132.1643341856514;
        Thu, 27 Jan 2022 19:50:56 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 190sm6951958pfg.181.2022.01.27.19.50.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 19:50:56 -0800 (PST)
Message-ID: <61f36820.1c69fb81.ff526.49bc@mx.google.com>
Date:   Thu, 27 Jan 2022 19:50:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.17-rc1-438-g4db37f24284ff
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 201 builds: 8 failed, 193 passed, 99 errors,
 7 warnings (v5.17-rc1-438-g4db37f24284ff)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 201 builds: 8 failed, 193 passed, 99 errors, 7 wa=
rnings (v5.17-rc1-438-g4db37f24284ff)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.17-rc1-438-g4db37f24284ff/

Tree: next
Branch: pending-fixes
Git Describe: v5.17-rc1-438-g4db37f24284ff
Git Commit: 4db37f24284ff1fe9e32aab9eb2199fd9ab4c592
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-10) FAIL

arm:
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

mips:
    cavium_octeon_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning

arm:
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    cavium_octeon_defconfig (gcc-10): 92 errors
    ci20_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 error

riscv:

x86_64:
    allmodconfig (gcc-10): 2 errors
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment disc=
ards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3D=
discarded-qualifiers]
    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arch/mips/cavium-octeon/octeon-memcpy.S:399: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:375: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:372: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:371: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:371: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:370: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:370: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:369: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:369: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:368: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:368: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:367: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:367: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:366: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:366: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:350: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:348: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:347: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:337: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:336: Error: unrecognized o=
pcode `ptr 9b,s_exc_p2u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:335: Error: unrecognized o=
pcode `ptr 9b,s_exc_p3u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:334: Error: unrecognized o=
pcode `ptr 9b,s_exc_p4u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:332: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:331: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:330: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:329: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:328: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:327: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:325: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:324: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:310: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:305: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:298: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:295: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:288: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:285: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:270: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:269: Error: unrecognized o=
pcode `ptr 9b,s_exc_p2u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:268: Error: unrecognized o=
pcode `ptr 9b,s_exc_p3u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:267: Error: unrecognized o=
pcode `ptr 9b,s_exc_p4u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:265: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:264: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:263: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:262: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:251: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:250: Error: unrecognized o=
pcode `ptr 9b,s_exc_p2u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:249: Error: unrecognized o=
pcode `ptr 9b,s_exc_p3u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:248: Error: unrecognized o=
pcode `ptr 9b,s_exc_p4u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:247: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:246: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:245: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:244: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:243: Error: unrecognized o=
pcode `ptr 9b,s_exc_p5u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:242: Error: unrecognized o=
pcode `ptr 9b,s_exc_p6u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:241: Error: unrecognized o=
pcode `ptr 9b,s_exc_p7u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:240: Error: unrecognized o=
pcode `ptr 9b,s_exc_p8u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:238: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:237: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:236: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:235: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:221: Error: unrecognized o=
pcode `ptr 9b,s_exc_p1u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:220: Error: unrecognized o=
pcode `ptr 9b,s_exc_p2u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:219: Error: unrecognized o=
pcode `ptr 9b,s_exc_p3u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:218: Error: unrecognized o=
pcode `ptr 9b,s_exc_p4u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:217: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:216: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:215: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:214: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:213: Error: unrecognized o=
pcode `ptr 9b,s_exc_p5u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:212: Error: unrecognized o=
pcode `ptr 9b,s_exc_p6u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:211: Error: unrecognized o=
pcode `ptr 9b,s_exc_p7u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:210: Error: unrecognized o=
pcode `ptr 9b,s_exc_p8u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:209: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:208: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:207: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:206: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy_rewind16'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:204: Error: unrecognized o=
pcode `ptr 9b,s_exc_p9u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:202: Error: unrecognized o=
pcode `ptr 9b,s_exc_p10u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:201: Error: unrecognized o=
pcode `ptr 9b,s_exc_p11u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:200: Error: unrecognized o=
pcode `ptr 9b,s_exc_p12u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:199: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:198: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:197: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:196: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:195: Error: unrecognized o=
pcode `ptr 9b,s_exc_p13u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:194: Error: unrecognized o=
pcode `ptr 9b,s_exc_p14u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:193: Error: unrecognized o=
pcode `ptr 9b,s_exc_p15u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:192: Error: unrecognized o=
pcode `ptr 9b,s_exc_p16u'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:190: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:189: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:188: Error: unrecognized o=
pcode `ptr 9b,l_exc_copy'
    1    arch/mips/cavium-octeon/octeon-memcpy.S:187: Error: unrecognized o=
pcode `ptr 9b,l_exc'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'

Warnings summary:

    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    cc1: all warnings being treated as errors
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment discards =
=E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Ddisca=
rded-qualifiers]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 92 errors, 0 warning=
s, 0 section mismatches

Errors:
    arch/mips/cavium-octeon/octeon-memcpy.S:187: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:188: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:189: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:190: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:192: Error: unrecognized opcode=
 `ptr 9b,s_exc_p16u'
    arch/mips/cavium-octeon/octeon-memcpy.S:193: Error: unrecognized opcode=
 `ptr 9b,s_exc_p15u'
    arch/mips/cavium-octeon/octeon-memcpy.S:194: Error: unrecognized opcode=
 `ptr 9b,s_exc_p14u'
    arch/mips/cavium-octeon/octeon-memcpy.S:195: Error: unrecognized opcode=
 `ptr 9b,s_exc_p13u'
    arch/mips/cavium-octeon/octeon-memcpy.S:196: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:197: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:198: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:199: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:200: Error: unrecognized opcode=
 `ptr 9b,s_exc_p12u'
    arch/mips/cavium-octeon/octeon-memcpy.S:201: Error: unrecognized opcode=
 `ptr 9b,s_exc_p11u'
    arch/mips/cavium-octeon/octeon-memcpy.S:202: Error: unrecognized opcode=
 `ptr 9b,s_exc_p10u'
    arch/mips/cavium-octeon/octeon-memcpy.S:204: Error: unrecognized opcode=
 `ptr 9b,s_exc_p9u'
    arch/mips/cavium-octeon/octeon-memcpy.S:206: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:207: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:208: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:209: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:210: Error: unrecognized opcode=
 `ptr 9b,s_exc_p8u'
    arch/mips/cavium-octeon/octeon-memcpy.S:211: Error: unrecognized opcode=
 `ptr 9b,s_exc_p7u'
    arch/mips/cavium-octeon/octeon-memcpy.S:212: Error: unrecognized opcode=
 `ptr 9b,s_exc_p6u'
    arch/mips/cavium-octeon/octeon-memcpy.S:213: Error: unrecognized opcode=
 `ptr 9b,s_exc_p5u'
    arch/mips/cavium-octeon/octeon-memcpy.S:214: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:215: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:216: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:217: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy_rewind16'
    arch/mips/cavium-octeon/octeon-memcpy.S:218: Error: unrecognized opcode=
 `ptr 9b,s_exc_p4u'
    arch/mips/cavium-octeon/octeon-memcpy.S:219: Error: unrecognized opcode=
 `ptr 9b,s_exc_p3u'
    arch/mips/cavium-octeon/octeon-memcpy.S:220: Error: unrecognized opcode=
 `ptr 9b,s_exc_p2u'
    arch/mips/cavium-octeon/octeon-memcpy.S:221: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:235: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:236: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:237: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:238: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:240: Error: unrecognized opcode=
 `ptr 9b,s_exc_p8u'
    arch/mips/cavium-octeon/octeon-memcpy.S:241: Error: unrecognized opcode=
 `ptr 9b,s_exc_p7u'
    arch/mips/cavium-octeon/octeon-memcpy.S:242: Error: unrecognized opcode=
 `ptr 9b,s_exc_p6u'
    arch/mips/cavium-octeon/octeon-memcpy.S:243: Error: unrecognized opcode=
 `ptr 9b,s_exc_p5u'
    arch/mips/cavium-octeon/octeon-memcpy.S:244: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:245: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:246: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:247: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:248: Error: unrecognized opcode=
 `ptr 9b,s_exc_p4u'
    arch/mips/cavium-octeon/octeon-memcpy.S:249: Error: unrecognized opcode=
 `ptr 9b,s_exc_p3u'
    arch/mips/cavium-octeon/octeon-memcpy.S:250: Error: unrecognized opcode=
 `ptr 9b,s_exc_p2u'
    arch/mips/cavium-octeon/octeon-memcpy.S:251: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:262: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:263: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:264: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:265: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:267: Error: unrecognized opcode=
 `ptr 9b,s_exc_p4u'
    arch/mips/cavium-octeon/octeon-memcpy.S:268: Error: unrecognized opcode=
 `ptr 9b,s_exc_p3u'
    arch/mips/cavium-octeon/octeon-memcpy.S:269: Error: unrecognized opcode=
 `ptr 9b,s_exc_p2u'
    arch/mips/cavium-octeon/octeon-memcpy.S:270: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:285: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:288: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:295: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:298: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:305: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:310: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:324: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:325: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:327: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:328: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:329: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:330: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:331: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:332: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:334: Error: unrecognized opcode=
 `ptr 9b,s_exc_p4u'
    arch/mips/cavium-octeon/octeon-memcpy.S:335: Error: unrecognized opcode=
 `ptr 9b,s_exc_p3u'
    arch/mips/cavium-octeon/octeon-memcpy.S:336: Error: unrecognized opcode=
 `ptr 9b,s_exc_p2u'
    arch/mips/cavium-octeon/octeon-memcpy.S:337: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:347: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:348: Error: unrecognized opcode=
 `ptr 9b,l_exc_copy'
    arch/mips/cavium-octeon/octeon-memcpy.S:350: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1u'
    arch/mips/cavium-octeon/octeon-memcpy.S:366: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:366: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1'
    arch/mips/cavium-octeon/octeon-memcpy.S:367: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:367: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1'
    arch/mips/cavium-octeon/octeon-memcpy.S:368: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:368: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1'
    arch/mips/cavium-octeon/octeon-memcpy.S:369: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:369: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1'
    arch/mips/cavium-octeon/octeon-memcpy.S:370: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:370: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1'
    arch/mips/cavium-octeon/octeon-memcpy.S:371: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:371: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1'
    arch/mips/cavium-octeon/octeon-memcpy.S:372: Error: unrecognized opcode=
 `ptr 9b,l_exc'
    arch/mips/cavium-octeon/octeon-memcpy.S:375: Error: unrecognized opcode=
 `ptr 9b,s_exc_p1'
    arch/mips/cavium-octeon/octeon-memcpy.S:399: Error: unrecognized opcode=
 `ptr 9b,l_exc'

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+crypto (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+ima (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8a: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to do_s=
trnlen_user() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
