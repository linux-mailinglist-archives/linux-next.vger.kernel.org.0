Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C710233D677
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 16:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhCPPGP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 11:06:15 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:46834 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237763AbhCPPGA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 11:06:00 -0400
Received: by mail-wm1-f49.google.com with SMTP id d139-20020a1c1d910000b029010b895cb6f2so1647314wmd.5;
        Tue, 16 Mar 2021 08:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o+PiWHDEHupz02UsLHDLwfvKsdht9yaP3C9CO8u659w=;
        b=m58w/zy805ZiZXIZlF8qLmtajNJwg+pqEeN2n1FjbCxTyYEcgxk8M6/RV3y1JAcpf5
         ZECswjQMAfuivx1aTE1oVfhOYl/M/1nb2bhzj7C8U8TEtNgcNefDNwc89UooVaNtI+kV
         Tw7mKIWG7/r3qKJK/rBYNnVZ47Y9N8AW7U40qMhnDDypn8SC0H5ozbnUKqcGYCsMpwKW
         Yw9eyRug+9PKjV7yEtgALQbSRPdKm5vp5AMWc0JVGnV0bxYfs/l7O+0hPErfN8nG3Ig0
         cScHrR+FcAG7CINZfddUNHA2abByuQ3jkaw2IvS5BuLumxREilKdBRsmDyrj0DtbR9eW
         jm0g==
X-Gm-Message-State: AOAM5309l/XQlfera1tItaSqmB5myMQvn3yNe/9lXRFT5BdDdR4Z5Seu
        6TfiaSaLbUdqbpqQ86YD+Ew=
X-Google-Smtp-Source: ABdhPJwQJNdzrVoiD2MaOD9WmvNzm8l6HIhBnhOOf5ISEfZVq+i43rXX50QB6+7dAlmDFOAs1+ed8w==
X-Received: by 2002:a1c:1d14:: with SMTP id d20mr139110wmd.36.1615907156743;
        Tue, 16 Mar 2021 08:05:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id j203sm3559102wmj.40.2021.03.16.08.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 08:05:56 -0700 (PDT)
Date:   Tue, 16 Mar 2021 15:05:54 +0000
From:   Wei Liu <wei.liu@kernel.org>
To:     Borislav Petkov <bp@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wei Liu <wei.liu@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juergen Gross <jgross@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Kelley <mikelley@microsoft.com>
Subject: Re: linux-next: manual merge of the hyperv tree with the tip tree
Message-ID: <20210316150554.32xtihkhvdkup3eq@liuwe-devbox-debian-v2>
References: <20210315143505.35af617b@canb.auug.org.au>
 <20210316150254.GC18822@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210316150254.GC18822@zn.tnic>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 16, 2021 at 04:02:54PM +0100, Borislav Petkov wrote:
> On Mon, Mar 15, 2021 at 02:35:05PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the hyperv tree got a conflict in:
> > 
> >   arch/x86/include/asm/mshyperv.h
> > 
> > between commit:
> > 
> >   a0e2bf7cb700 ("x86/paravirt: Switch time pvops functions to use static_call()")
> > 
> > from the tip tree and commit:
> > 
> >   eb3e1d370b4c ("clocksource/drivers/hyper-v: Handle sched_clock differences inline")
> > 
> > from the hyperv tree.
> > 
> > I fixed it up (I used the latter version of this file and then applied the
> > following patch) and can carry the fix as necessary. This is now fixed
> > as far as linux-next is concerned, but any non trivial conflicts should
> > be mentioned to your upstream maintainer when your tree is submitted for
> > merging.  You may also want to consider cooperating with the maintainer
> > of the conflicting tree to minimise any particularly complex conflicts.
> 
> Right,
> 
> so tglx and I took a quick look and came to the conclusion that it would
> be best if you - provided it is not too much trouble - keep applying
> this patch so that linux-next can get tested properly and we - Wei or I
> - explain this merge conflict in our pull requests during the next merge
> window and ask Linus to merge your patch ontop. This way we'll save us
> the cross-tree merging dance.

Totally agreed. :-)

I've made a note to inform Linus about this in the next merge window.

Thanks,
Wei.

> 
> Thx!
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
