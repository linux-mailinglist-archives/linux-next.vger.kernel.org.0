Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA254A7614
	for <lists+linux-next@lfdr.de>; Wed,  2 Feb 2022 17:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbiBBQjn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Feb 2022 11:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235789AbiBBQjm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Feb 2022 11:39:42 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D896DC06173B
        for <linux-next@vger.kernel.org>; Wed,  2 Feb 2022 08:39:42 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id f8so18746369pgf.8
        for <linux-next@vger.kernel.org>; Wed, 02 Feb 2022 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tY7gifojugJSD5p4YfWSz9NLQ3A3BS+rqgnzng9kvSw=;
        b=BDw1mjVM+280XSXCpS330TZurj8fGxBv+iO6moGSKQvKefM5AOP+UBihwh/pltBMNR
         gadkcufziPPtSNG/j1UEaBG5T16386R1jrR8/enqNPP0c4A0ZdHK8g+TVbaPvXFRB8Dz
         +t9cyrk2C4kswXaNLPfRJbU2CnC+o+g9YPvMt8AuWVnHL3qKlu7bgC2ydF3U113GUgrG
         eq+7hmuTqV537xt2U1us/MTANqzEYmFECDNQRQ+unKXlCYAKs3uM8+5Q83GxCeNKpSLk
         B6unFTv5JKltb2yLKuoUDd5c1/ByDyRtJBHfqm9nH29TUQf3UiVYgl2oFm0GtM8MfNab
         Zj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tY7gifojugJSD5p4YfWSz9NLQ3A3BS+rqgnzng9kvSw=;
        b=HN4AMqJaFgLOmRQyWOlkjz7RMig2p2d4SZyViqq6RqVdoayS/P8aFraudYP+8nOT8z
         JjsTfTZ9Y0ZRHFqR5fmSZtrHfrGcCbt6w13ksFnI6rDDn66ODpRGLmq4D0yoOepCf2zz
         xnDNA6wbczN0haWuavwk2jVGj0em0vYfnKqmsts3NAS8n3p79+418viVY+2Z9t3OLPiU
         TuylM2PNDDt+j9DRNh3VXeUpMU7UHkEmdJ+lvRHvrRaJEosO6NTugGHjaSQ6AUGLBqoF
         1O9cqZ/BtZiVm4GeNkpZPl5BNW6QMUs6HSHyDQRyZ6vOsYXhw8nhhtrHC9NaxGKb5owe
         xKoQ==
X-Gm-Message-State: AOAM532yrVTnbYaNw+erQX1EBWxndA6XFtb1P4Z44imX6EL7/tR9O/zi
        hAfNPCnWYvpOdBQZCpVrbTAHNaWQPK0JqOKY78QCxQ==
X-Google-Smtp-Source: ABdhPJyTguLiL2diyFPk98mfUwfK8MI6kgRxK+9KfJJmXZoB0buNdO7m9XYTxFJhYAqKBZhxV38R/qAPe+/HPj9Dd4k=
X-Received: by 2002:a05:6a00:2343:: with SMTP id j3mr30022335pfj.7.1643819982134;
 Wed, 02 Feb 2022 08:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20220202000522.A3834C340EB@smtp.kernel.org> <46e56d44-bd7d-9239-a5db-099b6e285bee@infradead.org>
In-Reply-To: <46e56d44-bd7d-9239-a5db-099b6e285bee@infradead.org>
From:   Yosry Ahmed <yosryahmed@google.com>
Date:   Wed, 2 Feb 2022 08:39:06 -0800
Message-ID: <CAJD7tkYMhnf-Ph8tpC-E4Zudt53grP1SddUxScXsh76Acg2aTg@mail.gmail.com>
Subject: Re: mmotm 2022-02-01-16-04 uploaded (mm/memcontrol.c)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>, broonie@kernel.org,
        mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for pointing this out. The kernel test robot emailed me about
it and I am working on fixing it for v2.

On Tue, Feb 1, 2022 at 7:50 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 2/1/22 16:05, Andrew Morton wrote:
> > The mm-of-the-moment snapshot 2022-02-01-16-04 has been uploaded to
> >
> >    https://www.ozlabs.org/~akpm/mmotm/
> >
> > mmotm-readme.txt says
> >
> > README for mm-of-the-moment:
> >
> > https://www.ozlabs.org/~akpm/mmotm/
> >
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> >
> > You will need quilt to apply these patches to the latest Linus release =
(5.x
> > or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated=
 in
> > https://ozlabs.org/~akpm/mmotm/series
> >
> > The file broken-out.tar.gz contains two datestamp files: .DATE and
> > .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss=
,
> > followed by the base kernel version against which this patch series is =
to
> > be applied.
>
> on i386:
> (memcg-add-per-memcg-total-kernel-memory-stat.patch)
>
>
> ../mm/memcontrol.c: In function =E2=80=98uncharge_batch=E2=80=99:
> ../mm/memcontrol.c:6805:4: error: implicit declaration of function =E2=80=
=98mem_cgroup_kmem_record=E2=80=99; did you mean =E2=80=98mem_cgroup_id_rem=
ove=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>     mem_cgroup_kmem_record(ug->memcg, -ug->nr_kmem);
>     ^~~~~~~~~~~~~~~~~~~~~~
>     mem_cgroup_id_remove
>
>
> Full randconfig file is attached.
>
> --
> ~Randy
