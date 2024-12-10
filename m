Return-Path: <linux-next+bounces-4930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F619EA61A
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 04:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1A85188B2B4
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 03:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC151419A9;
	Tue, 10 Dec 2024 02:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i0O3a8Ck"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DF1A2550
	for <linux-next@vger.kernel.org>; Tue, 10 Dec 2024 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733799598; cv=none; b=fAOoo6pl23sucpo8J9oU/38aaL8rLAUtYPjtQv2sAAS6X+xtfzlc3vb3jBwMr/xmez0c1B3Dr7olRCYoixxv6sn5JDdk+Jm+hHom8UIqQHvrospcFJay/fVvsibntwWPFkvaelDp0BJLNJ+E9Pr4c6OdFK8pAM5vCjm6CKvB1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733799598; c=relaxed/simple;
	bh=01Tx+4XzEZ+NTO2+o9iHtwlXrsiYXte+gysvc6H9Cjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nOw+P4GvX90eI+XMQnYGefB2oWepcq93Ar1f4zTaqO9v0MKMhsDNtUPIhkNKB+8YXHu71SJrttXa7H//zEez6/LxQ6+AVF7JAU5HEBipNrC5J8iv4JgHTccuYcKKMVP4b+b/xCzlRTt/JGBpZJWuiNLXEFHUb6Du9Dgjz6tWmlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i0O3a8Ck; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4674a47b7e4so63691cf.1
        for <linux-next@vger.kernel.org>; Mon, 09 Dec 2024 18:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733799596; x=1734404396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqtikDvWFJLEEUaQWd5b4CM9UaFy67luahhU5hmTSNg=;
        b=i0O3a8CkrwWNE1dFf9jaQbpmmCd1aLpAKfJBYHWiAUsCpNBI+qCVk7zCsLApXR8OoJ
         8S+eOdtRT6F8EIJQafnhvIHXJq2kxc4gGjdwPr/Rf4V9L8HdhfK+STsM04MxMszWfm1O
         F+M8oqrJo//b8BREs5HBE3GSneN5IUGsgfmRoaUVz6VLWS76wBtwb8V1iZLW8ej+pTJU
         hkfUFd7a7WxoRi/ezSOLk3DGp7ZixVg5BGpyIBHE5KQyd0ydDVJNCFEQAJ6ALnD8kwvB
         Yrkri1X6xWoV/Gd0e5GK0ruCv/hPhJO+wbuS8S54VYMfgoMLNREdRxvi2zKz+Or1WmTG
         aOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733799596; x=1734404396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqtikDvWFJLEEUaQWd5b4CM9UaFy67luahhU5hmTSNg=;
        b=tJbfIxoVIC8WAs6GUlfjylniRK+ELTdI4FaCViHetS3kgsQI4gpFfPXR40XbTadXVv
         B41hit/LcsZqSQqJQvlXlyScDWquW4z6uUbGXUloS/dDIIzr4KQGdU++Lg7Kd2rLmjT6
         uoekqx7ETidPCFiOffdmPW1fKtyIioEKpnRMr3QSVqD4I+blRHy7KsmyTQ4b6zMlaV8Z
         5t31x3fOr9D5bzM5PvrizlcNV0JVmM3rE/VIjha8OAJFlELu3WZu6/9pSiHLdF/bFXBY
         kc1HuaLZ0gaQcCStyh8M4fPbVJTI0RSZfzrmLTOCd/nrRqHRTu8ReMjOsrW0nGOkuzph
         7Y0g==
X-Forwarded-Encrypted: i=1; AJvYcCWZU6RQsxPQHan3mIs0gG3vB1CG03pOlY0ANZfJ+tC6fauXengDdI4Y3gaUQVr3hOA+diejlSZa2wpF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1EJoTEFGggfLGhPJM1FTLDt6hHPuWLYjKYF/itRqIqyOIv9O0
	HA2oPGNlLFw4/fVjj9YvlcvkTHjtBh6HcRigeJEwZTP5b5XQ/iu42Hk4jc6mVoiw+KihXr3S1xM
	/q1BMMH5ovcbPvv0R3Ozjbspb4tSX4u2fYf+8
X-Gm-Gg: ASbGncvb4s5h1y9GuWCG3RZjlh1JOv0hlXAkdPWlqgN0cGc6osN5y5xL3xl86kiAprn
	NMXu3KJ9BhV4SJWsEX8ygzwcc28PelwITY0I=
X-Google-Smtp-Source: AGHT+IEHE/+Pilo+iwwcHWSCM+Hn33u8h4+xxjiqwbHH0akU+zubulaaVV4fWsU6X3yv/eY6vzu7g5PFNTMEm7xTYHY=
X-Received: by 2002:a05:622a:229a:b0:465:18f3:79cc with SMTP id
 d75a77b69052e-46777643edbmr1230341cf.11.1733799595361; Mon, 09 Dec 2024
 18:59:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209170829.11311e70@canb.auug.org.au> <20241209182557.8794e5b886e4ca91994ed0d7@linux-foundation.org>
In-Reply-To: <20241209182557.8794e5b886e4ca91994ed0d7@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 9 Dec 2024 18:59:44 -0800
Message-ID: <CAJuCfpHXaSKab3xhFB-wmtw03EgotXgLjN4ynUZTjJmQ+xuaCw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 6:25=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 9 Dec 2024 17:08:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
>
> > Hi all,
> >
> > After merging the mm tree, today's linux-next build (powerpc allyesconf=
ig)
> > failed like this:
> >
> > In file included from mm/damon/vaddr.c:736:
> > mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_=
vmas':
> > mm/damon/tests/vaddr-kunit.h:92:1: error: the frame size of 3280 bytes =
is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
> >    92 | }
> >       | ^
> >
> > Presumably caused by commit
> >
> >   062111898568 ("mm: move per-vma lock into vm_area_struct")
> >
>
> How about this?

This looks like a good fix. Thanks!

>
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm/damon/tests/vaddr-kunit.h: reduce stack consumption
> Date: Mon Dec  9 06:20:01 PM PST 2024
>
> After "mm: move per-vma lock into vm_area_struct" we're hitting
>
> mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vm=
as':
> mm/damon/tests/vaddr-kunit.h:92:1: error: the frame size of 3280 bytes is=
 larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>
> Fix by moving all those vmas off the stack.
>
>
> Closes: https://lkml.kernel.org/r/20241209170829.11311e70@canb.auug.org.a=
u
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: SeongJae Park <sj@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>
>  mm/damon/tests/vaddr-kunit.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- a/mm/damon/tests/vaddr-kunit.h~mm-damon-tests-vaddr-kunith-reduce-sta=
ck-consumption
> +++ a/mm/damon/tests/vaddr-kunit.h
> @@ -68,7 +68,7 @@ static void damon_test_three_regions_in_
>         static struct mm_struct mm;
>         struct damon_addr_range regions[3] =3D {0};
>         /* 10-20-25, 200-210-220, 300-305, 307-330 */
> -       struct vm_area_struct vmas[] =3D {
> +       static const struct vm_area_struct vmas[] =3D {
>                 (struct vm_area_struct) {.vm_start =3D 10, .vm_end =3D 20=
},
>                 (struct vm_area_struct) {.vm_start =3D 20, .vm_end =3D 25=
},
>                 (struct vm_area_struct) {.vm_start =3D 200, .vm_end =3D 2=
10},
> _
>

