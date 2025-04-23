Return-Path: <linux-next+bounces-6361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2259A98C9E
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 16:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DDBD445D66
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 14:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA8D238C39;
	Wed, 23 Apr 2025 14:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUPBRZga"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456927CCD4;
	Wed, 23 Apr 2025 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745417897; cv=none; b=GeCbEQDeYjieFehu6Qj3tnAxf7gHNGKFcHXOIsOosjIY/Ng4sGBZ5LaVSVDMy419msjrBpOuTUB7RSUeFr5B1/2GBpczyrseLP7vUQSNX64zoTcnqHiANAKhXZyIirMAI/5k4DYSa23TCy5jEObfXB6fX3LxPI76KepyIgRJGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745417897; c=relaxed/simple;
	bh=7aKM+auJAcCA4EwMJlrxXFyhWFOU+ZvyqtXYQRJElw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RlL7sQl+ICKQB0WLRLkaNIq/XPBAZzZ3KdBdzkEr2vNN4h4kpGzp8L8dTgblhvn7GbSPhel9d8xftMIERiJn9veYfPHLGCv/NHTSFkEafby4Kh048kF/3c2KD0kT1ITZt91kiGNbNrdp9oyrDoe4d2OA23OiJcr1D/oKGG6oJF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUPBRZga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D5EC4CEE2;
	Wed, 23 Apr 2025 14:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745417895;
	bh=7aKM+auJAcCA4EwMJlrxXFyhWFOU+ZvyqtXYQRJElw8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=VUPBRZgaVTUVw8N8jw2czHw2ITJ1jsFrSgFh29oJQLY0SBp4sqPV5HzaieeT/OI0j
	 uZ69O1JXRZBjvDeFuGDYgVuK7Mxc9BLSN47aW6tE7mHLeK4rVSgQU9f3njrlPMtH5E
	 rJVWMHYlx8Lip3HhTFwE8ZRmWwwCu26xBB/2hrysMZgGfM9hFmOW31GB79eEXe/kTF
	 +QRn9Bwu/zbMGI3TMErtar0I+I/rnCIWu7swRUeLUdQRF0+p0ddcLPc4l/joIiBdtC
	 050OQeeq+XXzBVdjWWy9pHeyMG9LWQxmihMStG6MWGwO2m6QL3dbagf22r9YEpD9qo
	 9kEc0ZNrruMbQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A8080CE0B75; Wed, 23 Apr 2025 07:18:14 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:18:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
Message-ID: <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250423115409.3425-1-spasswolf@web.de>
 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>

On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop runnning
> > debian sid. When booting kernel message appear on screen but no messages from
> > init (systemd). There are also no logs written even thought emergency sync
> > via magic sysrq works (a message is printed on screen), presumably because
> > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) and found
> > commit dd4cf8c9e1f4 as the first bad commit.
> > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> 
> 
> Hello,
> 
> On AMD platform as well boot failed starting next-20250422, bisecting the
> issue led me to same commit dd4cf8c9e1f4. I have attached kernel config and
> logs.

Thank you all for the bisection and the report!

Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
Force re-initialization when rate-limiting re-enabled"):

13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")

Then please apply the patch shown below, and let me know what happens?
(Yes, I should have split that commit up...)

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index 04f16b8e24575..13ed636642270 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	unsigned long flags;
 	int ret;
 
-	if (!interval || !burst)
+	if (interval <= 0 || burst <= 0)
 		return 1;
 
 	/*

