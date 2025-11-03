Return-Path: <linux-next+bounces-8801-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D784DC2ACDE
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 10:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7D9C94F3E7C
	for <lists+linux-next@lfdr.de>; Mon,  3 Nov 2025 09:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24A12EC0A0;
	Mon,  3 Nov 2025 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fS2bv1Kp"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE482EBB98;
	Mon,  3 Nov 2025 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162688; cv=none; b=jm+f6fWiWrHU+ulC43VIfXZIG07bEGboS26w1FoO1L4WYNdbZNwRjOQVFNGy6PFJtdc1fwS0eTltHj6rGa6Up47DA2Zc9rGiorbJl0Ynk9Pk1vs0LZrhd1IjtEqf8efvfMnNoK+b92wfFLITt2HNCRKu51uQKnSfqS1m/MGQrCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162688; c=relaxed/simple;
	bh=buv33Uz2Fo5fwFIVaIdaFUPAiAI11WQiPVvmTTQ8Zw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjQ/jOVFaI6M79nyj55HIZjIAQByPDeZUYsI66n7cEcJSh8qyGk4WmS0vYeIwhq5KwToTZmOcWRvweO9kCa/67z5wDiTMOQlWYV+Ej6Rb6Pe63YUScG5/EtXTEdaLZbU4X2JRlscDyxMYeXMwEktSs9BSIQU3aInlxzsnSxLEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fS2bv1Kp; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gsDapFRugM+4XwGq22nVfGICtpH+R8BdlGsLTJySzLk=; b=fS2bv1KpeHE/vj0SlxiKC7ffk3
	CKn04SPP2TPAJSHdqAAzRiod6AHFz1c/UCJ3cI9/KnHufmCdiX8owqRDox/9wE/1NUeHduAPp2HR8
	TV02nXRa0EopydUkHTe+dMaukt11gXDUysJCB/lWdVU5t2Bw5vI2BUxTRo7OaSf58j+shL2Gk+qBO
	D6LVPlQqeYD12WvCcyqbLZXQPI9zH0BdVB1S/7jCeEC0sxnh/VrRYr+XgvcBlusuvKrZDYyke2rfT
	okfbzv6U23kCTtfOSfU/vMWr17w/a6SN4gD0xOLtdn4Z97Beg1V0Qv/k3NE4IEkcdnPjd9px7MqiL
	YbA3aGeQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFq95-0000000F0Es-1EO8;
	Mon, 03 Nov 2025 08:42:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9947E30023C; Mon, 03 Nov 2025 10:38:04 +0100 (CET)
Date: Mon, 3 Nov 2025 10:38:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
 <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103203256.5ac39302@canb.auug.org.au>

On Mon, Nov 03, 2025 at 08:32:56PM +1100, Stephen Rothwell wrote:
> Hi Peter,
>=20
> On Mon, 3 Nov 2025 10:10:06 +0100 Peter Zijlstra <peterz@infradead.org> w=
rote:
> >
> > On Fri, Oct 31, 2025 at 11:15:15AM +1100, Stephen Rothwell wrote:
> > >=20
> > > My x86_64 allmodconfig builds started producing these warnings today:
> > >=20
> > > vmlinux.o: warning: objtool: user_exc_vmm_communication+0x15a: call t=
o __kasan_check_read() leaves .noinstr.text section
> > > vmlinux.o: warning: objtool: exc_debug_user+0x182: call to __kasan_ch=
eck_read() leaves .noinstr.text section
> > > vmlinux.o: warning: objtool: exc_int3+0x123: call to __kasan_check_re=
ad() leaves .noinstr.text section
> > > vmlinux.o: warning: objtool: noist_exc_machine_check+0x17a: call to _=
_kasan_check_read() leaves .noinstr.text section
> > > vmlinux.o: warning: objtool: fred_exc_machine_check+0x17e: call to __=
kasan_check_read() leaves .noinstr.text section
> > >=20
> > > I can't easily tell what caused this change, sorry. =20
> >=20
> > What compiler? This smells like a broken compiler, these are all
> > noinstr and that very much has __no_sanitize_address.
>=20
> And today I didn't get them.  So who knows?  I did *not* change compiler
> since Friday.

Oh well, lets chalk it up to gremlins for now. I'll have a look if it
happens again/reliably.

