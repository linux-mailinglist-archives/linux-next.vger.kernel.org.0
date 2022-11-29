Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE9B63B9B2
	for <lists+linux-next@lfdr.de>; Tue, 29 Nov 2022 07:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbiK2GMu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Nov 2022 01:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235392AbiK2GMs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Nov 2022 01:12:48 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2B663C6
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 22:12:42 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id a16so12306322pfg.4
        for <linux-next@vger.kernel.org>; Mon, 28 Nov 2022 22:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ylL3m3WkiaiBb1U9qwe4tuLSx4Mx2eaOKu2W3qoSE8Y=;
        b=lv55r+mlSlbVQnCi52eOzK4BpcrWtRoTtCFUHu+eQgVGDe8Yo0XMMursc6ylZ5q5BH
         AKUAk0CV37EkOMi5XsmFLI4SUuYoUW9eYZ0+lthNSRtkoADSvlNjV7/Jag7upNK6LTnA
         ZURRXp/LdOJboaICjTjMa50YFEOiD3ivV5B3o0scKcLixPjrlW91UP8km5Yx09zXxHoy
         DdzxjK5oiXnHEB7mXR5AAsftYLMvkHXZzd4s3CE7xhhQI/14F1VFwZDHZiA7I+fk22Bq
         UwZ5Qy3aK1wdf9GY1diBsgxh7w95LlZMJPnOGRi0ho+NiPtThFS+t+fCY3Lh4B8YGV7i
         rIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylL3m3WkiaiBb1U9qwe4tuLSx4Mx2eaOKu2W3qoSE8Y=;
        b=W+AKivRJEy8Nm+GGtiOWRuajxAo7ro/8UqQ96bVmQCQsYfIJ11H3Pc438LlvOjiByP
         CTypdiNIZKIohSr7Mx2CnRJh9nF+MFSZw0PoFoCVdA45w11kHKUgsv6+r1qB2hD5I0++
         cdyWJ/RQLi1DnJ3kcB1xjJi3mnbkcYc5n6GZUNmF+FQUEyYOU+hWliQLlbqXHKwvfES+
         wlAUCbG//3Z8XboSFJgWru9BYXht3vW41R41xArWZ1JQtA9pqLz/q2XWxA5jpWFU6KaX
         dD5AYagbEbbcI0NeTKHdB67SnN3iRhBb3HqVT87H1O0mtzWPvl+2YTLhgLRKKBWRuQEa
         lz0Q==
X-Gm-Message-State: ANoB5pmcri4lUxwvRv9ojg7TdTzyAAYvHQ9hBW59BT4rjU5R9sV4uRsP
        co/AEyLwVzDFNZqKhAa8Ao+tXAcCPRUojVe200o=
X-Google-Smtp-Source: AA0mqf6xdEI2VBVXXEpnJuGcVhK1qDFB7paclxlmv0xCQ0v41Vq+u/lRTBfEOQNbIZv8E/7Yc2Wkgg==
X-Received: by 2002:a63:ef07:0:b0:476:aad3:9121 with SMTP id u7-20020a63ef07000000b00476aad39121mr32271832pgh.385.1669702361134;
        Mon, 28 Nov 2022 22:12:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090a178f00b002132f3e71c6sm489023pja.52.2022.11.28.22.12.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 22:12:40 -0800 (PST)
Message-ID: <6385a2d8.170a0220.fe651.0e82@mx.google.com>
Date:   Mon, 28 Nov 2022 22:12:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221129
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed (next-20221129)
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

next/master build: 14 builds: 0 failed, 14 passed (next-20221129)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221129/

Tree: next
Branch: master
Git Describe: next-20221129
Git Commit: 13ee7ef407cfcf63f4f047460ac5bb6ba5a3447d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
