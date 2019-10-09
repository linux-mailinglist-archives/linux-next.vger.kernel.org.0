Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B820FD0C34
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2019 12:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfJIKH6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Oct 2019 06:07:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36864 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbfJIKH6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Oct 2019 06:07:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id p14so2109420wro.4
        for <linux-next@vger.kernel.org>; Wed, 09 Oct 2019 03:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=5YjzV+ySd+XjMLPJh6GBSI5sH/trwPsfj/E/L6lHwDU=;
        b=yzRTaRdGhTHfKqYzvLJMJGG0Dwg/1j8fz6bWgsuBo0js46ImeqRuC0zkxey4GZLhgc
         jDX+4VrcviyljPQ3V/MOPPgl8KE/hhD4l6TbnBhQ+zTXp2OyPwGzgdT2CC+TOQdi8jQt
         Npqajtk6Na0h7FSzRoDD9dTDFcZ6MeRut/qVna29rC+jxGUdnp/rca2WIuHxMjC9cRBP
         3rlwUqFeKIDaPgduHfAiWrkdIpEGiFY6k5RGH1gFUPQi+fI42xAsRa9s0CgdOxlzd9HV
         nE2r6K/eORrWVYkl1rMIT4SLOLZa1bujFYPXG8wRvvf5aj1NOGjyJ0IlnEUZF54/bCe1
         7ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=5YjzV+ySd+XjMLPJh6GBSI5sH/trwPsfj/E/L6lHwDU=;
        b=KALZyaLlcRgYv3PfLZNnVxJtXv02TeOyXYVNChYAkxCgJusvh5UN5OEHCGqAkgVsSy
         wxDvLSgulNK+GdJJoVa8DgaqKMvuRgSwZht+FIIK3qsXC0S0+M2o31q+XETmLaWPiV3/
         +Mtea5p9qZPP/+yDfqc4A1BFfyQ5aTyNS99pNJnmtE0JCly8w7qKUn6VvQmXpXubDOAT
         MLwH4ZJn1Vfbt0qydIKzw/IlIADzJL8YUkWlXRWAQkRNYzzpeuqMLT7tXzoTbQ4dqIY8
         O8bCCynC9o+AWjzn86dL3a8RfEpvp9Hi05Leqgt6s2d4Qe7UpTd6s3m84oBCSK7nvPWq
         2/9g==
X-Gm-Message-State: APjAAAWxyrW7FwmmuK95Ub9PW13i7tsNHVzPBYCcr5KsGEitP7p+rSmx
        yuVyn5OgqWT4CxjwCUTf4O1lIXzFgGsABQ==
X-Google-Smtp-Source: APXvYqy7aFfevh4k1hwOg9wjTwcKnPgngJGk58J2lq2wRmSIPQ8f/szNHUoG7VOVDRj28detjyWXMw==
X-Received: by 2002:adf:facc:: with SMTP id a12mr2262973wrs.109.1570615674759;
        Wed, 09 Oct 2019 03:07:54 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w4sm1830440wrv.66.2019.10.09.03.07.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 03:07:54 -0700 (PDT)
Message-ID: <5d9db17a.1c69fb81.8a69a.8127@mx.google.com>
Date:   Wed, 09 Oct 2019 03:07:54 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc2-351-gbf1295fae6a6
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 144 boots: 5 failed,
 138 passed with 1 untried/unknown (v5.4-rc2-351-gbf1295fae6a6)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 144 boots: 5 failed, 138 passed with 1 untried/unk=
nown (v5.4-rc2-351-gbf1295fae6a6)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc2-351-gbf1295fae6a6/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc2-351-gbf1295fae6a6/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc2-351-gbf1295fae6a6
Git Commit: bf1295fae6a6208895492c900d5cc247643ae30c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 44 unique boards, 15 SoC families, 23 builds out of 214

Boot Regressions Detected:

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: v5.4-rc1-298-gb766=
90ad767a - first fail: v5.4-rc2-299-gb6f03173ae19)

Boot Failures Detected:

arm:
    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

arm64:
    defconfig+kselftest:
        gcc-8:
            qcom-qdf2400: 1 failed lab
            r8a7796-m3ulcb: 1 failed lab
            rk3399-puma-haikou: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

---
For more info write to <info@kernelci.org>
