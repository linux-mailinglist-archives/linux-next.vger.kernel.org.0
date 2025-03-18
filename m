Return-Path: <linux-next+bounces-5868-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6FA680AB
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 00:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B06E882B02
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 23:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45697207DE0;
	Tue, 18 Mar 2025 23:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="VTShvNqV"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C061E207A2C;
	Tue, 18 Mar 2025 23:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742340305; cv=none; b=SxVK31Q5GZ6MCWntGrOS9JlJeRT9F4kHWTyTJlZZpCp4LKFn8ZhlrzchOxm3Pa+KNA8YlQ/OoKmZX5K7wAFi2jNrhJe0RXASVdv/cmw+S/XFf8y1FdHhNiSHAQZNFZoa/kKV2e0Awc5aqknowEVud2X6vnUtiUgLnPIDL71C5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742340305; c=relaxed/simple;
	bh=NRLfJq/FwMd6niXNpvpBrOxMUtdzwrzlNuHtInGfMZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iuz5NJhCYhd1SqDEZxhz+lgO8rw5qLvOkZcLuVz9wkBWoZ9+ectVH4Qf9r3fsXRJJxFKgkS/9Wh1Jm2RazOPfP+m+eOa5KPQnKKwO95eP/dLTURHeVEot0EY2DnxsF4vW3WS596PI+ptrHq5fRfB0sEtay3fSJfRiQ/M5Bdfv6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=VTShvNqV; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uHyHzilSWbC+UBLudukfiL/DOAeWEd7pFysVQd2Jiqk=; b=VTShvNqVa77P/1cqSlIODlnTHr
	Bx4G39CZ8ignG9l+7vyEaKdOLpAeQ8BmHg5Mwm4cvky5/8NNamJ7mcANtct3kA9RLqeNe1kt/ZZ2c
	WYCU+EldRwhbYQNQpmbbWFm8ncPK3SC4zFBREzjueTTHrzhugjNHyglEAJlGy90wnpGbEG35lV3aq
	XmTel4MfmTOYMHxBN1XNfBq2RR34EvsSpNOo7hsfWNs3GGiAhzoe9V9jXMmLmhTjySYUJAdK+Ps9i
	f9ch8EiJE3iFL/0Tl6mp6q7iJrI6SLn7LbHwZkMuCj2KTqI6CmPWJYNZI/h2rWJHYhqYd1D+V4aIr
	TlDMhK6Q==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tugIf-0004Fw-HS; Wed, 19 Mar 2025 00:24:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org,
	sfr@canb.auug.org.au,
	linux-next@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"
Date: Wed, 19 Mar 2025 00:24:41 +0100
Message-ID: <174234022088.1144821.1552001262318084726.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317230705.932808-1-heiko@sntech.de>
References: <20250317230705.932808-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Mar 2025 00:07:05 +0100, Heiko Stuebner wrote:
> This reverts commit 19a634195c1abe498798b564cd6b81e6dd4533f7.
> 
> The dt-binding addition adds the compatible to a syscon (a mfd) and should
> go through the mfd tree. And it did, and is part of the mfd tree for 6.15
> as commit 7f3e3e7228bb ("dt-bindings: mfd: syscon: Add rk3528 QoS register
> compatible"), with all the correct Signed-off-by lines.
> 
> [...]

Applied, thanks!

[1/1] Revert "dt-bindings: mfd: syscon: Add rk3528 QoS register compatible"
      commit: cee24bc73d4f3f47344a1a54100a69c72f1db061

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

