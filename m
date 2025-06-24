Return-Path: <linux-next+bounces-7228-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A0AE6425
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC2C188B2FE
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D7C28F948;
	Tue, 24 Jun 2025 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT1EhN6z"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64928ECF9;
	Tue, 24 Jun 2025 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766436; cv=none; b=EUIYKoB+wHo5hyebjRxv7mkpbm6u4zHhmQBFjssGJiTBkqT6E7oEgnG+ZQ+/z5fJ5SWLDy7pFEL7plpY+T9g/2wBLJH/he9SO6LTx+7tiVhI7riHummGtacz0R19EOnnTHDUXZgMd0u/j1FTp69Luz+DGkq4iyOop7JRagHSpmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766436; c=relaxed/simple;
	bh=5I9jkgqN3QpHuEK/bDx3b9DO/wZ+Qmkg+LsqhTphb/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIJBUBIs95Hsn8FvUgUTlVuo12YdDgtkVn2QMaRRO5yD+GiklzZIZN1GrSYN9Imd/1SJivOs+r51MTRED0IHUIRQYRxIhMSZRF0BnLTPFqtzDsoqFWdNCbAsYCAedDZg5yiCfk7FjrH0yNqgDOMcPrZDzzypnQMkh/81RLLwC3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT1EhN6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DBBC4CEE3;
	Tue, 24 Jun 2025 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750766436;
	bh=5I9jkgqN3QpHuEK/bDx3b9DO/wZ+Qmkg+LsqhTphb/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YT1EhN6z0IIvmheeLOQp7XmFBZiLITXRZeraMSJZyBFv+zKAcbIXayAVPv4tIT3E+
	 A8caZq+O1pWNqIE2pl0PjP3mRD+cdgJ2o8SOOwvQiodUDEwlT9p1EKj1cnvSUrLxLL
	 qzSdbVhpLj65TQkZH8OQJjYWrIAQF+Gfj9C1buhP3HTIIp3VG651TChQM1umV144Je
	 7uIeY+25BmnZG4zn1oBDrDQDOrlxveX4AhdLsRY8LpYhjOtoPQQsA3xHuZ22ZJ+5gZ
	 j001MIzQZPgr48mEYgw/jcHohalPedumyfvKub/6Z2pqD5xQTgDxLlzUjPuREgukPk
	 WhgmyVXuscGaw==
Date: Tue, 24 Jun 2025 14:00:31 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <aFqTX2oDzacpDpif@pollux>
References: <20250624173114.3be38990@canb.auug.org.au>
 <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>

On Tue, Jun 24, 2025 at 12:31:52PM +0200, Miguel Ojeda wrote:
> On Tue, Jun 24, 2025 at 9:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > error[E0277]: the trait bound `u32: From<DmaTrfCmdSize>` is not satisfied
> 
> > error[E0599]: no method named `as_nanos` found for struct `Delta` in the current scope
> 
> > Presumably caused by commit
> >
> >   b7c8d7a8d251 ("rust: enable `clippy::cast_lossless` lint")
> 
> The first error, yes -- the `register!` macro was changed to use
> `u32::from()` to avoid an `as` cast in that commit, and while the cast
> is OK converting the new `enum`s like `FalconCoreRev`, `from()`
> isn't`, so we would need to implement `From` explicitly -- Cc'ing
> Danilo, Alexandre, Lyude.

It's a bit annoying to implement From explicitly for all of them, but it seems
to be the correct thing to do.

nova-next also contains a couple of cases where the introduction of
`cast_lossless` causes warnings.

I can implement the From traits and fix up the warnings caused by enabling
`cast_lossless` in my tree with subsequent patches, such that we do not have to
carry all this as merge resolution.

- Danilo

