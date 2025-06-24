Return-Path: <linux-next+bounces-7218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E69AE5D93
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 09:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA58C4A2619
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 07:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAA3248F61;
	Tue, 24 Jun 2025 07:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="GmiGLe2r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Rxj2tMDK"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13872248880;
	Tue, 24 Jun 2025 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750749893; cv=none; b=cI7EBZkuZsykQFgAxWFZc/x76PvHbw1ZafRg8icvn9ussE6ceX3Pe3NGR+SyrM00Z4Ew9EVNmdnN8ReR5DTcbTD5RgYs2AGPtjMST9/F7SCmAGq8zl0gwZLOZOuaG8qVVaxZPrVMCVDR9/hOh7CItXNaHITbXtnnN+w8KePbSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750749893; c=relaxed/simple;
	bh=LduQloanuZx+tgDxiS24sDj+gjCYzkw7aaOUangnmV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AzEEsqRH5jvnTHXMUcd6qIIUAJeaA2EEQkRMdYUn6OwhQtmJCjpA7Ra4IAoQdERkgu6RHO9qEjTjS1pYoYuZqXxj/hQ8/Ifte97WVmBr9T4EO8OW/kELZe3p0Ra+XBCcxyZGKERqGatAMZd+bq1OfwYAxBnwyXLkhll78riwlTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=GmiGLe2r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Rxj2tMDK; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id D95791380CEC;
	Tue, 24 Jun 2025 03:24:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 24 Jun 2025 03:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750749889; x=1750836289; bh=/DLPc3AqvE
	lHPw7buUbyDhqu+Ojy4kjlZASoEdJa6ME=; b=GmiGLe2reNQXTMTIxu9QvOY1cB
	DMj6Pe3tiDRPWrjBpzQerWTJ0DyUxshZZqjvWhb1o+UHFF8j0ro5+zx9HC7FR+eV
	RKxBEBvAWcUCMlFvTaABk/R3YQHJXCGhEd+3mKQi3k1H1tf8ko0IQ2/UNAb8mK5h
	4HVtP+9Dg6fosY1aEuByMbbteDu3Z1RstWvStsAfoMEtTgH3WKLi/sOIg9I67Whu
	NE3aVLAo44xed/4ubIVEsSCESnl6D73zKWd2beDGjWJ+OsD3W6odqpuHyQjC8t0+
	j4Atl3hDrjnK2jQ5L3LTbyFY80AVOeZSOV6CcpOD4stfrg8U84gChZ/rM1eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750749889; x=1750836289; bh=/DLPc3AqvElHPw7buUbyDhqu+Ojy4kjlZAS
	oEdJa6ME=; b=Rxj2tMDKmNIpEtX6eAzOk3K0bRfvN8DIecQ0TkiYW7ypmAJCrcN
	EmuyyseNCkCmm5o/TtSw5bRW8yd/HcssI+J4NgaGZ56SHC85Nt56laylxMo+NKTx
	QAYv16a9CGCv/InwpkCzPIanGvp2aYYEQUVe/yeFmMw9fkxZ+7v9KYPjJPuavV5T
	egFQncwsCeouS7OAXIFsNpJtalWQ7Utz9aTosrDTg/z6l3/mHsiSWL+KgW9HlAut
	GrSsWk1zSQjjVbeFnOk0aWXaQFG7WrMfyHj0G3EO9kVHsJN+znDnMMaxK8iL/LVL
	PYgvSPsDvkSF6B9brv+vpL5BDFCyG7dMIqw==
X-ME-Sender: <xms:wVJaaKSe1dKmIqid8BR1rZTo-0pYd50D8kMqWyAIt8lxOSWf2P8ixQ>
    <xme:wVJaaPz_oXBndr_H2PxagmwrcLo5zfC81S_NqNnbH7jN-BpjNwp0uyOynzqe9oGwD
    jTQ1g8l_vmhpw>
X-ME-Received: <xmr:wVJaaH2-pvzBLi9JTLkaT6MIrDoEBL0XjhYwbCbzt2joR7SoqkEojOAy6obZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduledvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegsrhgruhhnvg
    hrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprhgvmhhosegsuhgvnhiilhhirdguvghv
X-ME-Proxy: <xmx:wVJaaGDVQqhw5CAbooaFIMe8A_8rSxnm6mf7MVMo2F7WS-90q48qXQ>
    <xmx:wVJaaDje7ODcrFj6M5qkHa1AxsmytnU5gt91D-UHz2OP0324trsOZA>
    <xmx:wVJaaCqKB4H3D8-iso5IRmRJNSWqDw0Gx39ebspGjlVhcv4cYr1ezQ>
    <xmx:wVJaaGghrfOeEpkudmkdMO9cFtD0FQGms-2yIsQ8zj2PluAIQbI4vQ>
    <xmx:wVJaaFZ9JQ78lxBC1w0H-4R6ufPJXbgmmnDP333ukjuNEG6aehBQEX99>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 03:24:48 -0400 (EDT)
Date: Tue, 24 Jun 2025 08:24:47 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Remo Senekowitsch <remo@buenzli.dev>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 vfs-brauner tree
Message-ID: <2025062437-composite-jaws-2bbf@gregkh>
References: <20250624144231.3598eb5e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624144231.3598eb5e@canb.auug.org.au>

On Tue, Jun 24, 2025 at 02:42:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   rust/helpers/helpers.c
> 
> between commit:
> 
>   6efbf978891b ("poll: rust: allow poll_table ptrs to be null")
> 
> from the vfs-brauner tree and commit:
> 
>   a2801affa710 ("rust: device: Create FwNode abstraction for accessing device properties")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc rust/helpers/helpers.c
> index d2887e3b2826,393ad201befb..000000000000
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@@ -32,7 -32,7 +32,8 @@@
>   #include "platform.c"
>   #include "pci.c"
>   #include "pid_namespace.c"
>  +#include "poll.c"
> + #include "property.c"
>   #include "rbtree.c"
>   #include "rcu.c"
>   #include "refcount.c"

Looks good, thanks!

