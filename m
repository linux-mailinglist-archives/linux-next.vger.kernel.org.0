Return-Path: <linux-next+bounces-4440-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC07B9B08A0
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 17:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B04C928175A
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 15:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47309171E6E;
	Fri, 25 Oct 2024 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/HdLCNj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA631714BD;
	Fri, 25 Oct 2024 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729870866; cv=none; b=fONkowDyRunB9dPk4zRBAxdf3CPYOmrbwl72sFBVPE11izY0K+L9ULc/CzrzutSJIP5HfcUDWLjF/Mu5d0smBKeGIMz4eJK6l7PLX104oiMzVG/Hkj5KpuR6S1dpoSNPq5xIeAdopnkFhPB/d4F/+1EoOcLrAtATtXzIUr1Sjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729870866; c=relaxed/simple;
	bh=NXJ4qNQJHglAEWKUT7abED3eB1Er8xp/LyziW9o5pcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eP319Fbv9u/qlfAOCCX21NyrXB5P7ZLKXyG5Xlvq6CwF2ZPsBd2P3lX41t5JLRKdLT0XNyIX9aQ25M+heU3F7Zu1N+1sg0/X9GQ8lVVZbXZV6ytLBZRlnHlkVQz2j+Ck4hxEhc/QJ3Bon17AA/bmX6RhSe5BX0p3uLwsLWhr1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/HdLCNj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3035C4CEC3;
	Fri, 25 Oct 2024 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729870865;
	bh=NXJ4qNQJHglAEWKUT7abED3eB1Er8xp/LyziW9o5pcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C/HdLCNjX25adga7E9GfiDB7E70SulkVCRxFVKMMQtczoF+X2mVAS99Bx2pazuI56
	 RwwLhcDPwAk0WMuYqGFIlBXSPu0g2leidD0BCynWFtayCcj3cegF4P6QClMx4dnMIs
	 Ak7n2vwD8yikyiaWRYFw3roWOnFYiY19bBYosxKGRwKdYzSRJj87RpY+oggmOUuPQi
	 1+Q3LeHjwS0rzJghcVCVfEc7cwhsHGoorv4NVrTLxNBynwsqGd2wMWAfNIGcMspewj
	 yo4CKnxL2Cu5tyS2pLVZjvhY3hRk+Ux/XSnrRR5yH3/FsbhfpRnhzf5MLnERwSg1Bn
	 YPGzcVEFRwPug==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f8490856so2144716e87.2;
        Fri, 25 Oct 2024 08:41:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlpWR9qVX8u7eglG+LCWMHlZ7ucY+O9fVxkP6favxu3rj3kzs7K3MgTADTcy7SCl22rq1Ney8DqncRCw==@vger.kernel.org, AJvYcCVs/jv2EwTimrnHuhVEBTVd5ynFoAa0YmZV+DUV3sy6QJM1PJX1WousV+FKE8b0ZSxRh2SGCI23yLlEQR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3iP6MmfCK3TH4W1jPGg5z3sttuNrhNvEHwElE6PR6apcamtaY
	I+hgCdh0i1HW/2CC6UetQYP1JZe8riFgMhDXUZOsLNukw/VHOeURcLEnxhWVi9Q5SCl/iSDb+pe
	83g0awKgIZOGr9zKOqfVocwAloQ==
X-Google-Smtp-Source: AGHT+IF7KL6PEoDfPaZ6WSe61hJ+stADyujCxtlqOKkZjClnxHKQ/nk+puHuIkn/tBs6+nNepGIi5PxWAbWT1Yej4wY=
X-Received: by 2002:a05:6512:1599:b0:539:f26f:d285 with SMTP id
 2adb3069b0e04-53b1a2fb015mr6756295e87.3.1729870864045; Fri, 25 Oct 2024
 08:41:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025145353.1620806-1-p.zabel@pengutronix.de>
In-Reply-To: <20241025145353.1620806-1-p.zabel@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2024 10:40:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKebRL454poAYZ9i=sCsHqGzmocLy0psQcng-79UWJB-A@mail.gmail.com>
Message-ID: <CAL_JsqKebRL454poAYZ9i=sCsHqGzmocLy0psQcng-79UWJB-A@mail.gmail.com>
Subject: Re: [PATCH] misc: Silence warnings when building the LAN966x device
 tree overlay
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Herve Codina <herve.codina@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 9:54=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> Silence the following warnings when building the LAN966x device tree
> overlay:
>
> drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): =
/fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent

> drivers/misc/lan966x_pci.dtso:42.22-46.7: Warning (simple_bus_reg): /frag=
ment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges proper=
ty
> drivers/misc/lan966x_pci.dtso:48.22-52.7: Warning (simple_bus_reg): /frag=
ment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges proper=
ty
> drivers/misc/lan966x_pci.dtso:54.22-58.7: Warning (simple_bus_reg): /frag=
ment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges proper=
ty

These nodes should be moved out of the simple-bus.

> drivers/misc/lan966x_pci.dtso:18.15-165.5: Warning (avoid_unnecessary_add=
r_size): /fragment@0/__overlay__: unnecessary #address-cells/#size-cells wi=
thout "ranges", "dma-ranges" or child "reg" property

For this one,  dtc should be fixed to also look for child "ranges" property=
.

Aren't these other ones all W=3D1 warnings?

Rob

