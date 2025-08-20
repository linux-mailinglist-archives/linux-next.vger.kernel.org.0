Return-Path: <linux-next+bounces-8033-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775FB2D4A1
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 09:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CABE568698C
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 07:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71642D29D0;
	Wed, 20 Aug 2025 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJhhZveI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4B1277C80;
	Wed, 20 Aug 2025 07:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755674064; cv=none; b=SVfPY2mQq/mi5qgeieMQDDGMBeFFoILxiWmFuq4lzbkN+vbV4O7GGsWS4lEd+oC5xZbMsNDIx5pnSKDA0SM/hFAd64/CXdpCEMuTA2+dH3itD8GnC3HRCm0gZ7cBY/1K6U7tODyguC1NyIUqfsMeM3QZ7E0f56qxueLiFyRmT3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755674064; c=relaxed/simple;
	bh=zC0MdIcOWrTIh5RXNiglNlTaZrqVT/jZze1mXwgcEOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyqdNMQEysgoesEgXFzXgE3g4TVMEpQMDlOr+vHIn4FW1Eeq2jp9smNsEiSIQNl6T3ArXWs9iK1sL+8qezwCQT2p0XYA8OeNN5jn49cKciDGxPZ6XNzSpCkH6n4V1cSQPpZMINQBN37QuqXMezAeWtYNMfVxrdKiP/YXTzvrTfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJhhZveI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA66BC4CEEB;
	Wed, 20 Aug 2025 07:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755674064;
	bh=zC0MdIcOWrTIh5RXNiglNlTaZrqVT/jZze1mXwgcEOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJhhZveIwcOAk91z45xfFgjXCXuNJuq0pxXsG0x9sNlTi7oQR6VSK+8xElxEMaVMk
	 IJ751ZJMom68zgEZeHXP7ZKuc97y/PECzW5fkgEK99YZjng4ET9ajgPorXUTlBzV4H
	 dJD2CvcwQGr5bTiiawyD+zW8qJyJn/EO9CoGjDaQZnhp4pZFlU8bvoM2yu/l3XIbeb
	 lh5Z3D2MsbKH4vFU93XAZG0X3JBBIk3AoBoRLVJJGHzVr/OvWAIX+aPClj9WrKrbkK
	 OLZCc3SKb0IeB+urVFFhu0i9OtjLyUmoVassOMaKzdvFao6GY9e3+B8DTlelDpdJT6
	 4g7W+uZ6nIbpQ==
Date: Wed, 20 Aug 2025 08:14:19 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nvmem tree
Message-ID: <20250820071419.GI7508@google.com>
References: <20250819134039.5742c60e@canb.auug.org.au>
 <10708013.qUNvkh4Gvn@diego>
 <20be4ac4-42c0-422c-bcd4-8d49527f217f@kernel.org>
 <3593278.som1txNFv6@diego>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3593278.som1txNFv6@diego>

On Tue, 19 Aug 2025, Heiko Stübner wrote:

> Am Dienstag, 19. August 2025, 15:58:32 Mitteleuropäische Sommerzeit schrieb Srinivas Kandagatla:
> > 
> > On 8/19/25 2:54 PM, Heiko Stübner wrote:
> > > Am Dienstag, 19. August 2025, 13:22:04 Mitteleuropäische Sommerzeit schrieb Srinivas Kandagatla:
> > >> On 8/19/25 12:14 PM, Heiko Stübner wrote:
> > >>> Hi,
> > >>>
> > >>> Am Dienstag, 19. August 2025, 05:40:39 Mitteleuropäische Sommerzeit schrieb Stephen Rothwell:
> > >>>> After merging the nvmem tree, today's linux-next build (x86_64
> > >>>> allmodconfig) failed like this:
> > >>>>
> > >>>> In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
> > >>>> include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
> > >>>>    13 |         u32 baud_rate;
> > >>>>       |         ^~~
> > >>>
> > >>> [...]
> > >>>
> > >>>>
> > >>>> Caused by commit
> > >>>>
> > >>>>   117c3f3014a9 ("nvmem: add driver for the eeprom in qnap-mcu controllers")
> > >>>>
> > >>>> I have used the nvmem tree from next-20250818 for today.
> > >>>
> > >>> bah, sorry about messing this up.
> > >>>
> > >>> While I encountered this, and fixed that with the pending
> > >>>   https://lore.kernel.org/all/20250804130726.3180806-2-heiko@sntech.de/
> > >>>
> > >>> I completely missed that the nvmem driver applied alone would break
> > >>> without that change :-( .
> > >>
> > >> I have now reverted this change, @Heiko Please let me know if you want
> > >> to take this to mfd tree or vice-versa.
> > > 
> > > ok, no worries :-) .
> > > 
> > > I guess for now, I'll just make sure the header patch gets somewhere.
> > > And I guess I'll re-try the nvmem driver once that has happened,
> > > probably for the next cycle.
> > 
> > I don't think we need to wait till next cycle, Lee can pick up this
> > patch via mfd tree if header change is going via mfd tree.
> 
> Okay ... if that is fine with you then great.
> 
> I guess for less confusion, I'll re-submit the driver, reference the header
> patch it needs and you can Ack it to go via the mfd tree.

Sounds fine.

-- 
Lee Jones [李琼斯]

