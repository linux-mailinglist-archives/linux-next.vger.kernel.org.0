Return-Path: <linux-next+bounces-6221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E204A881DB
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 15:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D325179788
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 13:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B30275870;
	Mon, 14 Apr 2025 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bt8ATvhl"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FF275868;
	Mon, 14 Apr 2025 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637089; cv=none; b=imk7niF+jATR+cLIuufom1SQjtNTTG7SaOe+msHQ8Bdf5jilczdFyZ092Sgema1YbAkCAyv7G3VJCt6oNuLlVjW9f2uzOE8lZv02Ew/UTcHlBenADTzFmWKegG3JIHDlfcEA29eGJ1VCRXIFdih+cGtRMgoxtIZ5vWzAL2r55nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637089; c=relaxed/simple;
	bh=OIUY2loNioGZCRstuIG2QyPb7o81yT3V8XzNN848fTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSAWnaxjdL14nPvghXxBPlMUoCPOIaL8p6sJeYrQXe0UWUBbzXl7zGKknkGWBZfftAKQaONokzTThYehIWRm9zeDa5EBcCIBkS5a0BtWbSMUsvRNrAB2r4sRkIuYleh8sIVfYJpYJqjFmO60VEMaVmesRdCYKq2nsSAt1fjeLAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bt8ATvhl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ED1C4CEE9;
	Mon, 14 Apr 2025 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637088;
	bh=OIUY2loNioGZCRstuIG2QyPb7o81yT3V8XzNN848fTQ=;
	h=From:To:Cc:Subject:Date:From;
	b=bt8ATvhls9+CejRE0KYlc9zoU4aWFmMUKNiI9cIMD1QUNn/zSw2LMx7gGu6iNAVrm
	 NymYea4MT/YHL7/kcfXhZEenHae7PEDKtKZBHMi9uuQr4u8PUVgVCBYntModW8ZcFl
	 iEjm6XmlWtpGSUeV76ioYD6NBr7kHQHPLEv8x4xAJjZHDho3qh+B9rGfg0PTEStFzQ
	 020vdWuVvLSIZ5ITvw4I/bmq2nVJkCoJBp5WcLkIGuTwla4MkxKQauGLdQmQqI5lIh
	 FyIQSCmwhqRBGKPkygrFtBj62nH4eV5hxV6lilw2yNWazIdRFhMHCcCos0jn8M7hMS
	 obKXJnESFIvmg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	sfr@canb.auug.org.au
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-next@vger.kernel.org,
	srosek@chromium.org
Subject: [PATCH 0/2] platform/chrome: cros_kbd_led_backlight: Fix dependencies
Date: Mon, 14 Apr 2025 21:24:25 +0800
Message-ID: <20250414132427.204078-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch removes a redundant dependency.

The second patch fixes the build errors discovered in [1].

[1]: https://lore.kernel.org/chrome-platform/ed8adc69-c505-4108-bf63-92911b0395c7@infradead.org/T/#u

Tzung-Bi Shih (2):
  platform/chrome: cros_kbd_led_backlight: Remove CROS_EC dependency
  platform/chrome: cros_kbd_led_backlight: Fix build dependencies

 drivers/platform/chrome/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.43.0


