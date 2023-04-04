Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2026D5E3D
	for <lists+linux-next@lfdr.de>; Tue,  4 Apr 2023 12:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbjDDKzB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Apr 2023 06:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234176AbjDDKyE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Apr 2023 06:54:04 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78BD4234
        for <linux-next@vger.kernel.org>; Tue,  4 Apr 2023 03:53:17 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso33488342pjb.3
        for <linux-next@vger.kernel.org>; Tue, 04 Apr 2023 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680605597;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFMNv6e50Eo9GlYqb9XCB1dwGA0gALY2KZgJZCJOV0M=;
        b=Jodd/sSd5P4L5Q1/rkibvkiTrfpKw/uNAjzCCkn5glPKT7Be2K6s/SrvkNRoWbi/9Y
         +W3E7KjhUVF5oz8die+rRD1V2UepCXi6HA+lHPFNVk3BSANKxEN0gg77CWeBJk7JDZzI
         N+fdxh+6FxLYQC30sztwa94m4zQjbeSiXjm5O71M0meKhAt/nU+QgjKYB/1qKnVxfREw
         Lj8HriktRveohxCYuJv2a8bqfNcT4Hz7Zy2/wplgZz9v4Kp0kNqgHtjkJJ9NuCOHP/WN
         8WHERahw+imQ0dYa34B9Bi6sTRULmD99DTOz0mOP6WFOYjcuc6W+kWJqdBnGIVECoNBM
         gCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680605597;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFMNv6e50Eo9GlYqb9XCB1dwGA0gALY2KZgJZCJOV0M=;
        b=cEoRXPEBTCLBcQ4iJvxNn7umhYti0aXRK4X5JWdgASNKJSv49R13CGpE/8I6BxnnKt
         sgCJ1kvynTBHkkwxs7PB/VS2HG/95MH6Wn6DayYBsX8xbNE7URpGqEfg8rV1kceotQs9
         of6+6691zrdatd+5Ekp7DxrPrwagyC8OdIm6b6JQwB1gHzGqsszSluXMw4hWm6/rFJ0F
         m+VA4BNPbHUncYCdpeW5epLTCpxaKu4Era04NmJWKE919c8oDxZt9HnfjIBqW72/K6We
         3zcmkeKsvmzOMK1M0Cs/rHxEmY/ykMnwpUWnepwMnk4D3svMwSYZmMVZKfjmMFAnyVSW
         7Ytg==
X-Gm-Message-State: AAQBX9cVXiCe75BflfrHX/a0PGLuQmyNJZt0EkWv4XC0iSHAedzru3m8
        ixaVFcebHAKXMbLNNQ1trZ0c8ywkBnABMIJdjAT6zw==
X-Google-Smtp-Source: AKy350a3KcGkJVKxDe6NA57JDoKzsPBjCeii05NZzMGh6PYyc8O0W5cUqxUrr4EAgxOFmCxCC6k4kw==
X-Received: by 2002:a05:6a20:a89b:b0:db:36f0:a5c2 with SMTP id ca27-20020a056a20a89b00b000db36f0a5c2mr1513921pzb.59.1680605597077;
        Tue, 04 Apr 2023 03:53:17 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l26-20020a62be1a000000b0058dbd7a5e0esm8520270pff.89.2023.04.04.03.53.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:53:16 -0700 (PDT)
Message-ID: <642c019c.620a0220.2287b.05b7@mx.google.com>
Date:   Tue, 04 Apr 2023 03:53:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230404
Subject: next/master build: 12 builds: 0 failed, 12 passed (next-20230404)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 12 builds: 0 failed, 12 passed (next-20230404)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230404/

Tree: next
Branch: master
Git Describe: next-20230404
Git Commit: 6a53bda3aaf3de5edeea27d0b1d8781d067640b6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
