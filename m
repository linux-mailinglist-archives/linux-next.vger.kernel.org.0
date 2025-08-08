Return-Path: <linux-next+bounces-7882-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE4B1F13C
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 01:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF8B7265D5
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 23:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3A23FE7;
	Fri,  8 Aug 2025 23:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="aXlq+E4G"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355C57346F
	for <linux-next@vger.kernel.org>; Fri,  8 Aug 2025 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754694947; cv=none; b=D2luFunIVssQOcEXFKwn37xQGXLOno8l9DbrfTZx4U+KUsvJ+WaX8Bv2OAIdzzSh0Z2XoDYRqQri4ZkYk2XShwpwEmZuY7EtCQPpOFq5pOEu0jFgXjOv+7AoURHDXYgXc6JPl5hy8d23QLfWqKQGQi2Ujufp7yTyZceXNN3C3qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754694947; c=relaxed/simple;
	bh=9HKrAgSiQMXQRMsG67SqiL0IkcMfPSyhJjUvSiEADqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZK3kstxzZebsSTEKzafituocZU0pSLW5PPY846EDvhYgl5qcjsaOwZtMLXy+/Kk6RRRTQPrMgqdS4vqRyNYfnoPKYPknwX9ojL19EwQCdCvz1Nxrkf5MD7VysWZvTj6OSR9frOMrXd2b/z7Hpnq7kCP9fL2b9Vlw4JXEVXUlwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=aXlq+E4G; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bzKdT4m8Mz9tCJ;
	Sat,  9 Aug 2025 01:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754694941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e6Jw1zDVtjTA2grbtCPb82zxpM0vKtOPY3V4HAN/9GA=;
	b=aXlq+E4GuZQDVxVshkb1a47xbWzfnSNnuOWmTkYUuLeH7BHPYDEy3wL7jZoq7bBcpn2leT
	bVZiaM9r7tHWVgafy+917E08EuPBpnCUbgLt4bIic51TzfALx0lJ1Uwrn5PDoU366TVBiR
	P7wmQ3gMh6hY81C2ygLV/3nt3z4socOLGj2LzIhsMdcVlDBgMzW36qYTzroKhgktMe7stG
	mj6UJv8cymD6dqld4WgclI5XxK6BOsrHkFgN3hGP07D7i4KIQUB+Hpw74pLcVJmyJrDD4+
	Tv31nK5bx2crWqaEhlIoFGaq7H+whaSSYCjWJr7864a00i+sMwy8TXR+jsJ+5g==
Date: Sat, 9 Aug 2025 04:45:38 +0530
From: Brahmajit Das <listout@listout.xyz>
To: linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Subject: drm/radeon/r600_cs: Build failures with GCC 16
Message-ID: <pqpvdwxmqler2mg4ou665v56g6qe36vwi5jeavqeszj2mrk5m7@io6dy7jsvuhe>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Developers,

Building linux-next with GCC 16 results in this following build error

$ make
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/gpu/drm/radeon/r600_cs.o
drivers/gpu/drm/radeon/r600_cs.c: In function ‘r600_texture_size’:
drivers/gpu/drm/radeon/r600_cs.c:1411:29: error: variable ‘level’ set but not used [-Werror=unused-but-set-variable=]
 1411 |         unsigned offset, i, level;
      |                             ^~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/radeon/r600_cs.o] Error 1
make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/radeon] Error 2
make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
make[1]: *** [/home/listout/linux/Makefile:2011: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I'm not sure whether this is kernel bug or GCC bug at the moment. But
building with GCC 15 does not give this error, hence I'm more inclined
towards the latter.
Planning to also report this on GCC side, wanted to get some
opinion/feedback from kernel devs as well.
I'm on GCC 16.0.0_p2025080.

-- 
Regards,
listout

