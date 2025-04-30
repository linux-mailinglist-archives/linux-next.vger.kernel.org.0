Return-Path: <linux-next+bounces-6474-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB29AA53CA
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 20:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 675251BC390A
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 18:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE62264F9F;
	Wed, 30 Apr 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ul8ZQmLk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB519F12D;
	Wed, 30 Apr 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038163; cv=none; b=Qk/fpj4DMNF73cHfzTT1bJdulDMfHo515LZwGA56jsN1hyzvgTnPRefwxilSB7OxpYM2dJ5riFQlOXjsAkYSdWEBLBw4Ua6cvI51PjDLL/cGN+4o4hSzCQTVUIAzZ7mOs5HD3Pm1sSb17d/niiEL89C9279QbkmyzPsMpunBSko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038163; c=relaxed/simple;
	bh=XdNVV29t9TAHj4UXaDCTwqU30VSAioCD+Ned+a7YrHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to1t4K6rMVchu+LccXqZx6lz2VutxNG97ix09kswIgAR8OXYX0GMkyGX4iqc7WEUpeWicd6NNqIcL+BRLGSefPg49F0nq73ZfPJH8ZCjfHsWYSiYKCH0GQ9D6KCL/Izyk+mhu4sMJVqGknGBsFluxIzYv3cOJdxhxdPBmtCSt9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ul8ZQmLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4359AC4CEE7;
	Wed, 30 Apr 2025 18:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746038163;
	bh=XdNVV29t9TAHj4UXaDCTwqU30VSAioCD+Ned+a7YrHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ul8ZQmLkpDQoRCQrvLf7Fvx9skoLngvqH/WiX3rq0E5Ln3cHm3OK/QXUHXLe+X6FR
	 n2+TwucYygGiRXH+6MgY9fwJM7rgeIQzevreWVZnB3N1CCuPPKW4QAe9SjJX0mdw1M
	 Hz7QSuAEKqpzdSqPSP4sm+mmCInMfENvcC8jSZXXGhgQ9qFB2CUFIcjMHOkZ8EfLZY
	 EtJt0ILMtZFBDviEK4yCSElCyBtnBQXyE6+krEii6ngyrPqlsoSPTSFbdg5JkbfLF4
	 /VAwwJrekW2eoGA8NjE/OF+k2+uaqiiBPNpnn9p1WyRFK7YnUVRygwUhJE9asqe1/J
	 IR4njGoiJmxzQ==
Date: Wed, 30 Apr 2025 11:36:00 -0700
From: Kees Cook <kees@kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, gldrk <me@rarity.fan>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pm tree
Message-ID: <202504301135.17AD266A98@keescook>
References: <20250430085544.12800bdd@canb.auug.org.au>
 <CAJ-ks9mQfDwmz=chKjjcjv2KxPk1su4NWfZXey7nNgQWYXzaWA@mail.gmail.com>
 <4654171.LvFx2qVVIh@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4654171.LvFx2qVVIh@rjwysocki.net>

On Wed, Apr 30, 2025 at 08:32:25PM +0200, Rafael J. Wysocki wrote:
> On Wednesday, April 30, 2025 1:30:43 AM CEST Tamir Duberstein wrote:
> > On Tue, Apr 29, 2025 at 3:55 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > Commits
> > >
> > >   9eef70365d71 ("ACPICA: Introduce ACPI_NONSTRING")
> > >   ac9334785c75 ("ACPICA: utilities: Fix overflow check in vsnprintf()")
> > >   5de20bc939b0 ("ACPICA: Apply pack(1) to union aml_resource")
> > >
> > > are missing a Signed-off-by from their authors.
> > 
> > Hi Stephen, how can I remedy this for 5de20bc939b0 ("ACPICA: Apply
> > pack(1) to union aml_resource")?
> 
> The original ACPICA commit does not carry an S-o-b from you, so this one
> does not either.
> 
> If you reply with a Signed-off-by to this message:
> 
> https://lore.kernel.org/linux-acpi/4664267.LvFx2qVVIh@rjwysocki.net/
> 
> I will pick up your tag.

Whoops, mine is missed too from ACPICA upstream. I've replied now to

https://lore.kernel.org/linux-acpi/1841930.VLH7GnMWUR@rjwysocki.net/

-- 
Kees Cook

