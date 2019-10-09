Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39161D08E8
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 09:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfJIHz7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Oct 2019 03:55:59 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36488 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfJIHz6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Oct 2019 03:55:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id m18so1347838wmc.1
        for <linux-next@vger.kernel.org>; Wed, 09 Oct 2019 00:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=hOMlQXijfqsVJ5uN7cV7qmmVf+oZcqodGiYa4s6iDks=;
        b=f29tMZ+oFatBQGbd4yJlKClTX0fRYcTvtV01yCNJ7tGxhJffo6K3rq33IFK6vABsb5
         ZP3CfHN9OCXXTspvr/ONIlbuGopL4XHxXTsy0K3PKw82eX3DRa4GlrRJueoW11XF21nz
         QYxCfGVMcae4gBRM5Muuvk+IvEIt0dezwcsCgR+vPxMqd+e0AfYVjTkrCuJtJh7c7t1W
         3FmXBECOfgfHkw7QV/Q1/rXW4wMMdajFBAWhU4fxUtU3EBu/UhFPCtknBAUAWZptFsoN
         BsQIrhpjHkz6j5K3frbKtIzwJMVDMyT3m90693GMiZRM6vJA/sB5d135ww27w/kFIqDb
         zDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=hOMlQXijfqsVJ5uN7cV7qmmVf+oZcqodGiYa4s6iDks=;
        b=uJ9Vy+tVlk8EveVKW1NWhJiVlMAO/cdIx4H3FS106zPojgefkmMZXNyCcZqu4i5Q20
         psdwyhdIsVV6dHna+zZgbArO4EwI3wrwC7JV02hsymH4cz0ekDijXR8inyI804eb+g1Z
         6UOvdN5JSDI0ByghA09Y3dWrhwVXb0wyNdhRJaVtzl02lEpmJsVZAub1KWqURTs65gXP
         rOvHfuZWDofVa4xpCaM2VFZCI4U25TjLR/Rwoe0mVYn0JIZryfdeYI2VgOKNeaUMzTvE
         utyILxYuka+Ja9hi5VdIA9dnMWf+gde5qfUhjGfLVZsZj+YC6bmTtmoIlK6XnDaowt40
         PSgA==
X-Gm-Message-State: APjAAAVUJiHfJzIlQ6Nndmohrx/9f6e1O6U9sH2VkdSRglgzpCkANten
        EGCaroZkhfr7qLHVT26uVwSdxngH1hVGoA==
X-Google-Smtp-Source: APXvYqy6Dr1u68NFfqOTJU5O61FOjjwtPTItilnq85q+T9nbG1ZmXekpn6tg4TgzTpzqw5b6EUezyg==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr1609464wmb.40.1570607749559;
        Wed, 09 Oct 2019 00:55:49 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x5sm2046067wrg.69.2019.10.09.00.55.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 00:55:48 -0700 (PDT)
Message-ID: <5d9d9284.1c69fb81.b7af.87ec@mx.google.com>
Date:   Wed, 09 Oct 2019 00:55:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191009
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 218 builds: 5 failed, 213 passed, 112 errors,
 531 warnings (next-20191009)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 218 builds: 5 failed, 213 passed, 112 errors, 531 warnin=
gs (next-20191009)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191009/

Tree: next
Branch: master
Git Describe: next-20191009
Git Commit: 1ba4389f4572d716d73f8bacab4e181d82504780
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-8) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (gcc-8) FAIL

riscv:
    allnoconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 30 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (gcc-8): 45 errors, 6 warnings
    allmodconfig (clang-8): 20 errors, 27 warnings
    defconfig (gcc-8): 27 warnings

arm:
    allmodconfig (gcc-8): 45 errors, 9 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 171 warnings
    ezx_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 1 warning
    imx_v4_v5_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 31 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    palmz72_defconfig (gcc-8): 1 warning
    pcm027_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 1 warning
    realview_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 1 warning
    tango4_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 warning
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 28 warnings

mips:
    32r2el_defconfig (gcc-8): 28 warnings
    db1xxx_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    qi_lb60_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 1 warning

riscv:
    allnoconfig (gcc-8): 1 error, 1 warning
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings
    tinyconfig (gcc-8): 1 error, 1 warning

x86_64:
    allmodconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    2    drivers/edac/qcom_edac.c:99:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:98:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:97:3: error: array index in non-array ini=
tializer
    2    drivers/edac/qcom_edac.c:95:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:94:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:93:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:92:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:91:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:90:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:89:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:88:3: error: field name not in record or =
union initializer
    2    drivers/edac/qcom_edac.c:87:3: error: array index in non-array ini=
tializer
    2    drivers/edac/qcom_edac.c:86:40: error: array type has incomplete e=
lement type 'struct llcc_edac_reg_data'
    2    drivers/edac/qcom_edac.c:343:42: error: dereferencing pointer to i=
ncomplete type 'struct llcc_drv_data'
    2    drivers/edac/qcom_edac.c:298:21: error: dereferencing pointer to i=
ncomplete type 'struct llcc_drv_data'
    2    drivers/edac/qcom_edac.c:258:28: error: passing argument 1 of 'dum=
p_syn_reg_values' from incompatible pointer type [-Werror=3Dincompatible-po=
inter-types]
    2    drivers/edac/qcom_edac.c:249:48: error: passing argument 2 of 'qco=
m_llcc_clear_error_status' from incompatible pointer type [-Werror=3Dincomp=
atible-pointer-types]
    2    drivers/edac/qcom_edac.c:216:24: error: dereferencing pointer to i=
ncomplete type 'struct llcc_drv_data'
    2    drivers/edac/qcom_edac.c:210:9: error: variable 'reg_data' has ini=
tializer but incomplete type
    2    drivers/edac/qcom_edac.c:210:28: error: storage size of 'reg_data'=
 isn't known
    2    drivers/edac/qcom_edac.c:176:25: error: dereferencing pointer to i=
ncomplete type 'struct llcc_drv_data'
    2    drivers/edac/qcom_edac.c:125:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:124:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:123:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:122:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:121:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:120:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:119:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:118:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:117:3: error: array index in non-array in=
itializer
    2    drivers/edac/qcom_edac.c:115:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:114:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:113:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:112:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:111:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:110:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:109:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:108:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:107:3: error: array index in non-array in=
itializer
    2    drivers/edac/qcom_edac.c:105:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:104:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:103:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:102:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:101:3: error: field name not in record or=
 union initializer
    2    drivers/edac/qcom_edac.c:100:3: error: field name not in record or=
 union initializer
    2    arch/riscv/kernel/traps.c:130:17: error: implicit declaration of f=
unction 'get_break_insn_length' [-Werror=3Dimplicit-function-declaration]
    1    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    1    drivers/edac/qcom_edac.c:86:53: error: array has incomplete elemen=
t type 'const struct llcc_edac_reg_data'
    1    drivers/edac/qcom_edac.c:316:10: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:315:24: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:300:10: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:299:24: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:298:21: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:258:28: error: incompatible pointer types=
 passing 'struct llcc_drv_data *' to parameter of type 'struct llcc_drv_dat=
a *' [-Werror,-Wincompatible-pointer-types]
    1    drivers/edac/qcom_edac.c:249:48: error: incompatible pointer types=
 passing 'struct llcc_drv_data *' to parameter of type 'struct llcc_drv_dat=
a *' [-Werror,-Wincompatible-pointer-types]
    1    drivers/edac/qcom_edac.c:237:9: error: incomplete definition of ty=
pe 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:236:23: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:226:9: error: incomplete definition of ty=
pe 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:225:23: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:216:37: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:216:24: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:210:28: error: variable has incomplete ty=
pe 'struct llcc_edac_reg_data'
    1    drivers/edac/qcom_edac.c:193:25: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:188:25: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:181:25: error: incomplete definition of t=
ype 'struct llcc_drv_data'
    1    drivers/edac/qcom_edac.c:176:25: error: incomplete definition of t=
ype 'struct llcc_drv_data'

Warnings summary:

    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    26   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    1 warning generated.
    8    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'reg=
s' [-Wunused-variable]
    6    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    6    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    5    sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'ma=
tch' [-Wunused-variable]
    4    cc1: some warnings being treated as errors
    3    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/stora=
ge/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    3    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/stora=
ge/uas.ko needs unknown symbol usb_stor_adjust_quirks
    2    drivers/edac/qcom_edac.c:86:40: warning: 'edac_reg_data' defined b=
ut not used [-Wunused-variable]
    2    drivers/edac/qcom_edac.c:210:28: warning: unused variable 'reg_dat=
a' [-Wunused-variable]
    2    drivers/edac/qcom_edac.c:208:28: warning: 'struct llcc_drv_data' d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration
    2    drivers/edac/qcom_edac.c:169:51: warning: 'struct llcc_drv_data' d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    2 warnings generated.
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized =
when used within its own initialization [-Wuninitialized]
    1    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1    drivers/edac/qcom_edac.c:208:28: warning: declaration of 'struct l=
lcc_drv_data' will not be visible outside of this function [-Wvisibility]
    1    drivers/edac/qcom_edac.c:169:51: warning: declaration of 'struct l=
lcc_drv_data' will not be visible outside of this function [-Wvisibility]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_host_template_in=
it
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_in=
it
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_c=
ommand
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_i=
nit
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_b=
uf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_=
command
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/u=
sb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/u=
sb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    2 warnings and 20 errors generated.
    1    /tmp/ccNck8gT.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccNck8gT.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1199:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.bjhNzTRHjS:8523:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bjhNzTRHjS:8506:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.bjhNzTRHjS:8505:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.bjhNzTRHjS:8501:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.bjhNzTRHjS:8481:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.bjhNzTRHjS:8475:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.bjhNzTRHjS:8466:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.bjhNzTRHjS:8464:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.bjhNzTRHjS:8463:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.bjhNzTRHjS:8462:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.bjhNzTRHjS:8460:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.bjhNzTRHjS:8459:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.bjhNzTRHjS:8456:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.bjhNzTRHjS:8449:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.bjhNzTRHjS:8439:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.bjhNzTRHjS:8428:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bjhNzTRHjS:8320:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.bjhNzTRHjS:8316:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bjhNzTRHjS:8291:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.bjhNzTRHjS:8270:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.bjhNzTRHjS:8212:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.bjhNzTRHjS:8211:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.bjhNzTRHjS:8207:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.bjhNzTRHjS:8206:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.bjhNzTRHjS:8204:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.bjhNzTRHjS:8203:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.bjhNzTRHjS:8200:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.awfebQmS2m:3397:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.awfebQmS2m:3380:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.awfebQmS2m:3379:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.awfebQmS2m:3375:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.awfebQmS2m:3355:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.awfebQmS2m:3349:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.awfebQmS2m:3340:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.awfebQmS2m:3338:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.awfebQmS2m:3337:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.awfebQmS2m:3336:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.awfebQmS2m:3334:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.awfebQmS2m:3333:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.awfebQmS2m:3330:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.awfebQmS2m:3323:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.awfebQmS2m:3313:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.awfebQmS2m:3302:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.awfebQmS2m:3194:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.awfebQmS2m:3190:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.awfebQmS2m:3165:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.awfebQmS2m:3144:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.awfebQmS2m:3086:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.awfebQmS2m:3085:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.awfebQmS2m:3081:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.awfebQmS2m:3080:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.awfebQmS2m:3078:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.awfebQmS2m:3077:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.awfebQmS2m:3074:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Z7Y87jzy96:4920:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Z7Y87jzy96:4903:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Z7Y87jzy96:4902:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Z7Y87jzy96:4898:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Z7Y87jzy96:4878:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Z7Y87jzy96:4872:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Z7Y87jzy96:4863:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Z7Y87jzy96:4861:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Z7Y87jzy96:4860:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Z7Y87jzy96:4859:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Z7Y87jzy96:4857:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Z7Y87jzy96:4856:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Z7Y87jzy96:4853:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Z7Y87jzy96:4846:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Z7Y87jzy96:4836:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Z7Y87jzy96:4825:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Z7Y87jzy96:4717:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Z7Y87jzy96:4713:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Z7Y87jzy96:4688:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Z7Y87jzy96:4667:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Z7Y87jzy96:4609:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Z7Y87jzy96:4608:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Z7Y87jzy96:4604:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Z7Y87jzy96:4603:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Z7Y87jzy96:4601:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Z7Y87jzy96:4600:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Z7Y87jzy96:4597:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PcfYP8mYXr:4859:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PcfYP8mYXr:4842:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PcfYP8mYXr:4841:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.PcfYP8mYXr:4837:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.PcfYP8mYXr:4817:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.PcfYP8mYXr:4811:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.PcfYP8mYXr:4802:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.PcfYP8mYXr:4800:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PcfYP8mYXr:4799:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.PcfYP8mYXr:4798:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.PcfYP8mYXr:4796:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.PcfYP8mYXr:4795:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.PcfYP8mYXr:4792:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PcfYP8mYXr:4785:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PcfYP8mYXr:4775:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.PcfYP8mYXr:4764:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PcfYP8mYXr:4656:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.PcfYP8mYXr:4652:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PcfYP8mYXr:4627:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.PcfYP8mYXr:4606:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PcfYP8mYXr:4548:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.PcfYP8mYXr:4547:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.PcfYP8mYXr:4543:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.PcfYP8mYXr:4542:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.PcfYP8mYXr:4540:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.PcfYP8mYXr:4539:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.PcfYP8mYXr:4536:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Cq559mJiZN:4012:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Cq559mJiZN:3995:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Cq559mJiZN:3994:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Cq559mJiZN:3990:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Cq559mJiZN:3970:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Cq559mJiZN:3964:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Cq559mJiZN:3955:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Cq559mJiZN:3953:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Cq559mJiZN:3952:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Cq559mJiZN:3951:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Cq559mJiZN:3949:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Cq559mJiZN:3948:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Cq559mJiZN:3945:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Cq559mJiZN:3938:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Cq559mJiZN:3928:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Cq559mJiZN:3917:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Cq559mJiZN:3809:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Cq559mJiZN:3805:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Cq559mJiZN:3780:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Cq559mJiZN:3759:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Cq559mJiZN:3701:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Cq559mJiZN:3700:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Cq559mJiZN:3696:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Cq559mJiZN:3695:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Cq559mJiZN:3693:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Cq559mJiZN:3692:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Cq559mJiZN:3689:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.AzQPyDXLAy:7967:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.AzQPyDXLAy:7950:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.AzQPyDXLAy:7949:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.AzQPyDXLAy:7945:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.AzQPyDXLAy:7925:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.AzQPyDXLAy:7919:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.AzQPyDXLAy:7910:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.AzQPyDXLAy:7908:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.AzQPyDXLAy:7907:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.AzQPyDXLAy:7906:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.AzQPyDXLAy:7904:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.AzQPyDXLAy:7903:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.AzQPyDXLAy:7900:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.AzQPyDXLAy:7893:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.AzQPyDXLAy:7883:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.AzQPyDXLAy:7872:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.AzQPyDXLAy:7764:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.AzQPyDXLAy:7760:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.AzQPyDXLAy:7735:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.AzQPyDXLAy:7714:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.AzQPyDXLAy:7656:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.AzQPyDXLAy:7655:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.AzQPyDXLAy:7651:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.AzQPyDXLAy:7650:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.AzQPyDXLAy:7648:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.AzQPyDXLAy:7647:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.AzQPyDXLAy:7644:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8vEF4yuxLi:1776:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8vEF4yuxLi:1759:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8vEF4yuxLi:1758:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.8vEF4yuxLi:1754:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.8vEF4yuxLi:1734:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.8vEF4yuxLi:1728:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.8vEF4yuxLi:1719:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.8vEF4yuxLi:1717:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8vEF4yuxLi:1716:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.8vEF4yuxLi:1715:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.8vEF4yuxLi:1713:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.8vEF4yuxLi:1712:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.8vEF4yuxLi:1709:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8vEF4yuxLi:1702:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8vEF4yuxLi:1692:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.8vEF4yuxLi:1681:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8vEF4yuxLi:1573:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.8vEF4yuxLi:1569:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8vEF4yuxLi:1544:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.8vEF4yuxLi:1523:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8vEF4yuxLi:1465:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.8vEF4yuxLi:1464:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.8vEF4yuxLi:1460:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.8vEF4yuxLi:1459:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.8vEF4yuxLi:1457:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.8vEF4yuxLi:1456:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.8vEF4yuxLi:1453:warning: override: reassigning to sy=
mbol BPF_SYSCALL

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x3664): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3348): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 28 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.Cq559mJiZN:3689:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Cq559mJiZN:3692:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Cq559mJiZN:3693:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Cq559mJiZN:3695:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Cq559mJiZN:3696:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Cq559mJiZN:3700:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Cq559mJiZN:3701:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Cq559mJiZN:3759:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Cq559mJiZN:3780:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Cq559mJiZN:3805:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Cq559mJiZN:3809:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Cq559mJiZN:3917:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Cq559mJiZN:3928:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Cq559mJiZN:3938:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Cq559mJiZN:3945:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Cq559mJiZN:3948:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Cq559mJiZN:3949:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Cq559mJiZN:3951:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Cq559mJiZN:3952:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Cq559mJiZN:3953:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Cq559mJiZN:3955:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Cq559mJiZN:3964:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Cq559mJiZN:3970:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Cq559mJiZN:3990:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Cq559mJiZN:3994:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Cq559mJiZN:3995:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Cq559mJiZN:4012:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 45 errors, 9 warnings, 0 section =
mismatches

Errors:
    drivers/edac/qcom_edac.c:86:40: error: array type has incomplete elemen=
t type 'struct llcc_edac_reg_data'
    drivers/edac/qcom_edac.c:87:3: error: array index in non-array initiali=
zer
    drivers/edac/qcom_edac.c:88:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:89:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:90:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:91:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:92:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:93:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:94:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:95:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:97:3: error: array index in non-array initiali=
zer
    drivers/edac/qcom_edac.c:98:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:99:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:100:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:101:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:102:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:103:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:104:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:105:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:107:3: error: array index in non-array initial=
izer
    drivers/edac/qcom_edac.c:108:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:109:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:110:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:111:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:112:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:113:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:114:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:115:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:117:3: error: array index in non-array initial=
izer
    drivers/edac/qcom_edac.c:118:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:119:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:120:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:121:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:122:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:123:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:124:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:125:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:176:25: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'
    drivers/edac/qcom_edac.c:210:9: error: variable 'reg_data' has initiali=
zer but incomplete type
    drivers/edac/qcom_edac.c:210:28: error: storage size of 'reg_data' isn'=
t known
    drivers/edac/qcom_edac.c:216:24: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'
    drivers/edac/qcom_edac.c:249:48: error: passing argument 2 of 'qcom_llc=
c_clear_error_status' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
    drivers/edac/qcom_edac.c:258:28: error: passing argument 1 of 'dump_syn=
_reg_values' from incompatible pointer type [-Werror=3Dincompatible-pointer=
-types]
    drivers/edac/qcom_edac.c:298:21: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'
    drivers/edac/qcom_edac.c:343:42: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'

Warnings:
    /tmp/ccNck8gT.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccNck8gT.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    drivers/edac/qcom_edac.c:169:51: warning: 'struct llcc_drv_data' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    drivers/edac/qcom_edac.c:208:28: warning: 'struct llcc_drv_data' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    drivers/edac/qcom_edac.c:210:28: warning: unused variable 'reg_data' [-=
Wunused-variable]
    drivers/edac/qcom_edac.c:86:40: warning: 'edac_reg_data' defined but no=
t used [-Wunused-variable]
    cc1: some warnings being treated as errors
    sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'match' =
[-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 45 errors, 6 warnings, 0 sectio=
n mismatches

Errors:
    drivers/edac/qcom_edac.c:86:40: error: array type has incomplete elemen=
t type 'struct llcc_edac_reg_data'
    drivers/edac/qcom_edac.c:87:3: error: array index in non-array initiali=
zer
    drivers/edac/qcom_edac.c:88:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:89:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:90:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:91:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:92:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:93:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:94:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:95:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:97:3: error: array index in non-array initiali=
zer
    drivers/edac/qcom_edac.c:98:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:99:3: error: field name not in record or union=
 initializer
    drivers/edac/qcom_edac.c:100:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:101:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:102:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:103:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:104:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:105:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:107:3: error: array index in non-array initial=
izer
    drivers/edac/qcom_edac.c:108:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:109:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:110:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:111:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:112:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:113:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:114:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:115:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:117:3: error: array index in non-array initial=
izer
    drivers/edac/qcom_edac.c:118:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:119:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:120:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:121:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:122:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:123:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:124:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:125:3: error: field name not in record or unio=
n initializer
    drivers/edac/qcom_edac.c:176:25: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'
    drivers/edac/qcom_edac.c:210:9: error: variable 'reg_data' has initiali=
zer but incomplete type
    drivers/edac/qcom_edac.c:210:28: error: storage size of 'reg_data' isn'=
t known
    drivers/edac/qcom_edac.c:216:24: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'
    drivers/edac/qcom_edac.c:249:48: error: passing argument 2 of 'qcom_llc=
c_clear_error_status' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
    drivers/edac/qcom_edac.c:258:28: error: passing argument 1 of 'dump_syn=
_reg_values' from incompatible pointer type [-Werror=3Dincompatible-pointer=
-types]
    drivers/edac/qcom_edac.c:298:21: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'
    drivers/edac/qcom_edac.c:343:42: error: dereferencing pointer to incomp=
lete type 'struct llcc_drv_data'

Warnings:
    drivers/edac/qcom_edac.c:169:51: warning: 'struct llcc_drv_data' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    drivers/edac/qcom_edac.c:208:28: warning: 'struct llcc_drv_data' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    drivers/edac/qcom_edac.c:210:28: warning: unused variable 'reg_data' [-=
Wunused-variable]
    drivers/edac/qcom_edac.c:86:40: warning: 'edac_reg_data' defined but no=
t used [-Wunused-variable]
    cc1: some warnings being treated as errors
    sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'match' =
[-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 20 errors, 27 warnings, 0 sec=
tion mismatches

Errors:
    drivers/edac/qcom_edac.c:86:53: error: array has incomplete element typ=
e 'const struct llcc_edac_reg_data'
    drivers/edac/qcom_edac.c:176:25: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:181:25: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:188:25: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:193:25: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:210:28: error: variable has incomplete type 's=
truct llcc_edac_reg_data'
    drivers/edac/qcom_edac.c:216:24: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:216:37: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:225:23: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:226:9: error: incomplete definition of type 's=
truct llcc_drv_data'
    drivers/edac/qcom_edac.c:236:23: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:237:9: error: incomplete definition of type 's=
truct llcc_drv_data'
    drivers/edac/qcom_edac.c:249:48: error: incompatible pointer types pass=
ing 'struct llcc_drv_data *' to parameter of type 'struct llcc_drv_data *' =
[-Werror,-Wincompatible-pointer-types]
    drivers/edac/qcom_edac.c:258:28: error: incompatible pointer types pass=
ing 'struct llcc_drv_data *' to parameter of type 'struct llcc_drv_data *' =
[-Werror,-Wincompatible-pointer-types]
    drivers/edac/qcom_edac.c:298:21: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:299:24: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:300:10: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:315:24: error: incomplete definition of type '=
struct llcc_drv_data'
    drivers/edac/qcom_edac.c:316:10: error: incomplete definition of type '=
struct llcc_drv_data'
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

Warnings:
    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/edac/qcom_edac.c:169:51: warning: declaration of 'struct llcc_d=
rv_data' will not be visible outside of this function [-Wvisibility]
    drivers/edac/qcom_edac.c:208:28: warning: declaration of 'struct llcc_d=
rv_data' will not be visible outside of this function [-Wvisibility]
    2 warnings and 20 errors generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'match' =
[-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'match' =
[-Wunused-variable]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    arch/riscv/kernel/traps.c:130:17: error: implicit declaration of functi=
on 'get_break_insn_length' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3664): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3348): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.awfebQmS2m:3074:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.awfebQmS2m:3077:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.awfebQmS2m:3078:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.awfebQmS2m:3080:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.awfebQmS2m:3081:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.awfebQmS2m:3085:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.awfebQmS2m:3086:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.awfebQmS2m:3144:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.awfebQmS2m:3165:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.awfebQmS2m:3190:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.awfebQmS2m:3194:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.awfebQmS2m:3302:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.awfebQmS2m:3313:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.awfebQmS2m:3323:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.awfebQmS2m:3330:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.awfebQmS2m:3333:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.awfebQmS2m:3334:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.awfebQmS2m:3336:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.awfebQmS2m:3337:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.awfebQmS2m:3338:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.awfebQmS2m:3340:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.awfebQmS2m:3349:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.awfebQmS2m:3355:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.awfebQmS2m:3375:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.awfebQmS2m:3379:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.awfebQmS2m:3380:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.awfebQmS2m:3397:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.AzQPyDXLAy:7644:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.AzQPyDXLAy:7647:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.AzQPyDXLAy:7648:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.AzQPyDXLAy:7650:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.AzQPyDXLAy:7651:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.AzQPyDXLAy:7655:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.AzQPyDXLAy:7656:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.AzQPyDXLAy:7714:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.AzQPyDXLAy:7735:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.AzQPyDXLAy:7760:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.AzQPyDXLAy:7764:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.AzQPyDXLAy:7872:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.AzQPyDXLAy:7883:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.AzQPyDXLAy:7893:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.AzQPyDXLAy:7900:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.AzQPyDXLAy:7903:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.AzQPyDXLAy:7904:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.AzQPyDXLAy:7906:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.AzQPyDXLAy:7907:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.AzQPyDXLAy:7908:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.AzQPyDXLAy:7910:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.AzQPyDXLAy:7919:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.AzQPyDXLAy:7925:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.AzQPyDXLAy:7945:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.AzQPyDXLAy:7949:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.AzQPyDXLAy:7950:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.AzQPyDXLAy:7967:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 171 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_comma=
nd
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 28 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.PcfYP8mYXr:4536:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PcfYP8mYXr:4539:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.PcfYP8mYXr:4540:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.PcfYP8mYXr:4542:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.PcfYP8mYXr:4543:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.PcfYP8mYXr:4547:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.PcfYP8mYXr:4548:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.PcfYP8mYXr:4606:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PcfYP8mYXr:4627:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.PcfYP8mYXr:4652:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PcfYP8mYXr:4656:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.PcfYP8mYXr:4764:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PcfYP8mYXr:4775:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.PcfYP8mYXr:4785:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PcfYP8mYXr:4792:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PcfYP8mYXr:4795:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.PcfYP8mYXr:4796:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.PcfYP8mYXr:4798:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.PcfYP8mYXr:4799:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.PcfYP8mYXr:4800:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PcfYP8mYXr:4802:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.PcfYP8mYXr:4811:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.PcfYP8mYXr:4817:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.PcfYP8mYXr:4837:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.PcfYP8mYXr:4841:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.PcfYP8mYXr:4842:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PcfYP8mYXr:4859:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/st=
orage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/st=
orage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 4 warnings, 0 section mismatches

Warnings:
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 =
warnings, 0 section mismatches

Warnings:
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 31 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.bjhNzTRHjS:8200:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.bjhNzTRHjS:8203:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.bjhNzTRHjS:8204:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.bjhNzTRHjS:8206:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.bjhNzTRHjS:8207:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.bjhNzTRHjS:8211:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.bjhNzTRHjS:8212:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.bjhNzTRHjS:8270:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.bjhNzTRHjS:8291:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.bjhNzTRHjS:8316:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.bjhNzTRHjS:8320:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.bjhNzTRHjS:8428:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.bjhNzTRHjS:8439:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.bjhNzTRHjS:8449:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.bjhNzTRHjS:8456:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.bjhNzTRHjS:8459:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.bjhNzTRHjS:8460:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.bjhNzTRHjS:8462:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.bjhNzTRHjS:8463:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.bjhNzTRHjS:8464:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.bjhNzTRHjS:8466:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.bjhNzTRHjS:8475:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.bjhNzTRHjS:8481:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.bjhNzTRHjS:8501:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.bjhNzTRHjS:8505:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.bjhNzTRHjS:8506:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.bjhNzTRHjS:8523:warning: override: reassigning to symbol =
USER_NS
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc2-next-20191009/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 30 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.8vEF4yuxLi:1453:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8vEF4yuxLi:1456:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.8vEF4yuxLi:1457:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.8vEF4yuxLi:1459:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.8vEF4yuxLi:1460:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.8vEF4yuxLi:1464:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.8vEF4yuxLi:1465:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.8vEF4yuxLi:1523:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8vEF4yuxLi:1544:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.8vEF4yuxLi:1569:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8vEF4yuxLi:1573:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.8vEF4yuxLi:1681:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8vEF4yuxLi:1692:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.8vEF4yuxLi:1702:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8vEF4yuxLi:1709:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8vEF4yuxLi:1712:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.8vEF4yuxLi:1713:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.8vEF4yuxLi:1715:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.8vEF4yuxLi:1716:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.8vEF4yuxLi:1717:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8vEF4yuxLi:1719:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.8vEF4yuxLi:1728:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.8vEF4yuxLi:1734:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.8vEF4yuxLi:1754:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.8vEF4yuxLi:1758:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.8vEF4yuxLi:1759:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8vEF4yuxLi:1776:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    sound/soc/jz4740/jz4740-i2s.c:500:29: warning: unused variable 'match' =
[-Wunused-variable]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/usb/host/ohci-at91.c:118:28: warning: unused variable 'regs' [-=
Wunused-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1199:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    arch/riscv/kernel/traps.c:130:17: error: implicit declaration of functi=
on 'get_break_insn_length' [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.Z7Y87jzy96:4597:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Z7Y87jzy96:4600:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Z7Y87jzy96:4601:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Z7Y87jzy96:4603:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Z7Y87jzy96:4604:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Z7Y87jzy96:4608:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Z7Y87jzy96:4609:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Z7Y87jzy96:4667:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Z7Y87jzy96:4688:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Z7Y87jzy96:4713:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Z7Y87jzy96:4717:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Z7Y87jzy96:4825:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Z7Y87jzy96:4836:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Z7Y87jzy96:4846:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Z7Y87jzy96:4853:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Z7Y87jzy96:4856:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Z7Y87jzy96:4857:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Z7Y87jzy96:4859:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Z7Y87jzy96:4860:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Z7Y87jzy96:4861:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Z7Y87jzy96:4863:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Z7Y87jzy96:4872:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Z7Y87jzy96:4878:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Z7Y87jzy96:4898:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Z7Y87jzy96:4902:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Z7Y87jzy96:4903:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Z7Y87jzy96:4920:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
