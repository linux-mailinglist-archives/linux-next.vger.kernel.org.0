Return-Path: <linux-next+bounces-2649-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC87E9155C9
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 19:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85190287110
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 17:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9E019FA85;
	Mon, 24 Jun 2024 17:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="v7KUkMzS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mbzILD+T"
X-Original-To: linux-next@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A0519FA83;
	Mon, 24 Jun 2024 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719251298; cv=none; b=sqdMGSaOptUDm+3sA9jJfPD72f4/Lnb8IZodFD0OwoBMf/DbU835aoE5KeieMZnuygtRjqpllvDWHhvMh78BUrxa2N/DDYPaWF0jYQkkoKfAZjVp3WtvHmQD87hwxVLQ8V55OGoKbvnWU/lrYiCnNTLGVE7Ac5CBfq0xmCrSGdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719251298; c=relaxed/simple;
	bh=dKhJSsA3/03pyvMW1VMivxWq0gl5lOjReogd7JhGkxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TjGsdsCW/qZnUP4DfV7Mb8ugYoX6gC2rZCAYh8U8RYtM5zk6n7ZXIffT0wUjXiyhDzbi+3jJ5sbMFxFvqZXLj0d0qetdk2AmOL7pIcqOxn3Ws2+l1NMWRNftAuB0st8AVwXHPg3P2Qj5gFcpkJRo8Dqj4Lp0LTrmHrGZNAbC5NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=v7KUkMzS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mbzILD+T; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 2981718000A7;
	Mon, 24 Jun 2024 13:48:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 24 Jun 2024 13:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1719251294; x=1719337694; bh=DQqZBSRlw1
	1TA9UCQzDY3rNG30Jucm240uJxEpV1QvA=; b=v7KUkMzSfRK3FcwklHHh+iwgs+
	yeAU4342zmozsOOqTjLtOqdz/NRhQGgcMZRLvwhnrgnGPYBSeDgM9PkdBIBQ+W6G
	/NaWZpOiw/8ldxE87pn6s7k5PwBYDILjkPVnB++vautCuZAAb7y8E6t1rtS8j2Rm
	Ek6SD1aVcT5x+isqlh6Im0pnWrV/P16iUemCFWiG/FWinoYXuf3LzHpEX+MXJvj5
	m6BhpRVkgbKUjIcc+WbW+KEMuSKqvO9LApO1fxjD1xeiTWdf2W4ztxaqtoOl/GlB
	kDeoA1HEl/v8Lk26yz24/tZao2IJsn5ohNEuRqZHHK++ndvfTtncOSOimHsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719251294; x=1719337694; bh=DQqZBSRlw11TA9UCQzDY3rNG30Ju
	cm240uJxEpV1QvA=; b=mbzILD+TI3cLf6ebu1h/XlNbxZFsg/f13dWCK0slJLnB
	MXUfeCfrkq3Re+XSPeuBAA+sULBSpj/aWj0jhl3C1tvMKuPBqYP/dbL+cHmlD/A3
	65LA5JGonrU9qF+uFrIvG8RqVyy/CxE9kwpVczGSH6JYNZEarzKjrNRFORWwITAu
	oIq6FICr36/kQAnD/3vXtZX0oeqpWOjMTap2KZCQ/XP3sjGpYf5VlWA2xWg8CXjQ
	G9LPNjWwDEPUk+ny8yjB+TkOKgQK8dFPVfdjsJ6Gfuydxn6bWHR1zZVflOYGYeb1
	+hDIDhn9j7xBrKKarSxFZFm13LKkcHGEkDY+FtY9yA==
X-ME-Sender: <xms:XrF5Zj3Xy83Y-9bsoIC5B7WdYH2Naps9BsDTbayjRpUgDeL16vBBOg>
    <xme:XrF5ZiGPXV2SVGmQF88wfpX16m2TXQ9GhNk_RhIHvuPRCyYGvzLU51-wi02V2yla4
    X41d89AIMi20Q>
X-ME-Received: <xmr:XrF5Zj7vOVca0QBpXNAfcaPpUWsUE484PDYR0USnArZ8K9cHg3n40-53CXcdbjJnpPq3fAs-EF7hvtqWTe8coC65RB2YzVMp9Cv0Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeguddguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
    dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:XrF5Zo39p8au5qVSs1-dlj3F1CWmbiz_t1BTBfIor3wnfvqBP42kPQ>
    <xmx:XrF5ZmFnk8OLbWrn7gNs18CiD6REZ1wyy7FmSs1NrM5HWirUbvAELA>
    <xmx:XrF5Zp_G9qAmrzqlPBZ3L8iK4M860MQKe0hDZqJTtQBoCYIhGxiOlg>
    <xmx:XrF5Zjn9tq7Xq6eKi8wRiqDr8i2iFJ-VFexIfAXMhHKT3vFHPejD7A>
    <xmx:XrF5Zu-Tlpcd3QrswlvLmmqWcGyNXoTKt7tk0YPsEhe766A_2BbemW2L>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jun 2024 13:48:13 -0400 (EDT)
Date: Mon, 24 Jun 2024 19:47:56 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the driver-core tree with the reset
 tree
Message-ID: <2024062443-runt-lard-fd07@gregkh>
References: <Znmufb9L78FCoSSS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znmufb9L78FCoSSS@sirena.org.uk>

On Mon, Jun 24, 2024 at 06:35:57PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/reset/reset-meson-audio-arb.c
> 
> between commit:
> 
>   0e8b3bca280a7 ("reset: meson-audio-arb: Use devm_clk_get_enabled()")
> 
> from the reset tree and commit:
> 
>   b99e9c096148f ("reset: meson-audio-arb: Convert to platform remove callback returning void")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/reset/reset-meson-audio-arb.c
> index 894ad9d37a665,8740f5f6abf80..0000000000000
> --- a/drivers/reset/reset-meson-audio-arb.c
> +++ b/drivers/reset/reset-meson-audio-arb.c



No diff for the conflict?

thanks,

greg k-h

