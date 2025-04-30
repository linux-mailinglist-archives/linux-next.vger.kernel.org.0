Return-Path: <linux-next+bounces-6471-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CEEAA51BE
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 18:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19A669A7C9F
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 16:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EA32609C8;
	Wed, 30 Apr 2025 16:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XWDxr3A8"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D32DC768;
	Wed, 30 Apr 2025 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031024; cv=none; b=WskO5wwanB+Inm5bdsez0RBAIY6nbU2dlUg+b9XIdyeMmGcTggXsXyJNqw09VVVeUXcJiaZmCe+P0LQS38ElH6eMFzsS03RZC8X1kGkPusr++MDtPdGGVhZEpi8DAWQvVSyU2MwnFcqQ784ItERFSyCT4Gg3z2Cq9eMrLsYo+9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031024; c=relaxed/simple;
	bh=9geV/FjB9jog23wCw1W/StqQ0myuqQkS4rykbVNxuNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YcM+otHB7ppoCerZxfrdV+t+vQPsA5Z9ZdLxBjQvgRbgPokMFNstukIU3X43uyyCSW4t3BI7J99yMs1Cy2bgkFzf2mW0HwqHVTSISKoC0gPpUCXOrYRhu1lCNY43mrqOotTltoGC+Hrtu0aJeO64/Tjaa5JhpW7xjSjwy3lukqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XWDxr3A8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=u7nNGcfk3YS6f+K/g0woe4Rifi6nim8UCZ/niqDjLko=; b=XWDxr3A8XsgDAvBFCigLA/7cz3
	w9RO3KlsJ4ye37LnsnEv68WCDp/3huEwve9yG43vzEUmOLexUixvFbgWt1HsCytHU9EQDE6t36VDA
	UOo5F35Qq/JI1VSPlVJeJ3hruYY0XxDHX7KQ/ckv72u2WeJi9o8Dlqq1PbsscqOnXXM522skTIS16
	NmMiRZwHWGRcX3MV72zN+juudrcMJAvUicdVcY4oShlJwoWoqGDpayx8N7fjeJ+RL+AaFQTdGE8jU
	JRzkaaIITHZezOctm4HR1UOoHjO7Kn0schnWAvkTAd66SOhj09cS700j0Lm6V4OxRIvnNTz7I8oI4
	00Cv9Arw==;
Received: from 179-125-79-234-dinamico.pombonet.net.br ([179.125.79.234] helo=[192.168.67.187])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uAAPT-000zis-3o; Wed, 30 Apr 2025 18:36:43 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 30 Apr 2025 13:36:28 -0300
Subject: [PATCH] char: misc: make miscdevice unit test built-in only
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-misc-test-fixup-v1-1-6f39ed6c733d@igalia.com>
X-B4-Tracking: v=1; b=H4sIAItREmgC/x2MywqAIBAAfyX23IKaHupXooPYWnvogVsRiP+ed
 ByGmQxCiUlgaDIkelj42CvotoGw+n0h5LkyGGWcsp3CjSXgRXJh5Pc+sVfB+RhIz9pCrc5EVfz
 HcSrlA9LHNjVhAAAA
X-Change-ID: 20250430-misc-test-fixup-90c5afce1d14
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Andrew Morton <akpm@linux-foundation.org>, kernel-dev@igalia.com, 
 kernel test robot <lkp@intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2

Since it uses __init symbols, it cannot be a module. Builds with
CONFIG_TEST_MISC_MINOR=m will fail with:

ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250429155404.2b6fe5b1@canb.auug.org.au/
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504160338.BjUL3Owb-lkp@intel.com/
Fixes: 45f0de4f8dc3 ("char: misc: add test cases")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f9051ab610d54358b21d61c141b737bb345b4cee..0117b852bd131b8a585dc02d8225e2e8c0740077 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2512,7 +2512,7 @@ config TEST_IDA
 	tristate "Perform selftest on IDA functions"
 
 config TEST_MISC_MINOR
-	tristate "miscdevice KUnit test" if !KUNIT_ALL_TESTS
+	bool "miscdevice KUnit test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
 	help

---
base-commit: 4f822ad5ee944ffafc21937a32dd055f1df5c28d
change-id: 20250430-misc-test-fixup-90c5afce1d14

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>


