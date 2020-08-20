Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D2B24BF03
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 15:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgHTNjN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 09:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgHTJaF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2020 05:30:05 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383CFC061383
        for <linux-next@vger.kernel.org>; Thu, 20 Aug 2020 02:30:05 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id k25so699107vsm.11
        for <linux-next@vger.kernel.org>; Thu, 20 Aug 2020 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=6apwous/HgYA9e9mDqfrOOmq5wxR8eDdobsnINeJ2Ak=;
        b=eETmXHMWgfN31+kZjG7CG3fcmrCL+QERYJYc7EZzYmZ/iyBm5vlKvOgbCCqNZxA+XN
         10DkxJfP4eEu/UlvRJDammSXb+HlcfLo/fsFf2aSFcRcqIBQ+7RjdJr38r2T4P+8cYKO
         8d/CnJ8R9svj2hUovuPzmNxBKfCNxtu6eLdBKKXWJVho4oL/RoLTArsoGOYd0BIX4/qh
         +UqJMgXb82l+X/lNn+LZEZ6OyBAE3uKibnk1yh8wKFDHh+ShOt7pHuNUpHZjMK/Qj8+B
         5xpyiCvymikyE0YC0aGlESFBcdypcqQY4fBWYVaeZr3tCYVHbpKA/DJkxajl5oNxBOLv
         96Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=6apwous/HgYA9e9mDqfrOOmq5wxR8eDdobsnINeJ2Ak=;
        b=Fe5JDvSCDDN2W4j9BY+tYSZLmOgumyt6dUWEWIaebr3Y8rc9sdp1UTQfD2p0gscPxo
         JxejEgMdizEama20CHQvASnAOsajEl0NbT6WSZTldl4WbO9fCylNYwoYdRmxYpKBtNPm
         vOXC0DatZaNa8BFgTtytMfz3egZlOIMcN7gAiq/6Ix0mbsapUOSHA+PCN3T1/wiklIbm
         m6jTF7QfniO9PvcuO59NFPlpxmOtw533O5zizY/p/2HyuUVnfa3Fqnioj/lYz4cJe/we
         XDNraGOFIXeqiaizTvwIR/ULPpivzsBDwAzWmTRNA8to24+LMudXPAs85OBMkJgVYfE4
         WvXg==
X-Gm-Message-State: AOAM530v3ID5SImxgA9ne/+T8P+KgGHJc0pDAJkLU0Zt5EylfnVsvSlU
        BvTjy6HqpfqZOmdiOwPNrGE3Af38mFhKY4BAcYb2UyHXGJ4XIyzS
X-Google-Smtp-Source: ABdhPJxnX/aP9f1YYTlY9xogXia5cP6a2JVmyDFGvwr+8ZISnTbDnkGzsLz43KbFCYTyN0PDQwvWxV+jgNeZmbRKM00=
X-Received: by 2002:a67:e45:: with SMTP id 66mr1205335vso.191.1597915803707;
 Thu, 20 Aug 2020 02:30:03 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 20 Aug 2020 14:59:52 +0530
Message-ID: <CA+G9fYuNS3k0DVT62twfV746pfNhCSrk5sVMcOcQ1PGGnEseyw@mail.gmail.com>
Subject: =?UTF-8?B?bW0vZ3VwLmM6MTkyMjo3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuYw==?=
        =?UTF-8?B?dGlvbiDigJhpc192YWxpZF9ndXBfZmxhZ3PigJk=?=
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

arm and riscv architecture build failed on linux next 20200820 tag.

make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm
CROSS_COMPILE=3Darm-linux-gnueabihf- HOSTCC=3Dgcc CC=3D"sccache
arm-linux-gnueabihf-gcc" O=3Dbuild zImage

348#
349../mm/gup.c: In function =E2=80=98get_user_pages=E2=80=99:
350../mm/gup.c:1922:7: error: implicit declaration of function
=E2=80=98is_valid_gup_flags=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]
351 1922 | if (!is_valid_gup_flags(gup_flags))
352 | ^~~~~~~~~~~~~~~~~~
353cc1: some warnings being treated as errors

Full build log,
https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/695005038
https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/695005042

--=20
Linaro LKFT
https://lkft.linaro.org
