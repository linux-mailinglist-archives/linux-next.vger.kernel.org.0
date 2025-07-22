Return-Path: <linux-next+bounces-7681-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FE5B0D02E
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 05:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2760716052B
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 03:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD1828C01D;
	Tue, 22 Jul 2025 03:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSeKG48V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7817E374F1;
	Tue, 22 Jul 2025 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753154156; cv=none; b=HWyEB0VqF2zPFJHILJwdAaySoxIfBVLcDQnitCvx/Wxsc6tVV1OrNZ8tH42iqlAZCuzh//bEdrVhFPXf/ZcQ7j2aFxSAPVsQ1q7rFmd6SoK/2naRJMSN3RM2jejQkwuNysztCw/cwsnP8CzZslZK7IHTDTNFrODTFPwK6Uh8pew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753154156; c=relaxed/simple;
	bh=BgIUQni85rHJ+9ldRc5anDHo8ljtum799XeHii+VRBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMWtD6O4A4lwxnmHP6EdBVsJcIjofyR6iO3VgMYPYX18vRp30DSsX3OmBUiBzeOJe828GL+CXASprS+Mn9cs+88fENrzgISxpn7Usc+9H1m9J3IJjB9pd4yGybvdi6Kzc+v4FeWwV7GKOIDh2jRfBOzNyFBS0yn8VaEUQpH+KAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSeKG48V; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fad79433bbso45023076d6.0;
        Mon, 21 Jul 2025 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753154153; x=1753758953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn4TEokFlo13V4E/xBvkVozlK/MXcW/kd1dZgOVQPdM=;
        b=TSeKG48V3t0Z0Rwau/CG2F81Usttf19FgQq4oh0kfkyzWP2u+UXUbQLPRFXNOVb4sM
         wQHEx7Y6LnnbHdJWP1LD5IGkHqZXZa+0GzpeYMjtYq3NJjeIzPxoWcZgqqWf3kfQ+fFa
         seRP+CVJnwObFrclLxD9gyr7ObUnX7RFaQ+t24f14I5R3XjAgOqdqLHYD/SiH8zRtxN8
         YSn0kNvvNm/Hsu0y8/pa47U2+s47DjUtr2i2x17jkrNorcXqJZq/WHcxnZw18NBxq/BG
         OuzFvuLASrRN8XAhTJJAcSU6d3kPUoFNnoIoilYKZRY1ODm+urMCxASwtGyi2nfhc6RN
         TVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154153; x=1753758953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cn4TEokFlo13V4E/xBvkVozlK/MXcW/kd1dZgOVQPdM=;
        b=fGHGU18R8EbYUrKxPKWtTNbQBdHYtmQlh0cBrs73KEm2vSSfvV9V5v1skN2Cx3QrH9
         Lw2dOKySKxUkSuvGKu2s2/FigQV4i6CK1uPCs8SI3DpjIoHcLVv3+CiGo7Dq88FGWVYT
         yQrTHTw9Xwalb6ZE2ncktjMqYIYy5IjJyPE7ZYVfHFFLn53KhpgoRVSp2PAYWHoXKCR6
         RLPtqXnXVrceF0UOxvUt4k/TRCdgL2QCSS6Ct40nbsELKOVMvXTo4OIQhyfvxGx60tPW
         xgY8FmWIMvscX3OzhBuhkn2MeLxX5z2g6OkkxUScQmjZHHmMPMbjM13omvMBv5U7wK6F
         ceUg==
X-Forwarded-Encrypted: i=1; AJvYcCULgYlK00Poj+tRbCocSjTljj2QPhFY7S1+DkSIVFZjzFl004L5sXl0G6Ydy0jRjEeTziBwntKj6bAPqKc=@vger.kernel.org, AJvYcCXX8jWPotCBK2xzBMZms+ABy59o8rZjE2ikMqqG6gBP28optUA3N5gl/H9WfC7CVq2l3Xd19wYXhg6qlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDMQPraFNk0yonlSdIBka6FTQHhgNy0N35Hwc8o1XQMI4REJH
	QQ4z/AK+VBc2Ubka2K+rJEN67io+8MPKwiZgq79eau92xGsAquEAUZ4U
X-Gm-Gg: ASbGncs5xQk82r6hgR1HF6ukwMEFtba2ym6ewBaLJRpgcOSMmUq8RohWygz38Ld8FfT
	GNZe6F9vSU6tR1SZ106OY1p0O+RGD66ZJbFKJogWOTFIGaaY2IAvmhBtaYkYYU9wbmkHrg32mfv
	fn+LoAKBeMEQl1rF2yNNKr0oI/cjF+JWjI0QYmZYIASQi3pLPUcQ2DX12sQ2UlHffrL5u3r40ch
	zbD18In1ECPQkhyqIdynuys/tFHxrmKHAM4272UAQWBTVut6sWTkwCiksXdZkzE3AY3R9tVWIPd
	F+R8t4clX2nv8ZblEAgEkOXI+qvOQjD7O0VFYYHjGOV5Y+q8LrgcbtLn6eUQGef/lUmag5lhVWj
	cVJ6cx6B664RnisGMdCYFA2BeVF/b4QQVYEnqynKuXg1ZzYkSchVK/wnXuuUqce2Am7zYLDdQ3r
	H2Kkz9QqJJgBNAGalnQ7rYR7M=
X-Google-Smtp-Source: AGHT+IHfZITeir5tAF3Gl+MPDmA2MyPpGPq+SVFAIsBgnDW0aZwIMfe20/rST3sykfFBZSpNsyTwOw==
X-Received: by 2002:a05:6214:620f:b0:704:f952:18c0 with SMTP id 6a1803df08f44-704f9521f0cmr238014886d6.51.1753154153186;
        Mon, 21 Jul 2025 20:15:53 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b78esm46776646d6.52.2025.07.21.20.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:52 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id F233AF40066;
	Mon, 21 Jul 2025 23:15:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 21 Jul 2025 23:15:51 -0400
X-ME-Sender: <xms:ZwJ_aAg35Thmovu_TCpWlfY_-Pgv37J9eth96DGwnxx3TkV7cLteug>
    <xme:ZwJ_aNkx5bZ79dlz3Hm8Lb0NZsYNu0Ehyyd7UJst8RBKeW7k9kTqNwCugWLqHY8Lh
    0SE9mQ-KsaCTCefjg>
X-ME-Received: <xmr:ZwJ_aFOvSy20PUjWyeqlQ6ZKaCiyv3RU1yILksfdiXg66kmk-bKOgBa6q3M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejfeekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohephhhprgesiiihthhorhdrtghomhdprhgtphhtthhopehpvg
    htvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtoh
    hmpdhrtghpthhtoheplhhinhhugiesfigvihhsshhstghhuhhhrdhnvghtpdhrtghpthht
    oheptghkvggvphgrgiesohhpvghnshhouhhrtggvrdgtihhrrhhushdrtghomh
X-ME-Proxy: <xmx:ZwJ_aIHJ_SV3K9KQ2jOVsZSGocfAALu-a23T3yB6i_uuAM3_B_HYvw>
    <xmx:ZwJ_aLvGOVhJWjGGp49p5V2nonXQkmAX62nK5OntJKWzAlEUqoFS1w>
    <xmx:ZwJ_aIQ_UIQuCzpXRH46jQ7smrITYpnV1kA3h8xmhzAQ-VDRjjY7iA>
    <xmx:ZwJ_aFPHUpCAnWhm7SXgXpLXrjkS9X-8a7x4CqNKLoSS1MmXoUbq-Q>
    <xmx:ZwJ_aG51AiFJO_9BXi7c2ZCbCZMrW7YBeRjJf6cxDQ7xtZhwr5L0FxgM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Jul 2025 23:15:51 -0400 (EDT)
Date: Mon, 21 Jul 2025 20:15:50 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: semantic conflict between the tip and sound-asoc
 trees
Message-ID: <aH8CZooigrI4mmKB@tardis-2.local>
References: <20250722130140.74182f72@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722130140.74182f72@canb.auug.org.au>

On Tue, Jul 22, 2025 at 01:01:40PM +1000, Stephen Rothwell wrote:
> Hi all,
> 

Hi Stephen,

> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> In file included from include/linux/kernfs.h:11,
>                  from include/linux/sysfs.h:16,
>                  from include/linux/kobject.h:20,
>                  from include/linux/energy_model.h:7,
>                  from include/linux/device.h:16,
>                  from sound/soc/sdca/sdca_interrupts.c:13:
> sound/soc/sdca/sdca_interrupts.c: In function 'sdca_irq_allocate':
> include/linux/mutex.h:153:9: error: ignoring return value of '__devm_mutex_init' declared with attribute 'warn_unused_result' [-Werror=unused-result]
>   153 |         __devm_mutex_init(dev, __mutex_init_ret(mutex))
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/sdca/sdca_interrupts.c:422:9: note: in expansion of macro 'devm_mutex_init'
>   422 |         devm_mutex_init(dev, &info->irq_lock);
>       |         ^~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   daec29dcc873 ("locking/mutex: Mark devm_mutex_init() as __must_check")
> 
> interacting with commit
> 
>   b126394d9ec6 ("ASoC: SDCA: Generic interrupt support")
> 
> from the sound-asoc tree.
> 
> I have applied the following merge fix patch (just a hack, something
> better needs to be done).
> 

Thanks for spotting this, I think it'll be easier if sound-asoc tree
could apply this change (with proper error handling). Maciej, Charles
and Mark, does it sound good? Apologies that I was a bit late for
locking changes in this cycle. Thanks!

Regards,
Boqun

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 22 Jul 2025 12:26:10 +1000
> Subject: [PATCH] fix up for "ASoC: SDCA: Generic interrupt support"
> 
> interacting with "locking/mutex: Mark devm_mutex_init() as
> __must_check".
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  sound/soc/sdca/sdca_interrupts.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
> index b76512732af8..b393471e9760 100644
> --- a/sound/soc/sdca/sdca_interrupts.c
> +++ b/sound/soc/sdca/sdca_interrupts.c
> @@ -419,7 +419,11 @@ struct sdca_interrupt_info *sdca_irq_allocate(struct device *dev,
>  
>  	info->irq_chip = sdca_irq_chip;
>  
> -	devm_mutex_init(dev, &info->irq_lock);
> +	ret = devm_mutex_init(dev, &info->irq_lock);
> +	if (ret) {
> +		/* do some error recovery */
> +		return ERR_PTR(ret);
> +	}
>  
>  	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
>  				       &info->irq_chip, &info->irq_data);
> -- 
> 2.50.1
> 
> -- 
> Cheers,
> Stephen Rothwell



