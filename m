Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6659B84A7D
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 13:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbfHGLS2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 07:18:28 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37109 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfHGLS2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 07:18:28 -0400
Received: by mail-lj1-f193.google.com with SMTP id z28so30885327ljn.4
        for <linux-next@vger.kernel.org>; Wed, 07 Aug 2019 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=OPtDIWD1oyhmvgdHSOSG81TcfHz+uzX2gkbcVtn5ULE=;
        b=BKg1XWz76ThRetJwm2Ypk0pOm23cGUXpYhH2r8gddn3xAjYJ5CWfD0j1qyCgWuBRiO
         C/epNQA8aWh/sWQPKrkiHTvxQc4z0L3ncGkiKT0bAdwiq1C61QtpvTCcDCW2uisk7OR+
         7FlctYuyZKTgbys5tZ3EXNLSxgyj67UoT7nVsDQZ0rxhoBjyoHwvMmpjfKteZ6UV47R0
         6I76lQUTYm5Z1UICmiqzv9ysTQzx4j475gksfMPOTwidtbkVNH7ujF9jiaex+H0CKkWL
         VGvkpCPKtPKwVLnn7kpe+xOcNHPE88/eAg6A4xUwbiysqwIuGhMLzQf6UsUfkOI12GfL
         MXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=OPtDIWD1oyhmvgdHSOSG81TcfHz+uzX2gkbcVtn5ULE=;
        b=fypTeNOpfTVnTfOzudvJscwvU4rwlw0TSDyypBTII2EM5ipuyqk+m5eA90QmW6SHln
         evRmJAXn5aPZ9enmZSqPd5GyvwrYXpRPdyPmJXmS68SFUpud+GCCgOmpHlxtmswu0Ugd
         XhzQoV8pyLZ/16KErJau51O7rtpWc1USTKUi1rbSGKoaGeu63IwBQwqJPfrcWV9s6Cru
         rYs8H+CdwUcOxIr39wZ+f+vFFRLlGDJaJft9CCHsZH65c1PwWXTX8hd5lTze3GwWpatB
         LOalpp6XbXEywFDHR8GgiWWftF/h8Rgv4/aKyIu/YlgGqTvSXvdfGILiufw4+SRvWICu
         +ghQ==
X-Gm-Message-State: APjAAAXw/auru7pnqB3XoKc1HOp8Vh56/ejP46cCXZby3VYwn2gZl6Tr
        fxY1nn4sienMLXR9rb7puDfcd1g1Rl8d3EF0C4CZYA==
X-Google-Smtp-Source: APXvYqwTAVe95rSksZw+erekFdosmSxQDfjfhjtERnRYyENWOwshak+UScYbzsb44hFPW/YALmJunz/0Cw+mT4FzW4M=
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr4497521ljc.123.1565176706159;
 Wed, 07 Aug 2019 04:18:26 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 7 Aug 2019 16:48:15 +0530
Message-ID: <CA+G9fYvehn=5Rn0RHjFvCc1pCDFTUtxNeR11CQjD6rjM53D4ig@mail.gmail.com>
Subject: Linux next-20190807: arm64: build failed - phy-rockchip-inno-hdmi.c:1046:26:
 error: anonymous bit-field has negative width (-1)
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        kishon@ti.com, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next 20190807 arm64 default config build failed due to below error.

/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:1046:26: error:
anonymous bit-field has negative width (-1)
                inno_write(inno, 0xc6, RK3328_TERM_RESISTOR_CALIB_SPEED_7_0(v));
                                       ^
../drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:201:50: note:
expanded from macro 'RK3328_TERM_RESISTOR_CALIB_SPEED_7_0'
#define RK3328_TERM_RESISTOR_CALIB_SPEED_7_0(x)         UPDATE(x, 7, 9)
                                                        ^
../drivers/phy/rockchip/phy-rockchip-inno-hdmi.c:24:42: note: expanded
from macro 'UPDATE'
#define UPDATE(x, h, l)         (((x) << (l)) & GENMASK((h), (l)))
                                                ^
../include/linux/bits.h:39:3: note: expanded from macro 'GENMASK'
        (GENMASK_INPUT_CHECK(high, low) + __GENMASK(high, low))
         ^
../include/linux/bits.h:24:18: note: expanded from macro 'GENMASK_INPUT_CHECK'
        ((unsigned long)BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
                        ^
../include/linux/build_bug.h:16:47: note: expanded from macro
'BUILD_BUG_ON_ZERO'
#define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))

Config link,
https://storage.kernelci.org/next/master/next-20190807/arm64/defconfig/clang-8/kernel.config

Build link,
https://storage.kernelci.org/next/master/next-20190807/arm64/defconfig/clang-8/build.log

--
Naresh Kamoju
