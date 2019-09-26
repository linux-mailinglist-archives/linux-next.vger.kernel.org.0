Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917BCBF7A6
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 19:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfIZRgx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 13:36:53 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:43536 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZRgx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 13:36:53 -0400
Received: by mail-qt1-f182.google.com with SMTP id c3so3841118qtv.10;
        Thu, 26 Sep 2019 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KXTvrFGLYpN84o+cQ6iRUtgz+d/sIS68/UZpCvpezeM=;
        b=SVGIjs+HRpy0EboJP250vwLatuiJvWpXyR4cjcm5f9ENkVazU9nFXXfueNcw2Ssug/
         jqAgy/UfzZksE2c82NmwJwiUyYmaI8XZALf0oqK3UbTr7MRNRZFoGzKWUeVqCeqpcbuB
         YDF1JPu5THQ4IY5My4qYwxYGlkYixxBcfgshZpbroaTMvTrSz/5Q1nWYcvkUJkCXdJcQ
         9fsqJHzMnJio9FSvh7nCHqXMGKCuU0xhIPGr34xL7m1w0OZ2/p+kNuCCysi51bmcY2Yd
         ieJVIt1Able9nTSXKYhI+ndC4GFF0XmHfxZqNSUQbbawQbd5N9xqEOh074iQbqko4QfL
         OIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KXTvrFGLYpN84o+cQ6iRUtgz+d/sIS68/UZpCvpezeM=;
        b=WUlFq5KP8OC6UsTQO5udXh+M1lrmkBcp5McxBhFXwm651CBkJUfcBq/XxxBtMTz6Nb
         8Xa95lnMg7GOOo0xysNO2DHhJcMA0n33yRz4QNsZ6KcgftqydxOKM7VtCGK8LjKE5ilG
         4OY/XZSljCWvH5fZV9ZkFJ/QVn/x3aADdcTc+d7XqmRf2Ihe9eu2eulz3t0EiAVybikp
         FqgPObIPKmxFwAKEVNC+i+pD3ajpwerpg4rq4zKqOqopJO+cFm8QQE45OZ/zcucdmQOm
         8PmPYCo2zZ1YaLA74K6Fgo9R7o9zN5J6lURKNy1V427kbES/KdxCc9buhFyGfzXLycXv
         Ns4g==
X-Gm-Message-State: APjAAAWaTODT1J9wC5L3qIH+Id66eJU0GQ4p5MMAydpTIgns1pOu88Xa
        3KBs0hxt/Yq/jw+bjQadV5k=
X-Google-Smtp-Source: APXvYqxVWj5oHxULdGbhNzzv1NibZfhwPt3+2t6jUG5E/VAr/mJSuesTO312xW3dRPQkXOvT9QJyDA==
X-Received: by 2002:a05:6214:1590:: with SMTP id m16mr3829878qvw.20.1569519412298;
        Thu, 26 Sep 2019 10:36:52 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([177.195.208.95])
        by smtp.gmail.com with ESMTPSA id 16sm794338qky.93.2019.09.26.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 10:36:51 -0700 (PDT)
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 9952C40396; Thu, 26 Sep 2019 14:36:48 -0300 (-03)
Date:   Thu, 26 Sep 2019 14:36:48 -0300
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        alexander.shishkin@linux.intel.com, jolsa@redhat.com,
        namhyung@kernel.org, open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: perf build failed on linux -next on i386 build
Message-ID: <20190926173648.GA31477@kernel.org>
References: <CA+G9fYu0hkS+NdwX38DNTygV1A7eebvjZvWvFUTfL=f3_4m=Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYu0hkS+NdwX38DNTygV1A7eebvjZvWvFUTfL=f3_4m=Dw@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Thu, Sep 26, 2019 at 10:59:41PM +0530, Naresh Kamboju escreveu:
> perf build failed on linux -next on i386 build
> 
> build error:
> perf-in.o: In function `libunwind__x86_reg_id':
> tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
> undefined reference to `pr_err'
> tools/perf/util/libunwind/../../arch/x86/util/unwind-libunwind.c:109:
> undefined reference to `pr_err'

Can you try with the following patch?


diff --git a/tools/perf/arch/x86/util/unwind-libunwind.c b/tools/perf/arch/x86/util/unwind-libunwind.c
index 05920e3edf7a..47357973b55b 100644
--- a/tools/perf/arch/x86/util/unwind-libunwind.c
+++ b/tools/perf/arch/x86/util/unwind-libunwind.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <errno.h>
+#include "../../util/debug.h"
 #ifndef REMOTE_UNWIND_LIBUNWIND
 #include <libunwind.h>
 #include "perf_regs.h"
 #include "../../util/unwind.h"
-#include "../../util/debug.h"
 #endif
 
 #ifdef HAVE_ARCH_X86_64_SUPPORT
