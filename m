Return-Path: <linux-next+bounces-4891-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAC9E773A
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 18:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E082284267
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 17:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E050220695;
	Fri,  6 Dec 2024 17:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="kckIKlYl"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063A220680
	for <linux-next@vger.kernel.org>; Fri,  6 Dec 2024 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506113; cv=none; b=LGYk9qbjLWZpL0hCXwJcL/Swu2nNnzgZ8iR7y1SwHKfdPbP3G5dyofrcBX/rF2KgiCsWnDhbJEDI80Ns+01QTUW/6tEm49dNNglvG3Hu15sgTjdQXBD4i/qZBGhI9v2cQkj5faVnJ4lnqOrOtxt+R3vJdwXZUt9QgMs10RgjGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506113; c=relaxed/simple;
	bh=efvz2eXqmCQZmrVeOaWYMmbSXbUDQTsGzQ/BrVXRGk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDCX5E7El9Qzhw9YlOQqnNhVVFEN6NJiDRI/xlK8zyhtzadU5UiqFFXmlH/8T82mU5daysEUkmY6D1jTzpfvngQZxH01/FPE6eKBRPLd10hf4k7fHdrH2T4WCS9nnBe/Lkskn+jcnIx5zcWpFeFnnBFyaMe9DHSOE4e+jr+vnS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=kckIKlYl; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=abpXv2GPJogltjg85DL+kTBo+a1+5j4UHK9JxKe5vDg=; b=kckIKlYlNoJs1xklbOQZks2hNe
	iiMYrZ9gRIzCw4In5EoRLQQIdYLGRvpLS6xXUurY1fKpl4fZvn+/O9HJx+/0xEq5ItNKuEzVWJ8y5
	WcGCdJChP07e06ZD4szPDVmUoclQ4xPNr6GG39hwwd9OKntSvN3VDn/sBBVPaJLoUwjb1pq3LvX52
	W2GHhglzALEdPdLFoDj576ObVwu6sZzCZaXys/Mgt8VnEOgUfXFgutv2DCIUTfI41xiIPLA2Y3LEx
	1eT35sJZ3J9WRFnbzDn5j/aLHczUOIytL2v3t0M9l+u7gNUv/7MI0n62OekVBmmTHNrw9wDf2+ePT
	Bzv38P/w==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tJc7w-00000005Xaa-497O;
	Fri, 06 Dec 2024 17:28:29 +0000
Date: Fri, 6 Dec 2024 17:28:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-next@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: Missing signoffs in the ext3 tree
Message-ID: <20241206172828.GT3387508@ZenIV>
References: <1175596d-fdaf-4c99-9bf3-4a5f517ef09e@sirena.org.uk>
 <20241206144606.eltwdm6srrhlplss@quack3>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206144606.eltwdm6srrhlplss@quack3>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Fri, Dec 06, 2024 at 03:46:06PM +0100, Jan Kara wrote:
> Hi!
> 
> On Fri 06-12-24 10:22:31, Mark Brown wrote:
> > Commits
> > 
> >   74094f677916e ("fanotify: don't skip extra event info if no info_mode is set")
> >   8adc64d022177 ("fs: get rid of __FMODE_NONOTIFY kludge")
> 
> Thanks for noticing Mark.
> 
> Al, care to provide your signed-off-by for the
> "fs: get rid of __FMODE_NONOTIFY kludge"? Amir then massaged the details
> but you were indeed the original author of big part of the patch. Thanks!

Patch appears to match what I have in a local branch + fix for braino caught
by Amir, so...

Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

