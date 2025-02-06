Return-Path: <linux-next+bounces-5383-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E04AA2AB3A
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 15:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFD663A9BBA
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 14:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A153121CA07;
	Thu,  6 Feb 2025 14:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="HqBo0e7s";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jBpmXNFF"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5850225A30;
	Thu,  6 Feb 2025 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852077; cv=none; b=ABHDLjkgtI3bmMEcB565TXYiZtCjP3A+GYs6h/NlkzkHjfylo+5fgBjMNox2wvOCLbi13HlPJrL6EfMuUkgaaMGsJEtNmURz1iSvocD7aYhpKbmLQ2fZXBULhW3cUuo0gDXsiKfaEPwDRFqlEPtlPcYFPdvwNgWIKat3gbvG2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852077; c=relaxed/simple;
	bh=2cNmMRrjbMU+ZRP1p0rAJ5BG1SaRJHj8sVMoEn8RiOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmXqmWy7gjCQOestFsb8eacdIhXV0CJnrVWZUZX2IFaqDg9dyBRRNDVy6guTMyo0i7DYH5Ikwl/2IVtaS6btJ1COf9E7YNJquOdxINh3D3/fqKeZZYc2bS/B9/NUAFd48HEk4FUxdfWw3T3TDYj45CHjiJQMGt0gHJZzEzlufOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=HqBo0e7s; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jBpmXNFF; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E1BD211400F4;
	Thu,  6 Feb 2025 09:27:53 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 06 Feb 2025 09:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1738852073; x=1738938473; bh=kffymrycT8
	A8X7eXvYzY0zmmfkNntebL2JpumusSOlM=; b=HqBo0e7sung/aQHG1OUU2b6MCX
	djg1TwyJKuuHHEGwBkuOmAjNht4B8oltU+D75Fk+n+ZJnMXGH8mvGF2+oDazvI0f
	ExXAdueLApq8GMJcJKoqKWKfEDICZc5023a/uBWGUn8fg+9389FHftVOtNSgKvqG
	8n5h93YKdu7V9CQyT+AcqPVEgxRIzvxj27dHUA1xAKypruCCyrwKyWCAY0dUKm0o
	gZ6yu48xdys+O6bPPIDgF5lVDUVffZP1/ZCAGcdk3bvcu9g7DXJLZPd8mnUVBWP7
	jmBqHcSbwUejmmTEQd0fJZ91T4LC+2H8L6/uIE3G0u6TBQfXs64Q8cl9aejA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738852073; x=1738938473; bh=kffymrycT8A8X7eXvYzY0zmmfkNntebL2Jp
	umusSOlM=; b=jBpmXNFF2DEQDZXV029r06MPBdgGkrcndLzGFLMIBArprOTLRT4
	LP/eBPORIEXZqEddrahQ+pprU3itHVl4sWidrmpQIdTGjBYBbUlOCs1PgEO9D+Jn
	+i9yAQ5NtVX4+qegHX8u99dkXE/96hpJq0yLS5U3EbENYgLkovF632FqynrgxzzX
	LKskAv6EU4SOkbrwp6LJfga25VlkI3EnNlj6xENRK2AjD53jyxh+0W4dbywUO/9r
	CNqAf9MQZINFFVax8pQKZBi1n28rn8jDTkiXQZKtdS+fflEvg3ASiCAZdB98AzAT
	tb4ktdAZoMZVCXMqyk0yzyWh7WftE+VrFrQ==
X-ME-Sender: <xms:6MakZ-DeK_SW8M6EqsppoObAz6SZLBEj2WdPBkFyAAQNzmYilGD4SA>
    <xme:6MakZ4hBYV_uaGmdy4Nn7tOi_UtIpghyX4IOt_VoeZpdE8kQilnCW_5x4E2Z-gu5X
    EF2S9RA7hZymg>
X-ME-Received: <xmr:6MakZxlvCU4cjpcj-GuL5X0lxnL2pZ-ZnGYs44mRKUYxxVaISmZQgXHyS9c95HB6on6DHhf3Y8g7AmMstNqvRdghCp9VZ8lgmfT6oQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohepsggvnhhjrghmihhnrdhlrghrshhsohhnsehgvghnvgigihhsrdgvuhdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:6MakZ8wvxBHgyiC2hiohHz51VMjoy56sfgn5GIUZNqeAQ59lDhs0lA>
    <xmx:6MakZzRmzQcZmt7De3oSo9EU8nonF1sGRT18NYsgPdl6bYczqwWNPQ>
    <xmx:6MakZ3bYHa06_j_yKu_924t5wIHp9fLtJ6hmL_LL_5B8vVXNK4RYxQ>
    <xmx:6MakZ8S_lNlcC9KaiGupmrgHASUpLMb-47qSq0EkJC-BSANLcxVyVg>
    <xmx:6cakZ-FPRtLe3dDVfwxYTCeINfzwYsiZZF2_YqIcKQFFGzacZqrMap3i>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Feb 2025 09:27:52 -0500 (EST)
Date: Thu, 6 Feb 2025 06:15:05 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <2025020622-preset-snowless-563b@gregkh>
References: <20250206135328.4bad1401@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206135328.4bad1401@canb.auug.org.au>

On Thu, Feb 06, 2025 at 01:53:28PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tty tree, today's linux-next build (x86_64_allmodconfig)
> failed like this:
> 
> drivers/tty/serial/8250/8250_airoha.c:52:6: error: redefinition of 'airoha8250_set_baud_rate'
>    52 | void airoha8250_set_baud_rate(struct uart_port *port,
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/tty/serial/8250/8250_airoha.c:10:
> drivers/tty/serial/8250/8250.h:328:20: note: previous definition of 'airoha8250_set_baud_rate' with type 'void(struct uart_port *, unsigned int,  unsigned int)'
>   328 | static inline void airoha8250_set_baud_rate(struct uart_port *port,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   e12ebf14fa36 ("serial: Airoha SoC UART and HSUART support")
> 
> I have used the tty tree from next-20250205 for today.

Ick, sorry about that.  Benjamin, I'll go revert both of your commits in
my tree now.  Please feel free to fix them up and send working ones in
the future.

thanks,

greg k-h

