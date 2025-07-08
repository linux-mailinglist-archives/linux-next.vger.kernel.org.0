Return-Path: <linux-next+bounces-7405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CAFAFC6C3
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 11:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F08A07AA394
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 09:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0A22C08A9;
	Tue,  8 Jul 2025 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OltLh+xc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sbAVD4y0"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453AA1E376E;
	Tue,  8 Jul 2025 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965928; cv=none; b=rtle6VfqdZHv44NVcDJMzLbhQ7VOCaomY6PwGXxUsnA9ZS2oNUT7g7Dbp6NFqePl9+qN6qJUjUZGUIl47WPks6zoNkTl7iRNoQHcCToz1zEUbmNXIO3me28HqPslWVH3h8/saocKkfTccJjuvALCORNjZWZeQEd6hURbF2uBNpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965928; c=relaxed/simple;
	bh=mOrUgzCe43+zA2nQ+4uKKMmlZ7n6m8DSwUelXRzfUb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb33D4ITiNlkKaQ8qO7Qta0UnccGfWHRsYhJHjAhXhTZfbVI4POLao2qOclVQid3x2KKKRqSFA6marUxj8m4S7g3lKljOzR7LrruEruRtm5eDo04c7vHN24PuwUxaa5XwfAv9k8aIWJk4DH3/TUTMEWCGVjf7rKO5hlQFz2skTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OltLh+xc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sbAVD4y0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 8 Jul 2025 11:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751965924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1VexG1NlE1fmnPv3b5oRHrElSeCoj1GvfGLcPqaM+K8=;
	b=OltLh+xcxdJkvnu6rUG8vmOytXXZMAIxbg1dzly00ywod2v88kNFG/lyuO9LTUvCxY2NPc
	sR59qKUEIV0RbOE5PrPWn8cXUz44ugicbPrjZvizbB1XvMGbcPY3VjJHKresag80Rzc3dz
	4g6n3x49YG4FXIjioegRnA0NsDjh7vR7Xo3caKsOYiOSTJaed5DlIonAsljvVy/Kt8QYOq
	6eccWWDWBu/DyaD1xo+0m5HpVWt7XHhsJxivITOkTUX1t5TwILvVk1+EIj+GzvUyKUhuoa
	1lK0OEe16L/qYSU7MsGw46eASibiBAOgTnODSaTwBcJf39OXV4IL2526ThzFkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751965924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1VexG1NlE1fmnPv3b5oRHrElSeCoj1GvfGLcPqaM+K8=;
	b=sbAVD4y0hRLyzBZ+vcnV4mkIkAjZPMvZJdVhMyqdaS9zGbkIQl+i5wS3sVqEDHyoRVPUVq
	KzhvcXd1zXuu39Ag==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Johannes Berg <johannes.berg@intel.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
	Richard Weinberger <richard@nod.at>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Marie Zhussupova <marievic@google.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the uml tree
Message-ID: <20250708110852-85b541be-7e1d-4cbc-a455-9cbef4c15b3d@linutronix.de>
References: <20250708181539.0e778563@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708181539.0e778563@canb.auug.org.au>

Hi Stephen,

On Tue, Jul 08, 2025 at 06:15:39PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the kunit-next tree got a conflict in:
> 
>   lib/kunit/Kconfig
> 
> between commit:
> 
>   013c51446570 ("kunit: Enable PCI on UML without triggering WARN()")
> 
> from the uml tree and commit:
> 
>   5ac244b9cc8f ("kunit: Make default kunit_test timeout configurable via both a module parameter and a Kconfig option")
> 
> from the kunit-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks good to me, thanks.

Johannes:
I expected my patch to get picked up through the KUnit tree.
If you drop it, a Reviewed-by on the patch would be very welcome, though.


Thomas

