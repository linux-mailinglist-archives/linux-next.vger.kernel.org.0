Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E07B1E75C4
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 08:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE2GGf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 02:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgE2GGf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 02:06:35 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173C4C08C5C6
        for <linux-next@vger.kernel.org>; Thu, 28 May 2020 23:06:35 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o6so59677pgh.2
        for <linux-next@vger.kernel.org>; Thu, 28 May 2020 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4tNC0vFenam0gsg04innWqhm3B8rml6YVgRZIG7c0ME=;
        b=fe4fMewlul8u7qezGtvEHDwARE0z4tZX4kx2lN5kJ4iSebcwXzuJMAWw/xZP9XwlZT
         KRD2fiYYoReCYRfOAk7M4HHY5esXH18h9/qOMfvRL0/Xsjcx2mLyE8u2NNSXAo1Sqve6
         Id5yViJ8Lf3IAxw/+6lTl/M42JTLuCBB0eLAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4tNC0vFenam0gsg04innWqhm3B8rml6YVgRZIG7c0ME=;
        b=aESsR7tuxaM5BA8hbSC+T5ncii1gZi71uNie9yM/CNcoq7I12BJBJsctH7uEUfy7V8
         dO5sQlAChwnaOfVwBExXMkpljqPhsmuuUgt+NiP2GjoWyt4/wfPdsbHxjvUQDRrcF2pF
         euBohYcuiKdAxo/hHd/wOGD8bd+1vJCVgtkiu2c2Vc6G78Wb+l3ABclGyAOLwM0TrY3N
         JOoqHHDTK8AuBU2GuVFFhWoR7eCNM688EnL8TNakDemMIwyCx3Hfq0+O37mtz1cbRjnu
         6NRoSAMMeidJDNLuAT6q//bA7wMMWSF9DTKlMs27pVkLTDFiXcsPW9oBCN/l4qV1gKX0
         uUmg==
X-Gm-Message-State: AOAM531naTgjB6oFDu07LQbVHZ42soGMch8m/XxkRYj0qbZSbtrhzyeq
        6tvgGk9a3i6cGJEWkLP6xAUOVg==
X-Google-Smtp-Source: ABdhPJygV+/5xXSaoUnIkm/MtUF4xqc+nBPn6EhfFYV4t+uITkuEJvl2loUnigOFg+UIllHUTC7iMQ==
X-Received: by 2002:a62:4e8a:: with SMTP id c132mr6670578pfb.22.1590732394442;
        Thu, 28 May 2020 23:06:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t10sm7565475pjj.19.2020.05.28.23.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 23:06:33 -0700 (PDT)
Date:   Thu, 28 May 2020 23:06:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for May 14 (objtool 2/2)
Message-ID: <202005282258.94570AF@keescook>
References: <20200514210716.30b416ee@canb.auug.org.au>
 <742521db-1e8c-0d7a-1ed4-a908894fb497@infradead.org>
 <20200528154404.74sjv4bdj3myacn6@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528154404.74sjv4bdj3myacn6@treble>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 10:44:04AM -0500, Josh Poimboeuf wrote:
> On Thu, May 14, 2020 at 09:04:36AM -0700, Randy Dunlap wrote:
> > On 5/14/20 4:07 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20200512:
> > > 
> > 
> > on x86_64:
> > 
> > drivers/ide/ide-tape.o: warning: objtool: ide_tape_discard_merge_buffer.constprop.7()+0x4e: unreachable instruction
> > drivers/scsi/sd.o: warning: objtool: sd_pr_clear()+0x1e: unreachable instruction
> > drivers/scsi/sd_zbc.o: warning: objtool: sd_zbc_update_wp_offset_workfn()+0xec: unreachable instruction
> > drivers/target/target_core_xcopy.o: warning: objtool: target_xcopy_do_work()+0xdd6: unreachable instruction
> > 
> > 
> > randconfig file is attached.
> 
> Kees,
> 
> More UBSAN_TRAP fun.  This randconfig has:
> 
> CONFIG_UBSAN_TRAP=y
> CONFIG_UBSAN_ALIGNMENT=y
> # CONFIG_COMPILE_TEST is not set

Ugh, I thought CONFIG_COMPILE_TEST always gets set for randconfig and
the all*config choices, but now I see that CONFIG_COMPILE_TEST is
enabled due to the "all" part of the all*config choices. Okay. Big
hammer:

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 929211039bac..27bcc2568c95 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -63,7 +63,7 @@ config UBSAN_SANITIZE_ALL
 config UBSAN_ALIGNMENT
        bool "Enable checks for pointers alignment"
        default !HAVE_EFFICIENT_UNALIGNED_ACCESS
-       depends on !X86 || !COMPILE_TEST
+       depends on !UBSAN_TRAP
        help
          This option enables the check of unaligned memory accesses.
          Enabling this option on architectures that support unaligned

How about that?

-- 
Kees Cook
