Return-Path: <linux-next+bounces-4499-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0086F9B3829
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 18:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326BB1C222D5
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 17:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29C11DF978;
	Mon, 28 Oct 2024 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NDkpDFuA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B761DF73A
	for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137644; cv=none; b=HQTeu7nzZmimK6z0U24Ua/379+uFXUmwRu6PwwZHs1vDrQIZqp4k3hxw2JQEgKpycV1Ej3WLEenkOUoMlXzzO9rM9CYmSY/HXD/YPd/5y7lyEJseofGP6HF4NMeEqvrLVwResEFovE4nk5iMwl3cDPm6gexhhzwCC8m131znBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137644; c=relaxed/simple;
	bh=8Qy6EuWTLTgSH3tWlX0nZXRod/AApE+LgaNdmjIEShQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZmyWqWwYckEvtd8/VjiA4qcp7PdivKrzq4eZklZ+cBRIXuqsgpuUfj/l9OCuRG7ttWpFHF1SrSOJQBBIGoI5MRSwzIoQWIciX414iIV4GjuiZYakgAEEAHTrQeUTJgC9qRedu2tovGZxbTi+YiaVZr4HHmmXPMyG8zPIoeqAUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NDkpDFuA; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-460b295b9eeso18661cf.1
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2024 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730137642; x=1730742442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+7dK2iz0Ox4cFPWjhTc/9howI3oK48ilygPaNEQYyw=;
        b=NDkpDFuA0k+RrFsRA6I2V3NpUfFFWxP/kSmRXDCTiuljbfs733WDe/eBOV5O7LvZKu
         KAEfyi8qbScp1Y7s10lQRkEKL+C7fCfqP9R6vujAPqsVwCohRwo2io+a0RRkKouohssg
         8rtxyg9n3/VVEQTV0KU8MwL3NzMlza6xFG9Ez6xbCm3XbHPYjX8ZXBmd3mMomBXHkVNE
         An6bT46PdSqX0asUR9XgmiseB8PVqFiOq/Y4VMBGgl0RJlm9qdyfmJF0FoAOk2ZQG9qc
         ahjhTG4Sg02PWOm/JoHD5ISLZXt1Rhx8bRaA182c5Y/NJASrvj/nBrQ3Y+tL52GTfYxc
         5S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137642; x=1730742442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+7dK2iz0Ox4cFPWjhTc/9howI3oK48ilygPaNEQYyw=;
        b=X+Exbx+yhZkurK5rkALZhYS1GSzSdCW5hSWmY01jjZpReGopf0fPT6oNTo6RgUIKWv
         GbwoMHcW1tPyJimcWOlnUi+a97z3P7rFlXR7nFDeGqfc0jFyfuXCLhZYvGCj+2oPSQqs
         ldk9Xx2Uq0iybIGJCNh7/z8sztQo8e8bJwnxUzZUbOLzyYSLOiFG1I52WGoKLVY2GH6J
         kqSOtkVr3md+gKEwIszIJ1QllA78FP9XlMB4UYeP+3GMp89Hcj6D6tgvTGHrVAdzAdGC
         VwrRF8LnGNo4K0nHDCDdzWWYpii1dqfYqFZvkXn7+qZk9S/0xuqR4tOel6s3FY+lP15t
         urGg==
X-Forwarded-Encrypted: i=1; AJvYcCWpvzCFuMHjguhdygPyTETZh3XR3LuSrLbrQXeTgLkiVaKR48mcAk7DV/Vba2oMac3+Ehey0T+5zJKS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd0ZAhgvjco3ZYciM65Leo6rqJjO3St3DnD7fGQ/3RCaeLAbyo
	+saHuYdlh0JvHn27lZvFV0PE+WJYgBrRAG6EoM3QubW2kAKn9uv4JvMJuwTjxadr9ji1OE38ccX
	hnEQsww4PlNvmW2h9iNm3ovbALUaY3bc7OYRouj4tTwmK+1bLoQ==
X-Google-Smtp-Source: AGHT+IE8tETBeKPLMVvNg2JWu8r64tzkmGjjmC7NS5axB2qpJvBAUNBCaEzlbdjqVjBxZlzg9Ypu5lxX+AfRWnl9pVs=
X-Received: by 2002:a05:622a:1a16:b0:461:5b0d:7aa5 with SMTP id
 d75a77b69052e-46164f01be9mr136031cf.16.1730137641651; Mon, 28 Oct 2024
 10:47:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028111058.4419a9ed@canb.auug.org.au> <Zx_JDg9e61KKan3H@arm.com>
In-Reply-To: <Zx_JDg9e61KKan3H@arm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 28 Oct 2024 10:47:08 -0700
Message-ID: <CAJuCfpFOf-Yd41Jz0=F6R=-ojRZ=Ey0mMQ0eW32OfVgcs9ojhg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 10:25=E2=80=AFAM Catalin Marinas
<catalin.marinas@arm.com> wrote:
>
> On Mon, Oct 28, 2024 at 11:10:58AM +1100, Stephen Rothwell wrote:
> > Hi all,
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
>
> This looks fine. Thanks.

Looks valid to me too. Thanks!

>
> --
> Catalin

