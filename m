Return-Path: <linux-next+bounces-3823-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A2B977BCC
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 11:02:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5455E1C23366
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 09:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207781D5CC1;
	Fri, 13 Sep 2024 09:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="n3cXvuFw"
X-Original-To: linux-next@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4351BD4FF;
	Fri, 13 Sep 2024 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726218134; cv=none; b=acYVpUqaP2/oEor4dwGDjtgva5D0SaEyIUP/RE+sSfSXejOFkyqmfxEvlUqlA4e9me5y5UOu18Sa/H4qZkAChG0Tv8n6WF67lb5qIj1Wp9j2cI2YpMK7tgqtQR/IXLiQ6xVuYpf1G2fdA4DqtCjRXp5N71OqWygIMtHlpNGVqzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726218134; c=relaxed/simple;
	bh=PEZncW4Blrf2cqZAWua38JmvyEiNedQSPlzarhMkC/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTXHAwX5RN9elY4y8m5/148N2VMJK5TLnJKWAbCAzAVGybnl5/47MSy2EDwUzF9y9JNLNKwlxSDjuDr1JXUgVJ5diiSIT7AxyTtTmY39iJBHDXRpRvN+yElQUo1w514YuAnFUWgM+bnQnIilU2zGaAYEFPr1BPajPF6y+6s8VWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=n3cXvuFw; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 4EFDC409F1; Fri, 13 Sep 2024 10:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 4EFDC409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1726216280;
	bh=PEZncW4Blrf2cqZAWua38JmvyEiNedQSPlzarhMkC/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3cXvuFw4dpajtAeu/UTtIcc3EuppN7ScMkPQ1ntYRJM8cXBI3t9Co0UNZz1yS3E5
	 QrLBwMmFoPA5pLxhTHlmqj770kUx7VKN+lEcHrIfPuh23ZhgtmcvS+RRjeOwUZKYTi
	 Se80lP6C4pYoYdgTEs6pK1Z/6qcfCULqgYOxgQQs=
Date: Fri, 13 Sep 2024 10:31:20 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Message-ID: <20240913083120.GA31440@www.linux-watchdog.org>
References: <20240911145543.270c9c9c@canb.auug.org.au>
 <20240913154431.14297f94@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913154431.14297f94@canb.auug.org.au>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Stephen,

> Hi all,
> 
> On Wed, 11 Sep 2024 14:55:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the watchdog tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > ERROR: modpost: missing MODULE_LICENSE() in drivers/watchdog/rzv2h_wdt.o
> > 
> > Caused by commit
> > 
> >   f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")
> > 
> > I have used the watchdog tree from next-20240910 for today.
> 
> I am still seeing this failure.

The fix is in now.

Kind regards,
Wim.


