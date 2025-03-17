Return-Path: <linux-next+bounces-5842-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2BA66216
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 23:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CB113B5DAD
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 22:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD51200111;
	Mon, 17 Mar 2025 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RB6/jLur"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751C1EEA20;
	Mon, 17 Mar 2025 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742251915; cv=none; b=oYTaUjVkG5nGSL2UuNiMrU3/ylObCx7aKArySAvA1n/imlsATW3VUx/B24G2mS0ZOTacP7GIBmU0qjt4ZlH7PdiYLS3DvMP3l9/CDyUgezaqu7ICbOsWhKnqzaKbby3ROpTaVfJLhHk7ua2z1W80DT7m5LqltxhGFJC72yQHr1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742251915; c=relaxed/simple;
	bh=fYKi21bxCa8ZrGfrGQnP5SrX94dLJholFlCybWT7dAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QIhwBKq+GLYAKUhqyZuqQbg+h85+D3h1Qdp/XewBoaHjrDuEyjJ2XvMB4WWL3pP+HuXL/YMEzMVRP/HAinkjy1qNWJ6t9UTEVOIOAe6of2UVzbUB3dtn/j59ROeJUiZsQFThrQ/c/akPO/Fzyw+7kN7weh6DPDG6aeTU/Wbjddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RB6/jLur; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=wfy9ddRBbcX+tfTfmNOPuCaIiuAFuC2ZDzW9lWqaDig=; b=RB6/jLurPbaj8MZuXj01Xq8uQd
	2FUBKMC5YjsUBEoMRmzup+qDFD80kc6Gjx7bDpI7gBYxg+AFRv5xz/oyY7wX7LvS3emTqldnqvLMT
	DW0XGvlUStAxx1Nm8A8n4FIL/n04UoxzIy6SeA8hzoqb5iOBVslsnOrSRGDqMQpvRDELFljwRkCRz
	MFwO9edVmY4H89FZLF1ScUhpiN4xHV+09ELaN2xOYI0vBvXgACVbK7Spa6bPybb3dpnppI5K2fnjD
	y0sE4V2irR0+v6mcxqcEdL8rlcnVkLXrtdIx7Wqh7rlRLGxH5+6yNeZsoNJgSMDJ0iZL1eNXCK0Ah
	z0a+Tvpg==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tuJJ0-0001UR-Bx; Mon, 17 Mar 2025 23:51:34 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Lee Jones <lee@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Date: Mon, 17 Mar 2025 23:51:33 +0100
Message-ID: <5872617.DvuYhMxLoT@diego>
In-Reply-To: <20250317144507.0938757b@canb.auug.org.au>
References: <20250317144507.0938757b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Stephen, Lee,

Am Montag, 17. M=C3=A4rz 2025, 04:45:07 MEZ schrieb Stephen Rothwell:
> Hi all,
>=20
> The following commit is also in the rockchip tree as a different commit
> (but the same patch):
>=20
>   7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register compat=
ible")
>=20
> This is commit
>=20
>   19a634195c1a ("dt-bindings: mfd: syscon: Add rk3528 QoS register compat=
ible")
>=20
> in the rockchip tree.

dang, sorry about that.

With the qos compatible being a syscon, this _should_ go through the mfd
tree with Lee's Signed-off-by ... that it got in 7f3e3e7228bb .

I'm not sure how I managed to mess that up :-S .

In any case, as the commit 19a634195c1a already made its way from my tree
to the soc-tree [0], I'll create a revert so that this is fixed before the
merge-window.


Sorry for the mess and thanks for noticing
Heiko


[0] https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/=
?h=3Dfor-next&id=3D19a634195c1a



