Return-Path: <linux-next+bounces-9180-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41AC81112
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86683AA472
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30EB27815D;
	Mon, 24 Nov 2025 14:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BZUdJQMH"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74C14B96E;
	Mon, 24 Nov 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994944; cv=none; b=QDduLOJUkj5x6OZ9ux+7i3oxiNQU1Lgf+JzG37yTcvqhpItS6jFXWOJ8seZveQ3gSqixa/Q7QoXG38PXxPMJBKBk4WGW7sAMqZATqhZQqUQKZr8NLmHRLKW5es9bmCPJQhdjpzqZ9SGUIYO6wa7RK7FosFlmFALT613T5RVJ3oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994944; c=relaxed/simple;
	bh=JicZRofekoJmYVFMFWp/L+dPkO+mGCT+JfLWkp/bFKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFVLGWxb8Zb9HzC6HEKc3wcx4REO0hAeZcEg2H53S58bD3m/gRdH45j9mbmCTWHkY2jVxklSh3+2/SuFobDgZJ3/w8W2g/IIGoL5E/M3I5g/Gk504TThhEXjARqjeSxk/4Po4FriuLZVP9b+98NFAZzN2w8zmfCT9NP8BI5Qy1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BZUdJQMH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JicZRofekoJmYVFMFWp/L+dPkO+mGCT+JfLWkp/bFKw=; b=BZUdJQMHPxyEYJUT6J+QbP1BLo
	R1XJkALt5u2jsrAzX4gcG6DgM9B6RV/xR/LqHfZe5BnGKTzGVP7y21akIpajfTuRWalZvCXsKeZJt
	Y8+FkmAmQ6IF5t9dimQrZmTAUnbtyTku/rT3dX5jVSxDNhBS9zNxcHXpCE1YO9IZsp/rxYpyYEPLc
	EbNE9M9uNZj4ET1xDsNwPBAd1oTOaTA+Qng+ZDyb5kIMnh7GtD/p3zKxhVExyeadia3We77sO+DTU
	nuRyMqVvfV9VKbFHIX0wGpwjlWd/A+wvB5PlrXJ0h0hONHUO55RBlPe/2zOkFdbWFpivuk+KOHykX
	B0AV3t4Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXfG-000000076zW-37VF;
	Mon, 24 Nov 2025 14:35:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 784923002E3; Mon, 24 Nov 2025 15:35:37 +0100 (CET)
Date: Mon, 24 Nov 2025 15:35:37 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ojeda@kernel.org, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124143537.GS3245006@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <20251125010351.05b0b2d7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251125010351.05b0b2d7@canb.auug.org.au>

On Tue, Nov 25, 2025 at 01:03:51AM +1100, Stephen Rothwell wrote:
> Hi Peter,
>=20
> On Mon, 24 Nov 2025 13:32:49 +0100 Peter Zijlstra <peterz@infradead.org> =
wrote:
> >
> > Rust :/
> >=20
> > So I have:
> >=20
> > $ make O=3Dtmp-build LLVM=3D-22 allmodconfig
> > $ make O=3Dtmp-build LLVM=3D-22 rustavailable
> > Rust is available!
> > $ grep -e CONFIG_RUST=3D -e CONFIG_NOVA=3D tmp-build/.config
> > $
> >=20
> > Help ?!?
>=20
> Have you read Documentation/rust/quick-start.rst? =20

At some point in the past... I just did again, and updated the relevant
packages and rustavailable is still green, but allmodconfig is still not
giving me rust.

I'm on Debian Testing.


