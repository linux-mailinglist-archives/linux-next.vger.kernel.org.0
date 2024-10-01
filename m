Return-Path: <linux-next+bounces-4038-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4F698B77E
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 10:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B9031C21C07
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42ED19FA8E;
	Tue,  1 Oct 2024 08:47:05 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD01D19FA86
	for <linux-next@vger.kernel.org>; Tue,  1 Oct 2024 08:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772425; cv=none; b=GOjuQnd9CuOUCXqLrguMt0sOYmLmoLzIWMAqQdi9k18UE7pLBkPcITYfSVTC3lgN5cfc5POgMrSzNNabtcbmW/7DkOCBrC8jar/Sqpy9bUu4xR/CpNcQTrjhSMkAHDobYwAr1NlBAlZ+zhtAD+2Vu1HyX7xsthz+VUn4PTnBbyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772425; c=relaxed/simple;
	bh=/fXMwGVaahBsSaPXpcYDcv3WCPF7fsy9WoyEQYI7PTg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fj1akPQFuUQwdRqp/3b/YLWkpWjPG3aPd9XF9Ca+8HY5XZWD5uQBUVNtL3ttOLH7lV+3cNY9udGVwksYByOnh/OXHPKbLjfQZwY4UYUrv3CT2ZUDS7nAqkQ4zYYyePMw/iFgT7B8w9wlIeOrbfF6OU1bdJuHnGMUJtMdMTXZK94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svYX3-0002EJ-4S; Tue, 01 Oct 2024 10:46:57 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svYX2-002pqT-75; Tue, 01 Oct 2024 10:46:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1svYX2-000283-0W;
	Tue, 01 Oct 2024 10:46:56 +0200
Message-ID: <e9e2f114dd4051e59071768de814a1908f8a207e.camel@pengutronix.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the reset tree
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
	Mailing List <linux-next@vger.kernel.org>
Date: Tue, 01 Oct 2024 10:46:56 +0200
In-Reply-To: <20241001074106.2a545de5@canb.auug.org.au>
References: <20241001074106.2a545de5@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org

On Di, 2024-10-01 at 07:41 +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commits
>=20
>   5b93105afcdc ("reset: amlogic: add auxiliary reset driver support")
>   e66eebb88564 ("reset: amlogic: split the device core and platform probe=
")
>   33e712a6dfc9 ("reset: amlogic: move drivers to a dedicated directory")
>   2941bb7a8c43 ("reset: amlogic: add reset status support")
>   85873c151943 ("reset: amlogic: use reset number instead of register cou=
nt")
>   1392f6d3692b ("reset: amlogic: add driver parameters")
>   45d73c01b0a3 ("reset: amlogic: make parameters unsigned")
>   49ae3e0e55f5 ("reset: amlogic: use generic data matching function")
>   ac1bc5f19401 ("reset: amlogic: convert driver to regmap")
>=20
> are missing a Signed-off-by from their committer.

Thank you, fixed in reset/next.

regards
Philipp

