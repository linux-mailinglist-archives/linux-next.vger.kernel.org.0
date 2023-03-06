Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F05B6ABDEF
	for <lists+linux-next@lfdr.de>; Mon,  6 Mar 2023 12:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjCFLNu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Mar 2023 06:13:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjCFLNc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Mar 2023 06:13:32 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFDD1C7CA
        for <linux-next@vger.kernel.org>; Mon,  6 Mar 2023 03:13:13 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id d7so8760939vsj.2
        for <linux-next@vger.kernel.org>; Mon, 06 Mar 2023 03:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678101192;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m4mHnm6tKi9QUsR2VBQisXaqYs+QXsAPXswpr2JeOMw=;
        b=s945bFy3wxHRsThiokBxog7jblaBRypipXnIJcNW1NuZew9RmghR9Vid87kg/3+7FN
         wvJRCtNG43lBa7DF4MVp9YscyiD76EJ7iGNa3J8YXjdL35Spm1WIfYskt+/Voqy4DhFc
         lcIWO1wZvIHkOrZE5aBgOBNqd9MN/KrzPQcoaLrYew/iu02B5QjXdVbzdLaZm6NQAtSS
         kJg4+1DAUlPyMvP12K1pfeFFE0OeOzrn098bM5W7P4Vm+Tc1ACk/DfViP6lgNf34HUOO
         hzAgmxCv1KClBsbUqETgn0tRydK9M/5Of3oy3PV3OC4QPsD2ViOnF9bum//XHGLYctNV
         T18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678101192;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4mHnm6tKi9QUsR2VBQisXaqYs+QXsAPXswpr2JeOMw=;
        b=IeEDfyZsh5vXF/rLKaWNa90Ei3IH6lypt+4/mkyp74ast3KYLYO3MuMe2h4UQurCbz
         j+qPEL2tv5l/tkPteUPqxwfbUDE739+N71DxWqqdzCRJNQ+daKvtAqC123eBEPcHAKxC
         ZWspd6QaQKu8iFu7h9RexYjAN6O/i329oB7q0MrwgZodIM/4fQ5U7GS3JgZmEQ0a8oVf
         Z//76gHbCS75UQHpeF3xsiFU1pEU/AIBYhJKkisalso1lCuiaiF4n4Z0h4eOLe10saCx
         Y500A9yOMcjRgy52SxeAfQgGcFKdPFrmvPQM8KqLg5RjQFH5sVZ2i8dAUqx0LtSC8tZM
         Ctkg==
X-Gm-Message-State: AO0yUKV8Lhc91RYjmI+jBPzgI7SCrjljdgLwQNb2eTt3cRe+mhyEFyd9
        4ErZ8KFa9rcfvWFiVWvU/EmVI2zqlQQXlp6N6v6LmA==
X-Google-Smtp-Source: AK7set82NVO+VDrqJQfMtTWglBInb3q69D4Og0wpmm8DVBoIwB3MNcFYCGklbiRk1+4MrMxMpqyfS7/AB0hfgMV0/kQ=
X-Received: by 2002:a05:6102:80b:b0:421:7f84:f3d9 with SMTP id
 g11-20020a056102080b00b004217f84f3d9mr6560680vsb.3.1678101192299; Mon, 06 Mar
 2023 03:13:12 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 6 Mar 2023 16:43:01 +0530
Message-ID: <CA+G9fYtwqro9qaCmxOBAM1qt8L7k5ZwceaYBLY8RWoELDghhsw@mail.gmail.com>
Subject: next: mm/khugepaged.c:1702:30: error: implicit declaration of
 function 'vma_try_start_write'; did you mean 'vma_start_write'? [-Werror=implicit-function-declaration]
To:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Xu <peterx@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Following build regression noticed on i386, mips and s390.

mm/khugepaged.c: In function 'retract_page_tables':
mm/khugepaged.c:1702:30: error: implicit declaration of function
'vma_try_start_write'; did you mean 'vma_start_write'?
[-Werror=implicit-function-declaration]
 1702 |                         if (!vma_try_start_write(vma))
      |                              ^~~~~~~~~~~~~~~~~~~
      |                              vma_start_write
cc1: all warnings being treated as errors

build details:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230306/testrun/15286608/suite/build/test/gcc-11-lkftconfig-rcutorture/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230306/testrun/15286608/suite/build/test/gcc-11-lkftconfig-rcutorture/log

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#

tuxmake --runtime podman \
         --target-arch i386 \
         --toolchain gcc-12 \
         --kconfig
https://storage.tuxsuite.com/public/linaro/lkft/builds/2McWOXP1OH5MiYficVNv8hJCR4F/config

Similar issues have been reported and discussed on the mailing list.
- https://lore.kernel.org/all/20230305191335.fee8e6aa285b0ca771cab9dd@linux-foundation.org/

--
Linaro LKFT
https://lkft.linaro.org
