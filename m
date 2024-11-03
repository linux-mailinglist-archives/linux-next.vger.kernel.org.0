Return-Path: <linux-next+bounces-4593-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E249BA3C7
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 04:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3EEC1C20970
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 03:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569E8535DC;
	Sun,  3 Nov 2024 03:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHnzNS48"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9723FC2;
	Sun,  3 Nov 2024 03:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730604943; cv=none; b=XCZtNw7+T5tohPsfGBh4KhLYU40lOTY/GhTsco3cZyPj41kxXzMQyfG1dCxPxJL2FDJYh4TEulu0v7fFyySjuFm7ZSrfEAkD7YCb79B4DP9b6Ze2Z9ADVz9GG5/UOQorvU96ImG/NzRUOCC8D0IuVsiXR2e8QRF/7PHtk0g6acU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730604943; c=relaxed/simple;
	bh=r2zs0GDmVRBO/gdS+c9F68vUl67r+vWeXe0X9I8RsCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FV6AbyI3JQ2toBB0bZpfH8hzUMFE+xJrCuw3DX/CwCzUBsl94B6kkmbGHKvP3GVjMz+Om8/0oPojgodCF0ak4qQNFXePQQdIFX8sSk7dSXMIDlSPJ5a1Zyv4Sg4rgIByC7TYeRGdHqC1SUEKFKgYxhzUtnVLDQxAw/yvFH9jo+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHnzNS48; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cbcc2bd800so28720566d6.0;
        Sat, 02 Nov 2024 20:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730604940; x=1731209740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Urc9Z86LcjyqhCcm6H0VVQdu+SdtQEzmvHdA+i0O10=;
        b=NHnzNS48o9pXCEBM1RAPgRcCpLDL7PC4ixH88UwZgQQYxOvtKq4dTj5RE6t4y1I7rv
         qrlsLUi30T0GB4wAyAKk0H0tlr38m5pQGNVdX1CdX0+z+XdOx2b/FOh9pm9jUxl5lTiZ
         0WY030Ncn5OH/6LPo7E0WNIq74LWp14RKol0do5KPb0vJ0mT0jsDlk0KgjWSkftbA2WZ
         W8EtbNp3aB5yAY1M/ZUtjTrSvdhDkEo8fqQm0eVx+5F+8l2Hjg3bBGQVORrZdxkeF//a
         /wxKUR0soFr58ayDMClzSAhIamVqxs+SEEg6cIkBdID3OIntuZWjQcO9/Yiz8IVnU0y3
         3d7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730604940; x=1731209740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Urc9Z86LcjyqhCcm6H0VVQdu+SdtQEzmvHdA+i0O10=;
        b=cPNucgYU5/93aDa0/hsGnX4UJwpTITeJ09RHDDuxWFad/qmioj/0mJ/EgiTvkbMAKp
         itQGxRvcLEEFRkwfKGn1Jq5WaKD3RwVwaUzWQu1dmlWB3AoRhx36cyF1eL43jk7CV1EG
         6sfABHzqB8q/SnznzKBGxzU2/aZLr1omcH/ARyiHtpiNvZ4l9yFyxQkA9Q256q0Dt1cR
         LwoGFyzhSyvy/egszLfkInG4/ncgU0CDORKwRr+v4olwpmOCXBHhxHKKjgAWX3SzehR1
         Ph3mW385W9G2ScVp1wBX6qsqTsmpmVIF/m5u5xCEYB7NF+eQohSKP5G2Mc/WMae/ZYot
         d61Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvRpy/e7EF7G1PZnIrgkuCw84jeLwHXOzwGzvD5dhbp0zrHOkyWfuUTbqPRmoaGgjEuebwsQmCpkFK+rE=@vger.kernel.org, AJvYcCV+xCyXiCmBqIdlonojt7BnDocfQnds/JwptFYqqCPN8rspNTKUkpdZtolg2SlDlepLrLbjMXET592xuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyEf9RfgOA84d2a4STswAEGbSq4KQO2STU7r4szzuV+RUA5OR3
	BTPhm1iwStdJ6/44XIn9tnk+KCfVLsdFviYAfM05mXfCZtYvbBfB
X-Google-Smtp-Source: AGHT+IEbzeGYn2+Z6MWmsVVv7YSFNBxFwFumW2eL1yqpcXinGbawh6m18jluX4ZYN/s4hgo2EShoEg==
X-Received: by 2002:a05:6214:5d0e:b0:6d1:9f1b:b669 with SMTP id 6a1803df08f44-6d3542eddbbmr200542976d6.15.1730604939972;
        Sat, 02 Nov 2024 20:35:39 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a718bbsm309375385a.87.2024.11.02.20.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 20:35:39 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 89A4F1200076;
	Sat,  2 Nov 2024 23:35:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 02 Nov 2024 23:35:38 -0400
X-ME-Sender: <xms:iu8mZ9g9xRAqgpSsuv468xIJ18NCxzL5b6y2mLAeCASem1XW6oZEvA>
    <xme:iu8mZyCBofRgAjDFqnIdvWgwDOLWr8q1TJKTkNntMuO6Rz421sRc1cJjrtTxyZpdK
    F6VeRxhHtLSoXfBzw>
X-ME-Received: <xmr:iu8mZ9ESpwMuCl-pTWTfpIAjWjHl5PzKT0TnWmdNt3_7yz1UzzRSaeOU7hs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelvddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteeh
    uddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    epphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghighgvrghshies
    lhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
    dprhgtphhtthhopegvlhhvvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrghs
    rghnqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhg
    rdhorhhgrdgruh
X-ME-Proxy: <xmx:iu8mZyQ1moQKIgbQ5C7gBiQUMnsFQjOHesl3UO3wY02XC8g7xxxk0A>
    <xmx:iu8mZ6y82nLjVDUhjZjyoVrhkf_8ZVHbfL0lpUtQHFer8UTchH6fPw>
    <xmx:iu8mZ455GwRqIxBQlyCoTo9iVl2kjeDonsPd0hBGe3_LMmoaQYz4wg>
    <xmx:iu8mZ_zmbRQkGqS8hxvRnfLnU4jUeoU1M-MF3u4SVsW_6yH7ZMQJzg>
    <xmx:iu8mZyiOUvEEIEqpkifvVtnQalduFxGP0MgorsiFo2_fLE7n8y_nqzZ3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 2 Nov 2024 23:35:37 -0400 (EDT)
Date: Sat, 2 Nov 2024 20:35:36 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Marco Elver <elver@google.com>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	sfr@canb.auug.org.au, longman@redhat.com, cl@linux.com,
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
	akpm@linux-foundation.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] scftorture: Use workqueue to free scf_check
Message-ID: <ZybviLZqjw_VYg8A@Boquns-Mac-mini.local>
References: <ZyUxBr5Umbc9odcH@boqun-archlinux>
 <20241101195438.1658633-1-boqun.feng@gmail.com>
 <37c2ad76-37d1-44da-9532-65d67e849bba@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37c2ad76-37d1-44da-9532-65d67e849bba@paulmck-laptop>

On Fri, Nov 01, 2024 at 04:35:28PM -0700, Paul E. McKenney wrote:
> On Fri, Nov 01, 2024 at 12:54:38PM -0700, Boqun Feng wrote:
> > Paul reported an invalid wait context issue in scftorture catched by
> > lockdep, and the cause of the issue is because scf_handler() may call
> > kfree() to free the struct scf_check:
> > 
> > 	static void scf_handler(void *scfc_in)
> >         {
> >         [...]
> >                 } else {
> >                         kfree(scfcp);
> >                 }
> >         }
> > 
> > (call chain anlysis from Marco Elver)
> > 
> > This is problematic because smp_call_function() uses non-threaded
> > interrupt and kfree() may acquire a local_lock which is a sleepable lock
> > on RT.
> > 
> > The general rule is: do not alloc or free memory in non-threaded
> > interrupt conntexts.
> > 
> > A quick fix is to use workqueue to defer the kfree(). However, this is
> > OK only because scftorture is test code. In general the users of
> > interrupts should avoid giving interrupt handlers the ownership of
> > objects, that is, users should handle the lifetime of objects outside
> > and interrupt handlers should only hold references to objects.
> > 
> > Reported-by: "Paul E. McKenney" <paulmck@kernel.org>
> > Link: https://lore.kernel.org/lkml/41619255-cdc2-4573-a360-7794fc3614f7@paulmck-laptop/
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Thank you!
> 
> I was worried that putting each kfree() into a separate workqueue handler
> would result in freeing not keeping up with allocation for asynchronous
> testing (for example, scftorture.weight_single=1), but it seems to be
> doing fine in early testing.
> 

I shared the same worry, so it's why I added the comments before
queue_work() saying it's only OK because it's test code, it's certainly
not something recommended for general use.

But glad it turns out OK so far for scftorture ;-)

Regards,
Boqun

> So I have queued this in my -rcu tree for review and further testing.
> 
> 							Thanx, Paul
> 
> > ---
> >  kernel/scftorture.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/scftorture.c b/kernel/scftorture.c
> > index 44e83a646264..ab6dcc7c0116 100644
> > --- a/kernel/scftorture.c
> > +++ b/kernel/scftorture.c
> > @@ -127,6 +127,7 @@ static unsigned long scf_sel_totweight;
> >  
> >  // Communicate between caller and handler.
> >  struct scf_check {
> > +	struct work_struct work;
> >  	bool scfc_in;
> >  	bool scfc_out;
> >  	int scfc_cpu; // -1 for not _single().
> > @@ -252,6 +253,13 @@ static struct scf_selector *scf_sel_rand(struct torture_random_state *trsp)
> >  	return &scf_sel_array[0];
> >  }
> >  
> > +static void kfree_scf_check_work(struct work_struct *w)
> > +{
> > +	struct scf_check *scfcp = container_of(w, struct scf_check, work);
> > +
> > +	kfree(scfcp);
> > +}
> > +
> >  // Update statistics and occasionally burn up mass quantities of CPU time,
> >  // if told to do so via scftorture.longwait.  Otherwise, occasionally burn
> >  // a little bit.
> > @@ -296,7 +304,10 @@ static void scf_handler(void *scfc_in)
> >  		if (scfcp->scfc_rpc)
> >  			complete(&scfcp->scfc_completion);
> >  	} else {
> > -		kfree(scfcp);
> > +		// Cannot call kfree() directly, pass it to workqueue. It's OK
> > +		// only because this is test code, avoid this in real world
> > +		// usage.
> > +		queue_work(system_wq, &scfcp->work);
> >  	}
> >  }
> >  
> > @@ -335,6 +346,7 @@ static void scftorture_invoke_one(struct scf_statistics *scfp, struct torture_ra
> >  			scfcp->scfc_wait = scfsp->scfs_wait;
> >  			scfcp->scfc_out = false;
> >  			scfcp->scfc_rpc = false;
> > +			INIT_WORK(&scfcp->work, kfree_scf_check_work);
> >  		}
> >  	}
> >  	switch (scfsp->scfs_prim) {
> > -- 
> > 2.45.2
> > 

