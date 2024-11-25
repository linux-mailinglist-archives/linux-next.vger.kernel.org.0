Return-Path: <linux-next+bounces-4843-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B79D8E14
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 22:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A085D161ECA
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 21:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A3B1B85EC;
	Mon, 25 Nov 2024 21:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bc9bvMI8"
X-Original-To: linux-next@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8919066E
	for <linux-next@vger.kernel.org>; Mon, 25 Nov 2024 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732570498; cv=none; b=JgrYr1L9Bc1gpHDEsl1nsyQsjRaLH6lE+U+MJYQOaSU3YlqV9zLOtNE0Szu2imw6ukWuBHJAAvA0LbSng/tNfwHnBkRFZ/1jY8Kji7C1QJ5JHv1wr1G/Ig6saO4BX5NMHInpngd3ETdQxYQw4lOy9C4cqJ0xLhnBDVW+S/NRIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732570498; c=relaxed/simple;
	bh=iYM21YyG1P8NGSWo7SKKW3RDR8g+QqVm8/En6TTtZ10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcLZ0UR6JSO96X+7gxaCunq9fjq9F1n0HMsubAjWAF6c2loRTekBvFnkV+QVjo1pbfqlaTkcQ308Vhuv/qDxansxi2qkOtduouJtSe+wAQAAuB0JmRH/9ZnMvU4Dxc9+RRPiElY4pfMKheAyrDXv5byCZ92DOlBHH0cKBNMoS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bc9bvMI8; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 25 Nov 2024 16:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732570493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4z9seMwwfN5os5InvC6e4JEVTlNcHQwVQxYELoifTdc=;
	b=bc9bvMI806tpCSObfZnqRj14oJPcO5gEfinlMbPTO4iJIanPbh02o4ucAaYJiQxuwKCTaE
	b9loKXlg1swp7h+aOi0yc3xFJZeXe18QnPeIJmThKjtHzew55YeYnucyGZeziFKmxmveTX
	VxMkaOe3xqdsvTWgZbBH9FhJNNctOAA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <pcwl5uu77olfcogaq77jrnfic5ftsuizu7xtt3mjxhr7ri6n2y@kryl6cprd3br>
References: <20241124183507.5241d705@canb.auug.org.au>
 <L_EkkmQsB6qOPGXuF9tsZFHbNXMQcco_bdzKzow3ZXhjccVKzQJ-Ekd8SU4Ofqt9RNJccI_ZlUrjsNDGvKZuuujdUjxHcaS6qT8WkmHITL0=@proton.me>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <L_EkkmQsB6qOPGXuF9tsZFHbNXMQcco_bdzKzow3ZXhjccVKzQJ-Ekd8SU4Ofqt9RNJccI_ZlUrjsNDGvKZuuujdUjxHcaS6qT8WkmHITL0=@proton.me>
X-Migadu-Flow: FLOW_OUT

On Mon, Nov 25, 2024 at 05:26:03PM +0000, Piotr Zalewski wrote:
> On Sunday, November 24th, 2024 at 8:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Commit
> > 
> > a4f3d037408e ("bcachefs: Fix evacuate_bucket tracepoint")
> > 
> > is missing a Signed-off-by from its author.
> 
> Looking at the commit - Kent has changed my patch significantly. So either
> there was a mistake in assigning myself as an author or he forgot to add
> my signed-off-by line.

Uhh, some of column a, some of column b - I thought I was doing a new
commit and must have brainfarted somewhere.

Co-developed-by?

