Return-Path: <linux-next+bounces-4518-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA99B447C
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 09:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F49B283BF7
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 08:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA952204018;
	Tue, 29 Oct 2024 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HLZj86gz"
X-Original-To: linux-next@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EEF2038C1;
	Tue, 29 Oct 2024 08:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730191427; cv=none; b=Y+zsJGlk5qLq46CN4TMlFY1ZoOlXUANgQWLdbA++ze2rMf97cWCI5IETF3PtQXcH3RXA9A+34gEOUyY6XLkC2fqbcp8Y7NilouByDVITbuQKoK5c7cDVRR6gWbUSJtjpvaAB9WE8ik3qi0s/7md4hrQMhrKY9ogNjv+SZ2GQl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730191427; c=relaxed/simple;
	bh=PtAShjrj4m4aq7ybo6krxpb7zJkUhbYTk+V7g3odBnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tpK15VDtiGgehtkv8Cu9hJMISy4cE0TcIUyBxZYOmQhpvIbQCZf7W3P7hy8B6gwZ6ezyM5Q9Qj7KmnSrkSocZpRZ3inXQNiiT9BDA/Av38L9klWa75zMIsc4z0PrlXpryYSg/Uh5lSeLunSAV+NCFL31lKlGwXaSGkc082rsL7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HLZj86gz; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 1F011240002;
	Tue, 29 Oct 2024 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730191422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cr8IsfJa/COUD+qWT2ZiYUUbg/T7I7HjCgLzpziZJoE=;
	b=HLZj86gzXVfouB9BUlUiEcTqguXe0KtmLpyByuFeJ7EJBT/CsT8pjS2C2A1drVNfT/z4br
	O/iNE6+GDhllLF4KHhZJcAwxVdlckSAnDQTigBYME/uXF4DrnGIdQrC8c1A0bqwXc/WLQB
	ODsfrxT4bdeOFmsomrCDDbLskMguK8suCcGz+eHCoWWkOhjkLHCDm6D3xXhCR9CP1osv8Q
	KsZG+HAbTZRTIcqaLlRMK2kocaZT/ytrE6OtgJYakAGhKP613hyIeT/A9mp607IoXrCOyI
	FpJFPPeKx/QO/UItrZXhMVqBQ6ICoI7nYnEYjGjORc8hVolQAqxrTRDs99fzKw==
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 0/2] Fix dtc warnings when building the LAN966x device tree overlay
Date: Tue, 29 Oct 2024 09:43:34 +0100
Message-ID: <20241029084338.194942-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

dtc generates 3 kinds of warnings when it builds the LAN966x dtso.

- missing or empty reg/ranges property
    .../pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
    .../pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
    .../pci-ep-bus@0/sys_clk: missing or empty reg/ranges property
  Patch 1 in this series fixes these warnings

- Missing interrupt-parent
   .../pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent
  This warning was quickly silenced by Philipp [1].
  Patch 2 in this series fixes the warning and should replace the patch
  applied by Philipp to silence the warning.

- Warning (avoid_unnecessary_addr_size)
   /fragment@0/__overlay__: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
  This warning should be fixed in dtc.
  A patch has already be sent by Philip to fix it [2].

[1] https://lore.kernel.org/all/57793bb01e02f03e215dfa6f8783df18034ae2ea.camel@pengutronix.de/
[2] https://lore.kernel.org/devicetree-compiler/20241025161307.3629901-1-p.zabel@pengutronix.de/T/#u

Compare to the previous iteration, this v2 series mainly renames clock
nodes.

Best regards,
Hervé

Changes v1 -> v2
  v1: https://lore.kernel.org/lkml/20241028122405.27090-1-herve.codina@bootlin.com/

  - Patch 1
    Rename clock nodes

  - Patch 2
    Add 'Reviewed-by: Rob Herring (Arm) <robh@kernel.org>'

Herve Codina (2):
  misc: lan966x_pci: Fix dtc warns 'missing or empty reg/ranges
    property'
  misc: lan966x_pci: Fix dtc warn 'Missing interrupt-parent'

 drivers/misc/lan966x_pci.dtso | 46 +++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 18 deletions(-)

-- 
2.46.2


