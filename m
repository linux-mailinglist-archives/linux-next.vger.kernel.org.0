Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714256C6130
	for <lists+linux-next@lfdr.de>; Thu, 23 Mar 2023 08:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjCWH6Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Mar 2023 03:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjCWH6Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Mar 2023 03:58:24 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E28F974
        for <linux-next@vger.kernel.org>; Thu, 23 Mar 2023 00:58:23 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id c10so11087763vsh.12
        for <linux-next@vger.kernel.org>; Thu, 23 Mar 2023 00:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679558301;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qy+avBLXTpqBs7wiLv4nHuWGknSEznmW36KI6MrLqak=;
        b=XXv51V0gWpl8UrC6TIbTl/Nsx6t1lMItjiNjdwnbK9G4GQZp7r518YdFtkkZfQSPm9
         5t9QmO87cXoLBPZLjE3ffFYfiBMh+Fzm6ag1FApovASZRizeFttP6VTDwDXgEGg8I4Ca
         EddOmS1e/8vj2F8EbdMEOfwPPFUMD1MokOKMj9f7Dt9Hk/NDbPIGRmDQecaBhAJcOt9Q
         rPib6lHQTRdROEuAVn3L0u+JUOVvC6/de6EoHu3VbJ6mUVk0MDY0Ve3mrS9A6puCpPuM
         ET3o27jrpGF9MUtaHfpIeBs6ikBzbwd3edyrpPfB6Lln/1NOrpySifRo0QhlnRZoqFaS
         /xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679558301;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qy+avBLXTpqBs7wiLv4nHuWGknSEznmW36KI6MrLqak=;
        b=eH95D7XVK9HB5kBAIrsiACYlyOBpCXrhyqymAMvTouCGbIZHcy3A9HCFwO3vA5LOSy
         8JI1lQ6tjHR6JsIb1BQcJZqQZ6rgbFWcnU0DGnhj1nViXmueRxD/bF9E+8ivdSX2SSJ9
         VFbn9otOUdYR1xMqz87RejElHnM9ZQeeVi0tR5UURz4tUQICEPwCU9bBu8ihFjqzXk1j
         rJjittiCg3mBOCEN8nx8b3049cMach1HxuCWcO17wCfFeEUV0CS/3SXcqrbRz83OJeTH
         UUl30/XCPPrVX5zeu5vmF0/AmzcYYfPj8gbihucxNr37rTyJvumIouYoTpnQ2Yr9yW6s
         xEaQ==
X-Gm-Message-State: AO0yUKXa7/pRiDehCqeRUhFDNCfVq1BzDUiHoowSD1nV92LzukADveXm
        kF8DXoaclqJ06IqkbqErJCBEedBwOQeHcXyA7lx+i131wq5m1rBJkdI=
X-Google-Smtp-Source: AK7set+2jSxcjk2ShsjiG4KrocUujp4Queqnqp3zqlHipOMcCbLh4yZmFjwK6WEb+j/oACpaL/fM0x6CwZsXKs06MIQ=
X-Received: by 2002:a67:d20f:0:b0:426:392a:92bc with SMTP id
 y15-20020a67d20f000000b00426392a92bcmr1341687vsi.1.1679558301631; Thu, 23 Mar
 2023 00:58:21 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 23 Mar 2023 13:28:10 +0530
Message-ID: <CA+G9fYvEqk8tC7w3xxPcFhycctZeOj4CMJj3JbrtWKkp3w9qPQ@mail.gmail.com>
Subject: mm/mmap.c:939:11: error: variable 'next' is used uninitialized
 whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
        linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following multiple build warnings / errors noticed while building
Linux next-20230323 with clang-16 for x86_64.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build warnings / errors:
---------
mm/mmap.c:939:11: error: variable 'next' is used uninitialized
whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
        else if (!curr)
                 ^~~~~
mm/mmap.c:952:15: note: uninitialized use occurs here
        merge_next = next && mpol_equal(policy, vma_policy(next)) &&
                     ^~~~
mm/mmap.c:939:7: note: remove the 'if' if its condition is always true
        else if (!curr)
             ^~~~~~~~~~
mm/mmap.c:912:36: note: initialize the variable 'next' to silence this warning
        struct vm_area_struct *curr, *next, *res;
                                          ^
                                           = NULL
1 error generated.
make[3]: *** [scripts/Makefile.build:252: mm/mmap.o] Error 1

mm/vmalloc.c:3543:6: error: variable 'remains' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/vmalloc.c:3587:17: note: uninitialized use occurs here
        return count - remains + zero_iter(iter, remains);
                       ^~~~~~~
mm/vmalloc.c:3543:2: note: remove the 'if' if its condition is always false
        if (bitmap_empty(vb->used_map, VMAP_BBMAP_BITS)) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mm/vmalloc.c:3539:6: error: variable 'remains' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (!vb)
            ^~~
mm/vmalloc.c:3587:17: note: uninitialized use occurs here
        return count - remains + zero_iter(iter, remains);
                       ^~~~~~~
mm/vmalloc.c:3539:2: note: remove the 'if' if its condition is always false
        if (!vb)
        ^~~~~~~~
mm/vmalloc.c:3524:16: note: initialize the variable 'remains' to
silence this warning
        size_t remains, n;
                      ^
                       = 0
2 errors generated.
make[3]: *** [scripts/Makefile.build:252: mm/vmalloc.o] Error 1
make[3]: Target 'mm/' not remade because of errors.

steps to reproduce:
----------

tuxmake  \
  --runtime podman \
  --target-arch x86_64 \
  --toolchain clang-16 LLVM=1 LLVM_IAS=1 \
  --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2NOjxURhByyb4dR3Ld788iuYvAR/config

Related discussion on mailing list,
 - https://lore.kernel.org/llvm/202303231055.DeninwHS-lkp@intel.com/
 - https://lore.kernel.org/llvm/14c60785-2427-45db-9613-683410ff6802@lucifer.local/T/#t


--
Linaro LKFT
https://lkft.linaro.org
