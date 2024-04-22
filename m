Return-Path: <linux-next+bounces-2001-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7EA8AD5C2
	for <lists+linux-next@lfdr.de>; Mon, 22 Apr 2024 22:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7698B20519
	for <lists+linux-next@lfdr.de>; Mon, 22 Apr 2024 20:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E03155724;
	Mon, 22 Apr 2024 20:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0+lxSkgM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCB1553AD
	for <linux-next@vger.kernel.org>; Mon, 22 Apr 2024 20:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713817162; cv=none; b=OQ1D1QeFeauo4TGHEBmPosdA4QYxipxoCjqrT9ucEZ+rplAe/YGnRoClA/UjQC+6EyazBaUnOKi0CTD4K/SxuR2z4rR3Sx5ZOfJErDauwyZc1bB86vwwyTwJFkQK7mhO2l1sXGnhgbQasctrkspW8ju2PHTffwwaEyuzmrseCK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713817162; c=relaxed/simple;
	bh=zNWuH8R4KlmVwCmfi87OiHprzOdNZb+4awWRJihIuP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3q4tpPRx/t76hWti3K2NBMvVUffwioJSQz8ZlXe0RhqDT5Llzbk+kfOr95WKq8NLOKt97j83t0qhYO4ADTPkodJCfee6PoN3nXRr2oQJVZizvYEGHxnV2obJkHG4K4NpknZ45IJoFofvORTB22h8h6qnEvCmK8LK0Yi/sPM46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0+lxSkgM; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so5304981276.0
        for <linux-next@vger.kernel.org>; Mon, 22 Apr 2024 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713817159; x=1714421959; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNWuH8R4KlmVwCmfi87OiHprzOdNZb+4awWRJihIuP4=;
        b=0+lxSkgMkJOJq5QAImEZFUkLEkkGASKEcH8LE3i83xosqnxMcvTL8gTY6mCpQNZTRD
         IOnWppuSF/o9P09RsF9DHlm66IIb6/5ZMid3rrysH09Ul6luBHiDle6uUpZSX1PVJ5js
         hr2NmcxeT8GY2748+lPy2ORReX+GEgIlFj55MKOzwn7byi4rXdK/EKorytIZzYP8WeqY
         X4fPP22upv1V+w/o+CD3LZcojDBd+UTl2JiCswRVwWpiw+2ye/UHtf1q4nITg730cLS3
         e1vXtQrAhDvenpeuMOZBH/TsplSzWSsfKomia7iyBDyMP2wrxrEb9xjNBbe3msIHh4ja
         h1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713817159; x=1714421959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNWuH8R4KlmVwCmfi87OiHprzOdNZb+4awWRJihIuP4=;
        b=u1qYg9lzMXu5z3UzZ8XBTdazs4oN/SiPhA3jwoMy93h/2TFjGG4CWJOtQtwmv+JtfH
         z7CR3zQM42nyjkoYg8nyaeFHiNJfttDW/dg38D7L0wWHxIdwub87tE/wv37E30sqE6GB
         Ci6HumLIAV9YQIyNbJb3QC/9S8L3LuZ3Am4o7mRCOBczOD6WvljjvTQVEF7+ech9vxmr
         2ooE0qRWvoJPa/Bn62n7jZQ6YADj5c/wtoha6QTIwdyaDzzd/5OhJbZmxzjXMzzDX4bQ
         xtnNEWTdID4VvbAXHMiTBzpv3uE5MTU2HrFpX98YghKAiuMJ8E9MArwwtqmeG17l/r5Y
         XW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZXsOLNfhZiLifOvIQa26sunttK4h+uBGLDJMX3gQwKeX3gQg8Th7oNc+AvRWKM/BYukN901yoaFp8ZRCF3278NfVgocb4/fGaBA==
X-Gm-Message-State: AOJu0YwXhYVS8x9xS4Y05NaKigsHAMXydigu3LF8/K/nCTQkRLztIZ1u
	aAh7rrrSVDAzn/TKRg8JHSNtNfp7w1GPcGf6ZUEsoXf2W5cMwKv2qFr0mMFOau/P144d7F3NTZE
	l21alqC45G5EQbAYIhxaNdcgI/OCkShAM2PN2
X-Google-Smtp-Source: AGHT+IFDf/KV08uUrm9iSVoHnb88dMjYX5diuW8U2bZNhzrCeCsD/JyIMFVC8xCr1jkbtwis9euVnDQlC8QaQtgXjxA=
X-Received: by 2002:a25:8691:0:b0:de4:5c34:b8d6 with SMTP id
 z17-20020a258691000000b00de45c34b8d6mr719194ybk.8.1713817158654; Mon, 22 Apr
 2024 13:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326073750.726636-1-surenb@google.com> <95819052.15033.1713816660761.JavaMail.zimbra@nod.at>
In-Reply-To: <95819052.15033.1713816660761.JavaMail.zimbra@nod.at>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 22 Apr 2024 13:19:05 -0700
Message-ID: <CAJuCfpHnM6L-7s8cd90XKiawhw9LZaRfMfeDm54OshLQdV5YmA@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/um: fix forward declaration for vmalloc
To: Richard Weinberger <richard@nod.at>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	kent overstreet <kent.overstreet@linux.dev>, SeongJae Park <sj@kernel.org>, 
	anton ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-mm <linux-mm@kvack.org>, linux-um <linux-um@lists.infradead.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 1:11=E2=80=AFPM Richard Weinberger <richard@nod.at>=
 wrote:
>
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "Suren Baghdasaryan" <surenb@google.com>
> > Betreff: [PATCH 1/1] arch/um: fix forward declaration for vmalloc
>
> > Patch [1] replaced vmalloc() function with a new definition but it did
> > not adjust the forward declaration used in UML architecture. Change it
> > to act as before.
> > Note that this prevents the vmalloc() allocations in __wrap_malloc()
> > from being accounted. If accounting here is critical, we will have
> > to remove this forward declaration and include vmalloc.h, however
> > that would pull in more dependencies and would require introducing more
> > architecture-specific headers, like asm/bug.h, asm/rwonce.h, etc.
> > This is likely the reason why this forward declaration was introduced
> > in the first place.
> >
> > [1] https://lore.kernel.org/all/20240321163705.3067592-31-surenb@google=
.com/
> >
> > Fixes: 576477564ede ("mm: vmalloc: enable memory allocation profiling")
>
> This commit id is not in Linus tree.
> Do I miss something?

It's in mm-unstable under dc26c7e79daf2fc11169b23c150862f0e878ee5a. I
think it just didn't reach Linus' tree yet.

>
> Thanks,
> //richard

