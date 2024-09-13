Return-Path: <linux-next+bounces-3845-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58248978AB2
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 23:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDE60B20A67
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 21:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B8E1537DA;
	Fri, 13 Sep 2024 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wd2UICex"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457E137905
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 21:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263541; cv=none; b=Xy5+3afaK/3mnBcO4v92s2oP4Di+HRhM151gh3PB7kL8iJ26S8WKvHGwKm4EeCuFfmatPKpIMwzWEvVH0G76N1sP9Z0KBLMyCGCCsBDWhGJa14OFwR8roA8zXKHIA3yf5eQF6IMpeYZyhiS5JCyL3dUXHAQZonEMNKIj52UXZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263541; c=relaxed/simple;
	bh=t2CukQDmtmUqNG8HsheqIRsVphLV3VsQnCZdtsWYqvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTNoFlHLtCaRW+XLbUxM5UgEzWqYERRzz48Mr9qFoC2PZjSiP7lVhWPvcCuxZfYwzjK7tgKuaOWVCyK4m6upvUAHQY1Bpega+RPPfxIpKzS/71pSSQvawKizX8DvKLJBSj8R9rp4GYd0ALqFxPFsjCldvpsS1tTKgEhL6QIS+es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wd2UICex; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4582fa01090so84671cf.0
        for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726263539; x=1726868339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxOaF8AxUHaggzGBR0vXSvLLKExg7G9i5r3GTwRaXcM=;
        b=wd2UICexA5iHaZRBeG7t6s7GiGJZWSOulfSwEO9fyangJdAkG4eVHdpC/Hn48Jtgyf
         De5j/leTydJoc+6t2QD0C71s2elSLkjqLAcBIazKT/9+x2JZBjRB2OBCU+9uh3KQH+HS
         ch+NfzpMZ1poDWXmMhlxGdGEVKhDiVGzigsSL+SaYrjT/mE6lkqH8Wzr9DNaDLA0ZGdL
         ZWSns+qqv01xQefOeTebQRm8hN/5T1LOOmvWyRHr3/cYS54URCZX1igFqDRd3t0iVQkn
         fcd3rHNWkUPq3oaNXZqbcIpF9ds/QSNRwuvYPYjBgiFGHJFOJVRa42CMvZ/VDj+e96sS
         NGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263539; x=1726868339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxOaF8AxUHaggzGBR0vXSvLLKExg7G9i5r3GTwRaXcM=;
        b=YNedR0O00HijfAE9hHvQr1SPrcYgB3Zd02/WhfJT+PnOwh+0ouelYF9udg+rtBHdNu
         jqLeSbaqcMJX5K6Uo0B3pipJMPn9ioikQuMLMOo7usYFXhp/xZg5M8VUFW+dZeWjcQi+
         MFN7EtYrX9i+IqTu4EV9ZG+oRg3t9K9jP5cp0pZEZaTlEb4A44sQ6msYE0eH+o1wbd38
         WeHlBRWDAhpiyZWaZ6ER56IgfeLnYHsyN3rm7MNrgewl/ckhnRKE6L9P/8Jk2zzy8vHP
         7XHeY1bu5Z6DdBZRwNdbdx9ffFbBtocThHhvm711F/UlLZUH8fQNTA8XDogy5DLZoJWL
         PrVg==
X-Forwarded-Encrypted: i=1; AJvYcCUXw3e2lOqnrat7X3tJivlM+X1JdN32WTO1VRDFULOF7k508hg5E9r3OLsB2Tg0XkT/4RPN9ehN0vTR@vger.kernel.org
X-Gm-Message-State: AOJu0YxCx9XzuEQMI+4wD7ok9qCT4tNeW083jbOrw4j2dZBtkCMd+wWW
	JFNhVtiar8BKQ4Y9wWH+lVxMyW6MJgIBKNRN8iNooiJqs4IF1G6L4IbTsi3S4gf1582VpcIa+Y6
	En6UA2rddvMmj846NjeDgMhHp8uFKU0DOf+N6
X-Google-Smtp-Source: AGHT+IE7wQ6d82h+20+gfYgwUOrNdS6QR9EOku3ZBk+A8q3enqbGgESkjkfIrzysdu6Edkr34sHnqy06TDcBVoKfdsU=
X-Received: by 2002:ac8:7f41:0:b0:456:7501:7c4d with SMTP id
 d75a77b69052e-458644fcbebmr8520731cf.9.1726263538792; Fri, 13 Sep 2024
 14:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com>
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 14:38:45 -0700
Message-ID: <CAHS8izMfFPkXU5Wx7i7af2c2=nVzZ_GJnoj0YyLugKDr5uAyjQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 2:33=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> Building net-next with powerpc with GCC 14 compiler results in this
> build error:
>
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> net/core/page_pool.o] Error 1
>
> Root caused in this thread:
> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-so=
prasteria.com/
>
> We try to access offset 40 in the pointer returned by this function:
>
> static inline unsigned long _compound_head(const struct page *page)
> {
>         unsigned long head =3D READ_ONCE(page->compound_head);
>
>         if (unlikely(head & 1))
>                 return head - 1;
>         return (unsigned long)page_fixed_fake_head(page);
> }
>
> The GCC 14 (but not 11) compiler optimizes this by doing:
>
> ld page + 39
>
> Rather than:
>
> ld (page - 1) + 40
>
> And causing an unaligned load. Get around this by issuing a READ_ONCE as
> we convert the page to netmem.  That disables the compiler optimizing the
> load in this way.
>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Networking <netdev@vger.kernel.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
> Cc: Matthew Wilcox <willy@infradead.org>
>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>

Gah, right after I hit send I realized I missed the 24hr rule.
Although I'm unsure about the urgency of build fixes. Sorry about
that.

--=20
Thanks,
Mina

