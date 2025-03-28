Return-Path: <linux-next+bounces-6062-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC12A7462A
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 10:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17C4F175017
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5751DE4D7;
	Fri, 28 Mar 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hcacrj5o"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20FB1C36;
	Fri, 28 Mar 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153449; cv=none; b=m0xDZEdfNlL18LJ0VAsm+Qix9S3GR0rPPJP1OeWHGCIi73WnNCSw0EZyOdLN0HrqGmbXl4tnCtDQ4+RddnfjkzekgnyopNVFfwkZkJG/C5HZ2ZmCM9ORUxZOjzGyV0rOduJKcwoAnxAGpXFKWJ8aMFYcYV/oweX2RLY6nhOKeLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153449; c=relaxed/simple;
	bh=x3NZvRcTwn5V3UNaJOHVOZoRrWFFeJumVFdMrcbedTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UPVumygXJOn9xFcKybBh5sduRHQi6ADQuypRkRwVog8r2o3vfADenKKVLbYKSinrb0a/nHgemsenUbHiB827bb/kJK0byI3YkUpuLgGOifh4Wa+cEFTGmcngSAn0ypqS6Z8VhaAYQ+8IJb/3s13V5528Dhjb03jh7qtGJ/u2N6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hcacrj5o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17ACAC4CEEF;
	Fri, 28 Mar 2025 09:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743153449;
	bh=x3NZvRcTwn5V3UNaJOHVOZoRrWFFeJumVFdMrcbedTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hcacrj5oLcZNctvxWb2JkytmbNpy16GrQDazYdb3U13vQtlqbiTurPeagMX2EmSot
	 c9YQWuUlC7J5fFaYf3S9pMKcYm8GrhJ2rysiCdWnltJXIcprJLlfor6ghXRombxg1g
	 5GV6uwO+vMxySN/wU371tF0nC52XhM7SOTJrV0uDQOSpHmcn6zjlhkC7zmQFqMccsd
	 sOZ7ne+0ka8+QNzSOzvKJQGFcFV6hYTEdEJlauvZ9H4hsVjRG3uaqKk64Z9bDi7z6r
	 i/vjd6EaWTMTTtByHjlio+lBQf/DoNAvj8b09aOzA26jLaznZlKaEFoxTOEVQuhWGY
	 dNdLozlmlBoJQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499614d3d2so2166267e87.3;
        Fri, 28 Mar 2025 02:17:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRgdiUjTz4vDiQqks3dTvrCtH6pa17ya8XUmA9kG7QlpJy7XouP2Ut5Xz3VGuuRdb7HGo4Oh6dWGXEezE=@vger.kernel.org, AJvYcCVUYWiT06UjUFwtO9Y0AypFNQKleMXNJujEr6VHm0wnFWNpXP47InZcRWRPa1+CQKhojFSEdYbZ6WleAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Q9DIyNEkWwD1+4RfYMBtORdxgWOl+Q2tf/uHdneZY7laq2Jz
	M7XPfF3H6SdP5AfE3RX6KIBNGXYuiKV+t1z8jG+McJuEOanJqseEUhCrOJt2L8tfJXMIHQZKcsy
	vDAa86EagKku2KUN5g9lLyPsuef0=
X-Google-Smtp-Source: AGHT+IGGL5mo+8gl975uX9YbeSFfQJTYPPBcfIX724FcwKqMBD1e0YNf3sTbZdbZh4dqUchfGKzQdax50C3WfiheG4A=
X-Received: by 2002:a05:6512:1094:b0:549:7145:5d28 with SMTP id
 2adb3069b0e04-54b011dca5fmr2331245e87.25.1743153447420; Fri, 28 Mar 2025
 02:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com> <rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
 <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com> <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com> <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home> <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3> <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
In-Reply-To: <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Mar 2025 10:17:16 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGLWYrfEzdDXy1wriBycx0DPQ_kL==Jkw_sDW5f0KxEHw@mail.gmail.com>
X-Gm-Features: AQ5f1JpU6H6LooyOgp5MxGSUplJ1Di55u9wZFLS5uZLKj7Nvk3hVgSh4D1Gok6Y
Message-ID: <CAMj1kXGLWYrfEzdDXy1wriBycx0DPQ_kL==Jkw_sDW5f0KxEHw@mail.gmail.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain cpu/mem
 config combination
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	"Aithal, Srikanth" <sraithal@amd.com>, Jason Baron <jbaron@akamai.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"Roth, Michael" <Michael.Roth@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 10:09, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Fri, Mar 28, 2025 at 10:28:19AM +0200, Kirill A. Shutemov wrote:
> > On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
> > > On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
> > > > On Thu, 27 Mar 2025 16:43:43 +0200
> > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> > > >
> > > > > > > The only option I see so far is to drop static branch from this path.
> > > > > > >
> > > > > > > But I am not sure if it the only case were we use static branch from CPU
> > > > > > > hotplug callbacks.
> > > > > > >
> > > > > > > Any other ideas?
> > > > > >
> > > > > >
> > > > > > Hmmm, didn't take too close a look here, but there is the
> > > > > > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > > > > > the caller may or may not have the cpu_hotplug lock?
> > > > >
> > > > > Yes. This is generic page alloc path and it can be called with and without
> > > > > the lock.
> > > >
> > > > Note, it's not the static_branch that is an issue, it's enabling/disabling
> > > > the static branch that is. Changing a static branch takes a bit of work as
> > > > it does modify the kernel text.
> > > >
> > > > Is it possible to delay the update via a workqueue?
> > >
> > > Ah. Good point. Should work. I'll give it try.
> >
> > The patch below fixes problem for me.
>
> Ah. No, it won't work. We can get there before workqueues are initialized:
> mm_core_init() is called before workqueue_init_early().
>
> We cannot queue a work. :/
>
> Steven, any other ideas?
>

Why is the use of a static key required here?

