Return-Path: <linux-next+bounces-9145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92FC7AB5B
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 17:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43BA335CBAA
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 16:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1722528C864;
	Fri, 21 Nov 2025 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="gnlVN2cP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ElcnoSe2"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5709280A5B;
	Fri, 21 Nov 2025 16:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741236; cv=none; b=sHpJOXGDcaQDexYfO1KnICyQCmRYcAHVeWuBOZi52/XhLwpQn3bsqlXaAYsEn6wJjGw4OppDZk7+bGzdGUFs10KNQLxS+jpgUj323EPD89SYaqF6iiV84U0VLBFfU3XVpyercNcvkThMIfU9JPqbYkAG3puW2kgfReDw3dHzL9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741236; c=relaxed/simple;
	bh=l8TZsJ9mfnsBnwUIIBn/hpsCMgER2TPQsDASATdNm9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i//GgB66n5B+lS0CWZaSzQTJ/dxCEd2st9Yo3tAsT+SSCNnL+rrngi+7TIA+5CAkvXD2w0+JrYO9gQztqX8ookdeElQhDrrkfAhWthYssVyNRhjZ+ilIsaLHOQEMIrUIAaFmy/7+qacuGSmrDPJJ28sSPzqc2mB6oUWI/iZj5Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=gnlVN2cP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ElcnoSe2; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id E3D82EC0104;
	Fri, 21 Nov 2025 11:07:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 21 Nov 2025 11:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763741232;
	 x=1763827632; bh=d7DYWIkuS1VnL1BYw+kRKw8at79DyxtY39dTu9aZybo=; b=
	gnlVN2cP1lvPzX5X18zBCNWCEa22pcW2bfhKEH+akDQ+fTa2pm25IIIVd2DkE6mk
	X/gLnmv/UvisyZU1Rbfjzf9pWkDh2bMO/+VHAagN8gxvZc5nJJRsT0IUfh8UzVvE
	sQ4V0nPmyEHhzTG4Zl2dT1aH5QXsO120cmBQi1lgvUqY9HQDjeIpesEyRB+XY/qP
	jEtNmBHjcZT7IoVak0dSbWCtMHFjHdBKMj/RmXwtNl4S/2vt989JQF+yQee62ngn
	scR5uuLYc9LDfJWyHaUZI0bE9aK5/N+Gz8hHkv1jXmk9eb7PcgBrX78UF+X1scgx
	tknoL27hwmQv0fjqbgreXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763741232; x=
	1763827632; bh=d7DYWIkuS1VnL1BYw+kRKw8at79DyxtY39dTu9aZybo=; b=E
	lcnoSe26H+QD50uQfFSo8vwSh5DTCn4+hBAoBAftRzlsd1erC3VeUCe0OzdPFgBx
	qYpdOdGDlW6RcwOSlb4+wFhCT0DV3Zfry4TP3xNvyud973KUNcuC8clpjZUwcote
	lQ/yQYtflkqh6lxEpJjP3D4T/vUZ1kF8oEMh7EaVqKAInY7XGPGJVxRTuKJ7aguN
	0D/z7amvhmoVwFucckTRttN7BacMfgI8DPmkn6AlYYnlZ8Rs8CnhzOt/TxyAP1+u
	uBdYO0BPdgqNGDFq4g+Boqn7uzEQryrth2h2ARRp2ig8vGZXRAGFZrMzPq03TA2/
	dt/0opChqbb5aqy2wInWA==
X-ME-Sender: <xms:MI4gaWo4zQsvrj8IGIGDlNd5AqylEWNOnYb3ShtGilflAPBhDyPLwA>
    <xme:MI4gaZw1J2_eCPxuKDFqA1wmIOM5rImvjqjSuIIjEVyYB6vUoZHOQieEoqmQRfS2-
    WArDjctCxVFOvw9HrwyJT-h6ZdFae5h-8IMb9eJiIu-gXvLBmI>
X-ME-Received: <xmr:MI4gaeLSfb6-fZvyRDkVle54xe3ev5Ipk7wEnRCkmR4I-gwz7DaLtNr1fA3WZ3qt3JUj9Wwr5xfYN8IJOKfEP1sRo4KLE1wHuiginw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedtgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefgkeffie
    efieevkeelteejvdetvddtledugfdvhfetjeejieduledtfefffedvieenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomhdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepthgrmhhirhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhfrhes
    tggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepihhgohhrrdhkohhrohhtih
    hnrdhlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnh
    gvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:MI4gab4err5KC-3UxWp5NRM7ItTnmTLjse4qsKhsW2Dfd87kR1MHYw>
    <xmx:MI4gacwZ7ZZ7ACa3DZo3X2JbBjl9Oct4XGDcuui40a-5UrYdODO-Gw>
    <xmx:MI4gad8qRQEsyW34IqOyd9vd8hUBN6eBWFi3vuCKrqwtRncfMCPYEw>
    <xmx:MI4gaQGF_unAefA3H6muCqH4vC2pppBBzIzItZVIlquupdRn4KMZrg>
    <xmx:MI4gaeWALucYrwLwZ2kAX5LbGE0Z5lYzFVuZftBqVVxCDgGmD27KuV99>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Nov 2025 11:07:11 -0500 (EST)
Date: Fri, 21 Nov 2025 17:07:08 +0100
From: Greg KH <greg@kroah.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <2025112100-outpour-nearly-b7a8@gregkh>
References: <20251120181111.65ce75a0@canb.auug.org.au>
 <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
 <CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com>
 <20251121153906.1d306ad1@canb.auug.org.au>
 <CAJ-ks9k1=BLFCfjVrMqQ5u_ak6+g=HtQ6_TP4ZtazPhk0Z76YA@mail.gmail.com>
 <CANiq72kxj-7VjYp2i2VFU5qoRd6OJKPfajZAg+HMX148DU5zqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kxj-7VjYp2i2VFU5qoRd6OJKPfajZAg+HMX148DU5zqw@mail.gmail.com>

On Fri, Nov 21, 2025 at 04:56:37PM +0100, Miguel Ojeda wrote:
> On Fri, Nov 21, 2025 at 1:17 PM Tamir Duberstein <tamird@gmail.com> wrote:
> >
> > I don't see why not. It does not depend on changes in the rust tree.
> > @Danilo Krummrich?
> 
> I think Danilo may not be near a computer at the moment -- Greg, I can
> send you a patch to apply (or we could just leave this as a conflict
> resolution to be applied by Linus too).

I'll take a patch, thanks!

