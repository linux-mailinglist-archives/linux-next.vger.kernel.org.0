Return-Path: <linux-next+bounces-4453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 123F09B135C
	for <lists+linux-next@lfdr.de>; Sat, 26 Oct 2024 01:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B74CB22907
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 23:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9255620C301;
	Fri, 25 Oct 2024 23:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqRt6V+S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488931DD0C9;
	Fri, 25 Oct 2024 23:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729899415; cv=none; b=MyNOodyG+4nDNA3aE9TqF8btxvKeWo91BeDdEF0GNZr8H9dOfFHFKznPr5fhyZdYkDx8gJMTKHPgN9PllnnvgrjG7u9AU5A4V3zjTiYo2J6Nqeu0AbAYyaoq0XLkQsswcufmPexqYszO2tYdTzDF2pW7mOlut8LmIjmjaJK646g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729899415; c=relaxed/simple;
	bh=IGGzg2XSMEgYDbtmoEgullvHERYz9k0xD4DeSP9VkBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8IJ8/As42X65m74Ayef7qYy0C26nhpd/4druViIx99fzVwm/wZFwZ50mTIG57SaBCliexjcOOFQKg0TmGPfwdyu+0L27XPuRI4NcZS8ZjTj62dOB/lalzVBRNyVUg0oQY1K5iesZ/NR9bjw1tPjuXsFdlFH3/E1j6jX028+14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqRt6V+S; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e63c8678so2741333e87.0;
        Fri, 25 Oct 2024 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729899411; x=1730504211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sonXZqQPpkluHOHAfTU27yt9d8MezlEJ1IInPVvVSs=;
        b=jqRt6V+SzPTiHUo3uXC+mW/HR8DoeohTVi9XNVrsqXi3Qn1bnMoA1aqxIAKVi4s9a8
         AcryHZrQG3QQ2+iWAYTjUqldYTiUP+Z+LC4msjA6ZvHW9fltjpTPMXgA/6wwL1SITYic
         kBpzYGZ1/IRvFAYz3RJD6D5uG/D2TD6kMynsk4ofJvGSJb7dLw5L/4oqZQ7o5izvJtRw
         jn/Eh1izsKyu2DAzifoXvWAdwadziTygbDc6O6qjgezj/OTWI/OtWtV/5Nl/+Os6Fmen
         fxI+sV+CJ89Ae1Eo28YF770yQA+uqrOIJaAZyh0Id2H+3JntLNa+WhClf2GgJl57DqsG
         m+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729899411; x=1730504211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sonXZqQPpkluHOHAfTU27yt9d8MezlEJ1IInPVvVSs=;
        b=d95UWaw+/06gXs5rOnpspqlfHZO+j/MjCmzjtRYxoJf3S4z0amQzHQy03wRQBWtwNY
         axorH6JeUPQBChNMG4yezwSFT7VCPwUlcvpuGUXcNHQDgRxlzlTC0ZHDZsqKL0sKHTO3
         EdeKNW2QVhgt3kOKwXEmvOkc7e0rLWaaqmLG8WxTlX/2I5qWvBqNHJ729uNPGVyIH/lE
         UXpscMnl1zyzFrDsXkzp/C108cBVCpdAcj/o86dY9/QLmwZsxMdFVec5ofxvIrzAyDQg
         JJ/kF55yM6wUoGbq3/8udAUCMZDu6MwGqejl7OB+kGGwvgXuxWxIAbwz/pXtiHlD9gLv
         TSaw==
X-Forwarded-Encrypted: i=1; AJvYcCUdt5CFcSz9WDRiJS8n8Ro5lFf+lnrYBG5O6nNmj1oaZFiyTwudzOPxbT0uJAVVaK9EBVs2X80eI+XSBg==@vger.kernel.org, AJvYcCVkjjBQFyiGRcN/Mo3kinvzJ42BTia/pXTUY3eA7PGRFRZtjonfBic2bfaLpGbkHUFhg1Z3HFaIzJUaYEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLoth45DOGl7Hsgh0gpH9C34uDRUBLm4iiQa3jCv7WyFWc4Xm/
	EY9Uc+E8m/qeuaDBt0wGYt4kXbJlyOaB3RKaK+gkWKkd+9km0Mgra65Ux/0DACYbI9JPEV9CLrf
	A7Qba9X09JcdUVm2dNo39b+01MVY=
X-Google-Smtp-Source: AGHT+IFoVkurUIdmqu9xXNZo4jjLV3P0kCi/QWphDA4nIZpZd7wQ4MC7cQtGwcSQ106PimrY2VSlrAkZlKdWKufcles=
X-Received: by 2002:a05:6512:23a4:b0:539:e214:20e5 with SMTP id
 2adb3069b0e04-53b34c3fe07mr452676e87.59.1729899411030; Fri, 25 Oct 2024
 16:36:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022173921.6fdbdd38@canb.auug.org.au> <ZxtAWopjlF9unBno@kernel.org>
 <CALe3CaAehCC6WOpCAGtMX3qsTqMc8jh3kn1Fz_m7_7_M6SMgfQ@mail.gmail.com>
 <CALe3CaDW9vWcrukmWP+tj-ToSUh8p6==goL+B3aiGvxBDg79Ww@mail.gmail.com> <ZxtZ5q5HH-gu0zeQ@kernel.org>
In-Reply-To: <ZxtZ5q5HH-gu0zeQ@kernel.org>
From: Su Hua <suhua.tanke@gmail.com>
Date: Sat, 26 Oct 2024 07:36:13 +0800
Message-ID: <CALe3CaA9cc8fagJwA5ux6-U8mKTK=DEGU1Mb3LeCeKPrUGS5ig@mail.gmail.com>
Subject: Re: linux-next: boot failure after merge of the memblock tree
To: Mike Rapoport <rppt@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mike Rapoport <rppt@kernel.org> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=BA=94 16:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Oct 25, 2024 at 04:33:16PM +0800, Su Hua wrote:
> > Su Hua <suhua.tanke@gmail.com> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=E6=
=97=A5=E5=91=A8=E4=BA=94 16:19=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > Appreciate everyone.
> > >
> > > Mike Rapoport <rppt@kernel.org> =E4=BA=8E2024=E5=B9=B410=E6=9C=8825=
=E6=97=A5=E5=91=A8=E4=BA=94 14:57=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > Hi Stephen,
> > > >
> > > > On Tue, Oct 22, 2024 at 05:39:21PM +1100, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > After merging the memblock tree, today's linux-next build
> > > > > (powerpc_pseries_le_defconfig) failed my qemu boot test like this=
:
> > > > >
> > > > > Kernel panic - not syncing: Attempted to kill the idle task!
> > > > >
> > > > > Caused by commit
> > > > >
> > > > >   ad48825232a9 ("memblock: uniformly initialize all reserved page=
s to MIGRATE_MOVABLE")
> > > > >
> > > > > I bisected the failure to this commit and have reverted it for to=
day.
> > > >
> > > > Apparently set_pfnblock_flags_mask() is unhappy when called for
> > > > uninitialized struct page. With the patch below
> > > >
> > > > qemu-system-ppc64el -M pseries -cpu power10 -smp 16 -m 32G -vga non=
e -nographic -kernel $KERNEL
> > > >
> > > > boots up to mounting root filesystem.
> > > >
> > > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > > index 49dbd30e71ad..2395970314e7 100644
> > > > --- a/mm/mm_init.c
> > > > +++ b/mm/mm_init.c
> > > > @@ -723,10 +723,10 @@ static void __meminit init_reserved_page(unsi=
gned long pfn, int nid)
> > > >                         break;
> > > >         }
> > > >
> > > > +       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > > > +
> > > >         if (pageblock_aligned(pfn))
> > > >                 set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE=
_MOVABLE);
> > > > -
> > > > -       __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > >
> > > Indeed, when #ifdef NODE_NOT_IN_PAGE_FLAGS is defined, there is no
> > > problem, and this is why my
> > > test environment did not reveal any issues. However, when
> > > NODE_NOT_IN_PAGE_FLAGS is not defined,
> > > page_to_nid needs to use page->flags to get the node ID, which depend=
s
> > > on __init_single_page for initialization.
> >
> > Hi Mike
> > Could you please advise whether the fix for this issue should be
> > submitted by you or me
> > as a new patch, or should I submit a patch that adjusts the code
> > position, just like this:
>
> I've folded the update into your original commit, it's now in for-next
> branch of memblock tree

Okay, thank you.

> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 4ba5607aaf19..5a8114fb02ae 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -723,6 +723,9 @@ static void __meminit init_reserved_page(unsigned
> > long pfn, int nid)
> >                         break;
> >         }
> >         __init_single_page(pfn_to_page(pfn), pfn, zid, nid);
> > +
> > +       if (pageblock_aligned(pfn))
> > +               set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_MOV=
ABLE);
> >  }
> >  #else
> >
> > Sincerely yours,
> > Su
>
> --
> Sincerely yours,
> Mike.

