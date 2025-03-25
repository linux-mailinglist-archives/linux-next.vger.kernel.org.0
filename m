Return-Path: <linux-next+bounces-6007-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD7AA70DD8
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 00:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAE3E188A48C
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 23:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEB3269CFD;
	Tue, 25 Mar 2025 23:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="j3i+yTRJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MVc27JQa"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1EC19067C;
	Tue, 25 Mar 2025 23:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742947053; cv=none; b=GOXQcBli8SKxUEKaAujwtudC6n1rTSFIAhX2Vr4+B1N0V0oZE7NiXtkBZfbkuapozKu421ae0J9I7JW4V5yTFIUtLBKQxaYWsgBrd4l6++YznczO5Q5m7J15HuLk8j3wTibmL3zB42Wy3nM9B4AFDR6y6F2CHnbw8vwCMfXAbHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742947053; c=relaxed/simple;
	bh=ulqDgHJi9xktfMH9rS+A6qVuAla4HJJ12RSIL32wVVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1e9fffriTlbUtF6yahvYQntcEhiV0AO7pk9DoDzLb9EJ7QCYT1mF/NQw08VRZb8fu5CtGHk6SQtU25/WSaCtCpyY/hcWPj/vUGetaCfpcCx/8mw9/ojKqMgBB4lzUcwHZ81IkDkyigT469QjaqN+oDj2baDMBOj03JZbH8+ktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=j3i+yTRJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MVc27JQa; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A0A012540103;
	Tue, 25 Mar 2025 19:57:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 25 Mar 2025 19:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1742947049; x=1743033449; bh=53epuMkGW7
	VVw4kHXV3f2OBjzCS034p7lIo4scoUYY4=; b=j3i+yTRJqHHE3+spz2ow3pS9QO
	c8D7CXpevtAimcUH1unY8ZecbCsNzuAj6IHCZ7qY12SgfImzUrL3g04q3D4H7FkL
	1vlvK+67YjFPEbKZcI2LNN2xn47K38YeoeYFP2aEolMtED4YHC4y3jQyPeGDisoB
	Y6h4cOxGoyybTwFkqefcjZzbBBu9p1vseh6y+HWQwsrEVVFsBWNxIf9HYeeBg4gW
	7NGEWubVTjlG/qx1VmcJ6NDGFF1r/729e4+ZhzLminl3/VCpKzzEsCD8fl57R/lh
	3J1kGY5TV60YwjLVZlh/LIsoUcWAiAVR7KFXPKqB9Gbe6vw3W5Ro4X69tH1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1742947049; x=1743033449; bh=53epuMkGW7VVw4kHXV3f2OBjzCS034p7lIo
	4scoUYY4=; b=MVc27JQauJVoYrbojetHAZ9nUNDhSMUNKb/U7UHeH98I8Hacjwt
	/gfb2V8m4GTMOvLH1UfckM3Jte8H/1QOmivThiGrVmM3U3SJw8Hd7ND9IoOYvJEc
	qNB1huBXQlvNfe9sGKaewNfUKsbTO0M5B5c20xFQ9k8uQwRjWqAY8Drz+ntfpXom
	p4GRWwExNpUgmzlvEj9az2539foimIMC4RjeN7ZlROBgItlZOzImWzzDR2vqixCO
	4oSgu0YQGKZanZApQJifRFVxypQxiaf92VOkdJnlADyGK/RfmKJATKEC7uFO4+3S
	INseQD/ylabewCylLflMPoZOjiCktk22Y3w==
X-ME-Sender: <xms:6ELjZ5C2HyAO_6tHWf3aVhbyyVnDFYdweMcK5RJO8d_fJ6UA4KoBNw>
    <xme:6ELjZ3g3PKCKY3BcCc0svPCCLB5Ti26iL-GkQdkFXvbFsQ4xmn_zNXvHeWxFLXgBD
    fhdrmeljUSxvQ>
X-ME-Received: <xmr:6ELjZ0nGeX3lJFhBJmfzwrfGRtKArx-S9sTteSDw8wL8i0CNW73nntwyfiSD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieegtdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthho
    pehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhh
    grthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:6ELjZzxvLjOKHCf2KhELkxcfewZeR8Eychfx7mgoQAvSmHkDfvFmLw>
    <xmx:6ELjZ-QISVIqjaytnPUJ0ivBUiG5CMXFboYet_PGTOqoniZap2MvLA>
    <xmx:6ELjZ2Y9LBJDbrDU7blyiW122iZ2bs0QRYDisDCx63CiaVTbACR5SQ>
    <xmx:6ELjZ_RZpfwy7HWQvwbQg1438y3NhaEPLBqI9ka_w0VNZXvHFC37WQ>
    <xmx:6ULjZ6qQTmsLQoB8y9BbrKlKjZKm4q__H6uFBgK3dZEIWRg-khRSLYiS>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Mar 2025 19:57:28 -0400 (EDT)
Date: Tue, 25 Mar 2025 19:56:07 -0400
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tty tree
Message-ID: <2025032501-ominous-mongoose-e772@gregkh>
References: <20250325173133.7dd68fb1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325173133.7dd68fb1@canb.auug.org.au>

On Tue, Mar 25, 2025 at 05:31:33PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the net-next tree as a different commit
> (but the same patch):
> 
>   3c3cede051cd ("tty: caif: removed unused function debugfs_tx()")
> 
> This is commit
> 
>   29abdf662597 ("tty: caif: removed unused function debugfs_tx()")
> 
> in the net-next tree.

Should be fine, thanks!

greg k-h

