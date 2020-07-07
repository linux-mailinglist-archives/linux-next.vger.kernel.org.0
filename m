Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75E5216851
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 10:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgGGI0N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 04:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgGGI0N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 04:26:13 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A896C08C5DB
        for <linux-next@vger.kernel.org>; Tue,  7 Jul 2020 01:26:13 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ch3so3010411pjb.5
        for <linux-next@vger.kernel.org>; Tue, 07 Jul 2020 01:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fgBIZf6Ou6ZCSQC003d8zpy8H4E/NqNG8qaxNJbkaL8=;
        b=A6nYUDqHUKTXBW7Pk1P9cL/T4itjOBAzbhA96iehBZV//QPjGHpg9eNxJQEG/VM9BU
         IVTsNsdxCGQgTIKnoSfkELHb3ndL+8gD/TgAQo/WJzQ0qaN/8Q83HIhJ58+cW1icXw3D
         Hgm/RgYlRgGnJv19R8ao/wfQ8Wv3vrCWEgVsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fgBIZf6Ou6ZCSQC003d8zpy8H4E/NqNG8qaxNJbkaL8=;
        b=a1N6l23szVLC7BHAQ17hDIxJaNYPNz4TY4kH+nz7eOsXwZ6EXadQIypEyVSDN4k4PE
         Ujfb709N1si+dUSBSQdU3PFIbrK8g8W1gJuP2D9lHge5V9GX+W+5d5GIQY1TFVUEHTyH
         MVTBEB5NbeEHVGZSwLKmKIzwFIVZd0zRKZuIXTPXh0qibH4iFm/R8XwLZ3jtIq2ssiJ5
         ZzStNuCOTjk9WXsaBZeCHacVAq016EdPK+dCWH4wHXfaRukVF60ulw+j0Gynd8ZrmIoA
         aQ/WbCNsRh6endVMQlBZYYpFOTG981mj9jGRwi/Nkp7NZEB/i38xeDJyrv1o4vDza8Uv
         PFag==
X-Gm-Message-State: AOAM532UwixPAFyR+DiviwV1ErCwbBMOaFeBf1VwSyu2LII0CsIMm4zZ
        FAx4AgFBfjBGjx27uEnMwNKkzGI2WZM=
X-Google-Smtp-Source: ABdhPJxubdYJ+zA9s+j14s1peRxm9eOct8g9idUMim5bT+kkXQ+qoIFmxJYd5/+Qc/0bt77zbGH8fw==
X-Received: by 2002:a17:90b:1b44:: with SMTP id nv4mr3016781pjb.24.1594110372613;
        Tue, 07 Jul 2020 01:26:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z8sm194212pgz.7.2020.07.07.01.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 01:26:11 -0700 (PDT)
Date:   Tue, 7 Jul 2020 01:26:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <shuah@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: linux-next: manual merge of the seccomp tree with the kselftest
 tree
Message-ID: <202007070125.ECBAB9E7C3@keescook>
References: <20200707145720.02636577@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707145720.02636577@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 07, 2020 at 02:57:20PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the seccomp tree got a conflict in:
> 
>   tools/testing/selftests/seccomp/seccomp_bpf.c
> 
> between commit:
> 
>   9847d24af95c ("selftests/harness: Refactor XFAIL into SKIP")
> 
> from the kselftest tree and commits:
> 
>   aae7d264d68b ("selftests/seccomp: Check for EPOLLHUP for user_notif")
>   11b4beaa0d31 ("selftests/seccomp: Make kcmp() less required")
>   ef332c970dfa ("selftests/seccomp: Rename user_trap_syscall() to user_notif_syscall()")
> 
> from the seccomp tree.

Har har -- a collision of my own creation. Yay lots of trees. ;) I'll
make this go away; the cause is a harmless cleanup.

> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc tools/testing/selftests/seccomp/seccomp_bpf.c
> index b878e8379966,b854a6c5bf49..000000000000
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@@ -3079,10 -3043,8 +3055,10 @@@ TEST(get_metadata
>   	long ret;
>   
>   	/* Only real root can get metadata. */
>  -	if (geteuid())
>  -		XFAIL(return, "get_metadata test requires real root");
>  +	if (geteuid()) {
> - 		SKIP(return, "get_metadata requires real root");
> ++		SKIP(return, "get_metadata test requires real root");
>  +		return;
>  +	}
>   
>   	ASSERT_EQ(0, pipe(pipefd));
>   



-- 
Kees Cook
