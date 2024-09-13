Return-Path: <linux-next+bounces-3852-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28484978BDB
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 01:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8ACA1F26F64
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 23:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6584D17C9B2;
	Fri, 13 Sep 2024 23:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bJEuCsu7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE43178362
	for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 23:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726269975; cv=none; b=PxsaQsMIwzGODhFcq4/1VVivRfkh6h8JhEhx9osMJHeh81Y5VIYoi5Pa5a3lEqpxq3VUJqZKc980Z2gcrKY+d5iixKq+g/ri9a0joMg94ujw14FwJ0Y0vaH8F2r9HcCmuJX1MVJYiolJN/vMKYstcrNYvlzp6CQBPvs71Qe118o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726269975; c=relaxed/simple;
	bh=I5v3zvIhw3Z7idiG6BhkJY6AUPG52vciqLx7B4qZ+cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kbr4NIpkhNbfV7FmNSodYrwEbXHGHOrjD0d12AzXnqvBiYDpbenj1/1TKiAggjx1MunT6A5dVY3EL1J+kFak/9IcFBOnouUcbjeiYRLjI7b/Q6PcETnpKVKKnrAdZc3UO4I/dVvneUqsUQVKCgUNAQBFYvv99xOvhqR8sJH9RwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bJEuCsu7; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4582a5b495cso48941cf.1
        for <linux-next@vger.kernel.org>; Fri, 13 Sep 2024 16:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726269973; x=1726874773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/zSGPiOArXOzzX0HwJWO9XDkJRj9M2wk/pUWi0k/Ks=;
        b=bJEuCsu7agNo+NU8wfKlF/xKZ/GGeUGJJEFFGvsa8H2mSTXs6zhNw8FapZo+JTbyEb
         ly0cCQ2wdC0+BkR6LitfkibKWlGoo+wnAs9KYPIt42CfClJDmMstHc6FW84agEDUJqh8
         8BDm5edjRTibZpWDMptktb1ANfyrNIUd3BfK31wxszaZGvgOjiw90cz9n8iOptr57gQG
         jBAZfINbNqanv/HKAG3tVtLqM91xfuLMG/HX6CFHxoB0q+NXxrJ5LUGEjaF5J5I3hgMP
         in8aXOWlL1ugOtC3C/z3GIAOei4BZh6ALoFC3qCyHKrQ3aVmQ08Xi2fMOi2GPE3Nibml
         2vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726269973; x=1726874773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/zSGPiOArXOzzX0HwJWO9XDkJRj9M2wk/pUWi0k/Ks=;
        b=wmjJLxd6dYIedqXb1vwBws3x+EUgDg6ngfFShig1+X4Qb+YJcms7PiFSxuqQsfCMU1
         GNpsa9dF35Zb465ei4QS4K79nZzxGBmeNyxRuettt0hsg/e+VA7suLpzfgdKDK+4mzP+
         19k0v5kQ8nGga9J9wqDr5xIvfW125niRMjMjWqjzLKHyfttztgGW25oa8Jzupav4ks/V
         wPQIH6NMW2l4h0H23GStFDUBavACpcKcN0TzHwc8THwYLg8HX2/ICYumX9SIU94nTM4z
         OOvpOYMwSYpqQXqqcOPpeGw9JHmWC4SkPspRLC4oRpXCp3UmJhqa8aiqbtCxaCE4tlMB
         2pNw==
X-Forwarded-Encrypted: i=1; AJvYcCUDQignWG9LIf+NOIt4WBIInwjweDi4WT2EcWO1Ru7j0RswmZW+fuLeeIhG6IjzQ5COzn2O4BcgGl7N@vger.kernel.org
X-Gm-Message-State: AOJu0YwQOJgXuz4x+CAgdlNrUKjmksDyLKAsw5huWlHpa6ihi6g4ShZa
	ZrwunuFqtBo1d9HlhByXnreteF5pHSMmNcrRmb0vFnFqADqp2IK0DW6RCxZXJMPfJVN1NSpz1ve
	MvEB1F03UNbuaIDtHyAd3k8Zhk027qcndeI8f
X-Google-Smtp-Source: AGHT+IEXO5gvdbs+il7CDpTLc6xhdGle0XlSKxYKCooQsafNwkd1uFCAY64vKMmqs8XWP2QDEPY442O3slWn7LVJZhU=
X-Received: by 2002:ac8:5a89:0:b0:456:7513:44ba with SMTP id
 d75a77b69052e-45860789e90mr8634561cf.4.1726269972348; Fri, 13 Sep 2024
 16:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0x5ZRCGyzvTBg@mini-arch> <ZuS1u8G6M9ch2tLC@casper.infradead.org> <ZuS8Zp_iiMfi0PX9@mini-arch>
In-Reply-To: <ZuS8Zp_iiMfi0PX9@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 16:26:00 -0700
Message-ID: <CAHS8izMV48MeqcFB3QS_TkHNLWkQb1CjFrMk+XSS4dVqO66t2w@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 3:27=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 09/13, Matthew Wilcox wrote:
> > On Fri, Sep 13, 2024 at 02:55:19PM -0700, Stanislav Fomichev wrote:
> > > On 09/13, Mina Almasry wrote:
> > > > Building net-next with powerpc with GCC 14 compiler results in this
> > > > build error:
> > > >
> > > > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > > > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (3=
9 is
> > > > not a multiple of 4)
> > > > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > > > net/core/page_pool.o] Error 1
> > >
> > > Are we sure this is the only place where we can hit by this?
> >
> > It's a compilation error, so yes, we're sure.
>
> We also have netmem_compound_head() which does page_to_netmem(compound_he=
ad()).
> Wondering whether we'll eventually hit a similar issue over there.

A bit of a head scratcher why the compiler isn't running into the same
issue for netmem_compound_head.

The callsites of netmem_compound_head are in net/core/skbuff.c, in
skb_pp_frag_ref & napi_pp_put_page. Looking at the assembly generated,
looks like somehow the compiler completely optimized out the call in
napi_pp_put_page, and the call in skb_pp_frag_ref morphs into:

 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        addis 9,2,.LC63@toc@ha   # tmp158,,
        ld 10,.LC63@toc@l(9)     #, tmp140
 # ./arch/powerpc/include/asm/page.h:230:       return __pa(kaddr) >>
PAGE_SHIFT;
        rldicl 9,31,48,20        #, _17, head,
 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        sldi 9,9,6       #, _18, _17
 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        ld 3,0(10)       # vmemmap, vmemmap
 # net/core/skbuff.c:1047:      return
napi_pp_put_page(page_to_netmem(virt_to_page(data)));
        add 3,3,9        #, vmemmap, _18

Since it's page_to_netmem(virt_to_page(data)) (not virt_to_head_page),
the we don't hit there right now. It's certainly possible to trigger
this in the future.

I think we could also READ_ONCE in netmem_compound_head for some
future proofness.

--
Thanks,
Mina

