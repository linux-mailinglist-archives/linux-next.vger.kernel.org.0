Return-Path: <linux-next+bounces-3219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E50FF9463AA
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 21:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48801F22799
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 19:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678E047F64;
	Fri,  2 Aug 2024 19:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJcfkHWO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFE015AC4;
	Fri,  2 Aug 2024 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626481; cv=none; b=KyU93UvJSeTooeZpQs6V+y4zHSJRBlK8C8fugQBGhaDndCAdb2y2APHF37owCk729d2whLaTRXOKGQEgYsAUnWDXKHrd3kJHH12Le4BJGXZ4iRqlYpP+4/wVw/WNlbvNx7BowDbOjRUp0UsVB2PHj3QkkPybcSrXXyuih3QK2NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626481; c=relaxed/simple;
	bh=Yr9GYn+TKVFVrSGiZk+aTm5JRAvZ4W9DGzOvv0k4zsE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nTBKZjGdFm7QzVll31BX9XmnRD8DBXOPrpkOT+PPpw3XE5UUM9qxtMO/bhU1jS753AMA+i20VPu1N8Fx0qWf+SxLGUoYVOiJoSoB0ZkoMcdDupg7kUpFyVLVOMO0q6AV1JKouOOC61vJDizj7C37ZBeR7YFfkHuYezGjBaLEKrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJcfkHWO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA1EC32782;
	Fri,  2 Aug 2024 19:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722626480;
	bh=Yr9GYn+TKVFVrSGiZk+aTm5JRAvZ4W9DGzOvv0k4zsE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=lJcfkHWO5zzWGUFHipzo+oz7awUTnijt0Cv78NJ3x27FUKH+HNe5zCM0oD3h0vPgY
	 axWJOIVSE+iUa3/7MD8kMYKnG3HvsaQPuzCzsdmnmVb8yBwpSGCYk89lkLh/gXuTmm
	 76dNegXalfMpWfp/mwvV2D0m5GJOG+m9+DlNstTuDozvsyz3v/Em1KJuTc1sy0VsVo
	 nYVG7kZHw6YHkQqO9y2IYZF7oBG35m1Ko8K9gdBkKMD18njU6Y/eIi3gvOIfeygNN3
	 Pli6zrNVrxENOUOE5lVfw/pWm2zHTsoGoTgy+Swe/xPqwCfwdrSu+VANFvSQpEeaom
	 s77SznEjrRqOg==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Aug 2024 22:21:16 +0300
Message-Id: <D35O4EG1W2WO.14S0DMFFNLDME@kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tpmdd tree
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>, "Stephen Rothwell"
 <sfr@canb.auug.org.au>
X-Mailer: aerc 0.17.0
References: <20240802090234.2acf4c25@canb.auug.org.au>
 <D35MCFF29VT4.2JGEENK5HO6WU@iki.fi>
In-Reply-To: <D35MCFF29VT4.2JGEENK5HO6WU@iki.fi>

On Fri Aug 2, 2024 at 8:57 PM EEST, Jarkko Sakkinen wrote:
> On Fri Aug 2, 2024 at 2:02 AM EEST, Stephen Rothwell wrote:
> > Hi all,
> >
> > Commit
> >
> >   f6554cbf56be ("KEYS: Remove unused declarations")
> >
> > is missing a Signed-off-by from its committer.
>
> Will fix, sorry I came from holidays this week and mbsync failed me.
> Did a lot of stuff yesterday when I got it finally working (tried
> to be careful but shit happens).
>
> [1] https://bugzilla.redhat.com/show_bug.cgi?id=3D2302132
>
> BR, Jarkko

Should be fixed now.

BR, Jarkko

