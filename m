Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A31B3F92ED
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 05:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244175AbhH0D3y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 23:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244167AbhH0D3w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Aug 2021 23:29:52 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE36C0613C1
        for <linux-next@vger.kernel.org>; Thu, 26 Aug 2021 20:29:04 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id e16so4094534pfc.6
        for <linux-next@vger.kernel.org>; Thu, 26 Aug 2021 20:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=972//1VrtuuFZwnQDeMdS0B6akzzjiuVZWtERzM09s0=;
        b=j9siNTCZuGh7KQq256N6d/De1fzPdgR0s59g9kiBkVFEaXhT+QJ7U7zpHzePZleqCa
         NLeFWIHihL1/Y+z5CRxYz1icg+OLIffMO21qfx/LEc3WkIeVqdQM4oBbyPo2Jn0VviNz
         R3/z4TnS8N0GQHIBTY0/hyXoR9RDTQMpB7Q1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=972//1VrtuuFZwnQDeMdS0B6akzzjiuVZWtERzM09s0=;
        b=bqr//1qwlxWQCncvfuX8ln5nw+riQxJk73SDjj0qJg630t08Q58B9Gr5LWVQX/4w3r
         DxolzgMZmqhxT0NJ9Qdb/QRgdTWyG3xfQD3hITAAYYZt/+AFfNBH3aGFuI8JkGBCPMHA
         CmwrNxsZ0RKqVit1Fw2bennmNPQQcVQpyLAbyXy7BqHYSVivl18WWxS0zlyXy2SG9RUE
         bOhh3k0TeAz6DjlQcxmmt5BBLtQHI1gQvqqXvABv5tlWuhjo6Q9VLIz/759SpJHFQs6z
         5e7MCln4elqkQ5+B8AjghVoicYBCHdml0YHbpLJKD1B4YDLK7jBpaz/Yarfm3V7iVeUn
         JA+g==
X-Gm-Message-State: AOAM530tUrIig+b9Jz7k4iEWhgy5auHBDx6MewU6fEkIimruXtiEW7HA
        8IbD/ZLRRaWUhLXFPFBxmsn50tcRbywrQg==
X-Google-Smtp-Source: ABdhPJwVDJrVgxj/z0XncPqUa8JFXd12WSJDmoQs/kn0QTdmzgf8+20bw/dtXZZdLj09qUkYvY9BQg==
X-Received: by 2002:aa7:8198:0:b029:3dd:a2ec:9ea8 with SMTP id g24-20020aa781980000b02903dda2ec9ea8mr6921691pfi.11.1630034943468;
        Thu, 26 Aug 2021 20:29:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c2sm4382533pfp.138.2021.08.26.20.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 20:29:02 -0700 (PDT)
Date:   Thu, 26 Aug 2021 20:29:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the kspp tree
Message-ID: <202108262021.65CA0EC3@keescook>
References: <20210826180042.35e8aab6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826180042.35e8aab6@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 26, 2021 at 06:00:42PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
> 
> In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
>                  from include/linux/compiler.h:264,
>                  from include/uapi/linux/swab.h:6,
>                  from include/linux/swab.h:5,
>                  from arch/arm/include/asm/opcodes.h:86,
>                  from arch/arm/include/asm/bug.h:7,
>                  from include/linux/bug.h:5,
>                  from include/linux/thread_info.h:13,
>                  from include/asm-generic/current.h:5,
>                  from ./arch/arm/include/generated/asm/current.h:1,
>                  from include/linux/sched.h:12,
>                  from include/linux/cgroup.h:12,
>                  from kernel/cgroup/cgroup-internal.h:5,
>                  from kernel/cgroup/cgroup.c:31:
> kernel/cgroup/cgroup.c: In function 'of_css':
> kernel/cgroup/cgroup.c:651:42: warning: array subscript '<unknown>' is outside the bounds of an interior zero-length array 'struct cgroup_subsys_state *[0]' [-Wzero-length-bounds]
>   651 |   return rcu_dereference_raw(cgrp->subsys[cft->ss->id]);

Oh, that's cute. That's "with cgroups but no cgroup subsystems". :P I
will get this fixed.

> [...]
> Introduced by commit
> 
>   7d8aac16a0a8 ("Makefile: Enable -Wzero-length-bounds")
> 
> -- 
> Cheers,
> Stephen Rothwell

-- 
Kees Cook
