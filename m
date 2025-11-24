Return-Path: <linux-next+bounces-9177-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE49C80E55
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C3827341603
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640A730CDAE;
	Mon, 24 Nov 2025 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ST+2BDSo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2930E0EB
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763992867; cv=none; b=SqPMVRUpQujlY/98R35fXLfz3dg48ceRpiIewTw5PwpGI8v6lAQibBEXy/ARVRT+7MBQ4rY9G+6hmOLhl16nP3w6hwMlABUqvuvpGOSRkyS7ZsKjXRkGk5VfPB5nxdTLhnGQ52jH4PzW7xofBw3VaLdBZv4Q10wlNeifUi6ps+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763992867; c=relaxed/simple;
	bh=qsEkqJ2S5oPr2U1UTuFh60iN9pLOhGAzk92E0AvVXqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1aQz6/UmUN5zAlgKQJ+F7kde0vMjefD677TdXAZ/qxb0fqwZaPCsaA3EMpvHTbBpAg94kitpc26qp/t+D7hWpk4HNM4hwv1PUuxsAsc7LYPbQ22OEK1e4rkUVZKKF3/y1nHbL5lCGq9gmob1VrberJNgvtGx/d22BBbDqAa+qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ST+2BDSo; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee1fca7a16so37221911cf.3
        for <linux-next@vger.kernel.org>; Mon, 24 Nov 2025 06:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763992864; x=1764597664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/jxlDz9BAO9kydkpl4fCic8ClBRjihhesEG6s01glE=;
        b=ST+2BDSod1e63IV/v7+MPy5LQiJz/dbfLJYRrppaMd26bgwm6p1HvKsDUHdYiKAb2B
         NCpv0TySmhv2N3WgkauFTnPsLEwRqIkvhlpaeQi8FYkEiCufCxE6yLjF70PsvhnBsReI
         IBMRdtbH+Vr7lekCdxztCt0Q11Atp6/Z8ZFF0yRQJnmViTsYxtpM7YjvIj5a1ZBGY2oK
         tShN3+fkI3m7fp8vVwCS4K5jlvFgRoeHpNeqAjjoq1Z94b8zhLJf10BktZEYGTzuTM6x
         GaKrYaJ9KMq1E03KEf1QI0Y2tT5mftj6oPgb8ywH7H1ykhTLJqUpyC63klcSbqAK9mk4
         KYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763992864; x=1764597664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/jxlDz9BAO9kydkpl4fCic8ClBRjihhesEG6s01glE=;
        b=TGLxno4jfAAiXWdTx0QOoG1vQlU4+2DpxAmfloJUyxMa5Hw4I6wEx2s2PAAveQpaZR
         9aC4Q+syBracfUXtpR44e2OAsYmNPSuoh6fV/Dsva1BageaNBh60UEvv7waOxqoyWAzv
         EF+BfJTQopmX54ZoVHcLNSrfwqP8uNJ0QJ2KGyPdZ0r4aKm1k6h/39+zGIWT9boPkNO2
         C2CFiSCtIfQIGhaB7gOBuAXcbI9NulE/A1utCHBZrVagxpljPtOZX3eEwGzB83SbtSrk
         v7c233Xd436A87aZ0YYeIi/4WP8brEx3qtf9iNPOA738iUS0qLf6LqvRrCg5zTF38lJJ
         J+0g==
X-Forwarded-Encrypted: i=1; AJvYcCU4oOdluEgx4ZEX3PWgufF4LsVaGYB1TLXNN3GlzfXDmddcGoNSfQsgweCAbSNtBS8OfEgXd/9bQIwP@vger.kernel.org
X-Gm-Message-State: AOJu0YzN0cIP3msCoGEkeX+Nk5FZ1oGAvLdYzyzomC7dOzHZWb1vwlIS
	X8iJ4+ih5Fsx1OUH1+lVo+y+lt3BhT73lHKxwN7IGKorkd/qUbSe3Ee8
X-Gm-Gg: ASbGncufo+BuT6jFedwUX3bVNbz5+PCLBOez4srw5XKnsGsZi7WKJcmD1WBNkh6Ri+p
	A8J7wafuPMQaMiUgWxCS4YkEHSSkSaSphv8lCjeqR2ddnRWbZS5Tv6zHhJBNwp2Kn4b/XHJg2Sl
	ykun1QmakhAsj61NCjRgQD/6+z0MPxUg78f2KjsDrqGtvddgx2QX52Ucec47jn/t/+CMT9572ad
	8uhzuGhGsPvTkhqQ15tLOIXoifPQFj4Wvvs6gKF8TgNm/JB2dM2TCZAv1wf6vDeFNFZLIqLs9xj
	QYpniCN2+7v/drEYc0+UqgyxpxkEDAqxl40EuTUk7mBOIqvgLara3fe6FU5qweg6hVY92FearZ7
	dK3zSBunzoWbh3KKNDe0CNaVvmZOUnWSRVi/1UqV7yGldGDAwqAGNn3OzdG24BjFbDHX6Za7TVz
	cDjnJvPiclmAcJpt9zSWN1oEUgQ7+7NApoBz0VCwoZ61HOA1xfkKxz3dO1Ao9JQrrrvUjcjvIdw
	idgXE4AKi8l8EU=
X-Google-Smtp-Source: AGHT+IFrrXhu6AJfyliU/Xzg3MThXEUzI8ZAPUU7ipyQF52eo/ZMchMrcbXBykYYxmEfwQPHrKxvsQ==
X-Received: by 2002:a05:622a:89:b0:4ee:1f5b:73c3 with SMTP id d75a77b69052e-4ee588b5258mr166800441cf.60.1763992855573;
        Mon, 24 Nov 2025 06:00:55 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee4cbc3c81sm78152051cf.16.2025.11.24.06.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 06:00:55 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5A591F4006B;
	Mon, 24 Nov 2025 09:00:54 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 24 Nov 2025 09:00:54 -0500
X-ME-Sender: <xms:FmUkaRi8XRZ7NjmS5aeRh4-Jm1Pfv8hgGzNPpz_5YeA1tYOE41UXfw>
    <xme:FmUkabPthiPCpHANWDH3BhuF6r9lJNXRf9zF_XsmtbzvH7P9H9FR0QMQ1JEuawC6f
    pbd79UfL_3nWTVMtqoFU5nrQDfdHYmtxS7eAe_n2tBGNKaIO8i6kQ>
X-ME-Received: <xmr:FmUkaUePcNTfbNXU_ioiV3mYYPKLFXpFLx5lT86L_rAH17KxgRIBvxosI6S6qcNHjRZ87CsubsdzQrh4lHfN1ufZAFu1_DiT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeekjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsfh
    hrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehhphgrseiihihtohhrrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnh
    gvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:FmUkaVwKOdqs2hd1c5mVJwNjIzEk-ZJZjGbua1gEney0XsqYgUup6Q>
    <xmx:FmUkaZ2k42CgQZqenqRYQSlyFeJ03Aygp_PdeG-WqjDRQMnSmlNuog>
    <xmx:FmUkacekbu74JBnu_PLPfiu5XuLSGuPZCk5dY7M85Eo5cWCmkWTMWA>
    <xmx:FmUkaeWDVqlM3N7_rjUHHvB9Lm6nW8m9EwwnRZn-ig3h0D8kxtoCpw>
    <xmx:FmUkaU_7pojGQ_Cqb4E_n5iaqsuoY7-Os-7iD2I-3WKtSqb9HUGHKYB7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Nov 2025 09:00:53 -0500 (EST)
Date: Mon, 24 Nov 2025 06:00:52 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <aSRlFB9PoOcZVmvt@tardis.local>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124123249.GP4067720@noisy.programming.kicks-ass.net>

On Mon, Nov 24, 2025 at 01:32:49PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 24, 2025 at 11:16:44PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > ERROR: modpost: "NULL" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > 
> 
> Rust :/
> 
> So I have:
> 
> $ make O=tmp-build LLVM=-22 allmodconfig
> $ make O=tmp-build LLVM=-22 rustavailable
> Rust is available!
> $ grep -e CONFIG_RUST= -e CONFIG_NOVA= tmp-build/.config
> $
> 
> Help ?!?
> 

[CC nova]

On my system it seems that RANDSTRUCT=y prevents the enabling of RUST,
but I'm sure Danilo and Alexandre have better ideas about how to enable
nova-core.

Regards,
Boqun

