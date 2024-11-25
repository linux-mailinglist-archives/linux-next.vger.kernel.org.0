Return-Path: <linux-next+bounces-4844-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F274A9D8EED
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2024 00:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DCDAB20FB6
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 23:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4AD383BF;
	Mon, 25 Nov 2024 23:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Tf6i1oto"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F6190059
	for <linux-next@vger.kernel.org>; Mon, 25 Nov 2024 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732576533; cv=none; b=eukRT+mGfQgzJcz4RLv0M+Z9oZlq+RSOHMGaguMRy11Xt8zUF+KmZk0do9apkb3brdUawlJ2xmtHXRDJYZOMlRyhyWcPIeTa9maRL+PJiYD/0gJXDvrH0Y48SW/WaS8B2O/TTEBpiJNYO368FYJadLp5keZEe6Ls3yiL9cPeuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732576533; c=relaxed/simple;
	bh=KfA7LXjPyO7kCVg7OxRvn3iDegSqAZHvtk/Ge5HwQfU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YOGcoZa0s06Srive3DIc+L7npymKGFpLLHGNsb9WYAGl5umk1HscbhZ2dy2kkQPsSDs9EAYijCnVHRwOe0CnWHXVGYmiIzFmW2WsjyToO9pDhc+ibfoHpQit59HPIbJgvsZib574DTSLhDNTfe/tu+B3piXnlccueeZUb/bIJ4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Tf6i1oto; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=2wt2f27pjfbbllo3ihvqfaz43e.protonmail; t=1732576528; x=1732835728;
	bh=KfA7LXjPyO7kCVg7OxRvn3iDegSqAZHvtk/Ge5HwQfU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Tf6i1otoM94jLxpXwp6DoJLN6PgccsjzGprCxAzAdjC+XFut5/GMbSlYvNDR1iwJg
	 NULD8dJXUKBDuhgZSFdY33Ju09KpB9taoDFcaz0l/uj2A5OpggleIdXANq2zKAuyhP
	 PS/77boZTFDUucitDaM8B+xEs+2MKVgS4txDisif5KWS5OKh76AuGDT5QWscDQrwst
	 rC4wjZbG7bYnupNhgjME1VdJwq6IF7ihmynDpn4X01uoBbhUuM4rmAvOrKefUyHTHk
	 np/MNcRbvCg9e8rMgEwAEkun5wSmOgRBRaNLHggD9YBsUSCCn33Zpsg3eq4xwEfFVw
	 NghetN+nJ1fsw==
Date: Mon, 25 Nov 2024 23:15:25 +0000
To: Kent Overstreet <kent.overstreet@linux.dev>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <xlQ-OqcyGBAZ05DIFUqHB-9cMz9wJrU2C3wC2Nwrl73En9GjEZOkF6LjZcpspO08DWwfzJ75lyRm3qC3QDAnmqb3LHwQ4ztiqH2UGfkBDZw=@proton.me>
In-Reply-To: <pcwl5uu77olfcogaq77jrnfic5ftsuizu7xtt3mjxhr7ri6n2y@kryl6cprd3br>
References: <20241124183507.5241d705@canb.auug.org.au> <L_EkkmQsB6qOPGXuF9tsZFHbNXMQcco_bdzKzow3ZXhjccVKzQJ-Ekd8SU4Ofqt9RNJccI_ZlUrjsNDGvKZuuujdUjxHcaS6qT8WkmHITL0=@proton.me> <pcwl5uu77olfcogaq77jrnfic5ftsuizu7xtt3mjxhr7ri6n2y@kryl6cprd3br>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: b74d14b2b2c0ffcc131e8b8b84abd592492ae69f
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, November 25th, 2024 at 10:34 PM, Kent Overstreet <kent.overstree=
t@linux.dev> wrote:

> On Mon, Nov 25, 2024 at 05:26:03PM +0000, Piotr Zalewski wrote:
>=20
> > On Sunday, November 24th, 2024 at 8:35 AM, Stephen Rothwell sfr@canb.au=
ug.org.au wrote:
> >=20
> > > Hi all,
> > >=20
> > > Commit
> > >=20
> > > a4f3d037408e ("bcachefs: Fix evacuate_bucket tracepoint")
> > >=20
> > > is missing a Signed-off-by from its author.
> >=20
> > Looking at the commit - Kent has changed my patch significantly. So eit=
her
> > there was a mistake in assigning myself as an author or he forgot to ad=
d
> > my signed-off-by line.
>=20
>=20
> Uhh, some of column a, some of column b - I thought I was doing a new
> commit and must have brainfarted somewhere.
>=20
> Co-developed-by?

That's ok to me :) (any way of resolving this really)

Haven't yet been in co-developed-by tag!

Regards, Piotr Zalewski

