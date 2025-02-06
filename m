Return-Path: <linux-next+bounces-5384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9C1A2AB4C
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 15:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A6D5188A1FF
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 14:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDFC23315B;
	Thu,  6 Feb 2025 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="RuWL9TOo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LhKg4zX5"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2D7232378;
	Thu,  6 Feb 2025 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852115; cv=none; b=NlHcR61REBTeR7LpuBauI6AL7tsyKbwdFEYe+Y0y+7j+tw3nz67rUmS/tiSjBel0KwyK2ZHjKLqmKu0XFS+AHNcydJ2hu5ZwfgAeV1333nfsYIXDFDg3ojxdW7Y3PruEKD8PRD+ZaizTeyeFrMgxvq4d1xvkWcjXGbI+Y5HK8hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852115; c=relaxed/simple;
	bh=fgbY++RJ+ic/+i8oSfsHGyc3RLIXbYiasUWHSyg7s8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=laPSV5rg/xFBgrp9bz/St/nyvyoYP2ES/jeY7p4/FC6t93UaONQQXLGBVOpP0JHCMOZgXFYO9x6UNJ1m0YYLWWV2csovA5qdQdfYqpfuKxUDtFuZiVgpU/6gLGUA+ROH6heD/nG/IHgeqlUTJPtgHLIIErGIcUmke5Jowgek8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=RuWL9TOo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LhKg4zX5; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0D35011400D2;
	Thu,  6 Feb 2025 09:28:32 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 06 Feb 2025 09:28:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1738852112; x=1738938512; bh=i/bH1tcl0o
	ISJAV1FYlk9k+MIHMSnj8viyqL/ewy+ko=; b=RuWL9TOobf/UkOOz4MlUi42/tn
	DdIdvwR28xReC4dyCvNy8TszJQJi8ctXWU2/xAt17Oh3Z4aRWSobhPq6eGl+Bt7T
	eXUsXRn4xNkexRBfdXluU3qFlgRuU+LL+soLDVSqKG066+qab2sLggojKGq5iQRf
	4+0lrjgFCXwmOuWankVnqRaJc2VvFDPV7d2vS0r+aFEcZ4LGJk+cXMFP6D2uUF2t
	NsJmmBjSpC/RITjQlpJsjNcbt57EuxT3PUEg82GUwfWMVbYwEEphdzTQ2/WYBMvg
	cnicQo6pvBM6DHZSAb1lNF0jgKnwQiKBopMvmDhuYMAQSq7Vhwk8jHjNmT0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738852112; x=1738938512; bh=i/bH1tcl0oISJAV1FYlk9k+MIHMSnj8viyq
	L/ewy+ko=; b=LhKg4zX5VxBHFbdx/p0fzlfcJpZ8N25P/k8rLVtbJPIQInsEY++
	BJjrtgmu8C7n7DHn5fYhqEDPK7ioFtvnmJohPTheiPaNbT4AnbRPofvtXVZ4hi01
	UTzNiezPPn2M9wbCDUbhmh+aguSyWlcV05R9U0ehH6pO9tn9iwU60DB8gxoRiKzb
	xtFYPGeBuSKuTM3SFuM2rh6GoubdEiiSAiiR5e1QWe6a7wfNXjN3GLUaEMKG4ZBN
	Lx30krc/zsMxYRAkjB7z0fgW6uzkIb13J5JVWiai7siEp0hd4lw+mguTfvCzQ6Jq
	dA0CHNDNKqIv5mcuwCYlq63ERaG9X6bqZdw==
X-ME-Sender: <xms:D8ekZ3jm1jSSu_ZHQXofuyLLi468QYb31-kxaDqyC-aBo4fNE11-zw>
    <xme:D8ekZ0ANJmFBHW35_k5Ic-Y1eNZSbnjtFzIGER89aHbU8_f6OZqA5hFNEtSNBqSIf
    7pIPoaIC-HPkw>
X-ME-Received: <xmr:D8ekZ3F8eztWzqTKaF1fTKw7Kz47pgGVPK-XWCtQ7m1MC6i0oKQvdl7jsfZ84yBxsO8yw7ikBHIMKJLd3yXa1J3NyJSxbIfH7Moepw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepsggvnhhjrghmihhnrdhlrghrshhsohhnsehgvghnvg
    igihhsrdgvuhdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:D8ekZ0TucECWBB0w4jf7uQLGs9G_qufSVQmFAuWxvLBI9t7aM79VlA>
    <xmx:D8ekZ0xPGsH6Bv-Lzzs1-GA01A3Ku0guqRwrtYbvHDFMdhDJhGvJAQ>
    <xmx:D8ekZ66naF48u5Mw9q5nGR24RheOjklxSeNYE7tEZXdyvFM5XijqmA>
    <xmx:D8ekZ5xKOyQY5GF-ltltgwufnyOKYmoKhJ1enccfAbhrfttAyGqnwA>
    <xmx:EMekZzljNgwDLk33bYbOkbdXfpK5wpKr0A7V8_3q8rEWWEM9luzYqF3l>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Feb 2025 09:28:31 -0500 (EST)
Date: Thu, 6 Feb 2025 09:14:02 +0100
From: Greg KH <greg@kroah.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <2025020621-feeble-attire-0611@gregkh>
References: <20250206135328.4bad1401@canb.auug.org.au>
 <647d4d6b-615d-4c0c-b001-fab43fb7ab4d@genexis.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <647d4d6b-615d-4c0c-b001-fab43fb7ab4d@genexis.eu>

On Thu, Feb 06, 2025 at 08:40:34AM +0100, Benjamin Larsson wrote:
> On 2025-02-06 03:53, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the tty tree, today's linux-next build (x86_64_allmodconfig)
> > failed like this:
> > 
> > drivers/tty/serial/8250/8250_airoha.c:52:6: error: redefinition of 'airoha8250_set_baud_rate'
> >     52 | void airoha8250_set_baud_rate(struct uart_port *port,
> >        |      ^~~~~~~~~~~~~~~~~~~~~~~~
> > In file included from drivers/tty/serial/8250/8250_airoha.c:10:
> > drivers/tty/serial/8250/8250.h:328:20: note: previous definition of 'airoha8250_set_baud_rate' with type 'void(struct uart_port *, unsigned int,  unsigned int)'
> >    328 | static inline void airoha8250_set_baud_rate(struct uart_port *port,
> >        |                    ^~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >    e12ebf14fa36 ("serial: Airoha SoC UART and HSUART support")
> > 
> > I have used the tty tree from next-20250205 for today.
> > 
> COMPILE_TEST seems to be the cause for this.
> 
> +config SERIAL_8250_AIROHA
> +	tristate "Airoha UART support"
> +	depends on (ARCH_AIROHA || COMPILE_TEST) && OF && SERIAL_8250
> 
> 
> Should I send a patch removing this?

No, you should allow COMPILE_TEST to build the code, right?  Odd that I
can't build it here for some reason, I guess I need to enable OF on my
test builds...

thanks,

greg k-h

