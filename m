Return-Path: <linux-next+bounces-4559-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF529B7DB0
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 16:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6BB1C218D6
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 15:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2D71A4F0C;
	Thu, 31 Oct 2024 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gqIhS/sv"
X-Original-To: linux-next@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A432B1A4F01;
	Thu, 31 Oct 2024 15:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386889; cv=none; b=A869d42GRwTbzsB5JyfIbPC4pgrD2Hi+JZE59mhRaHNZryJ5XLox9cbPap9kmFL/g7qNQKGATQnBbEHeE1A3mb5SNLt0e786QGksaVZZFgmaz+DMAYRBf4y5gBxz1bKmaaSeCBj3UkRYMR4XkQTQ3r6GPeddcDsUBcnxyvwdOeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386889; c=relaxed/simple;
	bh=w1P9F7UnJdKp3E6r/SnKDquMCSMBRwxSkzH2UKLNezM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fPyclVoVaVoytxHHIAe9fuRU6MXlLH8MCV/C27M5P2RB1wIMRdmSnHojs+HsxQMpUE7KGaFSeLRE1+0u74Tsv3s71wmpStr0eMSQOigON/ZOjmnl9M1qDRiXAL6OzeNXdvuRR0DaPO7Gh8N9zFFau6WrmUD1nmptdHaN9TQn62o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gqIhS/sv; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04398240005;
	Thu, 31 Oct 2024 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730386884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4onf2bSMCTiRypACag+YRENrFk/22U9sSVMhr4kt0Q=;
	b=gqIhS/sv1tRrpuw3NlcXw1TySdU0wnYq6Qr4o9OyjEL9sKqrMSm/uuaW+sQ2+1GfqGkLIQ
	+bOaBn5URTxXXSH4qQsNZF8t9C5aEKRapxux+Zo9AKwt98xxyLFSNDaau2V8FUbfGdHQrV
	rYbPpEO/qykyjNg9GVfVfpu5M5YlnFR+aY9GWmi/l42bCKAbTOjGPN5xYjI7cfLWm0ggAk
	5V2Tt/WTMNSufG2KAHx2oMtTj9ZBSnJJ0nLIYSTiXmDiDLKj6qZleBeywAgpYk+JMm6bPi
	AS1JC3Mx9H7ic7qDh6qOPtB5MZTpV4wa6hmRLDvVnDTjmCiLytU15x1SqEKU4Q==
Date: Thu, 31 Oct 2024 16:01:22 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Allan
 Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/2] Fix dtc warnings when building the LAN966x
 device tree overlay
Message-ID: <20241031160122.40cf61e0@bootlin.com>
In-Reply-To: <20241029084338.194942-1-herve.codina@bootlin.com>
References: <20241029084338.194942-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi Philipp,


On Tue, 29 Oct 2024 09:43:34 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> dtc generates 3 kinds of warnings when it builds the LAN966x dtso.
> 
> - missing or empty reg/ranges property
>     .../pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
>     .../pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
>     .../pci-ep-bus@0/sys_clk: missing or empty reg/ranges property
>   Patch 1 in this series fixes these warnings
> 
> - Missing interrupt-parent
>    .../pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent
>   This warning was quickly silenced by Philipp [1].
>   Patch 2 in this series fixes the warning and should replace the patch
>   applied by Philipp to silence the warning.
> 
> - Warning (avoid_unnecessary_addr_size)
>    /fragment@0/__overlay__: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>   This warning should be fixed in dtc.
>   A patch has already be sent by Philip to fix it [2].
> 
> [1] https://lore.kernel.org/all/57793bb01e02f03e215dfa6f8783df18034ae2ea.camel@pengutronix.de/
> [2] https://lore.kernel.org/devicetree-compiler/20241025161307.3629901-1-p.zabel@pengutronix.de/T/#u
> 

Both patches in this series have been reviewed by Rob.

I think it is a green light to have them applied in the reset tree.
Your opinion?

Best regards,
Hervé

