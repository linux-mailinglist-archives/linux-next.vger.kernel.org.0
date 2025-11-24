Return-Path: <linux-next+bounces-9175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95F5C80799
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 13:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74C03A27C4
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 12:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B001E834E;
	Mon, 24 Nov 2025 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n1SAoFY5"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB70218EB0;
	Mon, 24 Nov 2025 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763987576; cv=none; b=T4nXbJvJ/YSFjTyZEokEDkPqU7pERwE1E2Z2WE7vAC2/ZKnGKGdG9D1b2PScPTbuOjgn9yIEcbYxYo6A5BfhPoMpSnis3Qt2HyVhiq9TPyfsEUpJlAi1S2NQn7pTpTF7tYVKyq6bS1I85f/87wCXk9xYkNZ2oqR+rUi8l3W62ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763987576; c=relaxed/simple;
	bh=awgAJavHOQ0+gv0VJv/Dpe9I33aTOIItQxdp4Ay4QNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1dkRSkZ9op+eOBnIFmwor4TxmYnrOnze7SiYe6NQ+HuD4PN5kMweOz4nE8O4pQvHzPnws158YfEsX3VNSTekW299CcOQQqsXR8N1mFslUlQA5nWc918ZgV1KhmmWJpiRvI1AldZjOgPNAU1VH300jU4lYWChNjMvDm1Dt7dAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=n1SAoFY5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=awgAJavHOQ0+gv0VJv/Dpe9I33aTOIItQxdp4Ay4QNQ=; b=n1SAoFY5LE7NY+epMrlq/prIue
	r7hef6GpuoF+B+YMYjFU6UeKvrWUGClr/2ic2W2CJfzhJcAF9rR2t/5ydZwr8IKt7Ksn50/HS5AG2
	jyeBOeTtKkYOpo9pnJ6E715N3Uwq8adX0S62LEc3ayeh0qFjXZuiCakxwOAXnWUzCAqNDvZXNPvQp
	MFHFGOW7enCVcqK27e3jZFXAkModoE3fnhxdyMyvYDId8HYm3+jaq5iQAE7t4bIg66sY8XpIPEtOw
	fBLyUcMgx8n9rEOAmCo4puzMoKlh5sUW9wgbk+10fOdg8Xqx48ToVO08HslmN3DbKr+NYT0oqhUav
	YmellBCg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUsp-00000003eVN-2Uzg;
	Mon, 24 Nov 2025 11:37:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C348C3002E3; Mon, 24 Nov 2025 13:32:49 +0100 (CET)
Date: Mon, 24 Nov 2025 13:32:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ojeda@kernel.org, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251124231644.38d0303b@canb.auug.org.au>

On Mon, Nov 24, 2025 at 11:16:44PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> ERROR: modpost: "NULL" [drivers/gpu/nova-core/nova_core.ko] undefined!
>=20

Rust :/

So I have:

$ make O=3Dtmp-build LLVM=3D-22 allmodconfig
$ make O=3Dtmp-build LLVM=3D-22 rustavailable
Rust is available!
$ grep -e CONFIG_RUST=3D -e CONFIG_NOVA=3D tmp-build/.config
$

Help ?!?


