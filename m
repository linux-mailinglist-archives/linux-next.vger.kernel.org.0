Return-Path: <linux-next+bounces-4605-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 005389BAFEE
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 10:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3185C1C2208E
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 09:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D581AF0A6;
	Mon,  4 Nov 2024 09:39:14 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470531ADFEC
	for <linux-next@vger.kernel.org>; Mon,  4 Nov 2024 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730713153; cv=none; b=U9GL0+/pPK3xHkEyy9H49Rl02NRbHp4XpN04H4B/FJpX+SkY0GfvWruTcBdYvFOg9FSr4BU2S2PgKQ5FeaAVy53q9j+3fBFnJ3e55IJ4GSGqrY9t23HAajrOgArZxRoAsaRhAKFy8vWJsicRJw/Xp+GMX9XSVROPQZA/uiXoHz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730713153; c=relaxed/simple;
	bh=4lLU8yg8a4RCxzMArT/7z31wwCcdW3fYlKsKjZeWhdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2t3ugUUWUiHPPoDNl8kaQ32Y6Ovt/eBzVtLhl8KfjaCCpcqUYbtcOzYdk056ugz0mRLh6/ziK9jetvqMIIoPygeS75QxYhKjI+S5OcyfvNa4XpyJh0w5VFfcXVBZcUMyllNzrSDl2JC1YXToAPvWXsTV0fmQAD0i9AHozNHrXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t7tY6-0000aX-Mp; Mon, 04 Nov 2024 10:39:02 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t7tY5-001xM7-2T;
	Mon, 04 Nov 2024 10:39:01 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t7tY5-00DP6z-27;
	Mon, 04 Nov 2024 10:39:01 +0100
Date: Mon, 4 Nov 2024 10:39:01 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH RFC] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
Message-ID: <20241104093901.rb5ozxt7qkdgoatc@pengutronix.de>
References: <20241102134522.333047-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102134522.333047-1-wahrenst@gmx.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org

Hi Stefan,

On 24-11-02, Stefan Wahren wrote:
> The recent introduction of reset control in pwrseq_simple introduced
> a regression for platforms without RESET_CONTROLLER support, because

This is what I was afraid of :/

> devm_reset_control_get_optional_shared() would return NULL and make all
> resets no-ops. Instead of enforcing this dependency rely on this behavior
> to determine reset support. As a benefit we can get the rid of the
> use_reset flag.
> 
> Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset control")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/mmc/core/pwrseq_simple.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> Hi,
> will trying to reproduce the Rpi 4 regression from here [1], I found
> the issue above. I'm pretty sure the Rpi 4 regression is caused by the same
> commit. Unfortunately I wasn't able to reproduce it.
> 
> [1] - https://lore.kernel.org/linux-next/6724d7d5.170a0220.1281e9.910a@mx.google.com/T/#u
> 
> diff --git a/drivers/mmc/core/pwrseq_simple.c b/drivers/mmc/core/pwrseq_simple.c
> index 24e4e63a5dc8..b8782727750e 100644
> --- a/drivers/mmc/core/pwrseq_simple.c
> +++ b/drivers/mmc/core/pwrseq_simple.c
> @@ -32,7 +32,6 @@ struct mmc_pwrseq_simple {
>  	struct clk *ext_clk;
>  	struct gpio_descs *reset_gpios;
>  	struct reset_control *reset_ctrl;
> -	bool use_reset;
>  };
> 
>  #define to_pwrseq_simple(p) container_of(p, struct mmc_pwrseq_simple, pwrseq)
> @@ -71,7 +70,7 @@ static void mmc_pwrseq_simple_pre_power_on(struct mmc_host *host)
>  		pwrseq->clk_enabled = true;
>  	}
> 
> -	if (pwrseq->use_reset) {
> +	if (pwrseq->reset_ctrl) {
>  		reset_control_deassert(pwrseq->reset_ctrl);
>  		reset_control_assert(pwrseq->reset_ctrl);
>  	} else
> @@ -82,7 +81,7 @@ static void mmc_pwrseq_simple_post_power_on(struct mmc_host *host)
>  {
>  	struct mmc_pwrseq_simple *pwrseq = to_pwrseq_simple(host->pwrseq);
> 
> -	if (pwrseq->use_reset)
> +	if (pwrseq->reset_ctrl)
>  		reset_control_deassert(pwrseq->reset_ctrl);
>  	else
>  		mmc_pwrseq_simple_set_gpios_value(pwrseq, 0);
> @@ -95,7 +94,7 @@ static void mmc_pwrseq_simple_power_off(struct mmc_host *host)
>  {
>  	struct mmc_pwrseq_simple *pwrseq = to_pwrseq_simple(host->pwrseq);
> 
> -	if (pwrseq->use_reset)
> +	if (pwrseq->reset_ctrl)
>  		reset_control_assert(pwrseq->reset_ctrl);
>  	else
>  		mmc_pwrseq_simple_set_gpios_value(pwrseq, 1);
> @@ -137,15 +136,14 @@ static int mmc_pwrseq_simple_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pwrseq->ext_clk), "external clock not ready\n");
> 
>  	ngpio = of_count_phandle_with_args(dev->of_node, "reset-gpios", "#gpio-cells");
> -	if (ngpio == 1)
> -		pwrseq->use_reset = true;
> -
> -	if (pwrseq->use_reset) {
> +	if (ngpio == 1) {
>  		pwrseq->reset_ctrl = devm_reset_control_get_optional_shared(dev, NULL);
>  		if (IS_ERR(pwrseq->reset_ctrl))
>  			return dev_err_probe(dev, PTR_ERR(pwrseq->reset_ctrl),
>  					     "reset control not ready\n");
> -	} else {
> +	}
> +

Can we add a comment like:

/*
 * Fallback to gpio based reset control in case of multiple reset lines
 * are specified or the platform doesn't have support for RESET at all.
 */

Regards,
  Marco

> +	if (!pwrseq->reset_ctrl) {
>  		pwrseq->reset_gpios = devm_gpiod_get_array(dev, "reset", GPIOD_OUT_HIGH);
>  		if (IS_ERR(pwrseq->reset_gpios) &&
>  		    PTR_ERR(pwrseq->reset_gpios) != -ENOENT &&
> --
> 2.34.1
> 
> 

