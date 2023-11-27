Return-Path: <linux-next+bounces-88-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A087FA17E
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 14:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56A0281788
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 13:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3E630344;
	Mon, 27 Nov 2023 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="T/mF6sIV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="L/U7aqHX"
X-Original-To: linux-next@vger.kernel.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F59187;
	Mon, 27 Nov 2023 05:54:11 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 57A2E3200AF5;
	Mon, 27 Nov 2023 08:54:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Nov 2023 08:54:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1701093246; x=1701179646; bh=08
	c3ZOJkvs/WUEnrIQy2p839jU1z0opu7K3BHqLsdYk=; b=T/mF6sIV/bhUadE5hh
	TUO3r6FDtzVQASe2nAKZFwTHuIT4ofayZ64zY57/J5osQOegIiRKTN7rdn/nx71/
	U68p5qfkOKg6A4cFjy1B4jmNdkbsbpGIVEvAXwQKJGX1fGdcJlO8l8REFlQCuAXV
	0HDrgzSideJahLcN12HVd6b/W7PSyEy1LG3ygS7DCUcJpZdtRGbu7YPutEURFjJ3
	q7yP1tiA9xanjHGmpDVVjhluWxgKCrY8j4gtOOvrFIfApUMJsIgo66OTYw6Zpvbn
	x+kxee02pEVcIYv7SUha6qjnm8hVG2SuZjzGx3R3wuAnEJuqx1uONOS6GQeNUMko
	SpDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701093246; x=1701179646; bh=08c3ZOJkvs/WU
	EnrIQy2p839jU1z0opu7K3BHqLsdYk=; b=L/U7aqHXey847XT7NXlckHYqdb5De
	tmV9IMGLy27r02hmh/3xM+abUv8M5AK487wkXh6XFLQ1lajmkM9P6wMH/DawOXHY
	Ry7ZZcZD+Efrmyga1CQokPck5SgqOPbiCvgKylJdldn4CPa2tGa/4JThP26IWRLE
	xGuWLy7c9oWOp2TPz+JCsu6PBSZ5gfZX092zFMwrjm4RVbZiW4LlL40CdQUMcP20
	qVa7/yJKt1BGIelkaL1Cnjam3cB0hvwqMwNSZeP5v7oMcRw/OuF10I7h97UoKn0W
	JmI7bXFFr4nqOUQpfJMaFiIzU+DMLMT0hb+4H0d00tqPhOcr8t/fJEHYg==
X-ME-Sender: <xms:fZ9kZeKBfAOm8q9B2WVl2wDTBN3FsTxCsXa0Nt4ZWcPh7etI3cRS5g>
    <xme:fZ9kZWJ1Aln82JqGegtdgZ-DNCYhCcrA201n7Gpom7dCYGokvDufz7FkFz_XJKrup
    rrGkpDn-EjHgA>
X-ME-Received: <xmr:fZ9kZeteOkX0HJ6g2POEchLEy2Sy1FkV8G0GdlZNekb_tECXSewQ6MX4H4zQ73lWNFLZySi0H99iWDuPQua6Lx7a8qM9wdTZAjLpebP6CG7kQ_3xgZJrJrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:fZ9kZTb4qHoCGi5zbT5WdrZwOm8bX5y6RB_zDkKGAfg-OxtH1yjMXw>
    <xmx:fZ9kZVb3_epGeWJafk2PzVzEO-DIeMqQazmDmy_GAd--N-cZe_Sq-A>
    <xmx:fZ9kZfAviFL2gpT2jYirMx6lOOfqdcscMI2kQJ9_I64bqug0Z2dLnw>
    <xmx:fp9kZSQLyYm9dRJDAHIzDTBca4_OWn2onUamwN01JCLyKdWcUzAelA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 08:54:05 -0500 (EST)
Date: Mon, 27 Nov 2023 13:14:07 +0000
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tty tree
Message-ID: <2023112757-enamel-degrading-38e5@gregkh>
References: <20231127115718.7ad1701c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127115718.7ad1701c@canb.auug.org.au>

On Mon, Nov 27, 2023 at 11:57:18AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the powerpc tree as a different commit
> (but the same patch):
> 
>   aa46b225ebbf ("tty: hvc: hvc_opal: Convert to platform remove callback returning void")
> 
> This is commit
> 
>   f99c0e0d0859 ("tty: hvc: hvc_opal: Convert to platform remove callback returning void")
> 
> in the powerpc tree.

Should be fine, thanks for the notice.

greg k-h

