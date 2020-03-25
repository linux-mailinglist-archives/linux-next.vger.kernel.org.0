Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE7F192B0D
	for <lists+linux-next@lfdr.de>; Wed, 25 Mar 2020 15:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgCYOX1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Mar 2020 10:23:27 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]:43790 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbgCYOX1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Mar 2020 10:23:27 -0400
Received: by mail-qt1-f170.google.com with SMTP id a5so2232633qtw.10;
        Wed, 25 Mar 2020 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yht3Hr3Z2LR8imhVwniUokEOhf9PD9ShQzB5wpJUp7I=;
        b=H4lv2ExY8zdsjjNslKgsEZs5uBONVSrNzo4qFhyqpJ4gkzc7OE9h7h2vLWGo7kQPbJ
         jxOgg9iEpsjuRz+5z4ccDxXFeEplNff6AfPcLRs0ncAP5DvGIgt0IYMDXmgj6Minj4G7
         L41nOxQLMzv3m7mwyJDhUjddy1G7A4bLk00kiylxKwj1l67myofaGxUfY/w1A9E1LKZp
         M1lzA71O8TlVjyC520n/t/m16TB85yBdVlZJssuGz0cK92oiBIN4B3d9Hb1Zz+VTkkEd
         svuSvEmkC56fGl+o6iltUJEeiiAS7t5h5HSLZpG4dk85zTCkSOlK1c44pajmzCT4Lv9z
         EG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yht3Hr3Z2LR8imhVwniUokEOhf9PD9ShQzB5wpJUp7I=;
        b=uclPqd4bPrjJUgtEO40iQQCtiMLZ2yN70NI+qvnZY9OUOEG99nEq0CQi3tWZHxQ/dI
         c1IMvZQ+YbM+KwSvgOr3RyjJ5ANqP0NRTnukJmKIiTMVHBqzulJjjXsi3ymz0bL6Xwpq
         eNMG1oGElb2bupBWJn3gKiG3Ty8ShpZSZC66IMmcuvDSZ58DZSoHsbtExFU1fx8TaG1V
         IZ0IVbJyqnf4y+wG3OQZ8/KsFTxWlO++Q0BGzGfQX/MENaAbRgM3zytgBY6W6D0os6nH
         nT6dFxv6ejY+joW9vVLK6/BFJFhVoPm1AmLeEV1aAiJZ0e/frEcZjT88kwOJR5J78DYE
         XyJQ==
X-Gm-Message-State: ANhLgQ3jmU+8C7rJnr6aEHiR/AbU7xmCLlR291F2DJIBCF613iwdgthX
        fk87R93lw1RgcAa7r4NHrWU=
X-Google-Smtp-Source: ADFU+vtnZ6zSN/9XvmD840B39Naz3Lc3yVMoWy3y6qVl/TRldW/Upvc3wcLPCgltAV2ybJ+oEWpWWQ==
X-Received: by 2002:aed:3988:: with SMTP id m8mr3227568qte.9.1585146206535;
        Wed, 25 Mar 2020 07:23:26 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([179.97.37.151])
        by smtp.gmail.com with ESMTPSA id q142sm15895019qke.45.2020.03.25.07.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 07:23:25 -0700 (PDT)
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 0B0B240F77; Wed, 25 Mar 2020 11:23:24 -0300 (-03)
Date:   Wed, 25 Mar 2020 11:23:23 -0300
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        jolsa@redhat.com, Namhyung Kim <namhyung@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Leo Yan <leo.yan@linaro.org>
Subject: Re: tools: Perf: build failed on linux next
Message-ID: <20200325142323.GE14102@kernel.org>
References: <CA+G9fYtiroQnpwGu4oLA=ChmS==XGpmAAqB_Oa9nrXC3vQ0xsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtiroQnpwGu4oLA=ChmS==XGpmAAqB_Oa9nrXC3vQ0xsQ@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Wed, Mar 25, 2020 at 07:37:10PM +0530, Naresh Kamboju escreveu:
> Perf build broken on Linux next and mainline on x86_64.
> 
> find: unknown predicate `-m64/arch'
> Try 'find --help' for more information.
>   HOSTCC   /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/pmu-events/json.o
>   LD       /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/libperf-in.o
> x86_64-linaro-linux-gcc: warning: '-x c' after last input file has no effect
>   GEN      perf-archive
>   AR       /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/libperf.a
>   GEN      perf-with-kcore
> x86_64-linaro-linux-gcc: error: unrecognized command line option
> '-m64/include/uapi/asm-generic/errno.h'
> x86_64-linaro-linux-gcc: fatal error: no input files
> compilation terminated.
>   HOSTCC   /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/pmu-events/jevents.o
>   MKDIR    /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/pmu-events/
> x86_64-linaro-linux-gcc: warning: '-x c' after last input file has no effect
>   HOSTCC   /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/pmu-events/jsmn.o
> x86_64-linaro-linux-gcc: error: unrecognized command line option

Right, there is some patch handling this, which we're trying to process
but has some issues.

- Arnaldo

> '-m64/include/uapi/asm-generic/errno.h'
> x86_64-linaro-linux-gcc: fatal error: no input files
> compilation terminated.
> make[3]: Nothing to be done for
> '/srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/plugins/libtraceevent-dynamic-list'.
>   GEN      /srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/python/perf.so
> Traceback (most recent call last):
>   File "util/setup.py", line 6, in <module>
>     cc_is_clang = b"clang version" in Popen([cc, "-v"],
> stderr=PIPE).stderr.readline()
>   File "/srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> line 394, in __init__
>     errread, errwrite)
>   File "/srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/recipe-sysroot-native/usr/lib/python2.7/subprocess.py",
> line 1047, in _execute_child
>     raise child_exception
> OSError: [Errno 2] No such file or directory
> cp: cannot stat
> '/srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/python_ext_build/lib/perf*.so':
> No such file or directory
> Makefile.perf:590: recipe for target
> '/srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/python/perf.so'
> failed
> make[2]: *** [/srv/oe/build/tmp-lkft-glibc/work/intel_corei7_64-linaro-linux/perf/1.0-r9/perf-1.0/python/perf.so]
> Error 1
> make[2]: *** Waiting for unfinished jobs....
> 
> ref:
> https://ci.linaro.org/view/lkft/job/openembedded-lkft-linux-next/DISTRO=lkft,MACHINE=intel-corei7-64,label=docker-lkft/733/consoleText
> 
> -- 
> Linaro LKFT
> https://lkft.linaro.org

-- 

- Arnaldo
