Return-Path: <linux-next+bounces-3204-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE294511C
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 18:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C97A21C25291
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 16:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBCE1B3F25;
	Thu,  1 Aug 2024 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="udpw47V7"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986381EB4BF;
	Thu,  1 Aug 2024 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722531172; cv=none; b=nEWDf/c8MvPXLm7tchUvpYtj0vG72pvgJu2369IotqYtNUm1Lfc+kkzmM5bgEuMhn0P7iSc1jtJNXKjoLRM86OX/4dfZHLmO3lYJauzdVVHKds1MFTh728LKsCeu7IEWsOinh1gADuxqbIPewvhnaat1lg5Uq9TZYqVzdpi8g1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722531172; c=relaxed/simple;
	bh=5pBlWnbJhBefyaHG1Q/6Xrl8J5ET5Y/bv7MzWjGp9P4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUSO0T6Qt+V2bL6z8cuDdkcFSy8Z5veOtYPzJ5bk566LM9Af7kBzokCuWO78U6tn+IgEH1WUvydjUuk3jyWq+uFln5o7If9sIHkZDj+AWmyeTdR7oJtX1lejlNHpw3GoG2p5LDTg00+yLD4a8fF8PeEjbiqcUQ63Al1hgUj/+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=udpw47V7; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1722531157; x=1723135957; i=spasswolf@web.de;
	bh=YXzdAyJuCN+crNIs8n0L2vrv8e4Yz9lRbDuGR0XjS1A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=udpw47V7SZb4ugBPEOf28X1s/Dbz4h7LAuxELIzXTfLpdyXHJr5stH9gKJIZnVHU
	 8x098qjDPooFEItibsgJiyXBrApKn6Q/aT3roXsea6iDjhI+oYcZowFnPRJTnQQ0W
	 qAQYv2U78GBKhUNmStOdrGhNNrC66BJFV0MVo2G43tGq73x5wtl+dI0RL0lvDzrw9
	 DWtfJ8GdTMEFy9CUVwnAEhJactuHmjELe3xg5pHGpuBxqw/pNDSOdDXmQesmV3pL2
	 uQGVsfnBnLMl4rUyQJPQuo4sYs5PvMhu9P6yKNUEJathekjsh0B8glYVpVBpAH0sH
	 DasZ70Xp3DtZ0NASew==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MVrbz-1sjDXd3vRF-00TU6B; Thu, 01 Aug 2024 18:52:37 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	amd-gfx@lists.freedesktop.org
Subject: commit 9d8c094ddab0 breaks Xorg/xfce4
Date: Thu,  1 Aug 2024 18:52:32 +0200
Message-ID: <20240801165234.2806-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:84uszetUgx3rIli4ubyycxiX/XKr4EoFSLGH2U7qZS1I0dx4F1M
 tihI36Ktj+Z9y0jfN4y6puI9HduYSkR5hWRpX/3AQW8+823JtMVrnd4rAl9k1FxpPyZyLbT
 pFUGoHhgXMi3SC5iZc78p5GYQkQM7xpra8xrefoSj+fzbQifjP7ScOmixgRYBq8hhf4FDOv
 sTy/wSwzV3RjSI0QwvYNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lasTxSPXQAY=;Hb51Xx4ndBRUOFVKggIffjzDEB7
 F4WiF1d9EJXU1nQxZTAv/2vTlZ32482s57mSTEM6/Rj++NcoBPWfv/SfalHs9Ux1liJGKWT/o
 Ji0NjqrLZx2rAoVDw/PLYP2ZeyWcUbIgwCZP9F/ZT9WIjMlEy8GbH9gy2P3tQ55Wn1/efsXxK
 ItZ0y53bDoBjhM6K7M6xhCAqRvEN28tyUwjPvQnOPkONUgKrbkSSHRhYPhm5ukaCazeDzWDuA
 6cAbgwoZzzht1i/cf8WRwurmxPS/nLVIjy7KSr3RzfFEXiHJk4iO43MPpLe/+1az6s1SvoasH
 f7DGO952GPrfeeg8pm34goWtYD8WGJgDQnhKFJpkMWmy7ieQLblCftQo3guIH06X7QrtLcPlu
 OD38+mvIgyBqcLnD8x+hU/VL4utSMatYA9aLvUWBOIJgKGoVlWlesGHbKIbt/sltm/svKq4d8
 z/z2MB8MZB2TSLw36nJ3M3A5YnIaD0nS1wXtNu9XEvF5Ht6MDyNOaRChcIhE4cinneoZU57J7
 RXR+DyDrCpd7HcXdskrUwJTSe058tZuSmRNjeBjl6N6Nvy/PC0diJIJ6XDqXVi1V0c0HKGZpH
 hMXWjUztsIhFMnytVmcvUfWuPIS0CwTy+hocN7LigYNxIcOFtc+pALlgsds8rpk5Mlh8LKppX
 DPFPo1J6pGONmMVMSoV3sypnHIlSicx4pBqhg6DpA9VkOaTRcPRkkJ3toY81dFTKVp7ujo5CP
 41v7m+N8574MIXCWjTspdK6KcE0HemIprZPJwrPA5KEG5xgIbjm+J+59tc1Lia/6w0H9VgyzC
 /qkFqTWBoNkxJXEMJXUqX6RQ==

Since linux-next-20240801 starting Xorg/xfce4 fails on my MSI Alpha15 Lapt=
op.
I bisected this to the following commit and reverting this in linux-next-2=
0240801
fixes the issue for me. Gnome (with Xwayland) works as usual.

9d8c094ddab05db88d183ba82e23be807848cad8 is the first bad commit
commit 9d8c094ddab05db88d183ba82e23be807848cad8
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Wed Jul 3 00:17:22 2024 -0500

    drm/amd: Add power_saving_policy drm property to eDP connectors

    When the `power_saving_policy` property is set to bit mask
    "Require color accuracy" ABM should be disabled immediately and
    any requests by sysfs to update will return an -EBUSY error.

    When the `power_saving_policy` property is set to bit mask
    "Require low latency" PSR should be disabled.

    When the property is restored to an empty bit mask ABM and PSR
    can be enabled again.

    Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
    Reviewed-by: Leo Li <sunpeng.li@amd.com>
    Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20240703051722.328=
-3-mario.limonciello@amd.com

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  4 ++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 52 ++++++++++++++++++=
+++++++++++++++++++++++++++++-----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 ++
 3 files changed, 53 insertions(+), 5 deletions(-)

Bert Karwatzki

