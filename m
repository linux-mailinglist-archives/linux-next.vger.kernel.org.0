Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9203D3210
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 04:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhGWCQA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 22:16:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:49292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233222AbhGWCQA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 22:16:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A2AD60EB1;
        Fri, 23 Jul 2021 02:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627008994;
        bh=0qejonRfIXOl8SWVLo3HVgB2UvOHe/ZYT+ExYN4oGGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oZOEhvQI0yPateI2LMezPt8FIKG6uuWTiodvf3tcw4EHFrZunzUV6wpjZUJQ5gT0o
         qugI/lX9Ntk+G9jUsw8wFCcq17mlPjRI+SzWElrx7COWl1x2G5nMMZX4fYNnessAie
         /8zaG0HOV+WIS37U/ehSjUszYkKIS5OI4X33k8T5KiHSFqVNfQQCEnCkLin/zhTX8U
         LWOy7Um6LuCLuS+nfQVT+DP7TanUOCpblamjl7rCbwicCDAUQo8BDxsE1SzDC2hgzw
         +3+StWjuisxfAd54Cg4Z5DheJ9EAlDrYFuSAwa6S5WspowMNqTGAKy/JQKcn6pMkpi
         giUj+QoyKIX3w==
Date:   Fri, 23 Jul 2021 10:56:28 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc:     linux-next@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
Message-ID: <20210723025627.GF28658@dragon>
References: <20210713202108.449831-1-oleksandr.suvorov@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713202108.449831-1-oleksandr.suvorov@toradex.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 13, 2021 at 11:21:07PM +0300, Oleksandr Suvorov wrote:
> NXP and AzureWave don't recommend using SDIO bus mode 3.3V@50MHz due
> to noise affecting the wireless throughput. Colibri iMX6ULL uses only
> 3.3V signaling for Wi-Fi module AW-CM276NF.
> 
> Limit the SDIO Clock on Colibri iMX6ULL to 25MHz.
> 
> Fixes: c2e4987e0e02 ("ARM: dts: imx6ull: add Toradex Colibri iMX6ULL support")
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

Applied, thanks!
