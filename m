Return-Path: <linux-next+bounces-6421-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723DA9F374
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 16:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7183D7AF8FA
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 14:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE5526FA4D;
	Mon, 28 Apr 2025 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9d1jUpF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598BE26F458;
	Mon, 28 Apr 2025 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850632; cv=none; b=NlaCEiuDU1fl1AtBn7svHMIOXVAEeHw5/QijmXZVFo6FUQp4Gtb0/zAF8EKJYIZV7dy21RyqmSl9QHUMvmPhEkBIpZyM0b5UK17JlWoLsXjPXRjJg6YJd7uIuio9FpUTbwHiiclC3FcGIzIcfDQL9HMu6ZHgD/rugKX/oAfYRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850632; c=relaxed/simple;
	bh=5Tul0UgKqEItZ9l0IeEA7LfntoTS/n68SZqcy9BrzRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIec4HIdmJ4brb922XLfGm6LHKvvrrN370cMrDPP3a3RrgsVlAnqdHtCZLkMQBia5r3uQq0mv9Gvl67DbpLMN452OYDwnmNCNpSczYpov6XlqdCCkqTjCi/POxA6vCX6QzSNOcD+uNn2bmLOoYhwdzJcdFpQwUvXUNOfPQONXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9d1jUpF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f2b05f87bcso52632946d6.3;
        Mon, 28 Apr 2025 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745850630; x=1746455430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6qLGoEJQPdzq4IJgvyxvY6FUlbaKt7CiOREYYADEK4=;
        b=c9d1jUpFPMQwXgnT5XAf8nvxWBXt6E1caDisORgThTwmprnHffhvyDKhpwt8Dhhzxg
         G99ZJuTu1oMtDQnsw5noFgjcrba5nE+EmzMakZoul6mTbr/euJK/+g7ACHfNmU3PZn0H
         2fvfR8ubDY4KOOj259jWY/5Oad6N5R2XfkTM241kpcHrWyt/uYGODZvTOX+OGkIs+cD2
         XMGt4EKqvGaeZN6qNMcL7Z8nXAY2hCjnP7JTgjCeXI9ZvpAazs9c/2y8sBMIu68NZ0pg
         QOEiOxyrpqVK2qEtKqXFMCdXfqtC2M7ydgy9FLfFMtwxXsEAqKyql3Dlgv0PaJ/kxvc7
         HD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850630; x=1746455430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6qLGoEJQPdzq4IJgvyxvY6FUlbaKt7CiOREYYADEK4=;
        b=syDFbXo2obR5L778iRrY8NQ+lwUG0SuS7hR9jwAZBvtVukMAGxV3RyEPUKCO6roW6u
         67C3Cml5NBNXW+BO82P6YKA5XqLR8qT+FbmdfKWBf59C81391CmJvZeWBiYW2zRpKZ8Y
         BxXJ1PWEzClW0q0Z3cXPxJkOBkqPKQ+OSRNAGNitW1xNMA5sGOOaHkEEwdeL+AN4Oy2Q
         ZnGv41VKOu+svACyav5/2M7XZ/5MwrntAI5GKysveBuno/xsDkqdOOXMmwt/gK6Y2ndl
         i6IrlPjOJ0X/ksIOcspjap2qyJzIrqSGt4bPiwmZUbcsh4DHoQ5S8omGpHV84YEkVFVm
         YZgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfVCKcJ8KFPuI8iPYvp3KYiDG3nxCelK5fIR2CYvjNQgBz5IqXLNSvljyZzQf/m5v3JL4WLtR9Pp6vxA==@vger.kernel.org, AJvYcCXK6QSQd8qKV1hrbMggCOnuT6YO7qOWcSlyeu22idIcnDQs+EZY1lrm+Jzq77RK4VAxD6uQ+8zxZU9RW0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtQ3PggH9CflvKtDV1uXzDR8ROan/Ks9xiedmEyTjkoedDV1nF
	fxBK4L88uws5lAA4feKwzosi9NRsfbOc9I3ulZpcY1vSAcdLSisi
X-Gm-Gg: ASbGncuQ2ZP46hrfksGAtGoU72h0MyRrrAgaAfAlbulJ65K2o+XmwX9wm6BkyV4hf8V
	qYaz+fy21BsZFS5Olbg6cy/fIkYuJvej59FJFT0unqhrObFXOaPb+S6e/feUPS0LeUZj8a9I0WY
	TW+V751Fft8voJLDi//KdW6bgm/OZFhVRY12IQZPRJw3NZAb+0bLAS6KrkC/io4ZILuO05vwuC6
	H5weUkLl9/bl+Vg4H6syDuJl9hWVCBnlhIbNXvw3krFY2nuFURW5aBT6+X3uMvEFuHSKzYnW09V
	60YoJ3DmLrkOvgUrII6Og9fC0Ul7dh0jdUXWQsKlBOGqgE1YQGHQby+PMCHWr+SAuhn58axYCmm
	BJ3MvEhGNnMuYWIaM+c/F1EzL4j581Pw=
X-Google-Smtp-Source: AGHT+IEobRjicM02uOFuHp85zQemUY1rWw1tmoVyDNr1mIrHBQvYSAKQJxLzyWJgTbC/BbdK9ujfzg==
X-Received: by 2002:a05:6214:202d:b0:6ea:d393:962a with SMTP id 6a1803df08f44-6f4f052eb25mr684556d6.1.1745850629689;
        Mon, 28 Apr 2025 07:30:29 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4cbbb9de6sm47577906d6.3.2025.04.28.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:30:29 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id BC6AF1200043;
	Mon, 28 Apr 2025 10:30:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 28 Apr 2025 10:30:28 -0400
X-ME-Sender: <xms:BJEPaPp6xkdywihycKXQSi991J7IbaRZKijZP-4_XhsI7At97dSnQg>
    <xme:BJEPaJoUbVQx6StiMZLvdn2TEu1dn1yO3YnuCthSCqkDb_e5PIC0FM5B0jCMAIlR0
    I1TgjeLWha_BReaDg>
X-ME-Received: <xmr:BJEPaMN5THSLIPs3Z69j9RPuGTolvqSq6WAU1-fcJAzMsz78YByaDz-d>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieduudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepledpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrgh
    drrghupdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggvrhgrjh
    druhhprgguhhihrgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehurhgviihkihes
    ghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehjohgvlhesjhhovghlfhgvrhhnrghnuggvsh
    drohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:BJEPaC52nNj6evnGiAU3lW0SxexUgcbpV8J-6LJY13mc8YtaS8zJxA>
    <xmx:BJEPaO5pd98c2ustORLaffssmdXp7dAWPYhfegi7OxzrwiQBWm8_2g>
    <xmx:BJEPaKiKUvt4PfUwG6s-6kbmP4x4stGA4JMgyLgHUm8TVKvzXuZVGw>
    <xmx:BJEPaA6LNSBS8oVfNXEvJFiVcznYeNU3He0QA7gBrIz-8EnT1OZB2w>
    <xmx:BJEPaNKVUy887xBHegHyhbeSAeROrXzmM1tWbFNu5KWA6V2Ucu35XaZi>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Apr 2025 10:30:28 -0400 (EDT)
Date: Mon, 28 Apr 2025 07:30:26 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>
Subject: Re: linux-next: duplicate patch in the paulmck tree
Message-ID: <aA-RAjmhvIbI_z9b@Mac.home>
References: <20250428175438.0209858e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428175438.0209858e@canb.auug.org.au>

[Cc Joel]

On Mon, Apr 28, 2025 at 06:08:45PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the rcu tree as a different commit
> (but the same patch):
> 
>   5c9e0062989e ("tools/memory-model/Documentation: Fix SRCU section in explanation.txt")
> 
> This is commit
> 
>   8e40035aab95 ("tools/memory-model/Documentation: Fix SRCU section in explanation.txt")
> 
> in the rcu tree.
> 

@Joel, should we drop this commit from rcu?

Regards,
Boqun

> -- 
> Cheers,
> Stephen Rothwell



