Return-Path: <linux-next+bounces-5958-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F89A6DB73
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 14:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB4A3B3961
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 13:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764BF25D8E0;
	Mon, 24 Mar 2025 13:29:21 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5983625DB03;
	Mon, 24 Mar 2025 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742822961; cv=none; b=YECO5ti2HHED4efttfML3xcEHuYyuAuRuKXQ2RZmHAIi9uCI4y7b+buXW5dwKl2OPkBTT0xop/kTFMfY53jOveSlmKT/qCA9+B7USxIhIdVfzq7493e1gU+xHG8hH4J30xIkvidLE2npZuEpE1l4A03L1jCh89yWRPDpoLKEqc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742822961; c=relaxed/simple;
	bh=MooAaV+Kvm9Expqrkk8Zya9Xzw3n3iQ2WHNCdwo+e/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IW6kK2HWouFm+B1mvCuIYyDkgUuKMR83E51PiJoIcqB3O983FfuXLq9+2N4/H3g6VwZPDUlaoqsMFQBv+E0x6btddVvAtdiJDcHnf/sNsktVP5qhbPiC+E52gzKtZVN3NQu+4ZXYRPSLK+9bZ9AzOahezLuCedsNsXl3AMApKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2F0C4CEDD;
	Mon, 24 Mar 2025 13:29:20 +0000 (UTC)
Date: Mon, 24 Mar 2025 06:27:59 -0700
From: Greg KH <greg@kroah.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <2025032446-glass-volatile-d77d@gregkh>
References: <20250324193728.4af92ccc@canb.auug.org.au>
 <DB9PR04MB8429CD5C790E85AEBD7A7DE292A42@DB9PR04MB8429.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR04MB8429CD5C790E85AEBD7A7DE292A42@DB9PR04MB8429.eurprd04.prod.outlook.com>

On Mon, Mar 24, 2025 at 09:10:01AM +0000, Sherry Sun wrote:
> 
> 
> > -----Original Message-----
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: Monday, March 24, 2025 4:37 PM
> > To: Greg KH <greg@kroah.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Sherry Sun
> > <sherry.sun@nxp.com>; Linux Kernel Mailing List <linux-
> > kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
> > Subject: linux-next: build failure after merge of the tty tree
> > 
> > Hi all,
> > 
> > After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
> > 
> > drivers/tty/serial/fsl_lpuart.c: In function 'lpuart_poll_init':
> > drivers/tty/serial/fsl_lpuart.c:642:29: error: unused variable 'sport' [-
> > Werror=unused-variable]
> >   642 |         struct lpuart_port *sport = container_of(port,
> >       |                             ^~~~~
> > drivers/tty/serial/fsl_lpuart.c: In function 'lpuart32_poll_init':
> > drivers/tty/serial/fsl_lpuart.c:696:29: error: unused variable 'sport' [-
> > Werror=unused-variable]
> >   696 |         struct lpuart_port *sport = container_of(port, struct lpuart_port,
> > port);
> >       |                             ^~~~~
> > cc1: all warnings being treated as errors
> > 
> 
> Hi Stephen,
> 
> Thanks for the quick fix, actually I sent the fix patch earlier today, please check
> https://lore.kernel.org/imx/20250324021051.162676-1-sherry.sun@nxp.com/T/
> 
> Best Regards
> Sherry
> 
> > Caused by commit
> > 
> >   3cc16ae096f1 ("tty: serial: fsl_lpuart: use port struct directly to simply code")
> > 
> > I have applied the following patch for today:
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 24 Mar 2025 19:10:57 +1100
> > Subject: [PATCH] fix up for "tty: serial: fsl_lpuart: use port struct directly  to
> > simply code"
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/tty/serial/fsl_lpuart.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c index
> > 33eeefa6fa8f..4470966b826c 100644
> > --- a/drivers/tty/serial/fsl_lpuart.c
> > +++ b/drivers/tty/serial/fsl_lpuart.c
> > @@ -639,8 +639,6 @@ static void lpuart32_wait_bit_set(struct uart_port
> > *port, unsigned int offset,
> > 
> >  static int lpuart_poll_init(struct uart_port *port)  {
> > -	struct lpuart_port *sport = container_of(port,
> > -					struct lpuart_port, port);
> >  	unsigned long flags;
> >  	u8 fifo;
> > 
> > @@ -693,7 +691,6 @@ static int lpuart_poll_get_char(struct uart_port *port)
> > static int lpuart32_poll_init(struct uart_port *port)  {
> >  	unsigned long flags;
> > -	struct lpuart_port *sport = container_of(port, struct lpuart_port,
> > port);
> >  	u32 fifo;
> > 
> >  	port->fifosize = 0;
> > --
> > 2.45.2

I've applied the fix to my tree now, sorry for the delay.

greg k-h

