Return-Path: <linux-next+bounces-2578-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A165F90C3BE
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 08:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3E82809A6
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 06:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5EA481DB;
	Tue, 18 Jun 2024 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="eRmwnu98";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n8xmEqUH"
X-Original-To: linux-next@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53316BFAA;
	Tue, 18 Jun 2024 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718692735; cv=none; b=suu92b0j3kGWRqPVCYU6jqgPW0Z3ZdMGhDIci2UFgdSiaaR35zNXzGLRNfIcuTxDHyT8KsC0ctj9PSzT1RbLpEW6Ai9LFrYmS1x0nVLXolMwESxI/KjGBr0LF2liisDSFSnGG5HWMVXGvUdf/uvfCaMdfqMH+2aMqv0hkF0+wnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718692735; c=relaxed/simple;
	bh=2MHzymjsptfmyDg7nkJWUgpNKKI9/H3dw6H8umrDA/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rv7AzGZKGBAAt7Pcrdhk1IGAJtWaeVnfqSMdpl5sNp0zT8XIm5tyX1VZEO2pvLq+HbVLmeRZn58xk1HVTZ6KjDI6UMuq0YnPKNpFMEPM0p2/12NwSuDpSWe4dP7BnnqU2QC90Rrx1FxYHBIlzZZp/ZVEXyY89WvLgFos3HxFVIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=eRmwnu98; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n8xmEqUH; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 3FE5018000D1;
	Tue, 18 Jun 2024 02:38:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 18 Jun 2024 02:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1718692731; x=1718779131; bh=MelmEiifL3
	mefmpiNyW6L73XRVlNle+exQ08leADDXE=; b=eRmwnu98b1+f62nfFifpY8Y7se
	hkKWXGiqSEivcgJVMHY/7F4oK26Nh2hYW4dFXYK+XeoEPtBceJAnNHlRz7N21CzX
	qTNq7tYVj3GkOrjDA3gnAlPRAvg3sUg0KPcSu4YE3XX0S11PFIJ1s1SJfEXgsD94
	olNXFin/71/h3ljwjvVSlcaEys4bcxZrY6i746dojtrVycCxGyg6ck50DH83+HaB
	ye9s4iNAdXisuCXhT/Inf8wW7umNLvaSJhacRN3WAtFv1YsQlUAM5zsaii3AG2Pg
	xBN46sn+ZujTmtg+d7rGCfGdGBk9zv2EscXEtXlGIRiy9vceopH1CuaqJvFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1718692731; x=1718779131; bh=MelmEiifL3mefmpiNyW6L73XRVlN
	le+exQ08leADDXE=; b=n8xmEqUHI/5mmb02Z1+IZYfCIQ4Wq7OtiY8ygvfpUTfb
	FMN/+NTRP7gabrQ+Z/9UMxqVGD9gSPCz/H7hWBFMos/5rfEzCI46cgJi3mSfik7m
	18Mkl1jkzu7PoJl9b2DMEBi4AV6Y79oV1Knqg2ZfX/AMFr7nOmVpkRELhuBC1hSn
	JJKjOGlFf3cu01KJqsUcrTwqgau9VH9ZeV2D6DzUvlxyhKjJe/zx6RJfbGHxn2LV
	G5l7nmofHQheGtxNFM8IZyBIf8ibT5GTDj/VqNSFz8LitddlrfzVA+VF+CByuczt
	cO8tLX5koGy/7g9xBpXU1/TP0QWgB6Fy+YQeEoIVig==
X-ME-Sender: <xms:eytxZunYQy-NhdCszhu7qkeYgjKLFXqgZpNcAeml5vDZf8WvqnRSZQ>
    <xme:eytxZl3NhmHA-IUAgX7pWAlQSVw9QTzOaG2xe9QGzdZoa7RH8rvO0OhYodjwhdh-8
    oYCMDdooxXa5Q>
X-ME-Received: <xmr:eytxZspWA5I4ARwAWpSolFeHx7C1uT-ZJYDOEDG3wAh2P3QqgavsoawFOUEKfbZ_pPuFKyG-Nzfgx8rNDNpevy0SKhI1dkGbYu1B8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedviedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehge
    dvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:eytxZincgJ4JsR2pqFnYM74WBJbf8GNDe2vvAOW34jpspnkUwvmuFQ>
    <xmx:eytxZs1XugIqhJr5gq4zYOifowyzyuySZ1_kavkh522_IOTRISFONQ>
    <xmx:eytxZpssHMxJuUhmoRNAwJU0ulfq6L4F43lCgcAUNUqrAa3HdhODog>
    <xmx:eytxZoXRkzOoUBRIEE9raKi62oJzYiTswliLfyXdsodbJD8_O0a6mQ>
    <xmx:eytxZmNVE6GRY6JAViC_A_gaO_lDXS4v-uL75o1F_6uX-Phn0UKKuQJA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Jun 2024 02:38:50 -0400 (EDT)
Date: Tue, 18 Jun 2024 08:38:48 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Gustavo Silva <gustavograzs@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the qcom tree
Message-ID: <2024061841-embellish-epilepsy-3a20@gregkh>
References: <ZnCUDSypSIPCTfJ8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnCUDSypSIPCTfJ8@sirena.org.uk>

On Mon, Jun 17, 2024 at 08:52:45PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   Documentation/devicetree/bindings/vendor-prefixes.yaml
> 
> between commit:
> 
>   1fabbb0888c3d ("dt-bindings: vendor-prefixes: Add Schneider Electric")
> 
> from the qcom tree and commit:
> 
>   202ce3eaa6912 ("dt-bindings: vendor-prefixes: add ScioSense")
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
> diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 56ad56d7733e9,044e2001f4e3a..0000000000000
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@@ -1264,8 -1254,8 +1264,10 @@@ patternProperties
>       description: Smart Battery System
>     "^schindler,.*":
>       description: Schindler
>  +  "^schneider,.*":
>  +    description: Schneider Electric
> +   "^sciosense,.*":
> +     description: ScioSense B.V.
>     "^seagate,.*":
>       description: Seagate Technology PLC
>     "^seeed,.*":

Looks good, thanks!

