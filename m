Return-Path: <linux-next+bounces-675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366F827617
	for <lists+linux-next@lfdr.de>; Mon,  8 Jan 2024 18:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D04D2831FF
	for <lists+linux-next@lfdr.de>; Mon,  8 Jan 2024 17:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99F653E39;
	Mon,  8 Jan 2024 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taaEqgJS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA6053E36;
	Mon,  8 Jan 2024 17:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14FDC433C9;
	Mon,  8 Jan 2024 17:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704734133;
	bh=xPMgJ2aFREL2j1LwnOpPiVGiyM4ZUehkCaCWx0OubRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=taaEqgJSS2VqNtognZZIE0e3GBSPrdc969WAXrzTWZ6kb+8SvyyA06W1eFxhxnK1+
	 Wxj6Ay+fC4HEBmNbIMPL5BXpGF2RuF4e2mT7sYyeqzQ8PUqxNPXk50hVpLlp3z2a/M
	 U5UPOwqt8c6Ndfa/23D+IsnwDzMo4Vn3pNk9t2cWXaqSllEabiv0bsOWfcMgJoXPKz
	 l06YYjxhs11AoD25vXBfMuXhjfx2rm+7U6IreyQSDHktRlwOLVsHXiaVHy+Nw5NbpO
	 lrZZT27Lw3CsA9v59Lx/mvEZxOPZCTom5L1s74WFwUuPLa67Zxn9HqoCj6EMa6Tjd/
	 UfQ+HfKsbHzNA==
Date: Mon, 8 Jan 2024 17:15:27 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@rothwell.id.au>
Cc: Sean Young <sean@mess.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Flavio Suligoi <f.suligoi@asem.it>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: (subset) linux-next: build failure after merge of the pwm tree
Message-ID: <20240108171527.GB7948@google.com>
References: <20231221165805.0c4771c1@canb.auug.org.au>
 <170316329164.542553.8341559295114557258.b4-ty@kernel.org>
 <20231221125801.GG10102@google.com>
 <ZYSFUZf8NcK5vvLv@orome.fritz.box>
 <ZZaCQahr3t8CUumD@archie.me>
 <ZZaplFvjLADNz-2m@gofer.mess.org>
 <20240105090449.5cf240ec@oak>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240105090449.5cf240ec@oak>

On Fri, 05 Jan 2024, Stephen Rothwell wrote:

> Hi all,
> 
> On Thu, 4 Jan 2024 12:50:28 +0000 Sean Young <sean@mess.org> wrote:
> >
> > On Thu, Jan 04, 2024 at 05:02:41PM +0700, Bagas Sanjaya wrote:
> > > [also add Jingoo (additional backlight maintainer) and Linus]
> > > 
> > > On Thu, Dec 21, 2023 at 07:34:57PM +0100, Thierry Reding wrote:  
> > > > On Thu, Dec 21, 2023 at 12:58:01PM +0000, Lee Jones wrote:  
> > > > > On Thu, 21 Dec 2023, Lee Jones wrote:
> > > > >   
> > > > > > On Thu, 21 Dec 2023 16:58:05 +1100, Stephen Rothwell wrote:  
> > > > > > > After merging the backlight tree, today's linux-next build (x86_64
> > > > > > > allmodconfig) failed like this:
> > > > > > > 
> > > > > > > drivers/video/backlight/mp3309c.c: In function 'mp3309c_bl_update_status':
> > > > > > > drivers/video/backlight/mp3309c.c:134:23: error: implicit declaration of function 'pwm_apply_state'; did you mean 'pwm_apply_args'? [-Werror=implicit-function-declaration]
> > > > > > >   134 |                 ret = pwm_apply_state(chip->pwmd, &pwmstate);
> > > > > > >       |                       ^~~~~~~~~~~~~~~
> > > > > > >       |                       pwm_apply_args
> > > > > > > 
> > > > > > > [...]  
> > > > > > 
> > > > > > Applied, thanks!
> > > > > > 
> > > > > > [1/1] linux-next: build failure after merge of the pwm tree
> > > > > >       commit: f7baa9ccef93ba1c36a8ecf58c2f4e86fb3181b9  
> > > > > 
> > > > > Actually it's:
> > > > > 
> > > > >   f7baa9ccef93b ("backlight: mp3309c: Rename  pwm_apply_state() to pwm_apply_might_sleep()")
> > > > > 
> > > > > But don't bank on the commit ID staying the same.  
> > > > 
> > > > This is likely going to break the build on your branch because
> > > > pwm_apply_might_sleep() is only available in the PWM tree right now. In
> > > > any case, I've now pushed a commit that adds pwm_apply_state() back as a
> > > > compatibility stub, so it should be okay for you to drop this if you
> > > > run into problems. It's always possible that somebody else wants to add
> > > > a new caller of pwm_apply_state() and in retrospect we should've
> > > > probably done this from the start, at least as a transitional measure
> > > > for one or two cycles.
> > > >   
> > > 
> > > Hi Lee and Thierry,
> > > 
> > > I know that we're still on New Year vibes, so some things are not up to full
> > > steam for now; but since we're close to v6.7 release and v6.8 merge window,
> > > hence allow me to ask:
> > > 
> > > Stephen Rothwell is still complaining about backlight tree build failure
> > > due to f7baa9ccef93b, yet it has not been fixed so far. Has the culprit
> > > been dropped/reverted as he requested? The worst case is the culprit slips
> > > through and become part of backlight PR and Linus will likely not happy
> > > with the build regression (maybe he had to fix by himself).  
> > 
> > This should be fixed by 9a216587a03df, and on current linux-next I can't 
> > reproduce the problem any more (x86_64 allmodconfig).
> 
> Of course linux-next is fine, because I have fixed it up in there.
> 
> Here is the problem:  the backlight tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git#for-backlight-next)
> is broken when built in its own because of the above patch (which is
> commit f7baa9ccef93).  In linux-next, I have been merging the previous
> working version of the backlight tree (with head commit 7d84a63a39b7).
> The patch (commit f7baa9ccef93) can only be applied to the merge of the
> backlight tree and the pwm tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git#for-next)
> which is merged much later in the linux-next process.  If the backlight
> tree was merged by Linus before the pwm tree, it would break his build
> (and he would not be happy).  But the patch on the head of the
> backlight tree was made unnecessary by commit 9a216587a03d in the pwm
> tree.  So, please either revert commit f7baa9ccef93 in the backlight
> tree (or simply to a "git reset --hard HEAD^" there).  The patch of
> commit f7baa9ccef93 can be applied some time later (after Linus has
> merged both trees.

Works for me.

It is done!

-- 
Lee Jones [李琼斯]

