Return-Path: <linux-next+bounces-6257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D995FA8A256
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 17:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0698E3BFD8D
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 15:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A772BE7A1;
	Tue, 15 Apr 2025 14:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKGpjKEv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2EC29A3D8;
	Tue, 15 Apr 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729155; cv=none; b=PdBTVGg1o8fUxpwj9XbmBLko3U5MnifjxafjMjiZRva5KEdS+ZZMri+DqngD6LGmljSrdVknqeoM7RodFWoqA3kZw65uMw775WE49yuRjaLsxvfhBVri52SZcyJmzpb0IxKqnLnN7UawsdCR3mr6TmVXHoMu7vT26fqdu7WJid0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729155; c=relaxed/simple;
	bh=eaMVYvn5HhAGPrDjorLh1Wet8DI0F9O9UUY54VXHWBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No8SCwWybaZU+xwkPcyBnuaoyTpd9Fi3V5EejNrtqtFcoHMoRMYYUkG8MC5+Jqqy6zDjc0R+LN2li/oj9QbMh2A+3W3GA9d/ds6ShmviqKK54TjpXbtQuTjqm/NzyUx8gi3AXy0nLWNu+uA8Vhlu3eE9pkI31u17fza5JX0ugLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKGpjKEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EDEC4CEEB;
	Tue, 15 Apr 2025 14:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744729154;
	bh=eaMVYvn5HhAGPrDjorLh1Wet8DI0F9O9UUY54VXHWBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKGpjKEvdBOeRzUa9EaGhqhKGfQEFbYLjRu6wGRMNVguN+p79XyUTOXM4NAiohLDG
	 RbRGx0sc/zDKtF8bsFTkO/NSZ9O6kxCXMzhvRB5waMJ5tN6briVr18AGE1/QJD7xQw
	 rPFwAv1V6Q4w1Cu0S943dy/sslulotrZo1lbJPm1C4vIz1NZnTz+oH2LMQMn7a2sR/
	 gsbhudrcGN3dSEFwQedVU+dB6g74wSqtMPkB0WKKQMZVNyqE+0vlXIwG9GkW10q3ee
	 3+N3yEojSKSd8jdM3dsXVIrSa8UE2/KTal7N16LhSzNwY2QoFh8Ya/CE4xuPnSWLzY
	 Xj/g/aR6/pd/w==
Date: Tue, 15 Apr 2025 04:59:13 -1000
From: Tejun Heo <tj@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the workqueues tree
Message-ID: <Z_50QbWczACrwL5f@slm.duckdns.org>
References: <20250415140116.13544ac6@canb.auug.org.au>
 <CAJ-ks9kUBCX6PjOeOSVQNXYGcy9gkYw++BEmHZ0eFbsyZeBZcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ-ks9kUBCX6PjOeOSVQNXYGcy9gkYw++BEmHZ0eFbsyZeBZcQ@mail.gmail.com>

On Tue, Apr 15, 2025 at 09:24:32AM -0400, Tamir Duberstein wrote:
> On Tue, Apr 15, 2025 at 12:01 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the workqueues tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > error[E0308]: mismatched types
> >    --> rust/kernel/lib.rs:204:9
> >     |
> > 204 |           ptr.sub(offset) as *const $type
> >     |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ types differ in mutability
> >     |
> >    ::: rust/kernel/workqueue.rs:495:18
> >     |
> > 495 |               ) -> *mut Self {
> >     |                    --------- expected `*mut ClosureWork<T>` because of return type
> > ...
> > 505 | / impl_has_work! {
> > 506 | |     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
> > 507 | | }
> >     | |_- in this macro invocation
> >     |
> >     = note: expected raw pointer `*mut ClosureWork<T>`
> >                found raw pointer `*const ClosureWork<T>`
> >     = note: this error originates in the macro `$crate::container_of` which comes from the expansion of the macro `impl_has_work` (in Nightly builds, run with -Z macro-backtrace for more info)
> >
> > error: aborting due to 1 previous error
> >
> > For more information about this error, try `rustc --explain E0308`.
> >
> > Caused by commit
> >
> >   345e029b561e ("rust: workqueue: remove HasWork::OFFSET")
> >
> > I have used the workqueues tree from next-20250414 for today.
> 
> HI Stephen, I believe Tejun plans to back this out. See
> https://lore.kernel.org/all/CAJ-ks9k2FEfL4SWw3ThhhozAeHB=Ue9-_1pxb9XVPRR2E1Z+SQ@mail.gmail.com/.

Yeah, sorry about that. It was in the tree only for a couple hours and then
got rewound, but we got a bit unfortunate with linux-next pulling. Should be
okay today.

Thanks.

-- 
tejun

