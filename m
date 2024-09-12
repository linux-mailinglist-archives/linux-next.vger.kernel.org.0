Return-Path: <linux-next+bounces-3795-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C9976928
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 14:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526941F20F95
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 12:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FEA1A2641;
	Thu, 12 Sep 2024 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="jyRbQOAY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sKTHGSzf"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8441A42B7;
	Thu, 12 Sep 2024 12:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144160; cv=none; b=fl3iqwUrPP5QeDvLeAwAa/7h0p6brO3hcjPD/ZLmojUX93W1UlABpFPvVZSoldyLpaPp9uaz/r3aSyYel3KrRG19KXekVnBkrwF50tHbklyvu6P7ooNi3EoXpAKhc/NucLmIaDeK+uUKESniSEcIkAHcKf3RCj7Pe0I7ZLf4Aw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144160; c=relaxed/simple;
	bh=qe7qVApfjJBsv+6+fm0CU+sdm8bViT6NwBr7Hwd9Nao=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AMJnpGl5X8cdBNkvAq8zxE+IvkLhRSbZuJjIp1XDhEnmLyaGy5dy9x7C9Kkaor52/9NxIhpDzuysmhp8z9Ik2v+yxnGL2LAiOS3iC/HJX45gagZB2lGe2PToEFQuhchwIY/oBYTYQ32H+0CBnMIbUkdZbn0DteSgqXf2kWF2f9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=jyRbQOAY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=sKTHGSzf; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3E6841140173;
	Thu, 12 Sep 2024 08:29:18 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 08:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726144158;
	 x=1726230558; bh=vAygn4MbCus9iqq8WHpmh7IMuoEg1L3mmHglUuGuQRg=; b=
	jyRbQOAYF9bl6qpmjloc+Lx/l1beN+dohAySiYmXSQE8sgjjkJJtpQG6QRPjhf8I
	NIoNRO7VSfMcZI+lyP3dW0ll93cVS0Vi6yJnewiYiPAyLaiGxxqYkCfkPBYuXvSt
	UBV7bSJpGuFIbbglIx4E90sodXFg4IuNdyRZ9cYghtsOpzek6wnZvFhz/6qF0YX6
	VKBB11m5YNaRlqub+dqOUA5I2E8OI1TrzIoCh6Qc7fw6Kropxlo1S1PlYsIlKn8J
	IKz++9lY8BFbOVBXeGr7mQPjv0p22QLEOau7DO07inrGrk8nc1INNvLM2oKppQCC
	pMJwSXK/kkKKow6yQmFYRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726144158; x=
	1726230558; bh=vAygn4MbCus9iqq8WHpmh7IMuoEg1L3mmHglUuGuQRg=; b=s
	KTHGSzfgCxgCkCvwRJywYqWuAM7lSfeMgFidJtq4x8dqgwROLEpQkvA64cy07IGr
	jKN9Su5LBYv8gezf4iaJZG53hs5XgBKZRmKpKfGwX/vi42tO1Mze5UKCrC2PgOvz
	6T5WRsT2IdkSPd+9FMklpL18veQ7GABv9f9AAGry9ax5Xs+6LY7sP1993ErW9Shx
	Nq4oQ9kwpsalAzhP0J+AFsPxLaKlpK8tfBG5rQdkMJKcr0LxEndFydnXMDG73we8
	LMONZO6di1g7NQk81KWOePY4VRhiJEaOndv8dcHgri931ckFRpm/h4xo4H6QQKR5
	w9y9d4uNiz9YxcanjWvdQ==
X-ME-Sender: <xms:nd7iZg3l1dYzv-NnoNcshx1Mt6vtsYihfiDP_yzd878ThYT3mqmWRw>
    <xme:nd7iZrFQzlpaguMntyMDwFJApjBGa_LYYluIe2XlAuL5jQlYGUV04jtwjDFGM1_-N
    JtlUJSc4ukWFU5zNSE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehlghhi
    rhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhs
    thhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepohhlohhfsehlihigohhmrd
    hnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:nd7iZo654973chgc_UbPdKZN3wSYyIoXzfveAroFE8_cEGEI7j9q-Q>
    <xmx:nd7iZp0Bd_cHYXR9sTLXL5pRcPIgbeAx6BQc__8ipl2iclLAPkLj1A>
    <xmx:nd7iZjGCHihUv2uNwX9V1mfm-z89McpLTbtWLnqQF5cKM_N0rbbiVw>
    <xmx:nd7iZi8RCILOrwCfrBNMpiByVkDlVhKKEx8tYIyLAiHchOYkLR7AmA>
    <xmx:nt7iZo6nao2HFa4DfCaJIU2lV7SSxfAvSa7CBijwCJtIS1wvo8evDhm7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AB990222006F; Thu, 12 Sep 2024 08:29:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 12 Sep 2024 12:28:56 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Olof Johansson" <olof@lixom.net>,
 ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <b064ce64-1a44-4d93-ac06-248067cc2c47@app.fastmail.com>
In-Reply-To: <7e5c452c-61ec-421f-bd87-506d66a58f55@app.fastmail.com>
References: <20240912144459.634e3e09@canb.auug.org.au>
 <6e5c1a20-2232-4a2d-9a0c-181d50a99ecb@sirena.org.uk>
 <7e5c452c-61ec-421f-bd87-506d66a58f55@app.fastmail.com>
Subject: Re: linux-next: duplicate patch in the sound-asoc tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 12:08, Arnd Bergmann wrote:
> On Thu, Sep 12, 2024, at 11:07, Mark Brown wrote:
>> On Thu, Sep 12, 2024 at 02:44:59PM +1000, Stephen Rothwell wrote:
>>> Hi all,
>>> 
>>> The following commit is also in the arm-soc tree as a different commit
>>> (but the same patch):
>>> 
>>>   7817eb1ad353 ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")
>>> 
>>> This is commit
>>> 
>>>   cf700e558e1d ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")
>>> 
>>> from the arm-soc tree.
>>
>> I wonder how that ended up in the arm-soc tree...  anyway, shouldn't
>> matter if it's the same.
>
> I merged the entire ep93xx DT conversion series in one branch
> that I plan to send as a separate pull request after the normal
> soc/dt, soc/drivers etc branches, in order to finally get the
> work done.

Hmm, I now see that this patch and 20240904-devm_clk_hw_register_fixed_rate_parent_data-v1-1-7f14d6b456e5@maquefel.me
were both picked up by my script even though they were not actually
part of the series but instead listed as dependencies in
https://lore.kernel.org/lkml/20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me/

Presumably these both got merged correctly into my tree by b4 and
then I accidentally flattened the branch when I applied Dan's bugfix
in front of the rest.

     Arnd

