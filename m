Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF264D0599
	for <lists+linux-next@lfdr.de>; Mon,  7 Mar 2022 18:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbiCGRsN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Mar 2022 12:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244644AbiCGRsL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2022 12:48:11 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F05571EE3
        for <linux-next@vger.kernel.org>; Mon,  7 Mar 2022 09:47:14 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o23so14201606pgk.13
        for <linux-next@vger.kernel.org>; Mon, 07 Mar 2022 09:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TrhR24qmw7DSvH6fOnwCnsPcty1f2JtFb1f0gjqCRlg=;
        b=eEoOy9jXeVreMxYAtQIbrJzfbrmk+9b1mAFtocFf/XiFl5MupwqF3fCev+Y5f9gpHH
         kkn0CYcMrle5Om4LrA/V31J+HH66fCjmt+ghbcxuk66WAvK/+2/WhBGxLURjbzivS+eo
         ESYaSqlcaDzl0pgfWayl6Gsi6uXc54Mtve8rnALypYhhf4Eazh1Q4vMWh7G1N9d9rQ9E
         6ralkr1z+D+NL8BmL9Nscvz3dw3ltXhizk+W7cpROa/5B/Vtapje/fUZFQ4WWArjCJY8
         eLJ3af2PduLbtVln1pHiLWJZ001zIZNv+WT5tRRwyNDxCBiAuofnHQpfMU4sMBuwchS9
         ihcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TrhR24qmw7DSvH6fOnwCnsPcty1f2JtFb1f0gjqCRlg=;
        b=2CHJcCEypYPjB3gXbX+JU0Uzh0O0Lc2rB1KH6KlLqncCzxLgod9W02XKmdXAgU0Rgg
         fburDcNN4Pew1+SRCFBtWKdCDnMKqS9CF7/2aNqcJktsShPu2kcOBYCHEkMH4WOFrlGo
         vtJ7/8CGDKB+CUhj04RUdkUekubka+MIxkTb6sC7tW0h++eEmH+nOZa92UAAhB7NHidh
         ByohcGhU2FViqx6zfy6hg3ra1lU+I4XVz8UdG/caXCoteqMtgBs6VBypFsf682evquUU
         MEX7HGlsmIQ57MWHRO1LvLs0AwlEHaLgiyjqFzSZvpCKdddaTNGSV8jkLpxpG6MkOVRX
         0JnQ==
X-Gm-Message-State: AOAM5315E8XdpuZsGZdFfdaa7dSctU5IfAiymN1zODF4osdjfwLwhoZ5
        OMBov1K4iqimq4ZqwIWGCNvZBMQF4ug5jwXiDXg=
X-Google-Smtp-Source: ABdhPJxNkYpbt4/02y9GJcWnw04lCVCFTL4T8jMP3TiQAkE9JoOIe+I5rCEMzDPoYqYVBYZN920Mew==
X-Received: by 2002:a05:6a00:815:b0:4f6:ee04:30af with SMTP id m21-20020a056a00081500b004f6ee0430afmr9088506pfk.15.1646675232002;
        Mon, 07 Mar 2022 09:47:12 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q9-20020a056a00088900b004e03b051040sm17221858pfj.112.2022.03.07.09.47.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 09:47:11 -0800 (PST)
Message-ID: <6226451f.1c69fb81.ee5a.ae93@mx.google.com>
Date:   Mon, 07 Mar 2022 09:47:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220307
Subject: next/master build: 177 builds: 62 failed, 115 passed, 330 errors,
 329 warnings (next-20220307)
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

next/master build: 177 builds: 62 failed, 115 passed, 330 errors, 329 warni=
ngs (next-20220307)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220307/

Tree: next
Branch: master
Git Describe: next-20220307
Git Commit: 519dd6c19986696f59847ff8bf930436ccffd9a1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    32r2el_defconfig+kselftest: (gcc-10) FAIL
    allnoconfig: (gcc-10) FAIL
    ar7_defconfig: (gcc-10) FAIL
    ath25_defconfig: (gcc-10) FAIL
    ath79_defconfig: (gcc-10) FAIL
    bcm63xx_defconfig: (gcc-10) FAIL
    bigsur_defconfig: (gcc-10) FAIL
    bmips_be_defconfig: (gcc-10) FAIL
    bmips_stb_defconfig: (gcc-10) FAIL
    capcella_defconfig: (gcc-10) FAIL
    cavium_octeon_defconfig: (gcc-10) FAIL
    ci20_defconfig: (gcc-10) FAIL
    cobalt_defconfig: (gcc-10) FAIL
    cu1000-neo_defconfig: (gcc-10) FAIL
    cu1830-neo_defconfig: (gcc-10) FAIL
    db1xxx_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    e55_defconfig: (gcc-10) FAIL
    fuloong2e_defconfig: (gcc-10) FAIL
    ip22_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    ip32_defconfig: (gcc-10) FAIL
    jazz_defconfig: (gcc-10) FAIL
    lemote2f_defconfig: (gcc-10) FAIL
    loongson1b_defconfig: (gcc-10) FAIL
    loongson1c_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL
    malta_defconfig: (gcc-10) FAIL
    malta_kvm_defconfig: (gcc-10) FAIL
    malta_qemu_32r6_defconfig: (gcc-10) FAIL
    maltaaprp_defconfig: (gcc-10) FAIL
    maltasmvp_defconfig: (gcc-10) FAIL
    maltasmvp_eva_defconfig: (gcc-10) FAIL
    maltaup_defconfig: (gcc-10) FAIL
    maltaup_xpa_defconfig: (gcc-10) FAIL
    mpc30x_defconfig: (gcc-10) FAIL
    mtx1_defconfig: (gcc-10) FAIL
    omega2p_defconfig: (gcc-10) FAIL
    pic32mzda_defconfig: (gcc-10) FAIL
    qi_lb60_defconfig: (gcc-10) FAIL
    rbtx49xx_defconfig: (gcc-10) FAIL
    rt305x_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL
    tb0226_defconfig: (gcc-10) FAIL
    tb0287_defconfig: (gcc-10) FAIL
    vocore2_defconfig: (gcc-10) FAIL
    workpad_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

riscv:
    defconfig+CONFIG_EFI=3Dn: (clang-14) FAIL
    defconfig: (gcc-10) FAIL
    defconfig+debug: (gcc-10) FAIL
    defconfig+kselftest: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_defconfig (gcc-10): 2 warnings
    tinyconfig (gcc-10): 2 warnings

arm64:
    allmodconfig (clang-14): 1 error, 1 warning

arm:
    allmodconfig (clang-14): 1 error, 14 warnings
    allmodconfig (gcc-10): 2 errors, 1 warning
    aspeed_g4_defconfig (gcc-10): 4 warnings
    assabet_defconfig (gcc-10): 4 warnings
    at91_dt_defconfig (gcc-10): 4 warnings
    axm55xx_defconfig (gcc-10): 6 warnings
    badge4_defconfig (gcc-10): 4 warnings
    cm_x300_defconfig (gcc-10): 4 warnings
    colibri_pxa270_defconfig (gcc-10): 4 warnings
    colibri_pxa300_defconfig (gcc-10): 4 warnings
    corgi_defconfig (gcc-10): 4 warnings
    ep93xx_defconfig (gcc-10): 4 warnings
    eseries_pxa_defconfig (gcc-10): 4 warnings
    ezx_defconfig (gcc-10): 4 warnings
    footbridge_defconfig (gcc-10): 4 warnings
    h3600_defconfig (gcc-10): 4 warnings
    h5000_defconfig (gcc-10): 4 warnings
    hackkit_defconfig (gcc-10): 4 warnings
    hisi_defconfig (gcc-10): 4 warnings
    imx_v4_v5_defconfig (gcc-10): 4 warnings
    iop32x_defconfig (gcc-10): 4 warnings
    ixp4xx_defconfig (gcc-10): 4 warnings
    jornada720_defconfig (gcc-10): 4 warnings
    lpc18xx_defconfig (gcc-10): 1 warning
    lpc32xx_defconfig (gcc-10): 4 warnings
    lubbock_defconfig (gcc-10): 4 warnings
    mini2440_defconfig (gcc-10): 4 warnings
    mmp2_defconfig (gcc-10): 4 warnings
    moxart_defconfig (gcc-10): 4 warnings
    multi_v7_defconfig (clang-14): 13 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 2 warni=
ngs
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+debug (gcc-10): 2 warnings
    multi_v7_defconfig+kselftest (gcc-10): 2 warnings
    mvebu_v5_defconfig (gcc-10): 4 warnings
    mvebu_v7_defconfig (gcc-10): 4 warnings
    mxs_defconfig (gcc-10): 4 warnings
    neponset_defconfig (gcc-10): 4 warnings
    omap1_defconfig (gcc-10): 4 warnings
    orion5x_defconfig (gcc-10): 4 warnings
    palmz72_defconfig (gcc-10): 4 warnings
    pcm027_defconfig (gcc-10): 4 warnings
    pleb_defconfig (gcc-10): 4 warnings
    pxa255-idp_defconfig (gcc-10): 4 warnings
    pxa3xx_defconfig (gcc-10): 4 warnings
    pxa910_defconfig (gcc-10): 4 warnings
    pxa_defconfig (gcc-10): 4 warnings
    qcom_defconfig (gcc-10): 4 errors
    rpc_defconfig (gcc-10): 2 errors
    s3c2410_defconfig (gcc-10): 4 warnings
    s5pv210_defconfig (gcc-10): 4 warnings
    sama5_defconfig (gcc-10): 4 warnings
    shannon_defconfig (gcc-10): 4 warnings
    simpad_defconfig (gcc-10): 4 warnings
    socfpga_defconfig (gcc-10): 4 warnings
    spear13xx_defconfig (gcc-10): 4 warnings
    spear3xx_defconfig (gcc-10): 4 warnings
    spear6xx_defconfig (gcc-10): 4 warnings
    spitz_defconfig (gcc-10): 4 warnings
    stm32_defconfig (gcc-10): 1 warning
    vexpress_defconfig (gcc-10): 2 warnings
    viper_defconfig (gcc-10): 4 warnings
    vt8500_v6_v7_defconfig (gcc-10): 4 warnings
    xcep_defconfig (gcc-10): 4 warnings
    zeus_defconfig (gcc-10): 4 warnings

i386:
    allmodconfig (clang-14): 1 error, 1 warning
    tinyconfig (gcc-10): 2 warnings

mips:
    32r2el_defconfig+debug (gcc-10): 6 errors, 2 warnings
    32r2el_defconfig+kselftest (gcc-10): 6 errors, 4 warnings
    allnoconfig (gcc-10): 6 errors, 1 warning
    ar7_defconfig (gcc-10): 6 errors, 1 warning
    ath25_defconfig (gcc-10): 6 errors, 1 warning
    ath79_defconfig (gcc-10): 6 errors, 1 warning
    bcm63xx_defconfig (gcc-10): 6 errors, 1 warning
    bigsur_defconfig (gcc-10): 6 errors, 1 warning
    bmips_be_defconfig (gcc-10): 6 errors, 1 warning
    bmips_stb_defconfig (gcc-10): 6 errors, 1 warning
    capcella_defconfig (gcc-10): 6 errors, 1 warning
    cavium_octeon_defconfig (gcc-10): 6 errors, 1 warning
    ci20_defconfig (gcc-10): 6 errors, 2 warnings
    cobalt_defconfig (gcc-10): 6 errors, 1 warning
    cu1000-neo_defconfig (gcc-10): 6 errors, 1 warning
    cu1830-neo_defconfig (gcc-10): 6 errors, 1 warning
    db1xxx_defconfig (gcc-10): 6 errors, 1 warning
    decstation_r4k_defconfig (gcc-10): 6 errors, 1 warning
    e55_defconfig (gcc-10): 6 errors, 1 warning
    fuloong2e_defconfig (gcc-10): 6 errors, 1 warning
    ip22_defconfig (gcc-10): 6 errors, 1 warning
    ip32_defconfig (gcc-10): 6 errors, 1 warning
    jazz_defconfig (gcc-10): 6 errors, 1 warning
    lemote2f_defconfig (gcc-10): 6 errors, 1 warning
    loongson1b_defconfig (gcc-10): 6 errors, 1 warning
    loongson1c_defconfig (gcc-10): 6 errors, 1 warning
    loongson3_defconfig (gcc-10): 6 errors, 1 warning
    malta_defconfig (gcc-10): 6 errors, 1 warning
    malta_kvm_defconfig (gcc-10): 6 errors, 1 warning
    malta_qemu_32r6_defconfig (gcc-10): 6 errors, 1 warning
    maltaaprp_defconfig (gcc-10): 6 errors, 1 warning
    maltasmvp_defconfig (gcc-10): 6 errors, 1 warning
    maltasmvp_eva_defconfig (gcc-10): 6 errors, 1 warning
    maltaup_defconfig (gcc-10): 6 errors, 1 warning
    maltaup_xpa_defconfig (gcc-10): 6 errors, 1 warning
    mpc30x_defconfig (gcc-10): 6 errors, 1 warning
    mtx1_defconfig (gcc-10): 6 errors, 1 warning
    omega2p_defconfig (gcc-10): 6 errors, 1 warning
    pic32mzda_defconfig (gcc-10): 6 errors, 1 warning
    qi_lb60_defconfig (gcc-10): 6 errors, 1 warning
    rbtx49xx_defconfig (gcc-10): 6 errors, 1 warning
    rt305x_defconfig (gcc-10): 6 errors, 1 warning
    sb1250_swarm_defconfig (gcc-10): 6 errors, 1 warning
    tb0226_defconfig (gcc-10): 6 errors, 1 warning
    tb0287_defconfig (gcc-10): 6 errors, 1 warning
    vocore2_defconfig (gcc-10): 6 errors, 1 warning
    workpad_defconfig (gcc-10): 6 errors, 1 warning
    xway_defconfig (gcc-10): 6 errors, 1 warning

riscv:
    defconfig (gcc-10): 7 errors
    defconfig+CONFIG_EFI=3Dn (clang-14): 9 errors, 3 warnings
    defconfig+debug (gcc-10): 7 errors
    defconfig+kselftest (gcc-10): 5 errors
    nommu_k210_sdcard_defconfig (gcc-10): 3 warnings

x86_64:
    allmodconfig (gcc-10): 2 errors
    allmodconfig (clang-14): 1 error, 2 warnings
    tinyconfig (gcc-10): 2 warnings
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    48   mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 =
undeclared (first use in this function); did you mean =E2=80=98MADV_DONTNEE=
D=E2=80=99?
    48   mm/madvise.c:865:1: error: control reaches end of non-void functio=
n [-Werror=3Dreturn-type]
    48   mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98MADV_DONTNE=
ED=E2=80=99?
    48   mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98MADV_DONTNE=
ED=E2=80=99?
    48   mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 u=
ndeclared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=
=E2=80=99?
    48   mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99=
 undeclared (first use in this function); did you mean =E2=80=98MADV_DONTNE=
ED=E2=80=99?
    4    drivers/virtio/virtio_ring.c:1772:26: error: variable 'ring_size_i=
n_bytes' is uninitialized when used here [-Werror,-Wuninitialized]
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    virtio_crypto_akcipher_algs.c:(.text+0xa66): undefined reference t=
o `crypto_unregister_akcipher'
    1    virtio_crypto_akcipher_algs.c:(.text+0x98a): undefined reference t=
o `crypto_register_akcipher'
    1    virtio_crypto_akcipher_algs.c:(.text+0x98): undefined reference to=
 `crypto_register_akcipher'
    1    virtio_crypto_akcipher_algs.c:(.text+0x580): undefined reference t=
o `mpi_read_raw_data'
    1    virtio_crypto_akcipher_algs.c:(.text+0x56c): undefined reference t=
o `rsa_parse_pub_key'
    1    virtio_crypto_akcipher_algs.c:(.text+0x522): undefined reference t=
o `mpi_free'
    1    virtio_crypto_akcipher_algs.c:(.text+0x4e8): undefined reference t=
o `mpi_read_raw_data'
    1    virtio_crypto_akcipher_algs.c:(.text+0x4d4): undefined reference t=
o `rsa_parse_pub_key'
    1    virtio_crypto_akcipher_algs.c:(.text+0x48a): undefined reference t=
o `mpi_free'
    1    virtio_crypto_akcipher_algs.c:(.text+0x47e): undefined reference t=
o `mpi_free'
    1    virtio_crypto_akcipher_algs.c:(.text+0x478): undefined reference t=
o `mpi_free'
    1    virtio_crypto_akcipher_algs.c:(.text+0x46): undefined reference to=
 `crypto_register_akcipher'
    1    virtio_crypto_akcipher_algs.c:(.text+0x3fa): undefined reference t=
o `mpi_free'
    1    virtio_crypto_akcipher_algs.c:(.text+0x2ac): undefined reference t=
o `mpi_free'
    1    virtio_crypto_akcipher_algs.c:(.text+0x134): undefined reference t=
o `crypto_unregister_akcipher'
    1    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x53a):=
 undefined reference to `rsa_parse_priv_key'
    1    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x4b6):=
 undefined reference to `mpi_read_raw_data'
    1    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x4a2):=
 undefined reference to `rsa_parse_priv_key'
    1    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x4a0):=
 undefined reference to `rsa_parse_pub_key'
    1    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x490):=
 undefined reference to `rsa_parse_priv_key'
    1    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x16a):=
 undefined reference to `crypto_unregister_akcipher'
    1    riscv64-linux-gnu-ld: /tmp/kci/linux/build/../drivers/crypto/virti=
o/virtio_crypto_akcipher_algs.c:387: undefined reference to `mpi_read_raw_d=
ata'
    1    riscv64-linux-gnu-ld: /tmp/kci/linux/build/../drivers/crypto/virti=
o/virtio_crypto_akcipher_algs.c:381: undefined reference to `rsa_parse_pub_=
key'
    1    riscv64-linux-gnu-ld: /tmp/kci/linux/build/../drivers/crypto/virti=
o/virtio_crypto_akcipher_algs.c:378: undefined reference to `rsa_parse_priv=
_key'
    1    drm_dp_mst_topology.c:(.text+0x870c): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x7660): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x2964): undefined reference to `drm_=
kms_helper_hotplug_event'
    1    drm_dp_mst_topology.c:(.text+0x1ffc): undefined reference to `__dr=
m_atomic_helper_private_obj_duplicate_state'
    1    drivers/net/virtio_net.c:1873:49: error: format =E2=80=98%ld=E2=80=
=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has=
 type =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
    1    drivers/net/virtio_net.c:1823:49: error: format =E2=80=98%ld=E2=80=
=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has=
 type =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akciph=
er_algs.c:579: undefined reference to `crypto_unregister_akcipher'
    1    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akciph=
er_algs.c:549: undefined reference to `crypto_register_akcipher'
    1    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akciph=
er_algs.c:483: undefined reference to `mpi_free'
    1    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akciph=
er_algs.c:373: undefined reference to `mpi_free'

Warnings summary:

    53   arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    53   arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    53   arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    53   arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    48   cc1: some warnings being treated as errors
    13   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    8    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 =
has type =E2=80=98int=E2=80=99 [-Wformat=3D]
    8    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 =
has type =E2=80=98int=E2=80=99 [-Wformat=3D]
    6    drivers/virtio/virtio_ring.c:1753:27: note: initialize the variabl=
e 'ring_size_in_bytes' to silence this warning
    3    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99=
 defined but not used [-Wunused-function]
    2    kernel/sched/rt.c:3032:12: warning: =E2=80=98sched_rr_handler=E2=
=80=99 defined but not used [-Wunused-function]
    2    kernel/sched/rt.c:2993:12: warning: =E2=80=98sched_rt_handler=E2=
=80=99 defined but not used [-Wunused-function]
    2    drivers/virtio/virtio_ring.c:1772:26: warning: variable 'ring_size=
_in_bytes' is uninitialized when used here [-Wuninitialized]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    1 warning generated.
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x59: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
6: call to do_strncpy_from_user() with UACCESS enabled
    1    kernel/sched/rt.c:3032:12: warning: 'sched_rr_handler' defined but=
 not used [-Wunused-function]
    1    kernel/sched/rt.c:2993:12: warning: 'sched_rt_handler' defined but=
 not used [-Wunused-function]
    1    drivers/net/virtio_net.c:1873:49: warning: format '%ld' expects ar=
gument of type 'long int', but argument 3 has type 'int' [-Wformat=3D]
    1    drivers/net/virtio_net.c:1823:49: warning: format '%ld' expects ar=
gument of type 'long int', but argument 3 has type 'int' [-Wformat=3D]
    1    drivers/i2c/busses/i2c-designware-platdrv.c:465:12: warning: =E2=
=80=98dw_i2c_plat_resume=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/i2c/busses/i2c-designware-platdrv.c:444:12: warning: =E2=
=80=98dw_i2c_plat_suspend=E2=80=99 defined but not used [-Wunused-function]
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
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
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings,=
 0 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 4 warni=
ngs, 0 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    cc1: some warnings being treated as errors
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

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
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 1 error, 14 warnings, 0 sectio=
n mismatches

Errors:
    drivers/virtio/virtio_ring.c:1772:26: error: variable 'ring_size_in_byt=
es' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    drivers/virtio/virtio_ring.c:1753:27: note: initialize the variable 'ri=
ng_size_in_bytes' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-14) =E2=80=94 FAIL, 1 error, 2 warnings, 0 sect=
ion mismatches

Errors:
    drivers/virtio/virtio_ring.c:1772:26: error: variable 'ring_size_in_byt=
es' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
    drivers/virtio/virtio_ring.c:1753:27: note: initialize the variable 'ri=
ng_size_in_bytes' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/virtio/virtio_ring.c:1772:26: error: variable 'ring_size_in_byt=
es' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/virtio/virtio_ring.c:1753:27: note: initialize the variable 'ri=
ng_size_in_bytes' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/virtio/virtio_ring.c:1772:26: error: variable 'ring_size_in_byt=
es' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/virtio/virtio_ring.c:1753:27: note: initialize the variable 'ri=
ng_size_in_bytes' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section m=
ismatches

Errors:
    drivers/net/virtio_net.c:1823:49: error: format =E2=80=98%ld=E2=80=99 e=
xpects argument of type =E2=80=98long int=E2=80=99, but argument 3 has type=
 =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]
    drivers/net/virtio_net.c:1873:49: error: format =E2=80=98%ld=E2=80=99 e=
xpects argument of type =E2=80=98long int=E2=80=99, but argument 3 has type=
 =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 section m=
ismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 section=
 mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 secti=
on mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 secti=
on mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 se=
ction mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 se=
ction mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning,=
 0 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 =
section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 =
section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning=
, 0 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 FAIL, 7 errors, 0 warnings, 0 section m=
ismatches

Errors:
    virtio_crypto_akcipher_algs.c:(.text+0x3fa): undefined reference to `mp=
i_free'
    virtio_crypto_akcipher_algs.c:(.text+0x48a): undefined reference to `mp=
i_free'
    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x4a2): unde=
fined reference to `rsa_parse_priv_key'
    virtio_crypto_akcipher_algs.c:(.text+0x4d4): undefined reference to `rs=
a_parse_pub_key'
    virtio_crypto_akcipher_algs.c:(.text+0x4e8): undefined reference to `mp=
i_read_raw_data'
    virtio_crypto_akcipher_algs.c:(.text+0x98a): undefined reference to `cr=
ypto_register_akcipher'
    virtio_crypto_akcipher_algs.c:(.text+0xa66): undefined reference to `cr=
ypto_unregister_akcipher'

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-14) =E2=80=94 FAIL, 9 errors, 3 warn=
ings, 0 section mismatches

Errors:
    virtio_crypto_akcipher_algs.c:(.text+0x46): undefined reference to `cry=
pto_register_akcipher'
    virtio_crypto_akcipher_algs.c:(.text+0x98): undefined reference to `cry=
pto_register_akcipher'
    virtio_crypto_akcipher_algs.c:(.text+0x134): undefined reference to `cr=
ypto_unregister_akcipher'
    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x16a): unde=
fined reference to `crypto_unregister_akcipher'
    virtio_crypto_akcipher_algs.c:(.text+0x2ac): undefined reference to `mp=
i_free'
    virtio_crypto_akcipher_algs.c:(.text+0x478): undefined reference to `mp=
i_free'
    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x490): unde=
fined reference to `rsa_parse_priv_key'
    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x4a0): unde=
fined reference to `rsa_parse_pub_key'
    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x4b6): unde=
fined reference to `mpi_read_raw_data'

Warnings:
    drivers/virtio/virtio_ring.c:1772:26: warning: variable 'ring_size_in_b=
ytes' is uninitialized when used here [-Wuninitialized]
    drivers/virtio/virtio_ring.c:1753:27: note: initialize the variable 'ri=
ng_size_in_bytes' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 FAIL, 7 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akcipher_al=
gs.c:483: undefined reference to `mpi_free'
    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akcipher_al=
gs.c:373: undefined reference to `mpi_free'
    riscv64-linux-gnu-ld: /tmp/kci/linux/build/../drivers/crypto/virtio/vir=
tio_crypto_akcipher_algs.c:378: undefined reference to `rsa_parse_priv_key'
    riscv64-linux-gnu-ld: /tmp/kci/linux/build/../drivers/crypto/virtio/vir=
tio_crypto_akcipher_algs.c:381: undefined reference to `rsa_parse_pub_key'
    riscv64-linux-gnu-ld: /tmp/kci/linux/build/../drivers/crypto/virtio/vir=
tio_crypto_akcipher_algs.c:387: undefined reference to `mpi_read_raw_data'
    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akcipher_al=
gs.c:549: undefined reference to `crypto_register_akcipher'
    /tmp/kci/linux/build/../drivers/crypto/virtio/virtio_crypto_akcipher_al=
gs.c:579: undefined reference to `crypto_unregister_akcipher'

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 FAIL, 5 errors, 0 warnings, 0=
 section mismatches

Errors:
    virtio_crypto_akcipher_algs.c:(.text+0x47e): undefined reference to `mp=
i_free'
    virtio_crypto_akcipher_algs.c:(.text+0x522): undefined reference to `mp=
i_free'
    riscv64-linux-gnu-ld: virtio_crypto_akcipher_algs.c:(.text+0x53a): unde=
fined reference to `rsa_parse_priv_key'
    virtio_crypto_akcipher_algs.c:(.text+0x56c): undefined reference to `rs=
a_parse_pub_key'
    virtio_crypto_akcipher_algs.c:(.text+0x580): undefined reference to `mp=
i_read_raw_data'

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 section=
 mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/net/virtio_net.c:1823:49: warning: format '%ld' expects argumen=
t of type 'long int', but argument 3 has type 'int' [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format '%ld' expects argumen=
t of type 'long int', but argument 3 has type 'int' [-Wformat=3D]

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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

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
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

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
ip32_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 se=
ction mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 =
section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 =
section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 secti=
on mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warnin=
g, 0 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning,=
 0 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0=
 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 13 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    drivers/virtio/virtio_ring.c:1772:26: warning: variable 'ring_size_in_b=
ytes' is uninitialized when used here [-Wuninitialized]
    drivers/virtio/virtio_ring.c:1753:27: note: initialize the variable 'ri=
ng_size_in_bytes' to silence this warning
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 2 warnings, 0 section mismatches

Warnings:
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 2 warnings, 0 section mismatches

Warnings:
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 3 war=
nings, 0 section mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]
    drivers/i2c/busses/i2c-designware-platdrv.c:465:12: warning: =E2=80=98d=
w_i2c_plat_resume=E2=80=99 defined but not used [-Wunused-function]
    drivers/i2c/busses/i2c-designware-platdrv.c:444:12: warning: =E2=80=98d=
w_i2c_plat_suspend=E2=80=99 defined but not used [-Wunused-function]

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
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 s=
ection mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    drm_dp_mst_topology.c:(.text+0x1ffc): undefined reference to `__drm_ato=
mic_helper_private_obj_duplicate_state'
    drm_dp_mst_topology.c:(.text+0x2964): undefined reference to `drm_kms_h=
elper_hotplug_event'
    drm_dp_mst_topology.c:(.text+0x7660): undefined reference to `drm_kms_h=
elper_hotplug_event'
    drm_dp_mst_topology.c:(.text+0x870c): undefined reference to `drm_kms_h=
elper_hotplug_event'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 se=
ction mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
rt305x_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, =
0 section mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/binfmt_flat.c:117:12: warning: =E2=80=98flat_core_dump=E2=80=99 defi=
ned but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    kernel/sched/rt.c:3032:12: warning: =E2=80=98sched_rr_handler=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/sched/rt.c:2993:12: warning: =E2=80=98sched_rt_handler=E2=80=99 =
defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    kernel/sched/rt.c:3032:12: warning: 'sched_rr_handler' defined but not =
used [-Wunused-function]
    kernel/sched/rt.c:2993:12: warning: 'sched_rt_handler' defined but not =
used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/sched/rt.c:3032:12: warning: =E2=80=98sched_rr_handler=E2=80=99 =
defined but not used [-Wunused-function]
    kernel/sched/rt.c:2993:12: warning: =E2=80=98sched_rt_handler=E2=80=99 =
defined but not used [-Wunused-function]

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
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/net/virtio_net.c:1823:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]
    drivers/net/virtio_net.c:1873:49: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 3 has ty=
pe =E2=80=98int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x86: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x59: call to do_s=
trnlen_user() with UACCESS enabled

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
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    mm/madvise.c:55:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undecl=
ared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:789:19: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:859:47: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:998:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:1129:7: error: =E2=80=98MADV_DONTNEED_LOCKED=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MADV_DONTNEED=E2=
=80=99?
    mm/madvise.c:865:1: error: control reaches end of non-void function [-W=
error=3Dreturn-type]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---
For more info write to <info@kernelci.org>
