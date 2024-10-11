Return-Path: <linux-next+bounces-4234-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26D999CAB
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 08:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9582281D23
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 06:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3D519AD94;
	Fri, 11 Oct 2024 06:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="nTwOOlbx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JPpVPfee"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF3199FB9;
	Fri, 11 Oct 2024 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628314; cv=none; b=TFt/8ubVCFEa1pm2wsKqzWB2Zw3xd9Y21QtT4tSlxLZagoqte0IJTbmDdz7HzdHKSoj4UAOHprbm/os5uK6Nh9ePCPZsFJRzayCut5LoNVHEF6ceN9iqmMe2zHXPCz1dEjgYAxsREbGsLfaxZgKu5ehL0tjwjCNz2UipHc/wJmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628314; c=relaxed/simple;
	bh=0bqvD0UmMFI1ymelQhYbM/Mt5hf980yPF4/OeqnUlUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ept/6NQPFp4wqVzXc1VFu2vyXn5HW5HXGvKUa/m7kKBYZnX3NsyhJLwiDNlfvh1Yh1FF0iA4E4d40jSLA2qMz08iQ/qW4Frek269WMSgYwBvWjugt0b6DMQDZL3MTa9OgQuaaITXCY1qsPKOz+HjEuEBqAaFe63bxa97/jslTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=nTwOOlbx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JPpVPfee; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 545671380138;
	Fri, 11 Oct 2024 02:31:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 11 Oct 2024 02:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728628310; x=1728714710; bh=EpJTgdvBeA
	hgKzpRgymC2grtynE9KvgloorxM6nvsU0=; b=nTwOOlbxuNMgXbDuHFMG73IFt7
	ClSTpMUm8bmSmQjMgWXLPUpr4saxDrEkplpNk0N1pAEhr1f4R/lnGTl8zuyvtwvC
	42vI/d0W+ArP7F6GEcoNJzhhLQ8GTtU4jaU5r2bShfGmBv/HdDtiUozYjAYfenOF
	bI5fRh9Ja4p9nlz93h90e1P1YySQvAowPB4tq4CS5At6aI8IKqKSFf4o+pxli7Qg
	tF1ki+I25Rsl4hcKF9yZ3YwmHpnDyOuppXTYdJxtvL7BVRXjz/Rfsy+2r45Bll2a
	7KHcwU4u+NFw5mYICriNMfCkKcdp1uySLhe+DNDnIkjWtpEAaXq/3Sq6P80g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728628310; x=1728714710; bh=EpJTgdvBeAhgKzpRgymC2grtynE9
	KvgloorxM6nvsU0=; b=JPpVPfeeykI1zHsMuFnXwu/TuSvnV71VzjKH89OHZRqv
	wCq1Gx7h4z9QC3SkBfGkcKSdYRKbKr3FF10VMgh6I01okZUK7R549xixWD9FK3g0
	DR5Oeetf7es+jtjwERlOquse284WJGG92kQlBhzWntkaDnFLw4Hlalw7GcOoYuqc
	Ok46rY4R8LhAqMuXp30gcDHoj83KkkNLOgwEiuX4IN6ADebzZZbBs4ct6a0OS1M9
	uncTQaPq6F1363xPE38NECvvAjBuJnmv7HkFz65a+CyZRIOB2wBTGcUsNddlPxPX
	zMHpoMRxGeAg2oAwi0kwxEiVB43ENuywTmvppUU8wQ==
X-ME-Sender: <xms:VsYIZ7ssTSAyivj5y7cp_XC8e1NtHdTlAhQgtNDtX2zt6wC98UlfeQ>
    <xme:VsYIZ8cpZsV2j81TVEB5zxvqS1gN4q0YKhwY85IF1cl8w_xKiGc6qyOeBnzR0HJx-
    WO6Y2GAN8M17g>
X-ME-Received: <xmr:VsYIZ-zr3OIki8ZtqbZyv8kggfRI0bCh_zzli0PtyIxup5dvI7gkBvIpNu6dREBpGnxZQSDfiAIMrY1Kv475iAVz5cBan1v_qmV-DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefjedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:VsYIZ6PneX5fcseXkU2g8AFdEOuTZZkFvC9FMa92WrItCMgd57uMXA>
    <xmx:VsYIZ7_Wi4DCBfRlt6UHYDpXO9Uf1bW98ZASED2z4jvCgBJGKQgO_A>
    <xmx:VsYIZ6WldHkdpOvO4Je62FEH07sdVlY7qPW636caqT-PPT6Z0Pk9zQ>
    <xmx:VsYIZ8dWNsAkMPFEpnexTnDk0HzyHUy3fxXxF7roJzfovuGHWp4RMA>
    <xmx:VsYIZ3SnjvJx39y4mkyMGPbFi1-yJLt01jtiBjFVDWh__10pHNoaYijl>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Oct 2024 02:31:49 -0400 (EDT)
Date: Fri, 11 Oct 2024 08:31:47 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning for a long time
Message-ID: <2024101127-scrubbed-unfilled-8b47@gregkh>
References: <20241011172442.3a9cc81b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011172442.3a9cc81b@canb.auug.org.au>

On Fri, Oct 11, 2024 at 05:24:42PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> From before the git era, an htmldocs build (if we had such a thing back
> then) would complain like this:
> 
> Documentation/driver-api/usb/usb:164: drivers/usb/core/message.c:968: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget:804.
> Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int index, char *buf, size_t size)'.
> 
> I assume it is confused because we have documented both a function and a
> data type called "usb_string".  The former in drivers/usb/core/message.c
> and the latter in include/linux/usb/gadget.h.
> 
> There are about 46 references to the function and 105 to the struct.
> We could rename the function to usb_string_utf8 ...

But usb strings are not in utf8 format :)

As C can handle this just fine, odds are sphinx should also be able to
handle this?

thanks,

greg k-h

