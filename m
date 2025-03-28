Return-Path: <linux-next+bounces-6066-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EFAA74664
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 10:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3ED87A8368
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 09:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2386D1DE2BA;
	Fri, 28 Mar 2025 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZcj5sBv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA281B3957;
	Fri, 28 Mar 2025 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154426; cv=none; b=sgjoxGIEOfIh45LunA63LrHe+qjrd61LGxGUSuzB97yXEOklATwzHXG4vazvCrRPBM6LFmgtgq+6ihwDjuAxuD4Zlwjcghi0XLKO27MTdHGtdCtTnAzA1yXxgS3NNQB+shqBoUg10s23+A3+qAni1BJ4HyUCIC021+Bbczag2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154426; c=relaxed/simple;
	bh=jk1/97f8/khzg4K46p1Cfbpj0pcqv0OI0ozBczngVNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vww3VfQav0LHihJqjlXW0BVMKhKwveINWw4mThJqep6jS7H8Ymz7LomyCIbhne8FSRCCiUReNT60OyV9epLhTiF+REn0ePcZEbH5ITvnKZN9u0a5X52Xi4Cwf5SmPoeQO8Y7BMOXP3T1z8PYNVYkpkqbdS4YXXP2T74zT8QT1Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZcj5sBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B9AC4AF09;
	Fri, 28 Mar 2025 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743154425;
	bh=jk1/97f8/khzg4K46p1Cfbpj0pcqv0OI0ozBczngVNc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BZcj5sBv3yGHhTSfGg2BlRJAUZIV2ZtyUg1Twjc0YrWHGRiOIXjKuoeYXq1Cm/U/8
	 iyH9q75g6UzjivNT12jUP/wIIyZvgLcQtYzKGKUrpEyMkhBIY5sxxMYVIe688SN7Cw
	 Kzq/hsiFOT5Off4mTwZXxyMY+Tr4QeiW25BVh5z5oeMpEXPfvFvWIZz6Ans8r/VeUd
	 j4hYgE72sP2g6+oKdrcWmtI9NA58MMLJmsg1hoCY8Uxn7MxAMJVawNyTQ00zU2bdEs
	 pHBf9jjkb90lBMAC/zeh/0m1noIoP/3L5XO3x5pm3FWbQ8k44oCqRv3xzB6WR+fAuA
	 pz2TeZsudMiOg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499659e669so1953091e87.3;
        Fri, 28 Mar 2025 02:33:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGDtGykdk691fYgVBzJadRlMa8Eh0symioYO1+5djCw++6Regci14+/tNMXJ4cMsVZSRyRM16Ti8cP8Q==@vger.kernel.org, AJvYcCWcOufBJlh5irYVB2o/esQUGE8pNFKh7c+VTiJgdxkkUQlomH24t98eRtgs+jERKL963uNoMVaSDAYL/JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWeQaPbi8jusSONn45Rg4kIMO3xjuRke+Av9HxEzpJOz8+whZJ
	pEoVoX9oi1Cr4SRUXQnTieBxft/sULE9YGAg5IZe4ACMWcwHQibcMZg6lfADo8cY3lvMCRmClRg
	unE7u6umW6kS+NmQLTVUNnhAfXA4=
X-Google-Smtp-Source: AGHT+IGLoPeycatF7pEMeTsw1RAsi8T1INd3OU6uhamoQRp0l7KYRcm2JnXJr6tl1XMm+TFtdboFdJ7WovelvcdVbyI=
X-Received: by 2002:a05:6512:ace:b0:545:2cb6:af31 with SMTP id
 2adb3069b0e04-54b011d5b21mr3225654e87.15.1743154423774; Fri, 28 Mar 2025
 02:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com> <idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
 <ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
 <4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com> <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
 <20250327110224.68c69c78@gandalf.local.home> <2kwzi2qxqualhskbgckk6m7oc6vsgupquceqgfx2gnz5xbkier@rwdrhym7yxhr>
 <vhwle6fj3ifmcouppec5adegqludggsxcsxxveqa43hugtsdgy@pb7vd5cqjmx3>
 <m4cubsijicsrtq3blyzxeknsuc4cqswg35yz45uk5lipza4lps@yeqq2j5hf4y3>
 <CAMj1kXGLWYrfEzdDXy1wriBycx0DPQ_kL==Jkw_sDW5f0KxEHw@mail.gmail.com> <wl7m7xtqg6ftqmkyaabtzsk7lkhxnpkinyehwy6eokvwkfklzi@m6chqm3rht2u>
In-Reply-To: <wl7m7xtqg6ftqmkyaabtzsk7lkhxnpkinyehwy6eokvwkfklzi@m6chqm3rht2u>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Mar 2025 10:33:31 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF68ibzc0_5tPmC7bLBHC0F6w_S7HeYMZeDr8PHo9jzDg@mail.gmail.com>
X-Gm-Features: AQ5f1JqGgetqByQlp4xvYY0HkBtshVg_U6-IptbKLGugqFb6gRBR6SYOemN1Ofk
Message-ID: <CAMj1kXF68ibzc0_5tPmC7bLBHC0F6w_S7HeYMZeDr8PHo9jzDg@mail.gmail.com>
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

On Fri, 28 Mar 2025 at 10:26, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Fri, Mar 28, 2025 at 10:17:16AM +0100, Ard Biesheuvel wrote:
> > On Fri, 28 Mar 2025 at 10:09, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> > >
> > > On Fri, Mar 28, 2025 at 10:28:19AM +0200, Kirill A. Shutemov wrote:
> > > > On Thu, Mar 27, 2025 at 07:39:22PM +0200, Kirill A. Shutemov wrote:
> > > > > On Thu, Mar 27, 2025 at 11:02:24AM -0400, Steven Rostedt wrote:
> > > > > > On Thu, 27 Mar 2025 16:43:43 +0200
> > > > > > "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:
> > > > > >
> > > > > > > > > The only option I see so far is to drop static branch from this path.
> > > > > > > > >
> > > > > > > > > But I am not sure if it the only case were we use static branch from CPU
> > > > > > > > > hotplug callbacks.
> > > > > > > > >
> > > > > > > > > Any other ideas?
> > > > > > > >
> > > > > > > >
> > > > > > > > Hmmm, didn't take too close a look here, but there is the
> > > > > > > > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > > > > > > > the caller may or may not have the cpu_hotplug lock?
> > > > > > >
> > > > > > > Yes. This is generic page alloc path and it can be called with and without
> > > > > > > the lock.
> > > > > >
> > > > > > Note, it's not the static_branch that is an issue, it's enabling/disabling
> > > > > > the static branch that is. Changing a static branch takes a bit of work as
> > > > > > it does modify the kernel text.
> > > > > >
> > > > > > Is it possible to delay the update via a workqueue?
> > > > >
> > > > > Ah. Good point. Should work. I'll give it try.
> > > >
> > > > The patch below fixes problem for me.
> > >
> > > Ah. No, it won't work. We can get there before workqueues are initialized:
> > > mm_core_init() is called before workqueue_init_early().
> > >
> > > We cannot queue a work. :/
> > >
> > > Steven, any other ideas?
> > >
> >
> > Why is the use of a static key required here?
>
> It is not required, but nice to have. We don't want extra conditional in
> page alloc path.
>

This would be a __read_mostly global variable that rarely changes, and
therefore gets predicted correctly 99% of the time. So I wonder if the
static key is worth the hassle.

Can you quantify the speedup?

