Return-Path: <linux-next+bounces-8662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67552BF34F1
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 21:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57DAD4FC79B
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 19:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF862D3EF8;
	Mon, 20 Oct 2025 19:59:16 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF6C333434;
	Mon, 20 Oct 2025 19:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.66.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760990356; cv=none; b=NvnrBqEU8R9NqaHMipWL/owB8ZVbc0+fSt4SPoDUjEQdmfQ1cbFIupyIVLUCpKAdMtAkR67fiF8r114T6Tdoak8OmnoSx46Ol5t9U5hYj3QpiH2AMdbBBayoBIFuWtG56Q6QdEJz3Jfn7OXmOqKwtajBRoXuTJb+UfZnmVA2has=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760990356; c=relaxed/simple;
	bh=HWDQQBySaWwcyqBNxtQ6itbpSI+j3m+A//1gLr/GpxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDFSlHFJnunf/I1HhGzudMyjCLSrDFk1/qrkVEqE4NmicWe3PIFBsXH0RbIyzJmVaKjh1Z1qgSKqEc9i8FFalJF5r3XKoUmk+0uFzddM2sr26rzcd9FrKI1IjtzgchWBMaW/RckvAiN1zvC4mri7I+3rZ0zoYou+/eJw5X7ZqNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hallyn.com; spf=pass smtp.mailfrom=mail.hallyn.com; arc=none smtp.client-ip=178.63.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.hallyn.com
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id C57CC84F; Mon, 20 Oct 2025 14:59:11 -0500 (CDT)
Date: Mon, 20 Oct 2025 14:59:11 -0500
From: "Serge E. Hallyn" <serge@hallyn.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Serge Hallyn <sergeh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: failed to fetch the capabilities-next tree
Message-ID: <aPaUj1rENWJr+fvX@mail.hallyn.com>
References: <20251020075738.2de7288c@canb.auug.org.au>
 <aPWPWEfPpyE94qcs@mail.hallyn.com>
 <20251020140947.0dfa07c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020140947.0dfa07c9@canb.auug.org.au>

On Mon, Oct 20, 2025 at 02:09:47PM +1100, Stephen Rothwell wrote:
> Hi Serge,
> 
> On Sun, 19 Oct 2025 20:24:40 -0500 "Serge E. Hallyn" <serge@hallyn.com> wrote:
> >
> > Sorry, there's nothing in there right now, so I think I deleted the
> > tag during the last cycle.  Is the right thing to just leave it
> > pointing at something like 6.18 with no changes and let your
> > automation calculate an empty set?
> 
> Yeah, that makes it easier for me (probably just reset it to v6.18-rc2).

Done, and I'm adding a note to my process notes so I don't forget.  Sorry
for the inconvenience.

