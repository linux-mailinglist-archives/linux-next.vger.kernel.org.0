Return-Path: <linux-next+bounces-3791-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAF99768BE
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDB231F28A1C
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340BB1A0BFC;
	Thu, 12 Sep 2024 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Vkn4UmNi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BhWkj9/G"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8772C6BB;
	Thu, 12 Sep 2024 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143027; cv=none; b=M2FEnCQqMTl1xiSNtrpPe+R7bdRHLBEQbqqEIrVhfjkXXzZgTBMijNbQCq6va9uoK88UknEiOuq/lAPmjUT8NE0xdddUDSIUA0SSxFN7tvtFzq6ISmMA0yUfowZ1zADkvOCpkdOS8rqi83v/5gGQfEhJInIuQ054m1drGjg3I2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143027; c=relaxed/simple;
	bh=AV1jYtUIipd9qkzR7p//Rh2Gc/C/YsKZ+UrC0yknVC4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eEKIB6nUlMKEDbpuwXtbMDG0nvfedwhsg5goF1Er+NejZLeIgz4TAhZXYvTtI5nSWtoKGd5ZFAALwppZuz/mCOgXQ51sGd7Lcsm1+lAiO6UIFgPaKndf9VZy4VjXsWzHXkKdXkMrbzVDWlHnCjM4xRNVDVasQYQf6aVF5INP5uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Vkn4UmNi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BhWkj9/G; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5F907114051D;
	Thu, 12 Sep 2024 08:10:24 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 08:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726143024;
	 x=1726229424; bh=TFjiILWQ3zmNn+J2ZdZa8z2bBZchiX1s8/Mph1BZHQw=; b=
	Vkn4UmNiktvvTwA3Tqr9ID84/qw+PUBqxZBX/L232MprALRAzLgaM+ri1q4ROgiu
	6TEDgiKBcDOTQSv5DVbipxPzmwDUDwC1jhlIeus/7r2bkxoDPkQbyiOh51gl/LSN
	hQCWadtcS/IT4Q2TzNsz9QTK36muDneXVPZbxAjPrxfjDbDTA516ohcMwNXf/FRi
	Huca8SnfKseQetEPVwPA9DhuBgzX6fGx79tCz7uhLxQzogQTxz/jxhaJqi5s8QOU
	guQylVQ572ll4qFJ6yj99Yjfw1fGFQWSXV1F9tkfwIeNFxkFLUKapN+iBimNb/aP
	paML78lyTxDaIQq1JpBb+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726143024; x=
	1726229424; bh=TFjiILWQ3zmNn+J2ZdZa8z2bBZchiX1s8/Mph1BZHQw=; b=B
	hWkj9/GW97GxRtv8ai9G0UaN3O9hkRkJq4+IC0Iy9L04JDuBMWeBg7PMHXVygoWu
	gJPWXwbj/GW8ByqZN3xi3/n0MZ/Nf9Z6VDc5+QSQD9g/e11NmGyGdLYTnw4lcw0B
	Duk21JJi9BMHkBAVqAMBTKifSjuIlUwRoU/6HIHpDKhGAncFvqwtzgp593cKi/Ic
	YGexec2ty0A/fNxFdQtwTspLLVJyVPFrKOwsSYKlvWSyP1gCejHqvdJshffYJ44n
	4p8LpZwfrj1DpxoX8wCv9tbrBXuebHdyL9nZoji6Orp6NATCx7eEASE/yAHwc0Mg
	ZM0raqoIrgYz8SBDkfohQ==
X-ME-Sender: <xms:L9riZtPqAz4RsfQioDshm8VfWAKzYEqNqDcogVhjbhcpRkYv_fexJw>
    <xme:L9riZv-pHqnA_0HLmGxfS1aZ9REZyldMFQhHdSk9RhRaQbkWu9SRkUMv008fKo9Bl
    7__EIS19GtLqB60M2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghooh
    htlhhinhdrtghomhdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgr
    uhdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghilhdrtg
    homhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopeholhhofheslhhigihomhdrnhgvthdprhgtphht
    thhopehnihhkihhtrgdrshhhuhgsihhnsehmrghquhgvfhgvlhdrmhgvpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:L9riZsTTPV-L1SoHz336mS-vjc_0QlOKKWRdr9Q-l6cVIFNQuJdHzQ>
    <xmx:L9riZpuuKI9jRYFMJc11zKJM7WRpznfVB6caITrTBaDPsQl7eb75dQ>
    <xmx:L9riZldeWR5DjwzAPP7ldyEiQePZ3Bw-fi5AictS_bwxVPQ6xFhk2w>
    <xmx:L9riZl3x6SGpRky16vzYG1BzMrh68vBkdzS5JmxQFFEmZsQ92834kg>
    <xmx:MNriZkw12VYXIuy0-Q3H7_nbKICPAOE-Fq429F5KlH6GoZL2-hRYp8KX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C90C8222006F; Thu, 12 Sep 2024 08:10:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:10:03 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Olof Johansson" <olof@lixom.net>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>,
 "Nikita Shubin" <nikita.shubin@maquefel.me>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Message-Id: <c2247944-8917-4bfe-8689-22a43861997d@app.fastmail.com>
In-Reply-To: <20240912175501.02f057f1@canb.auug.org.au>
References: <20240912175501.02f057f1@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the pinctrl tree with the arm-soc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 07:55, Stephen Rothwell wrote:
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@@ -22,8 -22,8 +22,9 @@@ obj-$(CONFIG_PINCTRL_CY8C95X0)	+= pinct
>   obj-$(CONFIG_PINCTRL_DA850_PUPD) += pinctrl-da850-pupd.o
>   obj-$(CONFIG_PINCTRL_DA9062)	+= pinctrl-da9062.o
>   obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
> - obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
>  +obj-$(CONFIG_PINCTRL_EP93XX)	+= pinctrl-ep93xx.o
> + obj-$(CONFIG_PINCTRL_EQUILIBRIUM)   += pinctrl-equilibrium.o
> + obj-$(CONFIG_PINCTRL_EYEQ5)	+= pinctrl-eyeq5.o
>   obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
>   obj-$(CONFIG_PINCTRL_INGENIC)	+= pinctrl-ingenic.o
>   obj-$(CONFIG_PINCTRL_K210)	+= pinctrl-k210.o

Looks good, I did the same merge when testing this.

Thanks,

      Arnd

