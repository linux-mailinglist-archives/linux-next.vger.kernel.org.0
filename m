Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4928B4625
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 05:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390812AbfIQDs2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 23:48:28 -0400
Received: from mail-ua1-f42.google.com ([209.85.222.42]:46119 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbfIQDs1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 23:48:27 -0400
Received: by mail-ua1-f42.google.com with SMTP id k12so617699uan.13
        for <linux-next@vger.kernel.org>; Mon, 16 Sep 2019 20:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XEDlyC4x23bFmi6UpkoBP9U4BLBNCovMFf9Dbwxqia4=;
        b=Kvun+zIvqiAg2550QWGL7sFDyHz43zbRsXL4usBSdvXMnOkmlvVkWoNHYyOWelmBFh
         nIiQso1Xulb06ASKNrIsjtN/XtP0tO+hGGkhUpVE+duS3xZPZpH+HNWCLWn8HasbSfVv
         pvzxor0GzCJhwhoi6B6Q/WQ6HsGHaIiXPQdAYBhCk/NXHfABZcKLj6zBSnZuZ6ED0/C+
         UywVXWnDa0l+PPkp0Q3MyatXBSXAc2oKQX/JBWLuUhrHt4SvT4uSaOUqI2n61t4iPxu1
         swK1cGIgF1wTrnvtZq25VYaHSThnae3q55WTC1LN5p2/DBxsdvI720gQM+c2tmZlpRGn
         1LHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XEDlyC4x23bFmi6UpkoBP9U4BLBNCovMFf9Dbwxqia4=;
        b=UwVFHT03f91KMPo2cGKJqyDmRnk75TyEvuEbuDFkIiIqsMXHTROjdNCodM7SSaWJTJ
         P+kcsJ9V2EUHuCBgyQmaSjTcECkAOJw56gTnhTCaGINpt+mFpXB9Vb59la76Hs97hM/R
         nB4k5Aa8z8D9lJvxBZNpSqe8LXlrm/Kf6X3Zv37GMCoEJWMUf9GLC2W0cWIjeRXwcVkZ
         ibgqy7x8fN7eMfx5QMHOYYIgTDNlLZ7Sv0mneo/wElao00Q3Wj8yHF6JYJtZ7We4mnoK
         jdDzb3tNI4nKxwWeqEL35RgUD/K00deV1zhAJWbs7o51YL3z9dLGoJoPfqqyaZwTTgZ9
         8pdw==
X-Gm-Message-State: APjAAAWKEOuajxYCQ98D0muHZAtc7uv820shjq/XmB1c4jS8uUZCBiXI
        +Zzj0+PXD191BcBoQ5w+U3UN7FHhIGXzKzhwgP1sWQ==
X-Google-Smtp-Source: APXvYqyg8ucr6zSEUvl1M4HqyTe0UtN4L5yxaNBlNU3B4YiN409t+8CgCOzREHhELtidr1lANj5X6RlXMQVG+NxMBG8=
X-Received: by 2002:ab0:2a15:: with SMTP id o21mr266565uar.91.1568692106395;
 Mon, 16 Sep 2019 20:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <5d805425.1c69fb81.212fb.3cf6@mx.google.com>
In-Reply-To: <5d805425.1c69fb81.212fb.3cf6@mx.google.com>
From:   Kees Cook <keescook@google.com>
Date:   Mon, 16 Sep 2019 20:48:14 -0700
Message-ID: <CAGXu5jJRmPn1o+znjE8ca4jmauwAC0OSdsoDcBEN52LATx7vbQ@mail.gmail.com>
Subject: Re: next/master build: 218 builds: 6 failed, 212 passed, 11 errors,
 640 warnings (next-20190916)
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     Linux-Next <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 16, 2019 at 8:34 PM kernelci.org bot <bot@kernelci.org> wrote:
> next/master build: 218 builds: 6 failed, 212 passed, 11 errors, 640 warnings (next-20190916)
>
> Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/next-20190916/
> [...]
> Build Failures Detected:
>
> arm64:
> [...]
>     allmodconfig: (gcc-8) FAIL

  HOSTCC  samples/watch_queue/watch_test
/usr/bin/ld: cannot find -lkeyutils
collect2: error: ld returned 1 exit status
make[3]: *** [scripts/Makefile.host:107: samples/watch_queue/watch_test] Error 1
make[2]: *** [../scripts/Makefile.build:509: samples/watch_queue] Error 2
make[1]: *** [/home/buildslave/workspace/kernel-build@2/linux/Makefile:1669:
samples] Error 2
make[1]: *** Waiting for unfinished jobs....

It looks like the keyutils development package needs to get added to
the build roots.

-- 
Kees Cook
