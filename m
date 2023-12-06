Return-Path: <linux-next+bounces-256-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F558807C9B
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 00:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78F0C1C20BD1
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 23:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C78A328C0;
	Wed,  6 Dec 2023 23:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll5yoxXa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11905328A2
	for <linux-next@vger.kernel.org>; Wed,  6 Dec 2023 23:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C76BC433C7;
	Wed,  6 Dec 2023 23:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701907189;
	bh=yrFJYJc0E6tGoZWu3ObI4Vq+ZOyLsfDkymwx3gl1DTo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ll5yoxXagqeawaFUdXpxpq83P17AkXfK3V2uDuUbcp8OPndtm4AwrEv27/VuRlENC
	 jTIvIXFkci2/aL29TqONgukcFr1WVByQkJ36TjYyblWW8pLTvcBazkfRFLtCw2ecNw
	 QEhwW553cntYLmRfavkExYznjkMTDIlbidgGYFbb0UAZROJn0avQpjFh2A34KeJxdM
	 w/tT/DULjbHuv2s/xUYwpassfX4bsbbrvz0p7kjOcGWcdqY3DggMYfBWudwsUR4rH5
	 VFREKfWAWIFrEN+yccJov53pcSye4UvilKtMigrIoZy2YfRyI0IkIVVcBjfVGMObyK
	 JQGMOMKR592JQ==
Message-ID: <87b4577efc5e0e0baf4fcc52d47404a6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <facc6759-b222-4912-9d78-deebecc977db@notapiano>
References: <facc6759-b222-4912-9d78-deebecc977db@notapiano>
Subject: Re: Adding SPMI tree to linux-next
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com, linux-next@vger.kernel.org
To: =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 06 Dec 2023 15:59:47 -0800
User-Agent: alot/0.10

Quoting N=C3=ADcolas F. R. A. Prado (2023-11-29 13:49:21)
> Hi Stephen,
>=20
> I've noticed your spmi-next [1] branch is not currently tracked by linux-=
next
> [2]. Could you please consider adding it?

I tried[3] but it didn't get added. Maybe it will work this time?

>=20
> There's a machine (MT8195 Tomato Chromebook) that relies on a fix from th=
at
> branch to reliably boot, and since the machine is hooked up to KernelCI t=
o run
> tests on top of linux-next, having the fix integrated into next would mak=
e the
> test results more useful, the machine's current upstream support easily
> verifiable and regressions detectable.
>=20
> Thanks,
> N=C3=ADcolas
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git/log/?h=
=3Dspmi-next
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/d=
iff/Next/Trees

[3] https://lore.kernel.org/r/fb12cab33d27c582125a22390e9c3b12.sboyd@kernel=
.org/

