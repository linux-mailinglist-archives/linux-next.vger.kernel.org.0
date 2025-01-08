Return-Path: <linux-next+bounces-5094-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15669A05B1F
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 13:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608603A5B3F
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 12:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157F21F8AE0;
	Wed,  8 Jan 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="ViVDD/U6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="v5/by6zW"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D81F76C3;
	Wed,  8 Jan 2025 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338394; cv=none; b=sF5Xd/ijjBfMSMxAw8UEatpfE/OQ9OeYuJwK7584tfrysxrGurRyts7ZUVEf4sJ8roQTDNoBKhhw1u0tcgKYaS+34r0b2GmOGIOcEvs51bwnnqtK9YyzNUaNYZqPqD7aR/3qPxrsRl6+lJQVGH2g5SPmNeGeiIa9v33wbPJOE4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338394; c=relaxed/simple;
	bh=8dIpAjXyic7YM2fJ/zmqhXkLzm+JvmU4tUeH4xYlCuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iy5HF6/OyqvVkydbDLEcxfJD7m30kkPoV72Lbi9gCaBwNPiWlDWCZ5lyIhuA6JOjCTI02xxz4tTBxzHtqkVHYo5QR06vauJ6I/iSgKFvkqGyeL9iGcic5xQJ4AH2a/pRTuXFfejQt+mgN74/HzXe0Uk/dWf+jDIDQewYEqec/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=ViVDD/U6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=v5/by6zW; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C0E50254019D;
	Wed,  8 Jan 2025 07:13:10 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 08 Jan 2025 07:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736338390; x=1736424790; bh=cwUBGlsGl/
	dSJmQqfRIIHs8sc7pHg4nk92SgPWKHe0s=; b=ViVDD/U6TmduWTO1CNwzmyB+dE
	USAQXvaVhzLAXa6x17wtaE+o7/ZMmfyEU6BHnUj8AQImY11+/DY0K3bO9wTlvYS+
	zCuJYxanGskMJw0PMSy23a86TAqEYcjpCgs9ec5O2uJgdm6mXNhZ6h6sEOa/jTgR
	C6kNXba3j09hpHZall35zVz7cP6Sds1X19TGDCzMTmbWLEgI/biL57v2NtW2RYxz
	lBuRe+X61g3QEuCVVmqPuS1U8rvkd2OBk2rLw9SY84S/lQNdpQyTX16Lgq85WZ/K
	9RHsnaySzaxAu3h2jt4PpRbkMUV2fgygHeuJ3QbqFGNssA5yqpUBodrOKegw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736338390; x=1736424790; bh=cwUBGlsGl/dSJmQqfRIIHs8sc7pHg4nk92S
	gPWKHe0s=; b=v5/by6zWKsrgUJ0sNlO2K8TowxrHdt0jM7yLh+X4kiQ3FfYVmTc
	QAJZROXI141dsXTOanxsMfOwTW4isoi0E0vY2Tn2dioYkLKpsty+bhBaSDu0j7uj
	2q/sy+C7WHEZnrsTc9aBf6RmVqZ9G1aAYkpCfpNTSTUZmxYgItjQbPtxkAmSGCHT
	qBMmdxZVsbydxQoD9iM4zUOvcBHNlJYDSri1OZJM6dLCL3z1Art/mmB3T3+uAB5F
	vdPMvRM0wy8xpHJaV6IawZjTzNSilsqNzn/B/W4TD2m8BLC5thZq02vguhmYNhKo
	4xKhrNrnohojR4a9zI24vWDx8xhwhFJ2Aog==
X-ME-Sender: <xms:1mt-Zwha3Asm1o9ju5RtoxBRGIdK5MWmUP2-aXhLRLcffpsjhOi_XA>
    <xme:1mt-Z5ChCz38Z9amMmyiiiCsya6sVVcLl7mAz-qU9UmmacjToUjbLSNBLvDjaZCt8
    lSNAr9vw5jWiQ>
X-ME-Received: <xmr:1mt-Z4GCOznTm_c-CIaMCepZ5aCQuq8EHbNBap6jPPHFI0dSm555NUbX3UjTfrNsHxkTQGFwg-vzd04JiqEOg_tHbBSYimdtFDHSCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtoheprghgrhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrsggv
    lhdrvhgvshgrsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhguvghrshhsohhnse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgvphhhrghnrdhgvghrhhholhgusehl
    ihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:1mt-ZxTjZUcCdD7KmdOIGKmRDpBB6Org-ZjCt7PvlhWyslizbVW6lg>
    <xmx:1mt-Z9xrGdtgsTx5FEfLJfv85lGfGriT5VeUVYjO1VLDPVvGd_u62w>
    <xmx:1mt-Z_4wcdiBTXOkF_dpgyNuu0w-ampyuoZG3h9LlNDSdQIfDD9gkQ>
    <xmx:1mt-Z6yh-7qvrpFJHIIqccF2Hnpl_ENb1Oi5x_cHEEogugURr-RqSw>
    <xmx:1mt-ZyK5OsxWAuKhavZJHJkyng8J--Z-pCbFAiLh6j5pNMHQ4vfhD-vW>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jan 2025 07:13:09 -0500 (EST)
Date: Wed, 8 Jan 2025 13:13:07 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Gross <agross@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: linux-next: manual merge of the usb tree with the qcom tree
Message-ID: <2025010801-easiest-excitable-a3ca@gregkh>
References: <20250106151712.4cf70651@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106151712.4cf70651@canb.auug.org.au>

On Mon, Jan 06, 2025 at 03:17:12PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> 
> between commit:
> 
>   ab8f487d2f89 ("arm64: dts: qcom: x1e80100-qcp: Enable SD card support")
> 
> from the qcom tree and commit:
> 
>   42943457e49d ("arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB switches")
> 
> from the usb tree.
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
> diff --cc arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 9a7b45066be2,f45df1396eae..000000000000
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@@ -943,13 -977,79 +1048,86 @@@
>   		};
>   	};
>   
>  +	sdc2_card_det_n: sdc2-card-det-state {
>  +		pins = "gpio71";
>  +		function = "gpio";
>  +		drive-strength = <2>;
>  +		bias-pull-up;
>  +	};
>  +
> + 	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
> + 		mode-pins {
> + 			pins = "gpio166";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 			output-high;
> + 		};
> + 
> + 		oe-n-pins {
> + 			pins = "gpio168";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 		};
> + 
> + 		sel-pins {
> + 			pins = "gpio167";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 		};
> + 
> + 	};
> + 
> + 	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
> + 		mode-pins {
> + 			pins = "gpio177";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 			output-high;
> + 		};
> + 
> + 		oe-n-pins {
> + 			pins = "gpio179";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 		};
> + 
> + 		sel-pins {
> + 			pins = "gpio178";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 		};
> + 	};
> + 
> + 	usb_1_ss2_sbu_default: usb-1-ss2-sbu-state {
> + 		mode-pins {
> + 			pins = "gpio169";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 			output-high;
> + 		};
> + 
> + 		oe-n-pins {
> + 			pins = "gpio171";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 		};
> + 
> + 		sel-pins {
> + 			pins = "gpio170";
> + 			function = "gpio";
> + 			bias-disable;
> + 			drive-strength = <2>;
> + 		};
> + 	};
> + 
>   	wcd_default: wcd-reset-n-active-state {
>   		pins = "gpio191";
>   		function = "gpio";



Resolution looks good, thanks!

greg k-h

