Return-Path: <linux-next+bounces-2046-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239EA8B145F
	for <lists+linux-next@lfdr.de>; Wed, 24 Apr 2024 22:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 556731C2194B
	for <lists+linux-next@lfdr.de>; Wed, 24 Apr 2024 20:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A902B13C9DE;
	Wed, 24 Apr 2024 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KCPCJb0F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1113813C9CF
	for <linux-next@vger.kernel.org>; Wed, 24 Apr 2024 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989862; cv=none; b=MvF5C9OXy/J3PVcQuWqITJ6oQD1Akc4fm6gbP7xLGEkHdh2nJAH32ZNHZ6KLlizMpRPJR9OHb9zMKhJZ/cPWWovkH7u4EyY42zR0i+ABhGAp8WSg2d+eE5g3iHyKdFXD9JTuSaSzJPYQbUpJe4a+liZ5QTwRGbfHnNAg5CfD360=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989862; c=relaxed/simple;
	bh=dEAeAjfbrXV9SIKake0QsuRWgkE1lxy9CxwcMeketdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bm8UTWm3xselKExiVODs0xKRSW8UuqKYRIYxzAGI6+6dgBp79KZP8lvScTuK2V6GZlJFpipdQ0Xtw3MnXBe6kkckOGeFfuXOqq23Em7f3PYfb2YrICl3CW4EG3KI09vo+/M7jaZxcguYGX0FX5gqAsgBJamlLZrnFrc0DRsxN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KCPCJb0F; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-345b857d7adso161003f8f.1
        for <linux-next@vger.kernel.org>; Wed, 24 Apr 2024 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713989859; x=1714594659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1TRoahzIOImSP+56mBR9DLoPEbZMF1GvJHHVC9qChk=;
        b=KCPCJb0FTVydEbVleTasU8bfTpswOMtgP+EED+8r5qDt6SlvMi2FOIHG0Y3epAhU3a
         HcHR0FI6oUsgi78f2Op0NHX0WpLvLxhcMVIbI3QUdINjkh6x6n7YPdlnbb4gOw10T15D
         Y7hufXHmmNdMkHsHCzEXwMYdwfOvcPsIWWSGG7wUkQENGg764+lqH8f1OnRY+ENiKiXU
         TS8D7besDI8ilDhgRoC5wuTIdctao3v8rAZfnQANJGTwbxX3Y5JquqXYa8EUoNFZSLM4
         n6cc5CniD85qHRZwF6gwGwVCqqn6pYFYKRR1a4n13QmE0a1kirDQth6ZnAzvHXvM5sGp
         gyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989859; x=1714594659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1TRoahzIOImSP+56mBR9DLoPEbZMF1GvJHHVC9qChk=;
        b=WMYAr8tgPKnrrDN66/t3SadVBCxQuUoQs9EOw7S19jCH6/0R7nuhzXfd3gVK8QC6Ce
         sNKdsstKLVpnnuXuZLlfOx/bF2+hI2qmy6Hc0Mk7wlwvhZ3ix0B66SS3nAPGJcXonyiL
         bdTnBYRTDESYV4oAmiYUDiVIiK2Y/m8T/Vi4o/A3pIRXThJjPjMXdH54rGYA912aftDk
         kDTrAAL2bg/PjzKhWWKN3cVaVEmqNMRnSAAwfodhSGQy3CxC5zGpzfLTOw0A4HdzVcxc
         B9GJ1vbPERn3V8MkyqRoaKqPiG5iKTKe5T2xwt9BbsFZ1VvhCrpjrLeIuiyKyzRwN/iE
         zhpA==
X-Forwarded-Encrypted: i=1; AJvYcCWVPY41W0d7TOQ+66XHLpr6zZ8Ahkdly8IMD1JX5dddh8FBbpCjFTeWgxEhaICqaD6QWq8QLnnUvy/bh3reLjCLvQi2J/w4g44XmA==
X-Gm-Message-State: AOJu0YyhXIzsnonspinZERC9kGkoN+pt2NG4+yS7xbl6aIIgZmfvuG/C
	2Lka5oo1bMnzW1cirfbtEnWTQGovNE+Xi2xfTbDJ6yQPLi562+Pz9C89o+lM+Xl3YjGnBD86HPW
	i8xsCloFcskAQeDR+NyMmKtiyR0x2J1Dsyt68
X-Google-Smtp-Source: AGHT+IH9KfoH5xHOI8C9QM4ZJsQC3Y4H/TsPfsML0YoIhKpp/pUvcWcY6by5H/VlgrjXETeZjqkiWKcoDndPOoSvIcY=
X-Received: by 2002:adf:fd05:0:b0:347:70ce:acbe with SMTP id
 e5-20020adffd05000000b0034770ceacbemr2582811wrr.67.1713989859203; Wed, 24 Apr
 2024 13:17:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424123935.2f65e886@canb.auug.org.au> <20240424130757.531be2842c505a62246d180c@linux-foundation.org>
In-Reply-To: <20240424130757.531be2842c505a62246d180c@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Apr 2024 20:17:27 +0000
Message-ID: <CAJuCfpG-D+m4Uym=9LA5O5hYd=Y6fwVxELb17Dhmfkg87Rzr5w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the modules tree with the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 8:08=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 24 Apr 2024 12:39:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
>
> > Hi all,
> >
> > Today's linux-next merge of the modules tree got a conflict in:
> >
> >   kernel/module/main.c
> >
> > between commits:
> >
> >   7f014cdda4cb ("lib: code tagging module support")
> >   5ab9b0c7ea5c ("lib: prevent module unloading if memory is not freed")
> >
> > from the mm-unstable branch of the mm tree and commits:
> >
> >   0746f9982603 ("module: make module_memory_{alloc,free} more self-cont=
ained")
> >   18da532eefc8 ("mm/execmem, arch: convert remaining overrides of modul=
e_alloc to execmem")
> >
> > from the modules tree.
> >
> > I fixed it up (I think, see below) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
>
> That's a shame.  I don't see much that we can do to reduce the damage her=
e.
>
> Suren&Kent, please review (and preferably) test Stephen's handiwork in
> linux-next?

Sure, I'll try it out today afternoon. Thanks!

>

