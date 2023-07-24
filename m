Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4F275E99D
	for <lists+linux-next@lfdr.de>; Mon, 24 Jul 2023 04:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbjGXCRY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 Jul 2023 22:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbjGXCRH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Jul 2023 22:17:07 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F07191
        for <linux-next@vger.kernel.org>; Sun, 23 Jul 2023 19:16:25 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a1ebb85f99so2958575b6e.2
        for <linux-next@vger.kernel.org>; Sun, 23 Jul 2023 19:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690164936; x=1690769736;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+ND33l7DGcfgdzuazHgI256/4wtaTEwRk8rIvWZohc=;
        b=FNNwKNlo8IP9eoQU49S7ik42Hm/ScFAq144l0Q7QNuQG9lQGOcxF0hX1NuJ56NSFmn
         icFsB2d6kW09nlHW6iv1fGRKuWUJagiB3eTqq6jo7dbJvPFzK6c8E1MuC62t4gQrjO6+
         ckBo1QO4mzmm3tVmOQSS0OJrys1HIhtdUoA20Dn+qQdjatisi3J+R/vE5yPFfHoWf1aG
         TzS6CEKxnmbUCSJ62SgFXV5VBeb/b2JxHePPF/0APIjVahWFEtS2Q6H+EiMbH4I1hv3s
         8CxWyQ9N5wcQMH3FMldjhI/EpIThe1ScPCn9/8sn4Oq0gACuhaPEOOGaPDUNvvQ94B/U
         DBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690164936; x=1690769736;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+ND33l7DGcfgdzuazHgI256/4wtaTEwRk8rIvWZohc=;
        b=NjGPQF81npj1ImUeob7sQl5LqMzN0biCvFC3zHfV0YS1NmVhBhOsXHjsJRfC1qEI97
         hzrEROpLWwLgArZGLAId8EXNknS0qaMEv5/5YGO/G5r/zNH0tYBz4pAc68DfC5XZROEX
         tT7G5YtM2tdtjfVK0BjAAu0K2otr4bdO19ee3FJ3l/ZUxvgn8/Jkoo5Q9bVRy+H6CaEE
         c7hcDrImNwqS2NgjnMJEfiAw3U2b8yJUC0vwZgFnDWVYMpt/aEnS2LK44KfigeM01Oke
         X3KGRVeAvDiPFt90yYdD2i7hEI6d14dcemmMog7/DIzSh85aaWJ5wOLgj+WfUa/vy50w
         jEPA==
X-Gm-Message-State: ABy/qLYlsJhAaMcFxBzt//m44SaXdaJs6v47EpxMe1Ii8BLsDxp+USyM
        f7dWTuRsEpWYvmXPeROCaBdnc8XoBpJ0Hm9D6zU=
X-Google-Smtp-Source: APBJJlFwS+KXuUNigo47o5vI/VrdmhAOZlCbu5JfoOoLVnRXS/dgDuTGu7Rag3zXIjVAEdU0RRSYDA==
X-Received: by 2002:a05:6808:8a:b0:3a4:88e1:de3d with SMTP id s10-20020a056808008a00b003a488e1de3dmr8230593oic.39.1690164935761;
        Sun, 23 Jul 2023 19:15:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id c1-20020a639601000000b00563826c66eesm5492704pge.61.2023.07.23.19.15.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:15:35 -0700 (PDT)
Message-ID: <64bddec7.630a0220.4cfa2.8fd7@mx.google.com>
Date:   Sun, 23 Jul 2023 19:15:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.5-rc3-160-g3ab5fb77387e6
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 2 builds: 0 failed,
 2 passed (v6.5-rc3-160-g3ab5fb77387e6)
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

next/pending-fixes build: 2 builds: 0 failed, 2 passed (v6.5-rc3-160-g3ab5f=
b77387e6)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.5-rc3-160-g3ab5fb77387e6/

Tree: next
Branch: pending-fixes
Git Describe: v6.5-rc3-160-g3ab5fb77387e6
Git Commit: 3ab5fb77387e65d14e9b3e715a7329b5fcdc7a22
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 2 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
