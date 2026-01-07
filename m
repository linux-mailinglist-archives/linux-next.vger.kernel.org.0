Return-Path: <linux-next+bounces-9584-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A68CFF9D0
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 20:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65A05306BECF
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 19:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E9133A71E;
	Wed,  7 Jan 2026 18:31:59 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F393A0B3D;
	Wed,  7 Jan 2026 18:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.187.169.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810717; cv=none; b=sSedcpqFbBbETsGJW+sStVIFFcqdqZIjLHJbR6ZZXDm53l/+yj4j5EzZGPx6N/FSU0+bbZEQtPVhy+jFYR76d8/jDYR/1ShPrI4xlcw6I/GSbGtFuwXKurc5fdPLfJMhtfloO1oRAz16hkte9YvlqdbexYWJkpwrH578DLUI4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810717; c=relaxed/simple;
	bh=Rj323hX9QvKiZWerlzHeclatqdwCrPScXn7DPgRsRXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QflNjr2m8RpJkevZvyYR3nn7o4mkrlDadvQKtJNe4kESl4+92nr+hUnda3WjDX7HstOJfGc/gJPZv+cOo6nwxCPSyoAh7XMsVRt8oJvvSAPpgCzoro9stIt0Zve88Twzw+GKdwHXnT36jwUYQye+yEtP1zY97YSRgphUlq/YM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass smtp.mailfrom=hogyros.de; arc=none smtp.client-ip=185.187.169.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hogyros.de
Received: from localhost.localdomain (unknown [IPv6:2400:2410:b120:f200:2e09:4dff:fe00:2e9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id AAC2A3F104;
	Wed,  7 Jan 2026 19:26:24 +0100 (CET)
From: Simon Richter <Simon.Richter@hogyros.de>
To: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Cc: Simon Richter <Simon.Richter@hogyros.de>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 0/4] Intel MEI Kconfig cleanups
Date: Thu,  8 Jan 2026 03:26:01 +0900
Message-ID: <20260107182615.488194-1-Simon.Richter@hogyros.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107174646.GA1230850@psionic12.psi5.com>
References: <20260107174646.GA1230850@psionic12.psi5.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this enables GPU firmware updates on Intel dGPUs plugged into non-x86
machines. The most important patches are the first and last.

The second patch switches the ME interfaces for GPUs to use !=n tests, so
it is possible for them to be builtins when the GPU drivers themselves are
modules (as is likely). MEI is built-in by default on x86_64 (and Atom).

This might need some discussion what is desirable here:

 - this is a strong dependency from an "early" directory (misc/mei) to a
   later one (gpu/drm), causing backtracking
 - does it make sense for MEI to be built-in by default, or should it
   default to being a module?
 - is the strong dependency desired because if the code is compiled as
   built-in, it will not be used until the module is loaded?

There is no strong functional dependency here, no symbol references, as
these devices are enumerated over an auxiliary bus.

Also, enable building without the GPU drivers for compile testing.

No stable backport.

   Simon

Simon Richter (4):
  misc/mei: Allow building Intel ME interface on non-x86
  misc/mei: Decouple ME interfaces from GPU drivers
  misc/mei: Allow building standalone for compile testing
  misc/mei: gsc_proxy: add dependency on Xe driver

 drivers/misc/mei/Kconfig           | 6 +++---
 drivers/misc/mei/gsc_proxy/Kconfig | 2 +-
 drivers/misc/mei/hdcp/Kconfig      | 2 +-
 drivers/misc/mei/pxp/Kconfig       | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)


base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
-- 
2.47.3


