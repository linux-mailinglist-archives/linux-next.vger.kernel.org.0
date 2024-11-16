Return-Path: <linux-next+bounces-4794-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C7F9CFBE6
	for <lists+linux-next@lfdr.de>; Sat, 16 Nov 2024 01:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A10BC1F23233
	for <lists+linux-next@lfdr.de>; Sat, 16 Nov 2024 00:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F836FB0;
	Sat, 16 Nov 2024 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQvHUPWi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748B6161;
	Sat, 16 Nov 2024 00:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731718779; cv=none; b=TSRQeIPaqWdMTqz6bv1fWmdyTB84SU4ZmiSPow56c2RSfBUkGFU8XfzkJe8UcKhHufKoacSCoOai8E7qmjSGcVbWE0dySYbz4p9mBoPbg4W14zfzPbLbHq1GDt1IoYeUx+nGgK/G6/NtnCpDP2yXSPcVmc/A+d0HPm736tVuDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731718779; c=relaxed/simple;
	bh=I0VslumfgKdekW8XDklNd2dJRtcj2IWDvMv+cfLhBGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlMflTm77Elx9aTOB1P5jOW3/glbyA8S8NBIPPTfottYfwmOUiouBKPiTUE/uM6nwoHhhgDrp9zT7w4D7V8DPwJraGu1O3SsttZe2e0H3xcB7jvHKtcp0Lt8i/tUBUm6o3LiYNQ1WUAkMLbJmdjixYIWZXM5Dgg3kfX5wowqUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQvHUPWi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63932C4CECF;
	Sat, 16 Nov 2024 00:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731718778;
	bh=I0VslumfgKdekW8XDklNd2dJRtcj2IWDvMv+cfLhBGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQvHUPWit+YYwo6ISi9Oa4lIH7ppZGbmBFsoORIEJ5mJBARtv1Xn34ixiM6Pivk0R
	 uSC/6J8xOaeuwSoP0Jdznb2AbD4BspunmQNVbpQNqcVOffgQxt3ZxQl6CTJdO6vErs
	 /v33gTdnIp/6YHbWrt5AHPDY6mx9h/o9LmiZkBD2x4RVRKOUJL7xUKDyaj/lre//VJ
	 H7hzyUIcge50F6h+NRnzCKiusI7dIefNyyFiubx9wYO/a0Hijw7Vg2XJ1t99TMJOKn
	 mrtiJ27krGPU2MTrXuGQCk21jE4cn4rkBTyru5IttYkTSEasFwjJ/RbnHCyyB90Ned
	 dNkIxEglxRnnQ==
Date: Fri, 15 Nov 2024 17:59:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: syzbot <syzbot+a521f132f5a83d10ab40@syzkaller.appspotmail.com>
Cc: apparmor@lists.ubuntu.com, jmorris@namei.org,
	john.johansen@canonical.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, linux-security-module@vger.kernel.org,
	paul@paul-moore.com, serge@hallyn.com, sfr@canb.auug.org.au,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] linux-next build error (18)
Message-ID: <20241116005935.GA1180844@thelio-3990X>
References: <67371529.050a0220.1324f8.00a4.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67371529.050a0220.1324f8.00a4.GAE@google.com>

On Fri, Nov 15, 2024 at 01:32:25AM -0800, syzbot wrote:
> syzbot found the following issue on:
> 
> HEAD commit:    744cf71b8bdf Add linux-next specific files for 20241115
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10525cc0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ada879778ea11d6f
> dashboard link: https://syzkaller.appspot.com/bug?extid=a521f132f5a83d10ab40
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+a521f132f5a83d10ab40@syzkaller.appspotmail.com
> 
> security/apparmor/domain.c:695:3: error: expected expression
> security/apparmor/domain.c:697:3: error: use of undeclared identifier 'new_profile'
> security/apparmor/domain.c:699:8: error: use of undeclared identifier 'new_profile'
> security/apparmor/domain.c:704:11: error: use of undeclared identifier 'new_profile'

I sent a patch for this earlier this week but it does not look like it
has been picked up yet:

https://lore.kernel.org/20241111-apparmor-fix-label-declaration-warning-v1-1-adb64ab6482b@kernel.org/

Cheers,
Nathan

