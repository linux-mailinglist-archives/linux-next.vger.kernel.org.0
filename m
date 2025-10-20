Return-Path: <linux-next+bounces-8639-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCCFBEEFE8
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6813018966A8
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 01:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6898C1C6FF5;
	Mon, 20 Oct 2025 01:24:51 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85C012C544;
	Mon, 20 Oct 2025 01:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.66.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760923491; cv=none; b=Hriqq1WRCcOLCAMnpKq2+bDXBg1epNNEX0TwvqPyxeuLR/N7yuOQCmHa+imifDDByaQmP9ioXOxk8vzip91B4TcRERnel/pXZAjCv6ahRtBLgBpRfNaXUtzumW5hfgS0IHFbvdINxGsCSGdUE/d9fMvbagcPRplUsokVe/Ndaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760923491; c=relaxed/simple;
	bh=5ZGt70rmMf8OL/L4fTLCCvUfMuHZk8RsnSh5QxkObvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f41HNHlLw2VU4NTw19CYm0+nkR1R1chPbyKlTofKx57+G0apqowFSlTLbXWOoNyVhdji6GEdk9Uxqr26IORPGxT3nuUHujaITlWk4sQH4oCU2rgsTmX8eBtMaVNW2CawYjbXDCl8HVEjfIEModm4cecO047uubH8lTcVY65TFi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hallyn.com; spf=pass smtp.mailfrom=mail.hallyn.com; arc=none smtp.client-ip=178.63.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.hallyn.com
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 92C2BD01; Sun, 19 Oct 2025 20:24:40 -0500 (CDT)
Date: Sun, 19 Oct 2025 20:24:40 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Serge Hallyn <sergeh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: failed to fetch the capabilities-next tree
Message-ID: <aPWPWEfPpyE94qcs@mail.hallyn.com>
References: <20251020075738.2de7288c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020075738.2de7288c@canb.auug.org.au>

Hi,

Sorry, there's nothing in there right now, so I think I deleted the
tag during the last cycle.  Is the right thing to just leave it
pointing at something like 6.18 with no changes and let your
automation calculate an empty set?

On Mon, Oct 20, 2025 at 07:57:38AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Fetching the capabilities-next tree
> (https://git.kernel.org/pub/scm/linux/kernel/git/sergeh/linux.git#caps-next)
> produces this error:
> 
> fetch_git: Could not fetch capabilities-next branch caps-next
> 
> -- 
> Cheers,
> Stephen Rothwell



