Return-Path: <linux-next+bounces-6746-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DBCAB5A85
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 18:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F08716395E
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 16:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE94F1A76DA;
	Tue, 13 May 2025 16:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="IVG134Ug"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC8946B8;
	Tue, 13 May 2025 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154917; cv=none; b=aSffaEFUdXoqjyk+r1qo2NPuO5DX/3smhEnTTHIYOzs7oPIsuKV5mIZgW9UvhGcSGQOvhkZRDozUOXl+x6PwXOUJzi4aH2kZ3V2sDrBjldQaIic3tX2SIL9mZm5E1I6WE8wh2KrNRAry9HPX1jOttOGlkFG+6SIPfO14/PqFfds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154917; c=relaxed/simple;
	bh=aEJswIepQo5GtmjeVR5yL0vVYawkMK4RHTOo1GRwF38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZ6mop2hdd4KMkEuIop2pCDjnsre9gRGWHzR7bqlZimQV00lH/wWEU+UGu4p8OIIrgpGggBxeVwbHC8omUvexoE8dDiV1VhUKfxdeYwWfuvFZJoQQVXVjihD0lEll7eniyo7DmOPcRK4kFLLL9OzFHSCnJwKqYNFOHn6Zj3Gtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=IVG134Ug; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747154889; x=1747759689; i=spasswolf@web.de;
	bh=aEJswIepQo5GtmjeVR5yL0vVYawkMK4RHTOo1GRwF38=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IVG134UgPKvLGrsUta8mEAUGBPGJkSn7T9ZXojl2GPfftsMoyTx0JSCJlrU1Hyg6
	 kQgNEMriXr8rG9cfkcfxv0tIn9uwUgTH+Xu/hKTDxQYhyHrSTOBjGFGajXO1OGE/6
	 zog7FWBchcAtWRiT2ARoPKE7uz/OL0GQg8bNRyxBBC9Eu6LRk4ue/KPBju96ahCvx
	 efHM7ryT6+gmuH/5n9T+a9a/28p+1dIBt7mqkgayEWPTxeax+TSUf5QOH0/2KFTHH
	 2ZOVmDfKna5qrvVEaok7mB0fouv4cOUr6KwLBuWoT7IFZuVn3McYYtha77eYthErO
	 yfl7lW00YnkZ5gyUVg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MREzA-1ubtIj1wd2-00JvCx; Tue, 13 May 2025 18:48:09 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-next@vger.kernel.org,
	llvm@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when compiled with clang
Date: Tue, 13 May 2025 18:48:04 +0200
Message-ID: <20250513164807.51780-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: 20250513101912.58056-1-spasswolf@web.de
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zv8+gy7mTdVJl15MxdX4sL9WGdUY/zbfyG6HYqg09Tw8hpLcLX2
 dsP8PyDFSUM6bWKRC5TdBTSGhTkigJOFWANI+MAq4nqSLdk4IFumDWDezet6RM365ZLbZCH
 oRMcsdl3TdpTt4rJVUFTlL/u+dmn3SHCBdKzaJk0JT73yqpMJ0GCAOHhQrcH3NeWKzLqqVr
 ffK7P9an+0Z2sJmnV86BQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gi1SpdleASw=;7+28aE3MJiMF+90mNdY1GirbARH
 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
 NFUbrAH6wlff8=

>=20
> I'll now start a bisection where I revert 76a853f86c97 where possible in
> order to find the remaining bugs.
>

The second bisection (from v6.15-rc6 to next-20250512) is finished now:

This commit leads to lockups and kernel panics after
watching ~5-10min of a youtube video while compiling a kernel,
reverting it in next-20250512 is possible:
76a853f86c97 ("wifi: free SKBTX_WIFI_STATUS skb tx_flags flag")
This commit leads to the boot failure, reverting leads to the
compile error it is supposed to fix:
97f4b999e0c8 ("genirq: Use scoped_guard() to shut clang up")

So are these kernel bugs or a clang bugs?

Bert Karwatzki


