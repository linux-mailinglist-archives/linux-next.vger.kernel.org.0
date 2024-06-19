Return-Path: <linux-next+bounces-2603-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D32590F512
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 19:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F10A028181D
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 17:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145E1155C8B;
	Wed, 19 Jun 2024 17:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5Cmp0T+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9622155C8A;
	Wed, 19 Jun 2024 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718818146; cv=none; b=To4fJHo3E9gaTvhJdTcUD1zI0o2UvoEbxs73LIkCEI/dF7xyKFqHWE1Cs8vL6iJDt0czyEetNXipohoZncnbRdKA4lSHm5raWZszTSNmNiv1643tgC49kO5x9MFKQqSq+XFpXSewlsyXrli0+87lnMFBWGTKpB3WquZxWoIddZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718818146; c=relaxed/simple;
	bh=tBeamOhapV1R4M0iwNrEfIo2niOeYuZL8rhIms65wSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVhHHtWWOd/OdOe1w2ikT1k+IiCmQGnBTVZ2aiUBlLFbWB3mSbtpRoX7eKo7vqwyQMQEuZdxEw1h1+vtpzl249BrNb32yVg+Fl5kMTfL1bYbNN5lElxn932ueYgRmTX6bYiORTVx+lmiVWiKGoQw7Ftfb8XRLJGt7w91c5gqyPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5Cmp0T+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FE0C2BBFC;
	Wed, 19 Jun 2024 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718818145;
	bh=tBeamOhapV1R4M0iwNrEfIo2niOeYuZL8rhIms65wSw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=c5Cmp0T+qo48U/JPO+MKoKEGId8QIXPFYwdRL1hF7qRVVz2K+sYNxqyQxxGBW2eBc
	 +U+9aElf8xNNmSkXXBj+ccZXYGDmt7oGRUf4aa0xcTw7eDBOjIXfIHu9G5aMm2NIXN
	 s8HCz9H3TN1rArYxKOex/CXqQL3xH/BjM4+WvFrIXxcb0dyM+qeRrYOhKObqI3kIMM
	 Ys0ufXwpyVfOmtQOv6E9PHXVr2bqvM1+8r07Wty61JN5g7n2ktbCCyISBbzVeiUWdD
	 0RtZs3XRiXi+Dxt1eyYvVysdFrhfcNQC8guBqRl30ecARRLG9gwvEsBIPq+fEC7p1u
	 CRz56Z5sWLJ1Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0B7BBCE09D8; Wed, 19 Jun 2024 10:29:05 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:29:05 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the paulmck tree
Message-ID: <f43a87ab-4540-4629-a1fb-4076ef49e4d8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <ZnLh6tnEtBgi-hWi@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnLh6tnEtBgi-hWi@sirena.org.uk>

On Wed, Jun 19, 2024 at 02:49:30PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the paulmck tree, today's linux-next build (arm64
> defconfig) failed like this:
> 
> /tmp/next/build/kernel/time/clocksource.c: In function '__clocksource_update_freq_scale':
> /tmp/next/build/kernel/time/clocksource.c:136:25: error: 'CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US' undeclared (first use in this function)
>   136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/kernel/time/clocksource.c:136:25: note: in definition of macro 'MAX_SKEW_USEC'
>   136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/kernel/time/clocksource.c:1167:50: note: in expansion of macro 'WATCHDOG_MAX_SKEW'
>  1167 |                 if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
>       |                                                  ^~~~~~~~~~~~~~~~~
> /tmp/next/build/kernel/time/clocksource.c:136:25: note: each undeclared identifier is reported only once for each function it appears in
>   136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/kernel/time/clocksource.c:136:25: note: in definition of macro 'MAX_SKEW_USEC'
>   136 | #define MAX_SKEW_USEC   CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /tmp/next/build/kernel/time/clocksource.c:1167:50: note: in expansion of macro 'WATCHDOG_MAX_SKEW'
>  1167 |                 if (cs->uncertainty_margin < 2 * WATCHDOG_MAX_SKEW)
>       |                                                  ^~~~~~~~~~~~~~~~~
> 
> 
> Caused by commit
> 
>   5800c05045dbfe ("clocksource: Take advantage of always-defined CLOCKSOURCE_WATCHDOG_MAX_SKEW_US")
> 
> I have used the tree from yesterday instead.

And that commit looked so good!  ;-)

Thank you for catching this.  I have dropped that commit.  I missed that
WATCHDOG_MAX_SKEW is used even when the clocksource watchdog is not
enabled.  :-/

							Thanx, Paul

