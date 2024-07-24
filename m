Return-Path: <linux-next+bounces-3124-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8993B79A
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 21:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E048C1F23CEB
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 19:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A2E16A95B;
	Wed, 24 Jul 2024 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWPSIGSC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EAF613D;
	Wed, 24 Jul 2024 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721849617; cv=none; b=YHpOMR6Dk+ISzTYYk5C5guodKO6dv7SmoAev9CuYOds+I+gngAf/PvXAGHB9f8rk01NvMLVYlstRCl+ABg4mTmy4mCccIuLChlpufDjbLaeHCytTHL+ymc/UVSCZoaWzKaB7752c++ZHI9zNAyxaRtxyThgHPggOEfyBPqrMqI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721849617; c=relaxed/simple;
	bh=R4NLPn8NBwnLCJybS1lD7/FgK1hwRSr07WyDtc1YZfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1/SnCIr3Paw1vOUThZl5bM60EJ73NKCdKG4k1/STIOsKFPN8bSPIG647BLA5VTmtUHOuXY1jzEFQxyCC+XYyoZV4FEPulK7Qa7VgH/2pzyrf4yosWsEfkoi4M+i+NC4eZxIp4xvzwastFxDHQM9bBKNljniPtiCA4acu9uXdS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWPSIGSC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CB1C32781;
	Wed, 24 Jul 2024 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721849616;
	bh=R4NLPn8NBwnLCJybS1lD7/FgK1hwRSr07WyDtc1YZfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWPSIGSCBW252BaHkWn3RBDZykaZAvKONjuDaP9a3CxSas1ZKbU8bLqySeQKeqjnc
	 S9J+GfQhfqdEypCW04f13LFSsqutenQpsxa27dlGpZrBNh3n1XaP9Wz9dW/ldtX6bZ
	 M9b2I3EYKv4lKpzKSjeJCjD/6Gsz+osHrIgjZKS24vXjXq6CRnQN4mVoFSJWVkz3+Z
	 dqjZS2Qe/D+qE/8tOJdf+vttttl0EQySb/fEx6MNVWOPymO2J8EmyYQov1C5JstcEI
	 c+xNEpHdr6hBKuaqdLWX6UQqj0CwTILBPrwGK+sJB+a7sZ4fJ9ZZTHW2I4scxSxEKz
	 mJZFvBlS2+mpw==
Date: Wed, 24 Jul 2024 21:33:33 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: syzbot <syzbot+198e5d62f814bce1e600@syzkaller.appspotmail.com>
Cc: anna-maria@linutronix.de, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, sfr@canb.auug.org.au,
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 tmigr_cpu_prepare
Message-ID: <ZqFXDRkPpX_laEIC@pavilion.home>
References: <0000000000002bbff4061e021f01@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0000000000002bbff4061e021f01@google.com>

Le Wed, Jul 24, 2024 at 11:05:21AM -0700, syzbot a écrit :
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2347b4c79f5e Add linux-next specific files for 20240723

Thanks for the report, this should be fixed in next-20240724.

Thanks!

