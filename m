Return-Path: <linux-next+bounces-5710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD47A5AFE6
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 00:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAE357A6319
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 23:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F9A208990;
	Mon, 10 Mar 2025 23:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWSWwiTU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5031922C0;
	Mon, 10 Mar 2025 23:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741650867; cv=none; b=bYLMYuqx3VwrLijZFRHvQT2YeQIZqN7ffehXl4kztF8MOerHEDQLGI/eRwUX+KoYo1FEg9djZoi/LoFs/gtEAwkvGiUjWuQFyrrri596mVOao2NWfDLxgf+L8Nk1Mfbidm2lOswiIBC1sOZTEAvrgxIp/wPIHsup+a62fK8JPf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741650867; c=relaxed/simple;
	bh=PtJcIGFFYfvdj1xMsCOxKWZ8G0BNBa+0xQdenVhQAfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnK+aOuBfSc3ibHA14bpkcA7IV41cDPZFpIbbYGgRpzZGo5vyBfEahmi00lz0G11pdCEirhIH5Sa5/UHV3LCt/gf7yqfeo2wgqBAs5YtgWsVfyD55Mdj5o4NWclR8/pPf+r5DKb26TadShfXLHHNzKaTmkZ2d0SpYjeO1MPrWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWSWwiTU; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ddcff5a823so30949826d6.0;
        Mon, 10 Mar 2025 16:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741650865; x=1742255665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aG2r2z6d7BuYAc7VjFnwY6uGPFpAxoshbTsTk9qhJZ4=;
        b=KWSWwiTU58OUBr93tMHYc5SnSDRws85YQD9V9XKoJLPNGC3uDgx4uLWxDARttZttWJ
         KK28eOaHag1kcJUbMao8atx681DK/0feAMjgUa8tDF8KVEDV/WUg6K1PkEKTUj6fBF+u
         lkJ9nikipvs1oMpmZjWtXuzOgm6VKXV6/tK9N9BVfx4KEEI1sZQQ6vdsBnzGYZisFShJ
         7HXrcyWkx6AIp3Yyjf/udvqWNZQp3FKhJ293Nse6MmZf9/o9sXic+IDM2aHbssIsNgvN
         dciQaVUc/GxE3Dh22fmq6E9c1yTRFeAaEYuVjnM5lQZ98snfQw1Bpgyvzt/wVLAzHan1
         UMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741650865; x=1742255665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aG2r2z6d7BuYAc7VjFnwY6uGPFpAxoshbTsTk9qhJZ4=;
        b=AY8ercDa5FqTTuEtIsIa3UpllJIILeaHwP/7Ji7/J57mD9YcJV84SIoiilN3SoWtLP
         bCVD9WiIaw9S7WMv6MwY24SevjPZmMsBdFcL7XgjSlJUwrfm8GMKfCg6POjKBbI1bwEW
         VBslLdz7x9+XdQqL5ZF9bJUy9jDxi4xXskDrHPF91dy5DoEKA1ELvBiGQzBX9pp8CuM1
         PcA4ETpTSB2umGyNccEo72tMg0ZPyVJhDK6fPNRRJvoqm5jp8PRjey68EDDy5IIi2nh3
         hpblabYNCilEB1LwNZsgjforx2cVMipVCeFZyz+/KFdQrYEiPivI14Cvr2qAgK9mva8Z
         fW4A==
X-Forwarded-Encrypted: i=1; AJvYcCUbduOfc5TJh+hrEFAu3iW76BVIGHIroR4A8j2aqGNC/6IaFiBF4IXB4B1K8fpCLspXbAORKRzmdgc8Jw==@vger.kernel.org, AJvYcCV3oc+nyHrOlC+KWJWUd5vmjWQ9JW+KjlRq9/Wm/662qyugkLBKxYYN8QUYGiG3yqXn8WQp1USyzBhoD9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXj++Qy28Og041ntysk3eNY8ExPkzftTrfcB9yBxT6z7SCJq2i
	A0Ptz2HFhYHPHBuh15pF63aTNx10hMeUnNVBUkESQ7Vx15Y3PJ7D
X-Gm-Gg: ASbGncuIbTx9LzrO8N9H96kbZ7q0BLx5pGxzzJYyTgnRLyDZXJTuZGHhx9TejIqOWRp
	6fc0gacm+PyiYv71+8/5ht1fJ9gepX381IivFX5ts7HI/T4osNwTZhH0IX900hmxM0imlzuPTK+
	XvIhYbd3ix14HXwaL7SCsMbAcYKh9NZvz2fElV6SdxPivjtNFLKUP2dVpEKwZxpQ+hAwOTuqqXy
	UqlLHX+SZUYx+ek3k0HmHBK7tI64LLLF5rPGj30Nc3TYU0o0UNEciLRlAvMG31RUHO206PwxV+7
	8YqOEOXOrt0j9SubYBKoIpbupw5ZN9sWjl8m930rVdjOHC5xTpHgh0AVIWFtos3+76XGzq8HxDI
	vy4GyhspIO0oNrEjxXu/LuE5NOI+tfgcvtog=
X-Google-Smtp-Source: AGHT+IE8b1YSYyJ5vnh8bMNcWfJg+aj6n7MpvB271ePK9VC+EtvXpHegIwCTIcxSME5/3h+U1xHJhw==
X-Received: by 2002:ad4:4eed:0:b0:6e6:6bd8:3a86 with SMTP id 6a1803df08f44-6e9005be42bmr198614916d6.6.1741650864801;
        Mon, 10 Mar 2025 16:54:24 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f707c267sm63927486d6.17.2025.03.10.16.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 16:54:24 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id DF2FE120006A;
	Mon, 10 Mar 2025 19:54:23 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 10 Mar 2025 19:54:23 -0400
X-ME-Sender: <xms:r3vPZ8SmoMBGv30iRePzhlOyWaQKHFrnquezIKpDVO7mmyYfFHkiJw>
    <xme:r3vPZ5w14VZb8u7DA8uaZfrYCJjSUeXsjuNlXbCA1UYXiNOgwtAx9ola0juSQKBir
    L3O_zRvmUHLiIAfrw>
X-ME-Received: <xmr:r3vPZ51TPv8D9lg-9N1DN5GGW5Dtu4FllLHFo6ncCckBjILjoEeiT5D4LRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvddtjedvucetufdoteggodetrf
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
    vghrnhgvlhdrohhrghdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrd
    gtohhmpdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:r3vPZwAUSCzZzsxOT_xc7PG9ytNG2qSEtGWexgHwIy82sd80lr2Npw>
    <xmx:r3vPZ1hI7Eigj8kllebjwlff4AGiTeqqWXpczqrzykMx8os3GppYfg>
    <xmx:r3vPZ8p5oNcpYlXBB6iubcu5_5JtqSvPgRoFRLNoPCBUCABjVZtL2A>
    <xmx:r3vPZ4jolOEB65bfMrBcwkaQfYKPVVgwhfRq75EM14G_WfPmNa7vgA>
    <xmx:r3vPZ8T-YSsgQsZAH32-O1flRLSEDKgXhy1y_4rDKJTswrXulZHgf8qc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 19:54:23 -0400 (EDT)
Date: Mon, 10 Mar 2025 16:53:02 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <Z897XqnvB30aWHHk@boqun-archlinux>
References: <20250311081301.6a22ab25@canb.auug.org.au>
 <Z89g6ZXRHQUq8WyV@boqun-archlinux>
 <20250311093752.703b3069@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311093752.703b3069@canb.auug.org.au>

On Tue, Mar 11, 2025 at 09:37:52AM +1100, Stephen Rothwell wrote:
> Hi Boqun,
> 
> On Mon, 10 Mar 2025 15:00:09 -0700 Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Thanks for spotting this. These two are likely for the next next merge
> > windows (i.e. for 6.16), and presumably they will be handled by Joel
> > (Cced), so I deliberately avoid putting my SoB there.
> 
> The next merge window (starting in a couple of weeks) will be for
> v6.15, so if the commits are intended for v6.16, then they should not
> be in linux-next (yet).  If they are intended for v6.15, then they need
> to have SoBs.
> 

Got it. Given we may still decide putting them into v6.15, I will add my
SoBs and update the next branch of rcu repo.

Apologies for the extra trouble.

Regards,
Boqun

> -- 
> Cheers,
> Stephen Rothwell



