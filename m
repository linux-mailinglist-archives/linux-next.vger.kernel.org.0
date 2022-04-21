Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA689509CF0
	for <lists+linux-next@lfdr.de>; Thu, 21 Apr 2022 11:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387982AbiDUKAM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Apr 2022 06:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387973AbiDUKAL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Apr 2022 06:00:11 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F0021250
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 02:57:22 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2f19fdba41fso46426067b3.3
        for <linux-next@vger.kernel.org>; Thu, 21 Apr 2022 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BRpBTKiaFhVLmT4dCtaB+HDGQyQYO4qpuBRNd+GaM3w=;
        b=jOUAM1UW3puj7tGbBazYn+hiVpRGjTCwSBns4PyvV5wYui2Z/9KZtsrOivNxMRdbfE
         93kaZLzA4z+FfyOMam7Z3pYLsKdgh2amJlm0WJKQPD9IQQnryIAujtm5aH5WNVPJtgP4
         oFQUWUH40LaBHXasUo7fxGByj8m1wJw0xjEfcFZZNk0rHs98bnbOP3dgk0Nbv3EDp9c6
         i9D74wFLpuyraPNnqDxI6kjuQCuIOoeSrLQw5kthgn5xN0qq/jhLInriCHFop+lPTMTB
         4CnMqcrXVzE8czp0v4ylsOjUPYtmEqg4JcLSGDKmEta7wJYBWVRG96sCG+/yHvEat/l2
         I1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BRpBTKiaFhVLmT4dCtaB+HDGQyQYO4qpuBRNd+GaM3w=;
        b=jwZHpdHNw6QYKIvv1++pntXcmmm/5yKQCNZtVBMJIlAgQwQEaFjeOXiiLBbo8bUe5M
         EZhT3S/IdhcnnI0WlN5YUWvnMmlBEObuloVrZI3n36IGu8dJS4dmMWl5uta3VQeb40Ws
         qa+4/mkrIefDu+C9sZcacR9VP5POy+nQOibtjGCFIEV0Bdv84w5D/hxG6ejS5TczQ2/i
         I5kuJRp23SErRkG0uEUN/ZlWASZO/5muNdJtwJVQzoMiBaViwr17u7nIJiK6GAcOPb0X
         ZDwrkeDzklMJN4K8tol+GUu0UrVCd7hrRwmKBo6kqAxXQ2hFfnLBw3iuW9gxlUAza+ja
         1A3w==
X-Gm-Message-State: AOAM532djvrWN+tKFjsVsySPsG+9pD5u1mKs+7zxYWZZY4CaYYF/iNK5
        3J5+4UPIPJzSzFGfvF4xpz5JSqXXQWxDvmH39nbiSt81fRaJNBc4
X-Google-Smtp-Source: ABdhPJwLOtR7AyrcmlsGs0ss51VpYNPbfDy9KKotr9egbK7J7mOdmBo/x+qeoVGlam/uf3t4VB0iGhVDnab2O0227Zk=
X-Received: by 2002:a0d:ffc3:0:b0:2eb:2327:3361 with SMTP id
 p186-20020a0dffc3000000b002eb23273361mr24852584ywf.36.1650535040995; Thu, 21
 Apr 2022 02:57:20 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 21 Apr 2022 15:27:09 +0530
Message-ID: <CA+G9fYvA9e760hFH==n2_gn8zNQeGBQ1=8_+Ot1sMCwoPiS15g@mail.gmail.com>
Subject: [next] s390: build failed
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Xu <peterx@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linux next-20220421 s390 tinyconfig and allnoconfig builds failed [1].

Regressions found on s390:
  - s390-clang-nightly-tinyconfig
  - s390-gcc-10-tinyconfig
  - s390-gcc-11-tinyconfig
  - s390-clang-14-allnoconfig
  - s390-clang-nightly-allnoconfig
  - s390-clang-14-tinyconfig
  - s390-clang-13-tinyconfig
  - s390-gcc-10-allnoconfig
  - s390-clang-13-allnoconfig
  - s390-gcc-9-allnoconfig
  - s390-gcc-9-tinyconfig
  - s390-gcc-11-allnoconfig
  - s390-gcc-8-tinyconfig
  - s390-gcc-8-allnoconfig

In file included from arch/s390/mm/pageattr.c:6:
include/linux/hugetlb.h:414:25: error: unknown type name
'zap_flags_t'; did you mean 'vm_flags_t'?
  414 |                         zap_flags_t zap_flags)
      |                         ^~~~~~~~~~~
      |                         vm_flags_t
make[3]: *** [scripts/Makefile.build:284: arch/s390/mm/pageattr.o] Error 1

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/2868Z0YrLSpSGSk9QDqRKYMJPug/
