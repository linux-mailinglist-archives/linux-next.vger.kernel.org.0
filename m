Return-Path: <linux-next+bounces-5079-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A278A038D3
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 08:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE97E1646FE
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 07:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410D82A1C9;
	Tue,  7 Jan 2025 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="CCZtB34M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xA92FhTR"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A5D14F70;
	Tue,  7 Jan 2025 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736235310; cv=none; b=eVL6yAJ121ZcP1OXfcqUj0YdpqeTEPL4vYTq41LyjHOd2bWFGpO0Dg49u04UjAH/dWpfjAEiffCWxPn4YML0SBBkUWi8ASbtxdsC4Z9ITYMjfI5HGmpHZqkSruubv17PkGG7doW0n4rXDyR22JsarCYG7IBW/3e0ZLiztPnwUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736235310; c=relaxed/simple;
	bh=PKYrtV/ymJ7ptYT90v/ASOoCWD64M2eRo2x3LabwYIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1wYKbg8qsuwaRoh4Z1ofRVx5buigpXp6MIE3SAd32hosd7U15KkDw6aXFRsIjloGwsnDO6m4EInAftSOc2ZN9UYkehAZ51z/049A7gqfjYjUAi4GHMngNBa/6uaDZsSLuROwTKD5hx40TVx1+N2qtndxYzEOm2YKjv54AzigjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=CCZtB34M; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xA92FhTR; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 90B9713801FF;
	Tue,  7 Jan 2025 02:35:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 07 Jan 2025 02:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736235306; x=1736321706; bh=i/aupEnvn4
	zyhbU88jnRfsmgZTPdYemqu0z7McqKNzE=; b=CCZtB34MF0pmqDAGKOnzrqEmp8
	zE8ji3CPxedndN8lvKViTQqsOoSuUu+zUZUSB1faSZEkJ62OlLM+d5XoEf03jqIG
	RrVQEUUSuNKed9F9Kfllfoqr+uOJDsrLpY/yegmxrjns5zJuKKqEbmEHjGR997rD
	CPn9os3M1zNlOfLMPz1KnPikgwaTveLvr7ZZ9F1BcFgRAOEzt5Ih7GlFDP/km+SK
	XlXBDVUq20pasIH1E/V+GRkjlo7c2pI4lUOxHLzKTVJzAyXgtgLDD7AwuqK0M36j
	q6rJhW6saNEomPM1xyB7bkVuaU4Jj45oik8+LzUw5PbjXJ9GkXGNrStuvKnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736235306; x=1736321706; bh=i/aupEnvn4zyhbU88jnRfsmgZTPdYemqu0z
	7McqKNzE=; b=xA92FhTRBGbSEh5gkSz4xP0iyrdqUlnBEd5/VI/0z3R9nPcxpNg
	sC0j5to/aPYFTY++rxnVynHNhNBcfXZSrwPSA/Si6meaBCHOfygNyuAdZGT88ePt
	uEBEM+OCe0mZW1E6qdxfkG5T7DIGUR634lJCpqw5kMCJSJgqe2sqe2qJitNhGAev
	NnFk5InUCMQhE1susUPc0w16d/Kt26CwPrwwB5ERtDETAE8WfKE6OH6fM1bF3DJn
	QcWC5amVsH97neoxtb4+0i47iS4Jx0YvxTEYDulCxTXdj3gaDY8+MoMBa2RxZUp4
	vsVmnaGcOWkKNfjxra9eeKMTWBTo2CejCOg==
X-ME-Sender: <xms:Kdl8ZxxKGXh22iCZhBelPylTqTADJ-vAexiIfVOqzWNcpHCLgkDPSQ>
    <xme:Kdl8ZxTSH72LkYQ-kUm-hFgHejdas47UZMiT-VbphPMC-1Dt6CFuybwsHB4XgK2G2
    HaqtjkTuSoi2w>
X-ME-Received: <xmr:Kdl8Z7XCGhcMyZjFI9qbZeJeiErsQY2O6PlKWmKFythMqFGXAAKm4G9J5d2wOwh7fI5Fz5fTs7ViRLP19zLydehCb0S2kuzze3Z7EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeguddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepudeipdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
    dprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheprhhosghhsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehquhhitggpjhhinhhghiifsehquhhitghinh
    gtrdgtohhmpdhrtghpthhtohepqhhuihgtpghlihhjuhgrnhhgsehquhhitghinhgtrdgt
    ohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepshhrihhnihhvrghsrdhkrghnuggrghgrthhlrgeslhhinhgrrh
    hordhorhhg
X-ME-Proxy: <xmx:Kdl8ZzjxEpsY8_XnLawFT6wMdnDa5zG_SWIrBSXG-BAA60bhmpJ6OQ>
    <xmx:Kdl8ZzDJrDfjf1-yMQ6s2eGEFUrfYfI3EtV7y83yy1Yzn_rIu_bHlw>
    <xmx:Kdl8Z8JleYqXfdx5UuHPnX4QuBnFqRpiQIA-E_Y_iJfyVswPC6DFFA>
    <xmx:Kdl8ZyAxkoQFnSci7BTyS1c_icExWD5W1TZyH2XtcTFpiNZp241w_Q>
    <xmx:Ktl8Z1wf_3uOj2Gvw3s0CCb8tMBlFPRlebMVP8Jcl8348sCujrQ9XmYY>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 7 Jan 2025 02:35:05 -0500 (EST)
Date: Tue, 7 Jan 2025 08:34:16 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 devicetree tree
Message-ID: <2025010709-composure-darkroom-8f63@gregkh>
References: <20250107144312.0cea97e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107144312.0cea97e9@canb.auug.org.au>

On Tue, Jan 07, 2025 at 02:43:12PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> 
> between commit:
> 
>   38a498a28112 ("dt-bindings: nvmem: qfprom: Add compatible for QCS615")
> 
> from the devicetree tree and commit:
> 
>   f22a51b0a7cd ("dt-bindings: nvmem: qfprom: Add compatible for QCS8300")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 38e0d50f0e1c,c03da595804f..000000000000
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@@ -32,7 -34,7 +34,8 @@@ properties
>             - qcom,msm8998-qfprom
>             - qcom,qcm2290-qfprom
>             - qcom,qcs404-qfprom
>  +          - qcom,qcs615-qfprom
> +           - qcom,qcs8300-qfprom
>             - qcom,sc7180-qfprom
>             - qcom,sc7280-qfprom
>             - qcom,sc8280xp-qfprom

Looks good to me, thanks!

greg k-h

