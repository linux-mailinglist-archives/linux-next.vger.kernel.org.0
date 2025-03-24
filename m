Return-Path: <linux-next+bounces-5959-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B67B2A6DB76
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 14:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF9613A518E
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 13:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A69B25EF81;
	Mon, 24 Mar 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="KMMqUa5a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UcPNVVNl"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A2525D8E0;
	Mon, 24 Mar 2025 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742822973; cv=none; b=t88UVtLRekvf6KNaG3pV1XhFEItFxrDvN/YPm+8c1QM7M9YgvJvkO88PhK7T8DgsDpJKQtkgAjWSaITUcaIimwtJghFgndXGvDhPPqGPn0XN9QsXLYZsuvbjw546XDxQgdUAUrggCLBRXcQa2qvXk52OY3xJZUwdUZWwJpR+5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742822973; c=relaxed/simple;
	bh=7Eo2OKO++fcO5lS8JT1MaZ62HuSdUFxjiWtbDxDJxTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUzBh1Vi++MnBv1MNFhBbYOKfxzjHLuaKuUAJ6UybFXH5vvcO3Iu1leUNsHhdNbGInlDkfZLfbAwIXsZzXhWX18mQ6I1jDuJKjS+lzr5MQw1lTXqjJNI54hJ57hmhqtVGITvlD0UY4pPt5Sslgp6iEoYk+GQUACdQ/HXCwjo2qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=KMMqUa5a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UcPNVVNl; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B5CB11140189;
	Mon, 24 Mar 2025 09:29:29 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 24 Mar 2025 09:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1742822969; x=1742909369; bh=omPhG9G9KN
	fSdtvb79F235XEDS/uv+8xB9cIdErxcSE=; b=KMMqUa5aLWR9/aNCbpX/ux1vLq
	Hual5I41ek3VRkV6fyCr8ix2PdTTgrWThp/PErbPsDXGdH7+cZXbyDqk17mJGvYL
	zenHoZ41ZNASndI/19RRcYMS2Lp8+QBNqslMQL0sh3ZCmLCPt+DxSOKXrqnliZaI
	SP4TWEvWp1faLbg27kXg3DZFiQgOkyTuD0PBWI66t/eScptvoEEkg6paEMCAGrux
	jbV+SNTW0hG5SGUl4qX5dHJCRxBAdTuPm+DhrE538poe2Bv09zfxfPEYeIrEGasq
	caFhBtgZ0Lz1jmwCPPUbIKGDoeyZHseA/jxn+zvmkM4u69TiwCx9tML5DeXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1742822969; x=1742909369; bh=omPhG9G9KNfSdtvb79F235XEDS/uv+8xB9c
	IdErxcSE=; b=UcPNVVNl+5+dQ0XJUear+vI+kNRAMEKFQUUyipo2ZtVNDA+zhGL
	qfRRYuR6LpjGiyMncdt6ak5CkgyA5bUgwgBbVIyaax5hoQItgqvTy6trkymYacUa
	TwX96UMmGSDmwhhZzs9qwcCcAyzS4Cm6YC6ZDLVBWLpWLK83J2mVZMOaR3OuuVpV
	UQ5mSbJYvRexf3uZiPlp3J5peRJOlm6hpFqWl+s4A71tEzVQr0uR3HKK8AHmEoAa
	8dabezOnc1xPjymEB3UmFaoZfdamiCa+DeavjVURz0z0+X3IsV9/X5rr03yGjaZW
	JoWe2Fkdh77f+oaW3mM9CrtQc13CuQD4Whg==
X-ME-Sender: <xms:OV7hZzmQvJbqSNaJ4LURzw4tCZPq1QEUwOXYnw5szOEK7hCdjwtOWA>
    <xme:OV7hZ226XkJ35rImC9_KdQbTcs3RsSCOu0e9ZDGAyzBsNLXi-H_LokZRb3VDXtwKF
    Dp15IQJv4hyfg>
X-ME-Received: <xmr:OV7hZ5qmr7ftcpf23Z9T7MUW-xbPrMacykEzETPxGmC9uRbz2uojT_csBIaU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheelledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
    dprhgtphhtthhopehulhhfrdhhrghnshhsohhnsehlihhnrghrohdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:OV7hZ7m3U2yQcxdUuaNF_yjcq0j4bgbguv3BSAkYVjqzupYCc8pOlg>
    <xmx:OV7hZx00hV9UUdOLvflVuentRTVr3QbriaPy-yn73W7tsaGQ6iKffg>
    <xmx:OV7hZ6vaKwrexoaQslB07pUq5iSuFNw-CUae5x0cEdpQcjdKOBPHWg>
    <xmx:OV7hZ1VOYw2eSNlS5-5ipoddPFrl-Kbnxzn7aZ1IsieUzLn5GBCcmw>
    <xmx:OV7hZ6JpXXhdhsgJejAUnt2kr0kU8YhB-a92yUoApbCkLe90q-bDawAO>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 09:29:28 -0400 (EDT)
Date: Mon, 24 Mar 2025 06:28:08 -0700
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tty tree
Message-ID: <2025032402-princess-embassy-2f28@gregkh>
References: <20250324194405.0cd118c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324194405.0cd118c2@canb.auug.org.au>

On Mon, Mar 24, 2025 at 07:44:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the mmc tree as a different commit
> (but the same patch):
> 
>   e10865aa8ebc ("tty: mmc: sdio: use bool for cts and remove parentheses")
> 
> This is commit
> 
>   38e7047a4dac ("tty: mmc: sdio: use bool for cts and remove parentheses")
> 
> in the mmc tree.

Thanks, this should be fine.

