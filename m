Return-Path: <linux-next+bounces-4813-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837C9D31A4
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 02:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8B801F23794
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2024 01:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B76F15AF6;
	Wed, 20 Nov 2024 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="psGrWpNN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D37EAF9
	for <linux-next@vger.kernel.org>; Wed, 20 Nov 2024 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065001; cv=none; b=rwASj65RsEpFwOPwNKh4GZSxNUvnkr85cU4lzMi1Pami1Ge96Kv4FrL39wDY/QdUgkAgqOwCQqf9EbCflNECT6zX02TQlXNyLMEVcRLIvBtngRfdy98A3ZLhw3T6l3YKZW2Gv9XTCPallADxjhpY5IILdsJO7v7CLNFa0J7R4GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065001; c=relaxed/simple;
	bh=hTwajJRAAvU6UJ4h6j5qhr1gH9r7IyhS/L6+4LgUJ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UE2PlK1AFzeMqL1DqyTfrEsSEbMeruRMufUf2BxbsX7dJdv/mp7NJ6RyJVXgHrWmw7VwQbW7Q9tyXsJe2Ifi10WQSIb90PgsD9v33m9KxX03tMRkeYA7Yy4VX3GZ3FpbzD38Bk04mmLsWePb3mpRBGuTSn4UiJel2cZD8unj41U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=psGrWpNN; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-460a8d1a9b7so464511cf.1
        for <linux-next@vger.kernel.org>; Tue, 19 Nov 2024 17:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732064998; x=1732669798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyD0n8XFP8f0istqBBknRrTZ6rAT8CN6zVNxOsts9j4=;
        b=psGrWpNNMHIn4c2oLFFckbtKqtUWx1UXJqQRpWFivUwVlW96+SfNI/UFrEtBt+s5yd
         5qPlR3Z4icOCLKelvbLiTj0GjE9BXIaiMuG/957MRC0Vu0f9hvlmqnI2NWOJRNEeyj0U
         c22agTgVrJo4h+dIpxJQpMElsX+bM9LTvI7Bv7ZuwjGKAzrC0Lfxfbjsl4pvuX5B1lv0
         asaKM3dowZNJC7sfLbECaWI4/oGIgJNBht5Hgwbf38YnsCFdrQsFicH6s/H9d1U/WCuP
         ruQtWLGl2SO6w5Q+0WFiiTZGJOQtp4sd74fqJhPMjKu85yRA7ZCNXZcLMQoJomerUrqd
         JIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732064998; x=1732669798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyD0n8XFP8f0istqBBknRrTZ6rAT8CN6zVNxOsts9j4=;
        b=nTtVjxuwwD8+WSvrMptj8RZPNbM4fHPyy/MOcLevCXnRGpc1HSNEyoIccHtdIEya+H
         dOeZwAvHw0Icm/MyGBcBy7lVv5y4Fn37oKVFuKa0282vnLz84tXoKs5VicHeVuQoob2T
         Ibx0eXYc0P06INENWGEzvT472VVBwdjHbDNsjPo2AP/k5CbsZht/mgFxkqXWa2b63mHE
         5SiZFZNP0mrxpjHkXGcicAVHBbmt1rMNIZ97OLJNHeMvYMLyIhaWfAmYDF88qp02bpyL
         lmwJHeI7091qLenig0u+PEVevNbF0FQU8FLkdPAYa3b03dMteAQEi/mLGd5nlMv0DVll
         j0lw==
X-Forwarded-Encrypted: i=1; AJvYcCVA/0TldQJIVbqkCvUSTCt/Qj5D3ukSh8mAbK7kCtQZY/JERZVbLYnFKzGCqiO8GZ0OKBfPFu3zgJK2@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkrO9oTtms7IqQ2NlMvYCxvjXbWJVzB+pUKELy33/0j22BJsL
	F6rPHpBTFn7hwguUyYWasWMEcRTw0xQnXhZdWZJP9st9yHYtE9idc9ofnJwbx7IOyQpBaVt03yF
	EFmaihp5llWA/ErESv57ZpnzrO6FDv1ywUuvB
X-Gm-Gg: ASbGncu+TZYpI8E+lr+ei6bvtcsyOF7NAWIuZK0nlYem630uCGvz7nkSUfzwv8n9/1V
	x/bEnSBcs8c1TTJnlKnNeC7wFAYYdidY=
X-Google-Smtp-Source: AGHT+IFsHmpVebwMXEK1glSVoxpXP+DG+iAfRE6TY3s0nAUoSLrP9HGvoiwMiUxbSdstOSlZRyQPTMfIc0RCUhStYcE=
X-Received: by 2002:a05:622a:3c6:b0:460:e7fa:cf2 with SMTP id
 d75a77b69052e-464d33fc13amr461681cf.23.1732064998036; Tue, 19 Nov 2024
 17:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028111058.4419a9ed@canb.auug.org.au> <20241120120124.03f09ac5@canb.auug.org.au>
In-Reply-To: <20241120120124.03f09ac5@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 19 Nov 2024 17:09:46 -0800
Message-ID: <CAJuCfpGNKzBadFix9WpN-PQMr2Mwj1NjawzSk8ycBST9USKpcA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 5:01=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Mon, 28 Oct 2024 11:10:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the arm64 tree got a conflict in:
> >
> >   include/linux/mm.h
> >
> > between commit:
> >
> >   e87ec503cf2e ("mm/codetag: uninline and move pgalloc_tag_copy and pga=
lloc_tag_split")
> >
> > from the mm-unstable branch of the mm tree and commit:
> >
> >   91e102e79740 ("prctl: arch-agnostic prctl for shadow stack")
> >
> > from the arm64 tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc include/linux/mm.h
> > index 086ba524d3ba,8852c39c7695..000000000000
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@@ -4166,4 -4174,65 +4178,8 @@@ static inline int do_mseal(unsigned lo=
n
> >   }
> >   #endif
> >
> >  -#ifdef CONFIG_MEM_ALLOC_PROFILING
> >  -static inline void pgalloc_tag_split(struct folio *folio, int old_ord=
er, int new_order)
> >  -{
> >  -    int i;
> >  -    struct alloc_tag *tag;
> >  -    unsigned int nr_pages =3D 1 << new_order;
> >  -
> >  -    if (!mem_alloc_profiling_enabled())
> >  -            return;
> >  -
> >  -    tag =3D pgalloc_tag_get(&folio->page);
> >  -    if (!tag)
> >  -            return;
> >  -
> >  -    for (i =3D nr_pages; i < (1 << old_order); i +=3D nr_pages) {
> >  -            union codetag_ref *ref =3D get_page_tag_ref(folio_page(fo=
lio, i));
> >  -
> >  -            if (ref) {
> >  -                    /* Set new reference to point to the original tag=
 */
> >  -                    alloc_tag_ref_set(ref, tag);
> >  -                    put_page_tag_ref(ref);
> >  -            }
> >  -    }
> >  -}
> >  -
> >  -static inline void pgalloc_tag_copy(struct folio *new, struct folio *=
old)
> >  -{
> >  -    struct alloc_tag *tag;
> >  -    union codetag_ref *ref;
> >  -
> >  -    tag =3D pgalloc_tag_get(&old->page);
> >  -    if (!tag)
> >  -            return;
> >  -
> >  -    ref =3D get_page_tag_ref(&new->page);
> >  -    if (!ref)
> >  -            return;
> >  -
> >  -    /* Clear the old ref to the original allocation tag. */
> >  -    clear_page_tag_ref(&old->page);
> >  -    /* Decrement the counters of the tag on get_new_folio. */
> >  -    alloc_tag_sub(ref, folio_nr_pages(new));
> >  -
> >  -    __alloc_tag_ref_set(ref, tag);
> >  -
> >  -    put_page_tag_ref(ref);
> >  -}
> >  -#else /* !CONFIG_MEM_ALLOC_PROFILING */
> >  -static inline void pgalloc_tag_split(struct folio *folio, int old_ord=
er, int new_order)
> >  -{
> >  -}
> >  -
> >  -static inline void pgalloc_tag_copy(struct folio *new, struct folio *=
old)
> >  -{
> >  -}
> >  -#endif /* CONFIG_MEM_ALLOC_PROFILING */
> >  -
> > + int arch_get_shadow_stack_status(struct task_struct *t, unsigned long=
 __user *status);
> > + int arch_set_shadow_stack_status(struct task_struct *t, unsigned long=
 status);
> > + int arch_lock_shadow_stack_status(struct task_struct *t, unsigned lon=
g status);
> > +
> >   #endif /* _LINUX_MM_H */
>
> This is now a conflict between the mm-stable tree and Linus' tree.

Let me try to manually apply it to Linus' ToT and will send a replacement p=
atch.

>
> --
> Cheers,
> Stephen Rothwell

