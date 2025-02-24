Return-Path: <linux-next+bounces-5546-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918CFA41540
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 07:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7C5D3ABCC1
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E111D619F;
	Mon, 24 Feb 2025 06:16:11 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C7B1C84AE;
	Mon, 24 Feb 2025 06:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740377771; cv=none; b=pTaauKx8LNEpHZbv5UFtSaiQIXYwvYEuWTLPhtyHLN5rsD72fmtMY/gPv4jXloYgC1p4sGqj+9GO8n/35AvBCFUqE9+qpLSJZ9EvimZuTTitYKOP4U4luII2UiB0VksYas50B1mIb2X1PTCrv/EvqaOrXVcIRewbFejub2XqJyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740377771; c=relaxed/simple;
	bh=sLKf/Nt8GIWHm/WWMEqmGsxGrNrgigMl0XpKmZeSdpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bigL89a97xRtCTo0zcD16D4AEsQw/URSWd+8wlqon2Tl3Ebf0NL+am/+9n/v9Eg88883J3r4KLMEWTV3Vh2YmsesgEPdcwCtBC2QgSYVNd5JHnvERV8W6NoZmX3HglHFlF1YpazujPX9+YhLGpjrcATBbgTpj93cU2RNnqjthLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7BBC4CED6;
	Mon, 24 Feb 2025 06:16:10 +0000 (UTC)
Date: Mon, 24 Feb 2025 07:16:03 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the char-misc tree
Message-ID: <2025022418-variety-musty-172b@gregkh>
References: <20250224160021.63b13a2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224160021.63b13a2b@canb.auug.org.au>

On Mon, Feb 24, 2025 at 04:00:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the drivers-x86 tree as a different commit
> (but the same patch):
> 
>   74826b3fd7d2 ("sonypi: Use str_on_off() helper in sonypi_display_info()")
> 
> This is commit
> 
> 
> 
>   74826b3fd7d2 ("sonypi: Use str_on_off() helper in sonypi_display_info()")
> 
> This is commit
> 
>   9cf1c75bfda5 ("sonypi: Use str_on_off() helper in sonypi_display_info()")
> 
> in the drivers-x86 tree.

Odd, why is a sonypi patch in the drivers-x86 tree?

	$ ./scripts/get_maintainer.pl drivers/char/sonypi.c
	Mattia Dongili <malattia@linux.it> (maintainer:SONY VAIO CONTROL DEVICE DRIVER)
	Arnd Bergmann <arnd@arndb.de> (supporter:CHAR and MISC DRIVERS)
	Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:CHAR and MISC DRIVERS)
	platform-driver-x86@vger.kernel.org (open list:SONY VAIO CONTROL DEVICE DRIVER)
	linux-kernel@vger.kernel.org (open list)

As I'm still listed as being in charge of this, that's why I took it...

Anyway, not a big issue, duplicate for it should be fine.

thanks,

greg k-h

