Return-Path: <linux-next+bounces-4255-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2099BFE2
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 08:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C733B1C21FCF
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 06:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515AD12BF02;
	Mon, 14 Oct 2024 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xgNFo2lw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7B3E47B;
	Mon, 14 Oct 2024 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728886635; cv=none; b=hitqMaPu6Lbpy8rRCysN0hATJgOuP7xItirUNHHKUsVG0+rpdYFLeuoArHWWKnVa7APlzy8/JN/Xn+lnVPow6RsODybyXJBDlB1cxrYe5D4jiDzCPra62CUsUwRQbxwB/DSsj4+MLQRz9xaARNhXbW2Y0aM85hRjcIwmSzPJi3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728886635; c=relaxed/simple;
	bh=DaCfb60xXYGTfydHKa4gWcBaytXWhjn1261Cct4Va0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2iUwZD6qELCSNH04jOuIR3YJNIP9NZuaDGaBgJ76XtXCqE1u8VdE2ZLkgAqU7UNI3KHWMCbWOOo3W0S6oXxUeRvmnJ9L+Q0YTVAiEOJFnPGLeQMwSY7BrYZoMpzBbtf3Es3TRBhZQe7+74d4p/OkzMUXLIz5GhEBE2lNcCyQEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xgNFo2lw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FDAC4CEC3;
	Mon, 14 Oct 2024 06:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728886634;
	bh=DaCfb60xXYGTfydHKa4gWcBaytXWhjn1261Cct4Va0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xgNFo2lwsS4g7B6G3hhKZ53RUL/IeRISuCAuwGQvamLPDKTsWfzarlUTYhkKxHP30
	 fgrCjLCT1vNKYWv8issN3pS+K9uCJ0+DOwRzXbt2+eUTh4J/jrjcSge/1wiOn72h44
	 MuI0XvzIUzVuXYPbyAX1k9kmSoUAi1KMl1yAxC2Y=
Date: Mon, 14 Oct 2024 08:17:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <2024101458-tux-unopposed-7960@gregkh>
References: <20241014102859.53f4774f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014102859.53f4774f@canb.auug.org.au>

On Mon, Oct 14, 2024 at 10:28:59AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bcachefs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: "sysfs_delete_link" [fs/bcachefs/bcachefs.ko] undefined!
> 
> Caused by commit
> 
>   c37fd6772eea ("bcachefs: Fix sysfs warning in fstests generic/730,731")
> 
> sysfs_delete_link() is not exported to modules.

Perhaps sysfs_remove_link() should be used instead?

thanks,

greg k-h

