Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499C3F0A5E
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 00:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbfKEXph (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 18:45:37 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35018 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729688AbfKEXpg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2019 18:45:36 -0500
Received: by mail-wm1-f66.google.com with SMTP id 8so1346648wmo.0
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2019 15:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GDqOGO0DL72UXkBb8kOGakJEP7jvalgZJiCnG08hG/A=;
        b=eXdg14dPYHBOB6GFnBDScuDuImr2EXSztouiqVvSsQV82SdRiB52AtFMTjH9Mhmj7D
         jMIGVcieil0IFkLFDp0o/NktKMhNAuagophnXA/3iAv/VbZpkHYFfanYeRm2lBarPdmQ
         1JRc60R4pMobYpqKCDPeA3++RQnKS97DSh/lRvz/6p/l4AJPAaIHmhL7JoHFatAZKjSh
         Z2H0NHdCtDPaeTYq9UQV/Fhyv2CgLWe5zV59UfDcL76fF548viENSsayAhspDi64EWfz
         06RojKnAn/eQJUtY4jcgPr5XVG7iO7Sokb5xnuQvBvq8kMymPeNwDt1dqAAOkX7Jkk5G
         0gOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GDqOGO0DL72UXkBb8kOGakJEP7jvalgZJiCnG08hG/A=;
        b=BRhoH4rEAg6xeKVcDw2TnpXna+zrLzAaIEDrko4TI3D+hZ25rMgZ8qKrWSbb7LuKzw
         g292WhA65LoqMW2Q1X8P2xnGMsfQjLLyq1ZDcLijkAN39Cn08wpA3sgWmz6YVcAMKVD9
         OP0kFvkOlkWMIOEm37eMku9mJsR3P/cW0dZGGWj0YGmfTW1T1QqycWxDNWJg4Oc7t6u0
         ueZFBfumuiRuuDx//OeVzwLEVMwIxXblfYebqPxP/S2ZyxKRNTMAhxPoxvi61NwVohik
         wSMI2uy3WKYP4nTVsF0P/HpRrQXHjc3mq4qCAi7ag9q13w1TgSAjlvwsnEoOfEIiIDpk
         UB4g==
X-Gm-Message-State: APjAAAXaykBqLpj4ORNZAuNVzS3N+SyPr67DvessJ/NQGxmrzRFPn+fm
        I2u5p4QfRyXf+SXwe3pAzHXJxbf+6uJfnQ==
X-Google-Smtp-Source: APXvYqwt94J7YW/I0MA3dyajGJfjk049Y1q7kAIlQEefvzuHl8SAuqDE0+EgcsBTxbm4e/bIR0ptoA==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr1260142wmb.66.1572997527542;
        Tue, 05 Nov 2019 15:45:27 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f140sm162021wme.21.2019.11.05.15.45.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 15:45:26 -0800 (PST)
Message-ID: <5dc20996.1c69fb81.1a744.0ba1@mx.google.com>
Date:   Tue, 05 Nov 2019 15:45:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-169-gb258bc9facf7
Subject: next/pending-fixes build: 215 builds: 0 failed, 215 passed,
 295 warnings (v5.4-rc6-169-gb258bc9facf7)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 215 builds: 0 failed, 215 passed, 295 warnings (v=
5.4-rc6-169-gb258bc9facf7)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc6-169-gb258bc9facf7/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc6-169-gb258bc9facf7
Git Commit: b258bc9facf78f918196a3babfef616345c20cbf
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 29 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    defconfig (gcc-8): 27 warnings

arm:
    am200epdkit_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 1 warning
    ezx_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
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
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 27 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 1 warning
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
    sama5_defconfig (gcc-8): 1 warning
    shannon_defconfig (gcc-8): 1 warning
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
    i386_defconfig (gcc-8): 27 warnings

mips:
    32r2el_defconfig (gcc-8): 27 warnings
    db1xxx_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings


Warnings summary:

    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    26   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    6    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    5    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    .config:1167:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.qQ1jmJUIYh:4832:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qQ1jmJUIYh:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qQ1jmJUIYh:4815:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.qQ1jmJUIYh:4811:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.qQ1jmJUIYh:4791:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.qQ1jmJUIYh:4785:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.qQ1jmJUIYh:4776:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.qQ1jmJUIYh:4774:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qQ1jmJUIYh:4773:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.qQ1jmJUIYh:4772:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.qQ1jmJUIYh:4770:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.qQ1jmJUIYh:4769:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.qQ1jmJUIYh:4766:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.qQ1jmJUIYh:4759:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qQ1jmJUIYh:4749:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.qQ1jmJUIYh:4738:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qQ1jmJUIYh:4630:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.qQ1jmJUIYh:4626:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qQ1jmJUIYh:4601:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.qQ1jmJUIYh:4580:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qQ1jmJUIYh:4522:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.qQ1jmJUIYh:4521:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.qQ1jmJUIYh:4517:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.qQ1jmJUIYh:4516:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.qQ1jmJUIYh:4514:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.qQ1jmJUIYh:4513:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.qQ1jmJUIYh:4510:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.kdxfIYOIo3:8488:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kdxfIYOIo3:8472:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.kdxfIYOIo3:8471:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.kdxfIYOIo3:8467:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.kdxfIYOIo3:8447:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.kdxfIYOIo3:8441:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.kdxfIYOIo3:8432:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.kdxfIYOIo3:8430:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.kdxfIYOIo3:8429:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.kdxfIYOIo3:8428:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.kdxfIYOIo3:8426:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.kdxfIYOIo3:8425:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.kdxfIYOIo3:8422:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.kdxfIYOIo3:8415:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.kdxfIYOIo3:8405:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.kdxfIYOIo3:8394:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kdxfIYOIo3:8286:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.kdxfIYOIo3:8282:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kdxfIYOIo3:8257:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.kdxfIYOIo3:8236:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.kdxfIYOIo3:8178:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.kdxfIYOIo3:8177:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.kdxfIYOIo3:8173:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.kdxfIYOIo3:8172:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.kdxfIYOIo3:8170:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.kdxfIYOIo3:8169:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.kdxfIYOIo3:8166:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.gZ4dj0QtAr:7931:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.gZ4dj0QtAr:7915:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.gZ4dj0QtAr:7914:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.gZ4dj0QtAr:7910:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.gZ4dj0QtAr:7890:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.gZ4dj0QtAr:7884:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.gZ4dj0QtAr:7875:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.gZ4dj0QtAr:7873:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.gZ4dj0QtAr:7872:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.gZ4dj0QtAr:7871:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.gZ4dj0QtAr:7869:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.gZ4dj0QtAr:7868:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.gZ4dj0QtAr:7865:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.gZ4dj0QtAr:7858:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.gZ4dj0QtAr:7848:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.gZ4dj0QtAr:7837:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.gZ4dj0QtAr:7729:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.gZ4dj0QtAr:7725:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.gZ4dj0QtAr:7700:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.gZ4dj0QtAr:7679:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.gZ4dj0QtAr:7621:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.gZ4dj0QtAr:7620:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.gZ4dj0QtAr:7616:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.gZ4dj0QtAr:7615:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.gZ4dj0QtAr:7613:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.gZ4dj0QtAr:7612:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.gZ4dj0QtAr:7609:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.esPt9rWEtZ:4893:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.esPt9rWEtZ:4877:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.esPt9rWEtZ:4876:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.esPt9rWEtZ:4872:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.esPt9rWEtZ:4852:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.esPt9rWEtZ:4846:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.esPt9rWEtZ:4837:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.esPt9rWEtZ:4835:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.esPt9rWEtZ:4834:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.esPt9rWEtZ:4833:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.esPt9rWEtZ:4831:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.esPt9rWEtZ:4830:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.esPt9rWEtZ:4827:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.esPt9rWEtZ:4820:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.esPt9rWEtZ:4810:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.esPt9rWEtZ:4799:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.esPt9rWEtZ:4691:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.esPt9rWEtZ:4687:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.esPt9rWEtZ:4662:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.esPt9rWEtZ:4641:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.esPt9rWEtZ:4583:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.esPt9rWEtZ:4582:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.esPt9rWEtZ:4578:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.esPt9rWEtZ:4577:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.esPt9rWEtZ:4575:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.esPt9rWEtZ:4574:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.esPt9rWEtZ:4571:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VOamsoctCv:1746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VOamsoctCv:1730:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VOamsoctCv:1729:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VOamsoctCv:1725:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VOamsoctCv:1705:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VOamsoctCv:1699:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VOamsoctCv:1690:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VOamsoctCv:1688:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VOamsoctCv:1687:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VOamsoctCv:1686:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VOamsoctCv:1684:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VOamsoctCv:1683:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VOamsoctCv:1680:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VOamsoctCv:1673:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VOamsoctCv:1663:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VOamsoctCv:1652:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VOamsoctCv:1544:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VOamsoctCv:1540:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VOamsoctCv:1515:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VOamsoctCv:1494:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VOamsoctCv:1436:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VOamsoctCv:1435:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VOamsoctCv:1431:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VOamsoctCv:1430:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VOamsoctCv:1428:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VOamsoctCv:1427:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VOamsoctCv:1424:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.5YDjq1MlpO:3981:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.5YDjq1MlpO:3965:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.5YDjq1MlpO:3964:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.5YDjq1MlpO:3960:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.5YDjq1MlpO:3940:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.5YDjq1MlpO:3934:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.5YDjq1MlpO:3925:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.5YDjq1MlpO:3923:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.5YDjq1MlpO:3922:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.5YDjq1MlpO:3921:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.5YDjq1MlpO:3919:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.5YDjq1MlpO:3918:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.5YDjq1MlpO:3915:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.5YDjq1MlpO:3908:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.5YDjq1MlpO:3898:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.5YDjq1MlpO:3887:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.5YDjq1MlpO:3779:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.5YDjq1MlpO:3775:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.5YDjq1MlpO:3750:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.5YDjq1MlpO:3729:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.5YDjq1MlpO:3671:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.5YDjq1MlpO:3670:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.5YDjq1MlpO:3666:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.5YDjq1MlpO:3665:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.5YDjq1MlpO:3663:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.5YDjq1MlpO:3662:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.5YDjq1MlpO:3659:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.17fFJgbHUK:3372:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.17fFJgbHUK:3356:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.17fFJgbHUK:3355:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.17fFJgbHUK:3351:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.17fFJgbHUK:3331:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.17fFJgbHUK:3325:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.17fFJgbHUK:3316:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.17fFJgbHUK:3314:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.17fFJgbHUK:3313:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.17fFJgbHUK:3312:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.17fFJgbHUK:3310:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.17fFJgbHUK:3309:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.17fFJgbHUK:3306:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.17fFJgbHUK:3299:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.17fFJgbHUK:3289:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.17fFJgbHUK:3278:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.17fFJgbHUK:3170:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.17fFJgbHUK:3166:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.17fFJgbHUK:3141:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.17fFJgbHUK:3120:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.17fFJgbHUK:3062:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.17fFJgbHUK:3061:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.17fFJgbHUK:3057:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.17fFJgbHUK:3056:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.17fFJgbHUK:3054:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.17fFJgbHUK:3053:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.17fFJgbHUK:3050:warning: override: reassigning to sy=
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
    1    WARNING: vmlinux.o(.text.unlikely+0x3598): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x321c): Section mismatch in ref=
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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 27 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.5YDjq1MlpO:3659:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.5YDjq1MlpO:3662:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.5YDjq1MlpO:3663:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.5YDjq1MlpO:3665:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.5YDjq1MlpO:3666:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.5YDjq1MlpO:3670:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.5YDjq1MlpO:3671:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.5YDjq1MlpO:3729:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.5YDjq1MlpO:3750:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.5YDjq1MlpO:3775:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.5YDjq1MlpO:3779:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.5YDjq1MlpO:3887:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.5YDjq1MlpO:3898:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.5YDjq1MlpO:3908:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.5YDjq1MlpO:3915:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.5YDjq1MlpO:3918:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.5YDjq1MlpO:3919:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.5YDjq1MlpO:3921:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.5YDjq1MlpO:3922:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.5YDjq1MlpO:3923:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.5YDjq1MlpO:3925:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.5YDjq1MlpO:3934:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.5YDjq1MlpO:3940:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.5YDjq1MlpO:3960:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.5YDjq1MlpO:3964:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.5YDjq1MlpO:3965:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.5YDjq1MlpO:3981:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
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
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
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
    WARNING: vmlinux.o(.text.unlikely+0x3598): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x321c): Section mismatch in referenc=
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
    ./.tmp.config.17fFJgbHUK:3050:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.17fFJgbHUK:3053:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.17fFJgbHUK:3054:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.17fFJgbHUK:3056:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.17fFJgbHUK:3057:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.17fFJgbHUK:3061:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.17fFJgbHUK:3062:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.17fFJgbHUK:3120:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.17fFJgbHUK:3141:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.17fFJgbHUK:3166:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.17fFJgbHUK:3170:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.17fFJgbHUK:3278:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.17fFJgbHUK:3289:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.17fFJgbHUK:3299:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.17fFJgbHUK:3306:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.17fFJgbHUK:3309:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.17fFJgbHUK:3310:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.17fFJgbHUK:3312:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.17fFJgbHUK:3313:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.17fFJgbHUK:3314:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.17fFJgbHUK:3316:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.17fFJgbHUK:3325:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.17fFJgbHUK:3331:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.17fFJgbHUK:3351:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.17fFJgbHUK:3355:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.17fFJgbHUK:3356:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.17fFJgbHUK:3372:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.gZ4dj0QtAr:7609:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.gZ4dj0QtAr:7612:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.gZ4dj0QtAr:7613:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.gZ4dj0QtAr:7615:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.gZ4dj0QtAr:7616:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.gZ4dj0QtAr:7620:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.gZ4dj0QtAr:7621:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.gZ4dj0QtAr:7679:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.gZ4dj0QtAr:7700:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.gZ4dj0QtAr:7725:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.gZ4dj0QtAr:7729:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.gZ4dj0QtAr:7837:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.gZ4dj0QtAr:7848:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.gZ4dj0QtAr:7858:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.gZ4dj0QtAr:7865:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.gZ4dj0QtAr:7868:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.gZ4dj0QtAr:7869:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.gZ4dj0QtAr:7871:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.gZ4dj0QtAr:7872:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.gZ4dj0QtAr:7873:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.gZ4dj0QtAr:7875:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.gZ4dj0QtAr:7884:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.gZ4dj0QtAr:7890:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.gZ4dj0QtAr:7910:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.gZ4dj0QtAr:7914:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.gZ4dj0QtAr:7915:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.gZ4dj0QtAr:7931:warning: override: reassigning to symbol =
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
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 27 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.qQ1jmJUIYh:4510:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.qQ1jmJUIYh:4513:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.qQ1jmJUIYh:4514:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.qQ1jmJUIYh:4516:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.qQ1jmJUIYh:4517:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.qQ1jmJUIYh:4521:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.qQ1jmJUIYh:4522:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.qQ1jmJUIYh:4580:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.qQ1jmJUIYh:4601:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.qQ1jmJUIYh:4626:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.qQ1jmJUIYh:4630:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.qQ1jmJUIYh:4738:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.qQ1jmJUIYh:4749:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.qQ1jmJUIYh:4759:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.qQ1jmJUIYh:4766:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.qQ1jmJUIYh:4769:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.qQ1jmJUIYh:4770:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.qQ1jmJUIYh:4772:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.qQ1jmJUIYh:4773:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.qQ1jmJUIYh:4774:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.qQ1jmJUIYh:4776:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.qQ1jmJUIYh:4785:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.qQ1jmJUIYh:4791:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.qQ1jmJUIYh:4811:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.qQ1jmJUIYh:4815:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.qQ1jmJUIYh:4816:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.qQ1jmJUIYh:4832:warning: override: reassigning to symbol =
USER_NS

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
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
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
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 27 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.kdxfIYOIo3:8166:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.kdxfIYOIo3:8169:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.kdxfIYOIo3:8170:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.kdxfIYOIo3:8172:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.kdxfIYOIo3:8173:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.kdxfIYOIo3:8177:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.kdxfIYOIo3:8178:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.kdxfIYOIo3:8236:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.kdxfIYOIo3:8257:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.kdxfIYOIo3:8282:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.kdxfIYOIo3:8286:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.kdxfIYOIo3:8394:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.kdxfIYOIo3:8405:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.kdxfIYOIo3:8415:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.kdxfIYOIo3:8422:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.kdxfIYOIo3:8425:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.kdxfIYOIo3:8426:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.kdxfIYOIo3:8428:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.kdxfIYOIo3:8429:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.kdxfIYOIo3:8430:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.kdxfIYOIo3:8432:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.kdxfIYOIo3:8441:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.kdxfIYOIo3:8447:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.kdxfIYOIo3:8467:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.kdxfIYOIo3:8471:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.kdxfIYOIo3:8472:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.kdxfIYOIo3:8488:warning: override: reassigning to symbol =
USER_NS

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
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 29 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.VOamsoctCv:1424:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VOamsoctCv:1427:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.VOamsoctCv:1428:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.VOamsoctCv:1430:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.VOamsoctCv:1431:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.VOamsoctCv:1435:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.VOamsoctCv:1436:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.VOamsoctCv:1494:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VOamsoctCv:1515:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.VOamsoctCv:1540:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VOamsoctCv:1544:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.VOamsoctCv:1652:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VOamsoctCv:1663:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.VOamsoctCv:1673:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VOamsoctCv:1680:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VOamsoctCv:1683:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.VOamsoctCv:1684:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.VOamsoctCv:1686:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.VOamsoctCv:1687:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.VOamsoctCv:1688:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VOamsoctCv:1690:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.VOamsoctCv:1699:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.VOamsoctCv:1705:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.VOamsoctCv:1725:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.VOamsoctCv:1729:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.VOamsoctCv:1730:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VOamsoctCv:1746:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1167:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
    ./.tmp.config.esPt9rWEtZ:4571:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.esPt9rWEtZ:4574:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.esPt9rWEtZ:4575:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.esPt9rWEtZ:4577:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.esPt9rWEtZ:4578:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.esPt9rWEtZ:4582:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.esPt9rWEtZ:4583:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.esPt9rWEtZ:4641:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.esPt9rWEtZ:4662:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.esPt9rWEtZ:4687:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.esPt9rWEtZ:4691:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.esPt9rWEtZ:4799:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.esPt9rWEtZ:4810:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.esPt9rWEtZ:4820:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.esPt9rWEtZ:4827:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.esPt9rWEtZ:4830:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.esPt9rWEtZ:4831:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.esPt9rWEtZ:4833:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.esPt9rWEtZ:4834:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.esPt9rWEtZ:4835:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.esPt9rWEtZ:4837:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.esPt9rWEtZ:4846:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.esPt9rWEtZ:4852:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.esPt9rWEtZ:4872:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.esPt9rWEtZ:4876:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.esPt9rWEtZ:4877:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.esPt9rWEtZ:4893:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
