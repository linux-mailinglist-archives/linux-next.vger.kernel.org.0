Return-Path: <linux-next+bounces-1170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B878550F8
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 18:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4D7E1C2900D
	for <lists+linux-next@lfdr.de>; Wed, 14 Feb 2024 17:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA22812882A;
	Wed, 14 Feb 2024 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VQjLCYC/"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0556128370
	for <linux-next@vger.kernel.org>; Wed, 14 Feb 2024 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933444; cv=none; b=nNrnAh4ApMZfsHLssktOHmNsk6/FnqVtEH9FjCK0p4M9Yn6nhoaeM39Ih3gDQ4rKpwsO58sfNwFyzLLucyPwOufgKFkzifzYuuk3fpVFOww2l8a+qJgFzF2YuqThLwaH+5bDmNaKObGNGTJ6kMTlUth4zxEfs/aO6cwFqgZwa74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933444; c=relaxed/simple;
	bh=C/07i7uhraJ/iCdkIrk3+g0sJu4LRkL1MeEwKjt2QEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgZSbkDNeM5lRAOFP+Lue4rr5HCzcuvF77eoO/afaADPley9h6fBrnVZ1jlYqOBKo9GW0ihECEfYfRDRjSqcwTwrrbywthIXHuZmtZYusFfWwJwCilXvW9+SH0rUBCcdpsBUB1pbWlc2YAhez393UHJTej1PKfYoeIdhoEhgXf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VQjLCYC/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707933441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QeVoRP0IbpurjG7gS4VE/L43GNfNUTlOq+29WpW/Zzo=;
	b=VQjLCYC/vc6BDju3SoCp3vy3W7AHHh38iy4kAzCgP0Tyzi+/E4Ra5KjZ1xDgK4DRL0gz4v
	7Ek/mOlu/wyw2lj4TW1bDD+6cxEg688Pfak7mmU9tqNtvOmur9hlNLMVPx7odSr4g5wO1P
	+3joeTXAVXfsLfXqYU3Yukuiz+lCr/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-_FqYJNzxP3iqxzNw-5dL_w-1; Wed, 14 Feb 2024 12:57:18 -0500
X-MC-Unique: _FqYJNzxP3iqxzNw-5dL_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 531DB185A785;
	Wed, 14 Feb 2024 17:57:17 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.126])
	by smtp.corp.redhat.com (Postfix) with SMTP id E186D2166B4F;
	Wed, 14 Feb 2024 17:57:12 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 14 Feb 2024 18:56:00 +0100 (CET)
Date: Wed, 14 Feb 2024 18:55:55 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Tycho Andersen <tycho@tycho.pizza>
Cc: coverity-bot <keescook@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Tycho Andersen <tandersen@netflix.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: Coverity: __do_sys_pidfd_send_signal(): UNINIT
Message-ID: <20240214175555.GC16265@redhat.com>
References: <202402131559.B76A34B@keescook>
 <ZcwGua3a9Z8nJXVq@tycho.pizza>
 <20240214090332.GA14017@redhat.com>
 <20240214090640.GB14017@redhat.com>
 <ZczLyDCN+zG6imTd@tycho.pizza>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZczLyDCN+zG6imTd@tycho.pizza>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Hi Tycho,

let me repeat just in case, I am fine either way, whatever you and
Christian prefer. In particular, I agree in advance if you decide
to not change the current code, it is correct even if it can fool
the tools.

That said,

On 02/14, Tycho Andersen wrote:
>
> On Wed, Feb 14, 2024 at 10:06:41AM +0100, Oleg Nesterov wrote:
> >
> > -	/* Ensure that only a single signal scope determining flag is set. */
> > -	if (hweight32(flags & PIDFD_SEND_SIGNAL_FLAGS) > 1)
> > +	switch (flags) {
> > +	case 0:
> > +		/* but see the PIDFD_THREAD check below */
>
> Why not put that bit inline?

Not sure I understand what does "inline" mean... but let me reply
anyway.

We want to check the "flags" argument at the start, we do not want to
delay the "case 0:" check until we have f.file (so that we can check
f.file->f_flags).

but perhaps this is another case when I misunderstand you.

> But I guess the hweight and flags mask
> are intended to be future proofness for flags that don't fit into this
> switch.

Yes I see, but

> That said, your patch reads better than the way it is in the
> tree and is what I was thinking.

this was my point.

And if we add more flags, we will need to update the "switch" stmt anyway.

But again, I won't insist. This is cosmetic afer all.

Oleg.


