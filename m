Return-Path: <linux-next+bounces-2502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B869A902217
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 14:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D5611F22EC3
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 12:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C01C8172D;
	Mon, 10 Jun 2024 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2j35B2c"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35BA80BFC
	for <linux-next@vger.kernel.org>; Mon, 10 Jun 2024 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718024027; cv=none; b=pD31BaSG2BfBJLLTu1VSPCzztcyRys21NLyc2OgDisZUZVSTsCv0z1b7MvAxHTOWJWK5d+710e6tsI7cvI38FB3ks6nQ3Cg3WDAP7CbhsYzc6BDAyQFgEBRB6U8voK79TleUKtBEku6KN0rLhoZvNrWOerT17CNQkVlHiglHXb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718024027; c=relaxed/simple;
	bh=fiE6O7g5B0mqvOxiDGcraG8ZdbHLcDWJ8WOI/cTR7h4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhNK3aNXhe09LRujKkYjT+5nBB/GDhLycO7LQKr8GqUxbrhwdrbA3+jgst5ZcFv1Esj6ykrGUJgBfVDlmkZ/b7ergbEj6IBF/emCFKXvhVeKHYFyk+aJlRN2HJc4hRYA1zoLNZQn9ux04uLbqKRHpxwjqnw2y1cRuSoIXLvRJ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2j35B2c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718024023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzBsxMH3vmY2btBaXMxYVJZfosKLoYMTI9Rfski6Xyo=;
	b=U2j35B2cqmcKhcFfYA9980f/ClxpLgaJzme3e1ULQ94FT2Q74oBDn3r5IdLyRB4b423M2f
	LfUHLcHRyZHwnc4l6UDZqnBxktEl22FkxyIfzHHNNTJKSTEM7wR9KCll0T0iyJt/U4xW6s
	YRbj4Pte1Hlp1yNxo5KeI1cMahRBydI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-BW7OIvEPPtecwlL02-QncQ-1; Mon, 10 Jun 2024 08:53:41 -0400
X-MC-Unique: BW7OIvEPPtecwlL02-QncQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1f66f2e4cc7so54017205ad.3
        for <linux-next@vger.kernel.org>; Mon, 10 Jun 2024 05:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718024020; x=1718628820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzBsxMH3vmY2btBaXMxYVJZfosKLoYMTI9Rfski6Xyo=;
        b=GY0J7EmLRoBVWl/z0LLeSz4B0aaftm8hdGZ40TvG+Y7T8Jz7kcGj+bypiZOSTEksqY
         aQEbvGgpqJSRIfKLSNf7hqa7t+9ipAADUM+kAq1MOhVc9BOySRQo1335vBkYM3AOssb4
         EhQFgaLusxuqAzBqFYt0yRxFoT6pmvnG0evXbNTEipAZUTalOUNItQCUvUyEa03Pkupz
         x8DLtnJE71GsGd/rvF5/28+iL4uUuNTHZngAQEXndjAM/xJZPEcQjwEqlF+YWpXZ5eAh
         sYt/I5S44RIb9NWTKW2mPEbW+6C6I7KJP0TBMyfCPqj3teTdBPVj2XOmXGhb/2mMCgLU
         2qHA==
X-Forwarded-Encrypted: i=1; AJvYcCWiniQHmX7yeL2U+1UcnJE15R2JLv1e5IHIllEHSXo3nGAZmx8lecWNXNs5MF9v7aSSrB8yBj+1smJXPLcJFZaYdw+PWpNZbIq70A==
X-Gm-Message-State: AOJu0Yw/PYK7UjvmGTSBVB+0Glz438oX63Dco2jGKjCEjv7x+kdorckh
	TEsSaqkGZbhX2Pj5PUY5+MGxv87XehEvoGsvhxy7biM0/Z4R+sE0qao84BIRnwClHlE9hnWY5KJ
	9/XhMBLDGzTWTy++s5iei4OSBkeGvr9mIBX0du+qupt/eG7Pb3CL31qyM7fTogjRIDDYC8yl+Je
	TNI6ZBmNBjosVjhx2aQkNyuBkKY+m4+XxRJw==
X-Received: by 2002:a17:903:24e:b0:1f4:698b:7a0b with SMTP id d9443c01a7336-1f6d02bebdfmr123282955ad.8.1718024020635;
        Mon, 10 Jun 2024 05:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe11afcKYP+MpOmGt2jmNnuEKLbqhWPhN+LU/MpXpmTJFkfDh6wbalNYSe8t/iINN3b9pOwNbP8rcuaYBuN2I=
X-Received: by 2002:a17:903:24e:b0:1f4:698b:7a0b with SMTP id
 d9443c01a7336-1f6d02bebdfmr123282825ad.8.1718024020314; Mon, 10 Jun 2024
 05:53:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240529142455.1c68e65a@canb.auug.org.au> <CAHc6FU7MrnksU9vDvdAvc_tv5knukGpnxXEpqidvdfWqDf1p5Q@mail.gmail.com>
 <20240531100032.4a112093@canb.auug.org.au>
In-Reply-To: <20240531100032.4a112093@canb.auug.org.au>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 10 Jun 2024 14:53:28 +0200
Message-ID: <CAHc6FU66Tsg1WZcUwK641rJ-KytbBSkegzrXWFgsEuuhe+PDhQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the gfs2 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Whitehouse <swhiteho@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 2:00=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
> Hi Andreas,
>
> On Wed, 29 May 2024 15:40:13 +0200 Andreas Gruenbacher <agruenba@redhat.c=
om> wrote:
> >
> > Could you please remove Bob Peterson <rpeterso@redhat.com> from the
> > recipients of these notifications as that address no longer exists?
>
> Done.  Who should actually be the contacts for this tree, I currently
> have only Steven Whitehouse listed.

Could you please add me, as I'm the maintainer. Steven almost isn't
active in the development of gfs2 at all anymore, but still very much
on the management side, so it probably makes sense to keep him in the
list as well.

Thanks,
Andreas


