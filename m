Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313A324BDB2
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 15:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbgHTNKo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 09:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbgHTJhW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2020 05:37:22 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB2BC061383
        for <linux-next@vger.kernel.org>; Thu, 20 Aug 2020 02:37:21 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id a1so729950vsp.4
        for <linux-next@vger.kernel.org>; Thu, 20 Aug 2020 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5ST+s1VgrChigIylT4K0fDa+xlZ9DEdl2V2OEw6xk/A=;
        b=Q6l7e3aB6cXvDGQDWPmsO6nE8jKBpLQECvMRYe8Lv0fwF1uKRy3O9LStHPIlg5F1Li
         /ZYJ4VffxOWSR+jebqLcjxeZ/MI36sP7LKWcMWrdV5ggv0+cQ+vAKjNYjB+/UDX0enrQ
         sDH08Zs7pC7hlzdthniOPY45mIpDgq+nEpsSjljUbApMMXuCM4CGv1+crVue021L61Cq
         liSfhbH2oEpNSlhQke/evvT8o1faVARSDooE05p9qbq3/5ZqUtmiA8sWYC6EeFsJnf7j
         REogkKt9AmqYlPlq3n/7tvLM6VGPZrSSoObfENQtxMcyouJ59FIXRXG4iCKJDbI8WkSb
         iT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5ST+s1VgrChigIylT4K0fDa+xlZ9DEdl2V2OEw6xk/A=;
        b=esNt3EV27NvXeZ9qee+Zl9rT+7j4GB6NynuLX5GrJ39eghg9jYIpWWCBe+Qkw/Mnuz
         v01ZXXTiTEHxif9snt0E+n2WC4z6xh2MxErelMVUpzthp8m+H3AJ+YWdH+UptviZNAJU
         QG1Sy5Y70S/1BzogJRoE4xovXMdkjlgH/O04BdzAlAB+vkeIXv3YI/afFLD7wiC7FjpQ
         HgdBy+jP84Xrb4bEj5JkxInkEjCzlnyfrE9AGbVxiYnXDHD3/XgI2DeVsCt3AJIDfLfc
         yonBrh+xe7gFAZL++ZbDR5x1pT+T+UMcfeYAUg0R5vN/ryomPGUAQIFsf1KpQfO/utL2
         xJ4Q==
X-Gm-Message-State: AOAM532snLql3py3Q+nGAHp3zVWeicDyr2OQG+2OeV/Bym/9dmveT+z0
        RaTkO+Ia/hVMmDEqaWImdZObv29HvqjxJKJwVpBqU67oMdUlqA==
X-Google-Smtp-Source: ABdhPJykM/Ah+8o5lls+LOP2kgmsthnXq9FjKqghIi9CrMLYv2Lea57WiTqrBpVnWKZxBKh0GsNVTIk/VCu+skb80FE=
X-Received: by 2002:a67:6996:: with SMTP id e144mr1285283vsc.185.1597916239685;
 Thu, 20 Aug 2020 02:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuNS3k0DVT62twfV746pfNhCSrk5sVMcOcQ1PGGnEseyw@mail.gmail.com>
In-Reply-To: <CA+G9fYuNS3k0DVT62twfV746pfNhCSrk5sVMcOcQ1PGGnEseyw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 20 Aug 2020 15:07:07 +0530
Message-ID: <CA+G9fYusZnYMYjKNcjf4cHwFUmV_=fXRHahsbtdsKwUzB98zEQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IG1tL2d1cC5jOjE5MjI6NzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIA==?=
        =?UTF-8?B?ZnVuY3Rpb24g4oCYaXNfdmFsaWRfZ3VwX2ZsYWdz4oCZ?=
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linuxarm@huawei.com, Barry Song <song.bao.hua@hisilicon.com>,
        John Hubbard <jhubbard@nvidia.com>, Jan Kara <jack@suse.cz>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shuah Khan <shuah@kernel.org>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 20 Aug 2020 at 14:59, Naresh Kamboju <naresh.kamboju@linaro.org> wr=
ote:
>
> arm and riscv architecture build failed on linux next 20200820 tag.

The pass with defconfig but failed with tinyconfig and allnoconfig.

> make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm
> CROSS_COMPILE=3Darm-linux-gnueabihf- HOSTCC=3Dgcc CC=3D"sccache
> arm-linux-gnueabihf-gcc" O=3Dbuild zImage
>
> 348#
> 349../mm/gup.c: In function =E2=80=98get_user_pages=E2=80=99:
> 350../mm/gup.c:1922:7: error: implicit declaration of function
> =E2=80=98is_valid_gup_flags=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
> 351 1922 | if (!is_valid_gup_flags(gup_flags))
> 352 | ^~~~~~~~~~~~~~~~~~
> 353cc1: some warnings being treated as errors
>
> Full build log,
> https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/695005038
> https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/695005042
>
> --
> Linaro LKFT
> https://lkft.linaro.org
