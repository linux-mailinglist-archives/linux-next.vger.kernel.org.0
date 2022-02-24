Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447B04C2DC4
	for <lists+linux-next@lfdr.de>; Thu, 24 Feb 2022 15:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbiBXODW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Feb 2022 09:03:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbiBXODW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Feb 2022 09:03:22 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D2420D834
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 06:02:51 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id bt13so4035103ybb.2
        for <linux-next@vger.kernel.org>; Thu, 24 Feb 2022 06:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Uu/up663McmtHwyoDsIfscJIaOT5C+2Ofku1sz+3c7s=;
        b=yeaQV/RM7+yh7dyByba3Uw81wfq81mO7nu0TI1EIsiKw1na9UNQ5yiAkFLa2frERQW
         jbhkruRz/0mKJTe4q2i8KivPZXfjhxkX4YMGUA8Jr8JiIeKw6v35R/vg+Q1Y2UudXLzz
         I+g+XXszoc6acZz3QeX7+XNT1bSS9Xa9kq60oI6VJkldWS/UKfW+Syv4j/9Wrkmm0GhO
         ttr1kb9ueMYL3JgGOxfwlMpFer8Yjd3sKt+RZbI7Tm3ZHlNHoGmQQOGnc7I5NopQ/bzK
         zXxhfLMn4iaPtk5PyAJjnoskqnC4L4luHO+6tmPhjsArHuUbxYadXmvnii8WXt35NKWr
         /VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Uu/up663McmtHwyoDsIfscJIaOT5C+2Ofku1sz+3c7s=;
        b=7+skT5v9+gk5cbUun10uc0/T4N7ZkqZzK8mh+vFmslN+erTRYP7nWyJwDRpwqlvHfy
         rbaPhigxJCoJrjK6ucn9kfB0ELaEcco2RfZgwDHBB6UI+97Ge0p+aWSMSgiAOvAdfY11
         99VBaNXX1XCFranmBNgb7dBbRcrllBPPYC93XwL+HfDPaHBuKD2mV9YcTqgJ3AnajT8F
         +qXSUkrXelAp5ckF/mdWquK6ZBTSC2YtB+VqA3tKAKvmEwLqhy86QxWhLA/QckFM6eJC
         M8Z01/xygMcD+ZSJsRra1oHktAn+ud/J+IAXYPI0qOtDJLQvTFTwyw4dAGAhZQ/vpi8f
         EEMQ==
X-Gm-Message-State: AOAM532eD9YvIhb/PI2oTrTD2T2GuqVpmboaD0jkUvOqFjGEoU3W4DSN
        eYmJI3IbGkSr72ezF7uctDsj2l/cuzR9iovdGX2bx+M0Sg2aGA==
X-Google-Smtp-Source: ABdhPJyFgcSPtZ+7eIpJu47YYVNdcJlDOjQ2o+dB7cqBHv4UdHQ6MtQQsUac7jeboUaZhHeeixU4ZJErYZVWYCtypuQ=
X-Received: by 2002:a25:2551:0:b0:623:a424:e2b5 with SMTP id
 l78-20020a252551000000b00623a424e2b5mr2624980ybl.603.1645711368889; Thu, 24
 Feb 2022 06:02:48 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 24 Feb 2022 19:32:38 +0530
Message-ID: <CA+G9fYvdFWYQ4GJkvD9KK8ut=DqHu8MKM-jok+tXo6-HiaPT0g@mail.gmail.com>
Subject: [next] mm/mmap.c:1962:25: error: passing argument 1 of 'vma_find'
 from incompatible pointer type
To:     linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next-20220223 arch parisc builds failed due to following errors.
Build configs:
  - gcc-11-defconfig
  - gcc-11-allnoconfig
  - gcc-11-tinyconfig

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: d4a0ae62a277377de396850ed4b709b6bd9b7326
  git_describe: next-20220223
  arch: parisc
  toolchain: gcc-11


Build error:
-----------
mm/mmap.c: In function 'expand_upwards':
mm/mmap.c:1962:25: error: passing argument 1 of 'vma_find' from
incompatible pointer type [-Werror=incompatible-pointer-types]
 1962 |         next = vma_find(mm, vma->vm_end);
      |                         ^~
      |                         |
      |                         struct mm_struct *
In file included from arch/parisc/include/asm/cacheflush.h:5,
                 from include/linux/cacheflush.h:5,
                 from include/linux/highmem.h:8,
                 from include/linux/bvec.h:10,
                 from include/linux/blk_types.h:10,
                 from include/linux/writeback.h:13,
                 from include/linux/backing-dev.h:16,
                 from mm/mmap.c:14:
include/linux/mm.h:661:54: note: expected 'struct vma_iterator *' but
argument is of type 'struct mm_struct *'
  661 | struct vm_area_struct *vma_find(struct vma_iterator *vmi,
unsigned long max)
      |                                 ~~~~~~~~~~~~~~~~~~~~~^~~
cc1: some warnings being treated as errors

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch parisc --toolchain gcc-11
--kconfig allnoconfig


--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/25XO7KdJCJcum36gCorICgGU8C5/
