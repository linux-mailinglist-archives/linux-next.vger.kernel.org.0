Return-Path: <linux-next+bounces-3848-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B736978B03
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 23:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957051C211A5
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 21:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56FF156236;
	Fri, 13 Sep 2024 21:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uaRfarTu"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E151527BB;
	Fri, 13 Sep 2024 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264768; cv=none; b=gpQKnsbbDGsmbgXKjrFpPFrFB9iaYawlRaKAWP0uYRQKYmfLDVO+gxZHCvuvxBFQeDbygzU439SCxZOKAMYTOb8ONBLcilyjg4234aBDaBUFza4WRMRqOaSedako1mGdpM/hPwxfZ0nRURQLQeOm3BoSI0yKPr0lBO+aW+VsiVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264768; c=relaxed/simple;
	bh=xm3HUyLPXJ6DgmausDPazaK89hIg1POHtC5HrcrQQaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qN3M1ZIXCfaf4Arv1KahM7Ac9CotG6NSVQqkd4H3DGlBL02jTA+QBuxIBEcy9UjMEaccxyRrPvF5Uj9Au0b8FN5V4mZobxE50lyXTIU8D9xZMpSizJ8bpUZReoxoivUMyzZjsYh1AlRZhEc9er+Q4YzK7uXE44uouPK0F6QomqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uaRfarTu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dZoc+H8/pDEQCpX/wXMW7qS2ky0b0EzCVbkT2OhZPi0=; b=uaRfarTu1HzENb/Y+zwaEQxeNA
	wBB2TtgiupMRvPIByotu+DXsMiRa14oqxGPKu3ea2kO3uknWuTP3tR9GmqwPTpxddg5MaJqlVRf0J
	42mi8pTeJeUTLONQ7fbfdFNacjDz05FazWZG1cpG/M26HmYRR91XDUOLpjZUip5bVuJNvzwt583w3
	taoWpCKqOf7yYjohYa53gNaZncwEar5KIgA5XmgEKCbq6V3/qKfvYI9LVk51WrvKAOj1GFrfy3DUN
	HKs7ghC35dnIT89UDnVJA3TT8HSg6Rfq5ZGU5X4lVsPNOy8Rjst2gUAyPbWGJ5yju9fYnHpNREHZ5
	BVW/3kxA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spEK3-0000000H288-3MUq;
	Fri, 13 Sep 2024 21:59:23 +0000
Date: Fri, 13 Sep 2024 22:59:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS1u8G6M9ch2tLC@casper.infradead.org>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <ZuS0x5ZRCGyzvTBg@mini-arch>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuS0x5ZRCGyzvTBg@mini-arch>

On Fri, Sep 13, 2024 at 02:55:19PM -0700, Stanislav Fomichev wrote:
> On 09/13, Mina Almasry wrote:
> > Building net-next with powerpc with GCC 14 compiler results in this
> > build error:
> > 
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > net/core/page_pool.o] Error 1
> 
> Are we sure this is the only place where we can hit by this?

It's a compilation error, so yes, we're sure.

