Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B1B21B69E
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 15:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgGJNiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 09:38:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58389 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726867AbgGJNiR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 09:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594388296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Fs+hXal+E9h+xSmSn1WDSBw3YxCqs2UgsXPkscEMfts=;
        b=iTjMYTTYdSgq7qqassriqelPO6fQ8zpxvbx171J88m7hc1nUONbn0HyAr0mpoFniEidApZ
        gv8henWLCBv19qQmvPddqoQS1r9sVbCsju/ALImpxfX0SeRruEiN/NS2GgFKMeJtrnwg1G
        YBtfqn9kkGPVXHzyij83wAQa8Lz8/mU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101---iV1-PHP86uzjKcv-65rQ-1; Fri, 10 Jul 2020 09:38:14 -0400
X-MC-Unique: --iV1-PHP86uzjKcv-65rQ-1
Received: by mail-qt1-f200.google.com with SMTP id k9so4121048qth.17
        for <linux-next@vger.kernel.org>; Fri, 10 Jul 2020 06:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fs+hXal+E9h+xSmSn1WDSBw3YxCqs2UgsXPkscEMfts=;
        b=NWGbt0tBTto7wCMCujTjeCelJ6ig4bPl1PzIhGc9k4a1iRZpvS5PAiuPRvuDiRDy0l
         Da7gXs1tUIIR77d3dR8S26Z2Bc++rJFvgCdki2CNYxqTUeSrxzw6w7iTqun9QqpouLhO
         RJfBQO+U0v1brqb31UL102VDKoV43/R7PpeXkJJIbVuPYG/EHFgDttkVHByf2qTqiiXd
         egkvjpABLUlUcjRxxMp/WiqczZ4JWFPEpO7gAe1NHq3KoI32QqC5jjoFK+tWWLcA7DFd
         roFXCcHwW9LbKpR/NDwWYMMTQR8TBMpjgvRRHWe0/NGllr+BzTRCzIC8mVpZg47qQjiJ
         pmFg==
X-Gm-Message-State: AOAM530VC744nhDWPbd0MbD0t2cwLW3dCHhjJXuAttgF4V2EiTywl1n1
        ZbwjbdMmyFXhI26yjDVvUWPpOZoIgchkNTaPib/RdeioNbO6wyN/quRiPmEMFbZara0bmO59coG
        lUwn//KaGl2v+PpOxaJLbcw==
X-Received: by 2002:a05:6214:13c6:: with SMTP id cg6mr68870819qvb.160.1594388294094;
        Fri, 10 Jul 2020 06:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx94pAjTCneB10Vm7hL/5f34lU0p1/JC54i6Ailssrju73hfAlT7p+WskPvc1OHKAsqE2lwYw==
X-Received: by 2002:a05:6214:13c6:: with SMTP id cg6mr68870802qvb.160.1594388293870;
        Fri, 10 Jul 2020 06:38:13 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c8:6f::1f4f])
        by smtp.gmail.com with ESMTPSA id h197sm7530332qke.51.2020.07.10.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 06:38:13 -0700 (PDT)
Date:   Fri, 10 Jul 2020 09:38:11 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Mark Brown <broonie@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: Re: Build failure in -next with get_user_pages_remote() API change
Message-ID: <20200710133811.GM199122@xz-x1>
References: <20200710113201.GC5653@sirena.org.uk>
 <20200710122457.GK199122@xz-x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710122457.GK199122@xz-x1>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 10, 2020 at 08:24:57AM -0400, Peter Xu wrote:
> On Fri, Jul 10, 2020 at 12:32:01PM +0100, Mark Brown wrote:
> > Today's -next fails to build in various arm64 configs with:
> > 
> > arch/arm64/kernel/mte.c:225:23: error: too many arguments to function call, expected 7, have 8
> >                                             &page, &vma, NULL);
> >                                                          ^~~~
> > ./include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
> > #define NULL ((void *)0)
> >              ^~~~~~~~~~~
> > ./include/linux/mm.h:1705:6: note: 'get_user_pages_remote' declared here
> > long get_user_pages_remote(struct mm_struct *mm,
> >      ^
> > 1 error generated.
> > 
> > caused by b7363b0ab88d66d3c (mm/gup: remove task_struct pointer for all
> > gup code) which updated the signature of get_user_pages_remote() without
> > updating the caller in mte.c.
> 
> We should need to squash into "mm/gup: remove task_struct pointer for all gup
> code" with:
> 
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 934639ab225d..11e558b02a05 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -221,7 +221,7 @@ static int __access_remote_tags(struct task_struct *tsk, struct mm_struct *mm,
>                 void *maddr;
>                 struct page *page = NULL;
>  
> -               ret = get_user_pages_remote(tsk, mm, addr, 1, gup_flags,
> +               ret = get_user_pages_remote(mm, addr, 1, gup_flags,
>                                             &page, &vma, NULL);
>                 if (ret <= 0)
>                         break;
> 
> Seems to be a new caller merged recently, so it got left behind during the
> rebases...  Sorry for not noticing that.

Andrew, IIUC this can still have its chance to be squashed into existing
commit, or please let me know if there's anything I can do (resend the affected
last patch, or send a fixup patch, ...).  Thanks!

-- 
Peter Xu

