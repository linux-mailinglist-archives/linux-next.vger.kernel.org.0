Return-Path: <linux-next+bounces-3842-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B46F97894B
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 22:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A53F5B21B67
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 20:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBBF14F9ED;
	Fri, 13 Sep 2024 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="03l3JB0o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C831465BB
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726257948; cv=none; b=JtrPVeTdeOamvBJUgYbMQXafiGRcBbF2tfokzb6xwflhpIuzmmr9+L9OsCqGhHN9qFzVBDlSqnNvlQum5H4Qk9qx5Zk7l7thlLoIEBoNgTt56Dy07FIVTH6PaNkAzP9qLAAsqB9zm1uCPd9dURAgamQ9yA/tTGzcPy7LgyuHLVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726257948; c=relaxed/simple;
	bh=JasvM0cGQ6Kp6s1RW9fXNSm51k0TxuA8UQb6JqCiRFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLibEcgXLH0XNUgitm5TVbCQumWlUpGn+svSMIF4iRXC26HBiiqkwgBLjldiRFbCUhsWAiSomR32BKcpCdwZhgIgSaid5wvIQmYQUnmhyQOQIKMEFQymV/LgfgqNQqoVrVKxqkvOdnRol5VrkBzf7GS7xyMNjXXgZ5bYlz6UgTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=03l3JB0o; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4582fa01090so63751cf.0
        for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726257945; x=1726862745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=428AI888COZr85p2dtQB4DhBQ69x1Du1oaYIZ9Pz7II=;
        b=03l3JB0oHV2Hzye+RjF0fXtSXBf8IdJKdJpZEGnUWf765simsQiTi79LODJOhCO41f
         k4AU+BVfkSgbft9guX75yRJ6kRfXrewdiAYsZzPiC3JjXtHP6z4+LUuCcstFCCFsicIZ
         k27rF8uiuEU8rFr5gCNKITx/XY0eIw0nIj02hbY+cvY4ySBvGVjnIbiV3WarSxaPiqEd
         n3WfMe/hAIAxFyIF23cT4cqxxId+MH/LhaHCAMraH0skq84ySZ9Ex3xO8+8Ba1Z7byM2
         N5tllqqSNqBu75Za+IkBl9Ndpe2GfKqt2yO0sxaojazkPuTspH3al+YVfg09Gcl9t3lw
         FXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726257945; x=1726862745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=428AI888COZr85p2dtQB4DhBQ69x1Du1oaYIZ9Pz7II=;
        b=Eem5OEkilOJMuTlAg7oOrgh2jq7dmElNvq/Teka1uvju77aDhC1WesV7pbd9+IzKX/
         4xdQGpL/Fgh1BeNR7Xww5Do8p03i8+lkGnbn3kW80QTg1m67T3UrU7z14XCKTvZcBh9m
         Q6NL5e7xWl+iLcnmBdyfnbBk1+bo5RTNOpZm+78z0aDKZjhngxgilPpoiwiIv9ygKXGr
         J/+4G3jj1zRnulwlEXKSgu1ILnA+zhth3mqEbFqjWhjtfwYyF6KIdUVgBRiD5tGh80vd
         UIEnGSS+z3WV4Jzis66hPpjf6yqP/XiXlOC0mnpdQlUQHN5LzQHdr8ZT/fSPeodnZKYI
         TmAA==
X-Forwarded-Encrypted: i=1; AJvYcCVeXJbLmFSFb2RQ+0kY8hmpMhY4IKhTLBFMISBrgrltbfNf7u9WEeMOtwNwkJuxB8XX2uV3YtEB6dBv@vger.kernel.org
X-Gm-Message-State: AOJu0YxXaPFPV99MnAHjmNYuXs7Dvmwv6UkYK2LXOL+OesmGOJ9D+mTk
	D6w/Y8wgazdb6r2FV7bb6X+IqRmSVSb6L5To++iU2c3cm0mkXL9SvlDzw0YdVZRfsBHP8MqjnVy
	IrL1Mgjv+70FMZ1wrEcv7B3mgnnaxzipXcivG
X-Google-Smtp-Source: AGHT+IF5n1mXupbErXFG4ufgiVBKgZXbeEDAnZXN3Paf7T9SpKrEw2qr89Hq947jCuTgHivZFmuNQ00T2DIMXKQJkVo=
X-Received: by 2002:a05:622a:34a:b0:456:7ef1:929d with SMTP id
 d75a77b69052e-4586079cda4mr8791071cf.12.1726257944603; Fri, 13 Sep 2024
 13:05:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913125302.0a06b4c7@canb.auug.org.au> <20240912200543.2d5ff757@kernel.org>
 <20240913204138.7cdb762c@canb.auug.org.au> <20240913083426.30aff7f4@kernel.org>
 <20240913084938.71ade4d5@kernel.org> <913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
 <CAHS8izPf29T51QB4u46NJRc=C77vVDbR1nXekJ5-ysJJg8fK8g@mail.gmail.com> <20240913113619.4bf2bf16@kernel.org>
In-Reply-To: <20240913113619.4bf2bf16@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 13:05:32 -0700
Message-ID: <CAHS8izNSjZ9z2JfODbpo-ULgOcz1dGe5xe7_LKU-8LzJN_z-iw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To: Jakub Kicinski <kuba@kernel.org>, Matthew Wilcox <willy@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, christophe.leroy2@cs-soprasteria.com, 
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Networking <netdev@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 11:36=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Fri, 13 Sep 2024 09:27:17 -0700 Mina Almasry wrote:
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 5769fe6e4950..ea4005d2d1a9 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const
> > struct page *page)
> >  {
> >         unsigned long head =3D READ_ONCE(page->compound_head);
> >
> > -       if (unlikely(head & 1))
> > -               return head - 1;
> > +       if (unlikely(head & 1UL))
> > +               return head & ~1UL;
> >         return (unsigned long)page_fixed_fake_head(page);
> >  }
> >
> > Other than that I think this is a correct fix. Jakub, what to do here.
> > Do I send this fix to the mm tree or to net-next?
>
> Yes, please, send this out and CC all the relevant people.
> We can decide which tree it will go into once its reviewed.
>
> Stephen, would you be willing to slap this on top of linux-next for now?
> I can't think of a better bandaid we could put in net-next,
> and it'd be sad to revert a major feature because of a compiler bug(?)

Change, got NAKed:
https://lore.kernel.org/netdev/ZuSQ9BT9Vg7O2kXv@casper.infradead.org/

But AFAICT we don't really need to do this inside of mm, affecting
things like compound_head. This equivalent change also makes the build
pass. Does this look good?

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 8a6e20be4b9d..58f2120cd392 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -100,7 +100,15 @@ static inline netmem_ref net_iov_to_netmem(struct
net_iov *niov)

 static inline netmem_ref page_to_netmem(struct page *page)
 {
-       return (__force netmem_ref)page;
+       /* page* exported from the mm stack would not have the LSB set, but=
 the
+        * GCC 14 powerpc compiler will optimize reads into this pointer in=
to
+        * unaligned reads as it sees address arthemetic in _compound_head(=
).
+        *
+        * Explicitly clear the LSB until what looks like a GCC compiler is=
sue
+        * is resolved.
+        */
+       DEBUG_NET_WARN_ON_ONCE((unsigned long)page & 1UL);
+       return (__force netmem_ref)page & ~1UL;
 }

--
Thanks,
Mina

