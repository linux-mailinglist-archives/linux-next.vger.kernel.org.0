Return-Path: <linux-next+bounces-4486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9859B3013
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 13:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 928D9281DC5
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F471D88CA;
	Mon, 28 Oct 2024 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kDUxbSei"
X-Original-To: linux-next@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E1F17C61;
	Mon, 28 Oct 2024 12:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730118256; cv=none; b=ry8tgSyj45ZocrEB9qPkUpgJMp8FZGq55cN3g1Cd95cca4hpS5JYPZgIJr1K0o+qRFE42/QYx+IKUK22C7iYe+hR5TYuykOBB9/gxbiqyJzz3a1IeIQePQprce0R9SFKmLHTXnxOgp2i+7MznkzpQtxYWbANyp/E3BsGGEtqd4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730118256; c=relaxed/simple;
	bh=Vn9Ie9nEX2tE5wgUI+h9ukkANUch/4BNBc7Hh8j5UF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cDWsx+lLCTpC7tzFoj+v00ztb9u1gAvN1DhVxU8ObCywsfyVR0H4VHu41cpxi3OSGaITPq3/FRNRL8sxS0Rjlnn97UXDX34NReISo2964I3bURWczYBPp4HxvuuTJlSmLQ92XHKRdEoH1HDhjxoVj8mETcyRjHibtKVq8hDV/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kDUxbSei; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 405E4FF808;
	Mon, 28 Oct 2024 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730118251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OTf7w1OsrBGGST3FazfRsIWMoEiY0yt6zH/eh22AVL0=;
	b=kDUxbSeioVQ7d3uRSRkG2o+aSZFLKKjP5f+KpqkFyFuioUy0fa8DRDVvMpExo1kzACz7fo
	dl/FckZ9roB1tilB7OQDNeuCbOnge5hwdLMcUJ9DovLGXE7y1h+qD5ZK4jLfgx+ltxt3yt
	a79tCVaoOQ/B9YNu4sBxSllDXpM5B1Sp/DL2yNLwtvHeg31eUooHYgScnQIUpyL15MRrTQ
	ialQm/UrOmzqnor9N9tToC1mCkIKq42FBaJOOf7jIjTFkW+ET3jKxG8or21tPCUF5JE9+v
	ZgkzGM6ZJXi9HmITb9IgN8taK/Sd9xRMGRQN5Mek6T7sxd36gkR9Zv+z4Ik1Lw==
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
Subject: [PATCH 0/2] Fix dtc warnings when building the LAN966x device tree overlay
Date: Mon, 28 Oct 2024 13:24:01 +0100
Message-ID: <20241028122405.27090-1-herve.codina@bootlin.com>
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

Best regards,
Hervé

Herve Codina (2):
  misc: lan966x_pci: Fix dtc warns 'missing or empty reg/ranges
    property'
  misc: lan966x_pci: Fix dtc warn 'Missing interrupt-parent'

 drivers/misc/lan966x_pci.dtso | 46 +++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 18 deletions(-)

-- 
2.46.2


