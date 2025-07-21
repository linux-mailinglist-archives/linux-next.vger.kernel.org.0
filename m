Return-Path: <linux-next+bounces-7660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 160B5B0C221
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 13:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4B517A7B2F
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 11:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C83C28F95F;
	Mon, 21 Jul 2025 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SUAyLweq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29941D540;
	Mon, 21 Jul 2025 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095853; cv=none; b=oQV+qKRtZ5U++pDRLNBgjgC+TPfkTnlhjlKQN4TEvIByh2lrpPKmcNy4PMCdpmjtuaz1j81wbvJFo8UTTV4+hPHuNtYXJgx+z7uYLvfXnWRLN6i6qz2WBRc4QoGXsPB/RRQsXkmXZQGCuk6NlAa10JqGF0pe3NyTph5nj3A4m6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095853; c=relaxed/simple;
	bh=FOl8B1w1BTmtkYtHJ9aUUMR1Sx99lJ8Y65IBMge6HNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfMRBv02qbzPBPSZgpcRcdxf3Vrcl5bT0JFQcgfvNSULzHQk8J9KifDNDJZ2FFVxtrn8NSFjD9LeZZR8ETxLvLvJANEBCbundH4kPcs0dAr5WfAw1x/fRDzTUIoHijfHOfmiCwd4bpgL+MimU6f4u/77e+RS9NUQKQLZoWvji2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SUAyLweq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CF1C4CEED;
	Mon, 21 Jul 2025 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753095852;
	bh=FOl8B1w1BTmtkYtHJ9aUUMR1Sx99lJ8Y65IBMge6HNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUAyLweqpIGhQZIudql067twi9TaYbc6LhEXkUSayi7DwqO5Wmzqr+cuIGdvwAgnU
	 CDj/v+Itds6YJySP2wR46qf7cMTqVF4YrMeOBWzz/T70J3jhiDQ1C+Mn0SHpHglfZy
	 AlgsLCfEuor/6uWKB0XQw9lNP0rQCZOIeinw+XDE=
Date: Mon, 21 Jul 2025 13:04:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: sfr@canb.auug.org.au, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] usb: core: add urb->sgt parameter description
Message-ID: <2025072159-banjo-resisting-db29@gregkh>
References: <20250721104417.3442530-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721104417.3442530-1-xu.yang_2@nxp.com>

On Mon, Jul 21, 2025 at 06:44:17PM +0800, Xu Yang wrote:
> The parameter description of urb->sgt is lost, this will add it for
> completeness.
> 
> Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250711182803.1d548467@canb.auug.org.au/
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  include/linux/usb.h | 4 ++++
>  1 file changed, 4 insertions(+)

What commit id does this fix?

thanks,

greg k-h

