Return-Path: <linux-next+bounces-4912-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D58719E8A88
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 05:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95C88280D1C
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 04:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB33190685;
	Mon,  9 Dec 2024 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eMET9XsK"
X-Original-To: linux-next@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAD18A6B2
	for <linux-next@vger.kernel.org>; Mon,  9 Dec 2024 04:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720157; cv=none; b=kqfOTA3omm2cVsO6+YWMMB3T94NQJfp4HDJO6At7Vtp38InfuVxFta/pD0UCC32z90/1MCQOUBnNzAsu89RzAuQAXwWkEx8MLYzpwaMeoiip8gTX1/0lBjV97+6CX9s1BpDOSH7Si1xJ1uoKoNYjSpQMnwIK+ijDP+WnFeh44MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720157; c=relaxed/simple;
	bh=VH/shOGBREMDD5P0xXQUsQrIXgYQZRNWJZCoAQzwPys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s88Nxuc5D32CdjTjpfqAB1XE5FFWOjCAA8BhdbKeGOW3Kqp5nE/EqL6P9YHKgt2Sq4b07n0nIgKStS84Of43gxa0FryOtP7Qa1QQ5SMFlj+vgjnibTC53Yuw7g4FgvrSobkL3jU1U7EWWFzhvyM06CAjavgsRRZ/boMExP2Tlqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eMET9XsK; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 8 Dec 2024 23:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733720152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imtpzrox85iDU+gasEW4W4oEnbh3XKoHR7yt2QiAu/c=;
	b=eMET9XsKv28ERPEHr0JZvl53nQy3MGvOme/M5zMnNnthlgTcDpXjcKBqtejttN4A3OENhj
	/HymfAxaYRA0ql4FUx//L8JtJ5hWfyVRc05qYuvKIXvfFJLlzYJLMhn9gFKICmvLVVKVp3
	k8rwVRQwppEIQx2loQCbttPjc7z0Zh8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the crc tree
Message-ID: <brztkvr45rq35vyuvec5sy5acbwdddr3qftagd3dqcchm4r6go@fbw47zmysch4>
References: <20241209145714.1619f9d2@canb.auug.org.au>
 <20241209043043.GA320952@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209043043.GA320952@sol.localdomain>
X-Migadu-Flow: FLOW_OUT

On Sun, Dec 08, 2024 at 08:30:43PM -0800, Eric Biggers wrote:
> On Mon, Dec 09, 2024 at 02:57:14PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commit is also in the bcachefs tree as a different commit
> > (but the same patch):
> > 
> >   cc354fa7f016 ("bcachefs: Explicitly select CRYPTO from BCACHEFS_FS")
> > 
> > This is commit
> > 
> >   4fa882d383cc ("bcachefs: Explicitly select CRYPTO from BCACHEFS_FS")
> > 
> > in the bcachefs tree.
> > 
> 
> Thanks.  Kent, this is a prerequisite for one of my patches targeting 6.14, so
> I'd like to carry it in my tree if you don't mind.  Thanks,

Of course - dropping it.

