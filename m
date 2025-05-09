Return-Path: <linux-next+bounces-6648-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E4AAB1775
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 16:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443341C45F4F
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 14:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980E321ADB4;
	Fri,  9 May 2025 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hf/65QZk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB3321ABB3;
	Fri,  9 May 2025 14:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800991; cv=none; b=ZelwNm24Nq+t7e8WCoi9M2kmbfsI6pbNu+KIVyUN6y7GTfkc3B6wLLiBiSCOrUsQVHrRurGCTP45fAnBmI6Uce53jmHXyFtja0mNAhd90hTQ2RUY21KrfOo00vZ+LEK7UobjI5GYR5PX6fdoDNrFKXGo1Y9rEhj7KLulfJ418AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800991; c=relaxed/simple;
	bh=hCpsmv275HP5/aRH2UewqRLavvTOvDm0DnZfYSdwUqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uw3O2XhPoS1656m8YTKGD9MNnKg4DbsyGlPstZrUVtt9xyKH8Yy2DU/URo6duM5eLtl04JXuvuSd0FGcNldFqZXqRc1f9m2kwp9B6mk7cjPbX6DyKU4uIMgwR6zRpPwSW86dZvisk3/YntzeP+C8D5/zuQVkq4v6pF760X+n2GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hf/65QZk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A1EC4CEE4;
	Fri,  9 May 2025 14:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800990;
	bh=hCpsmv275HP5/aRH2UewqRLavvTOvDm0DnZfYSdwUqc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hf/65QZkELMwtvZ5hghLriehO3cvcjD/L1vjosRLjgQgWn3+bShC9kYPGRrI+LSxX
	 QBVBDd096OmwbmDEsLyVm2taNgaWXijiCsGWW/e4dDJOcLnA497wfw0FAUS1p4+ZFC
	 w5ptwZqZJMmy8TsjwnMiN2qQ3xkb2psc/X90klcmBbJ/tgGAl1gN/usXZsmWm5B9AR
	 0H0J709ti0yNsTVEoeB0vk/qTslEtTpQVPfACdpAOhQl8xo/BPu/FY6bR5eiRUWwm9
	 fZ8JvGcT6FiQjcubgNYnsGjYG7hdP4h48iOy9bBtoPL9b6kZCYFqmTdVNHR++C1br7
	 HCMXnJzIvFbRQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7BE27CE083E; Fri,  9 May 2025 07:29:50 -0700 (PDT)
Date: Fri, 9 May 2025 07:29:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG] Lockdep warning from "genirq/cpuhotplug: Convert to lock
 guards"
Message-ID: <79f13909-71b2-4f48-af38-3c3dc8c7c419@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <a6f59b64-1604-4186-8a75-8ad776974a65@paulmck-laptop>
 <87plgil3da.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plgil3da.ffs@tglx>

On Fri, May 09, 2025 at 08:12:01AM +0200, Thomas Gleixner wrote:
> On Thu, May 08 2025 at 15:29, Paul E. McKenney wrote:
> > Testing next-20250508 with lockdep enabled got a splat that is shown in
> > all its glory below.  Reverting this commit makes the problem go away:
> >
> > 88a4df117ad6 ("genirq/cpuhotplug: Convert to lock guards")
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core

Very good, thank you, and feel free to add my Tested-by, though it
appears to already be set in stone.

							Thanx, Paul

