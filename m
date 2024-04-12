Return-Path: <linux-next+bounces-1914-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F548A2E05
	for <lists+linux-next@lfdr.de>; Fri, 12 Apr 2024 14:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F8971C210CD
	for <lists+linux-next@lfdr.de>; Fri, 12 Apr 2024 12:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F8C56459;
	Fri, 12 Apr 2024 12:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WIVLGs8H"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E317D56458
	for <linux-next@vger.kernel.org>; Fri, 12 Apr 2024 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924116; cv=none; b=pOrm7bUiAJ23KADf4xnXDR9EKb+At2mU3BuenUT9NtEKTn4r9uw4j63cAugOhiHIY1z+7VQN18zLud10F2S00HCxTblmqFle/HDfC4fTNpbnmv1QQxiDyLdE0YU3BrZA4Gc90MvCCFbtyybGU9as7XxFJLWzJ2nRUkTArzLc3FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924116; c=relaxed/simple;
	bh=jMgsflWuaYWNYa9dlh0cqvvdrhZy9tcBnp+Jx8l3B5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q4OPP0+locfMLBUwKCWqKHKgjpjrGh/OOCR40mH7RHjMFqNodCJeW3GCAMAEtuOKy6+qvXl6BMr4o6A2Bwz38t4XMbRpM1V/dibSoysLAnV641aGONtoSS0tcvj0YvQLvxss0LkpYPr9DFVBhwWDYq5M40D7aOfzkJ05RrG+cVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WIVLGs8H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712924113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kbg/AnMCE3YNGZKUUT6bVQZJO+XQvmdhDaWbX3/3Wzc=;
	b=WIVLGs8Hw0HDya4Ua+1GWTJbf6IxEG45+jDaf+PAg5SppvjYTPp2N8UxyQbqhPRpofcICr
	F64/NIZ2Q8TmKBYUO0+abw6+mHxu85BPN9ZqLabXGRe6cGI0/hqcKbkDf72+qT+2qXiYz6
	iM5XQJgxCxLZZ4vLxJmTY2GRLCvkm5I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-JOaDo5m-P4uRf731GREA4w-1; Fri, 12 Apr 2024 08:15:12 -0400
X-MC-Unique: JOaDo5m-P4uRf731GREA4w-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-343da0a889dso537908f8f.0
        for <linux-next@vger.kernel.org>; Fri, 12 Apr 2024 05:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924111; x=1713528911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kbg/AnMCE3YNGZKUUT6bVQZJO+XQvmdhDaWbX3/3Wzc=;
        b=xO0hhTJfO2eOOhcZEscSjljQupuEWhJtCBVboslswUCqfjzed+ca2rEv/VJS/BDrFW
         R/XabWU0p9iN1EmEPQC7uKDaeop2j9mF6FfLpIc+OmM8VrJxt5eKQ8NiC5xVPtlPQ4OX
         kEgeSWCv9QeDhm5Vpt75/tu5sPkmRynCK5+WUuQO4q4AWfK4U5gFlZtPEdy9cLKKszUm
         bcTFB2hhFXJt4zwPXnJO5bS2vZs1AaqPUEF6XO8pXJGJwFWXNEAyQuc4w6ljKfljd1Hs
         GE77pM0q1FnVXACbzobTMIyB/gYRyPlxULQuQRa+vXP/1cNLYdvjzfgN+WN/cUspRgG3
         gD/A==
X-Forwarded-Encrypted: i=1; AJvYcCVuio2QYhnUUH4+BzFK0zq18zJg50Hg/PEQMAvXhWV2HY+OOqfsM8KXnjQIbKzscT660J1IzZ+2JOSZvrXyuJqw0ZidF1LSx9sNNA==
X-Gm-Message-State: AOJu0YwX7IcwruIQq79n8toCbjnOs+3xpAtNGAMpZE7+K05nPHYcK0Nr
	Q7f8S0gVZ8AAIfI+u+ubMcuw79HqT7Fw5sELMK6aYxAV5FXD25WhLCvYYPV9OKPVims7/QHY7c1
	Aq3gD4jv254yXe3OE1cNMG4m+GGbKiIoFSgK/UldMN9SnpnRw7hM99JVWzs13hT8HH+Q1ld5o4q
	pvCz0syLcF9OMddiD/oqR99RB1K9Nl0GWq4A==
X-Received: by 2002:adf:f984:0:b0:343:90be:f8b5 with SMTP id f4-20020adff984000000b0034390bef8b5mr1811575wrr.36.1712924111090;
        Fri, 12 Apr 2024 05:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0f/Lal1JjP9dKNlIEcj9MMuXsHp5r8ZbKIS/SX6F6aPygKHGgkqTo1ZIYnBysCL3cQkaQ5/QML9YKp4gg4WQ=
X-Received: by 2002:adf:f984:0:b0:343:90be:f8b5 with SMTP id
 f4-20020adff984000000b0034390bef8b5mr1811562wrr.36.1712924110759; Fri, 12 Apr
 2024 05:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412133407.3364cda3@canb.auug.org.au> <20240412133516.0286f480@canb.auug.org.au>
In-Reply-To: <20240412133516.0286f480@canb.auug.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 12 Apr 2024 14:14:59 +0200
Message-ID: <CABgObfb0Sm8z8u2269+oiR57fxAgh74JURDRrEebhFAaPNKqGA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 5:35=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> On Fri, 12 Apr 2024 13:34:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the kvm tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > kernel/events/uprobes.c: In function '__replace_page':
> > kernel/events/uprobes.c:160:35: error: storage size of 'range' isn't kn=
own
> >   160 |         struct mmu_notifier_range range;
> >       |                                   ^~~~~
> > kernel/events/uprobes.c:162:9: error: implicit declaration of function =
'mmu_notifier_range_init' [-Werror=3Dimplicit-function-declaration]
> >   162 |         mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm=
, addr,
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~
> > kernel/events/uprobes.c:162:41: error: 'MMU_NOTIFY_CLEAR' undeclared (f=
irst use in this function)
> >   162 |         mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm=
, addr,
> >       |                                         ^~~~~~~~~~~~~~~~
> > kernel/events/uprobes.c:162:41: note: each undeclared identifier is rep=
orted only once for each function it appears in
> > kernel/events/uprobes.c:175:9: error: implicit declaration of function =
'mmu_notifier_invalidate_range_start' [-Werror=3Dimplicit-function-declarat=
ion]
> >   175 |         mmu_notifier_invalidate_range_start(&range);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > kernel/events/uprobes.c:208:9: error: implicit declaration of function =
'mmu_notifier_invalidate_range_end' [-Werror=3Dimplicit-function-declaratio=
n]
> >   208 |         mmu_notifier_invalidate_range_end(&range);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > kernel/events/uprobes.c:160:35: warning: unused variable 'range' [-Wunu=
sed-variable]
> >   160 |         struct mmu_notifier_range range;
> >       |                                   ^~~~~
> > cc1: some warnings being treated as errors
> >
> > Caused by commit
> >
> >   b06d4c260e93 ("mm: replace set_pte_at_notify() with just set_pte_at()=
")
> >
> > I have applied the following patial revert for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 12 Apr 2024 13:27:20 +1000
> Subject: [PATCH] fix up for "mm: replace set_pte_at_notify() with just
>  set_pte_at()"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/events/uprobes.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
> index f4523b95c945..1215bc299390 100644
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@ -18,6 +18,7 @@
>  #include <linux/sched/coredump.h>
>  #include <linux/export.h>
>  #include <linux/rmap.h>                /* anon_vma_prepare */
> +#include <linux/mmu_notifier.h>
>  #include <linux/swap.h>                /* folio_free_swap */
>  #include <linux/ptrace.h>      /* user_enable_single_step */
>  #include <linux/kdebug.h>      /* notifier mechanism */
> --
> 2.43.0

Fixed, thanks and sorry for messing up.

Paolo


