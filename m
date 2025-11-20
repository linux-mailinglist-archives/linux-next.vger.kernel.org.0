Return-Path: <linux-next+bounces-9111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A2C73609
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 11:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 79989343F71
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 10:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D45307AE0;
	Thu, 20 Nov 2025 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TvFVJDRs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3BC32145E
	for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 10:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632885; cv=none; b=DIMEJPFqp7XQxZWzOzOcQlrcdHmwaESRRssTi2oN7vahtbUozujSub4MUo9qlixo1y7f8GsBi0kzSfqYNuIXXK7U0Ii/u2gyuw71nFcsiCD17QCR16hWSTW/+gxSkslhSCTSmWduTq3npCruzO/6tumtyE9hNTI7Fv5400IBrCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632885; c=relaxed/simple;
	bh=0rQe3uK7gDnqTE7qLNAhjsBxcxYAYyf7idQ2Y8B+seI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aZbPA7SqDxoP4Zp2FctdoAGsoeHuYny66s0ONYBrZ7Cs8khhTuzE8CWeiMKKjSE/0G8Yn0x+sQPfbiAcWxIrWe/ou9hF3H2TqpEnElG84dXi2Ur+WrLWPyzAn7d2E0tjJbm3dkJUbIQVy/vbBC9GOFTk+VcyzGZFx/8gXmsaiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TvFVJDRs; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b735400de44so67355166b.0
        for <linux-next@vger.kernel.org>; Thu, 20 Nov 2025 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763632881; x=1764237681; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyOK57fNMIWjMc20yORiuasC4OzpP1niZsLEWNwJLiQ=;
        b=TvFVJDRsV4M1TSSS52yOz/AEoQHgsXza4D95NKfTmgclIF5rpQT7/ga3qa0n6eajya
         pdP0B7zlZMy7d3+PCFkL/emxUgBssaEaHUFjtsEGKo417NuNTYDElr7TYk0vI+WOhDpe
         F3ff3fcjfsiI+dTVwh7+OwkYX2h52kv9GLWU5T9HOiCpxIsx/bcRnXFVE5T3oadn8KnA
         VtGKysZHP9w+G8Ao8jZxZBIvItAN6ZXBptgAV+JmM/0vB3BStKZIvWxC9sFYWtFNlZ6N
         ntRtf2VGRy1h7B8bMW5SodSgQX5wiFiz/Z2D8xiWxhKw/EI5HnZdvpLfVPJr0USd3W1L
         abjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763632881; x=1764237681;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyOK57fNMIWjMc20yORiuasC4OzpP1niZsLEWNwJLiQ=;
        b=nEDoXPknyKtX7AX6V+wet3Zg8+Um7cjhml0Trp2WtN6/a/dYKxt03EJV6rctQ/iZUX
         00ysZYMk8Q543AplsoCNNU/a90gUW0Qzq7tPbX4rT4ec0c3+GGExvk9B6VK/g2mk3q3v
         lx0RRktDOMOIYm/PXNtgrwcWkb2PLvSFlTZ1zOBAJ75IXJDG98rUP/5gT8V2H+oe7efh
         c/BhyRuOLyN/dlnvi+fhfIz9J0xXIl7rPnL7+NmYDzMnPIxeLFsU63ncGHiaLW3jWTuX
         D9tlx2ipKWDpDxlhC/kJ3T4w2oIGrUVZwYgJgy2kOFIVEMVYF6ESs4sm3I9E9v1+L7dx
         He8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZQuAtkgbs7OEeJP/3ugo4LPUoVIUp5ZMU4A8dF/djDhcTqSRnNjsrR+FkOplQnAtbLwng1Y47vR05@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf6BUPN+gkHUljoUbeN4UNxBwT4YKpqPpK9Z6+IZteZ6kL+Eus
	QFZOz/K26MSO6GE4Ox6Iprcku3l6cFcLXGg/nnwvbNUejK7NNCIS0JRSYV4/YrTL9W+7iECzdNF
	qTuSgMSW9xt3pdp1X4Q==
X-Google-Smtp-Source: AGHT+IEnnqAVEVnkKPfR/rrErnFzOJ0xwzVV3Ukayy63sNeRekQHnJUoCxb8tjmScqYwkF6OJ1vqAgouGkXty8E=
X-Received: from ejcvw8.prod.google.com ([2002:a17:907:a708:b0:b73:8115:9bbc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f87:b0:b70:fd2f:6a46 with SMTP id a640c23a62f3a-b7655299929mr263016766b.20.1763632881657;
 Thu, 20 Nov 2025 02:01:21 -0800 (PST)
Date: Thu, 20 Nov 2025 10:01:20 +0000
In-Reply-To: <20251119154824.339bfbeb47d149b041f15550@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251117102310.58ecfdb4@canb.auug.org.au> <20251120101440.0f41ca9b@canb.auug.org.au>
 <20251119154824.339bfbeb47d149b041f15550@linux-foundation.org>
Message-ID: <aR7m8ObFWzYetZrO@google.com>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable tree
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Eric Dumazet <edumazet@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 19, 2025 at 03:48:24PM -0800, Andrew Morton wrote:
> On Thu, 20 Nov 2025 10:14:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > On Mon, 17 Nov 2025 10:23:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the mm-nonmm-unstable tree, today's linux-next build
> > > (x86_64 allmodconfig) failed like this:
> > > 
> > > error[E0425]: cannot find function `rb_first` in crate `bindings`
> > >    --> rust/kernel/rbtree.rs:209:42  
> > >     |
> > > 209 |                 next: unsafe { bindings::rb_first(&self.root) },
> > >     |                                          ^^^^^^^^ not found in `bindings`
> > > 
> > > error[E0425]: cannot find function `rb_first` in crate `bindings`
> > >    --> rust/kernel/rbtree.rs:224:42  
> > >     |
> > > 224 |                 next: unsafe { bindings::rb_first(from_mut(&mut self.root)) },
> > >     |                                          ^^^^^^^^ not found in `bindings`
> > > 
> > > error[E0425]: cannot find function `rb_first` in crate `bindings`
> > >    --> rust/kernel/rbtree.rs:249:42  
> > >     |
> > > 249 |         let current = unsafe { bindings::rb_first(root) };
> > >     |                                          ^^^^^^^^ not found in `bindings`
> > > 
> > > error[E0425]: cannot find function `rb_last` in crate `bindings`
> > >      --> rust/kernel/rbtree.rs:264:42  
> > >       |
> > > 264   |         let current = unsafe { bindings::rb_last(root) };
> > >       |                                          ^^^^^^^ help: a function with a similar name exists: `sg_last`
> > >       |
> > >      ::: rust/bindings/bindings_generated.rs:90155:5
> > >       |
> > > 90155 |     pub fn sg_last(s: *mut scatterlist, arg1: ffi::c_uint) -> *mut scatterlist;
> > >       |     --------------------------------------------------------------------------- similarly named function `sg_last` defined here
> > > 
> > > error: aborting due to 4 previous errors
> > > 
> > > For more information about this error, try `rustc --explain E0425`.
> > > 
> > > Caused by commit
> > > 
> > >   84aa8c5fc414 ("rbtree: inline rb_first()")
> > > 
> > > I have reverted that commit and the following one for today.
> > 
> > I am still reverting those commits.
> 
> Thanks, I'll disable them for now.
> 
> Alice, can you please help us with a fix?  Simple patch follows:

The diff Miguel shared should fix this issue. Let me know if you need a
real patch.

Alice

