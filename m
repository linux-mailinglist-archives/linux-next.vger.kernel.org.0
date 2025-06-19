Return-Path: <linux-next+bounces-7183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86365AE0A44
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 17:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC183A6CF7
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 15:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CB0221286;
	Thu, 19 Jun 2025 15:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="npowBuEh"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6C27494;
	Thu, 19 Jun 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346560; cv=none; b=HYzyAJpV/rdIyWWxAG5pOjkWYqTWFsRguBeqczU0PYH5L2QkmFhsHUEVvXd2LbZxmPSS9U8NxuCMebTqD/1/5MVy2FOOMkqF/0VZhKtpHgHOmHoYKi+yc/h5Nrk1hnILGDtqqOKQWj2c0ZuB4hS9oDxAiRLZmiSxyJY+4pHbBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346560; c=relaxed/simple;
	bh=7FXzHMHu6/S4aq8g950brYFPGQxuWBxluZclLGDr16U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQFMIt85Xrti+TqVDf3APcz233CeMTGCTOib0iGZTpbt7uuNsRN3jhUr9qLxqVh8DiA17rO3FJ3r35kvT3+vyC5C0YcGt5q358neBDHC7TKcyrNB5xVxypL053tqEpq6IlwnYqxz23da/bPhIyzxNlQhBR8228vDZW5n99itAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=npowBuEh; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750346538; x=1750951338; i=spasswolf@web.de;
	bh=7FXzHMHu6/S4aq8g950brYFPGQxuWBxluZclLGDr16U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=npowBuEh4j2166ewWxxxU1UP4eJJCdQx013TNrSWFvfoxMl6buspegy+7dvQsbho
	 gXqZRZ3uBzfR9q9kCQdIRzocy1weyh+asynU6XNhzzs8ciD6IUVxjN6Ng9R770ICp
	 fU+gsHsUNkO+r69aIBXf719p9idLvfbAETpz8WRGl/WECiQ5wahNQYA9SgA4mz5vK
	 ZQxftt6AVYmN7CwsHW8djPo2J30am7ZZJPcXE0esOxTrJNP8MItj1v2LKeyGYwRfR
	 JtzKJeKjvpOW+Q81u0mkHIEqXD5tZ2+HwXZAVrKKjFwxFvzIKEwFMWNFMMqYnK2h1
	 GpjZa/3h2rkFkI75tw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MdwJO-1v13wi14ti-00ov4K; Thu, 19 Jun 2025 17:22:18 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Joel Granados <joel.granados@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: register_syctl_init error in linux-next-20250612
Date: Thu, 19 Jun 2025 17:22:15 +0200
Message-ID: <20250619152217.3450-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: 11898dd756020687c2016a37af3c948b350bdbbc.camel@web.de
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:I6drH2iN2bpLiv8pX9dI87SltepBrVjv0SgJ4I6o7BNGCTXLbs1
 y+PgMa3YGTb987d8xavvMG3D+zcW5Qbchd9yJgbkiY3N/M5S0JO53nLC8EohLY1eonY8N/8
 YTOYE+GCz8NcKKTjOig6B2XRjb++umKMthQ9POKc53gv3RwIk1mXq3YBJRbH1gld8iNU5E6
 hk7TKOU9VKyUMq+wegABg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+ddzEgqYmS4=;uVUZEus7uBaphUUnqPlAiLavJZn
 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
 5qao=

I just confirmed that this bug occurs only with CONFIG_PREEMPT_RT=y,
and also occurs in your sysctl-next branch.

Bert Karwatzki

