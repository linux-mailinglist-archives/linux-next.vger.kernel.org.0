Return-Path: <linux-next+bounces-4337-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB409A56B8
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 22:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04B1B1C20C90
	for <lists+linux-next@lfdr.de>; Sun, 20 Oct 2024 20:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB4D196D98;
	Sun, 20 Oct 2024 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aG6WRvsn"
X-Original-To: linux-next@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851C198A25
	for <linux-next@vger.kernel.org>; Sun, 20 Oct 2024 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729456842; cv=none; b=PU2QfF2ZyY3xPNMBlozAImlmRNtz5dbAsHR9uQ8zzF9j7c0vVHmtO4LMKhD9DQCP8HIVjcvtzXcvNb5OP66PoWVu+MQTm8BcQJAeCnUF3U4u3rPLJM7Ed36ybYUCsMYNa5ed8dnSLJLwQ+ro/OPSDy3lIjm0HT5dXOvAh7uBBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729456842; c=relaxed/simple;
	bh=UD+HiEx82siOq5FpR9/Iq/Tmpkla9NdLZ3OaTiJzVOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0F7I1FYbmD8ASIBkYFR552FjS8K3GrdmNDlyiPB7E9Okn4Vk6oqzRE7XAulXBr/eP3ATATHBEurJqil3iACUaUTAXEax5fS+4emjeJ8XszoyzFGGSCGpKY8Z25NAEjFFrDgBxC8ZIMMW2/KccJ4yf/FwZAovP70NU5QflBfSJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aG6WRvsn; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 20 Oct 2024 16:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729456837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I6/RjdngvvzPRnLVE0ufrS0HRnnOyBIjVbyjsAyWOPQ=;
	b=aG6WRvsnPbk8/R/+jmmEgQkGvgoEnH4rN2RGhC9T/nQTELP4Oo3TI/XQSjfAm8KhCRKwQo
	G0quZcUGuCE27R61ZDhQLwDGdYcsfSHoD4fQl6YEpxF3SfUXSCHeHyykTGxpiR/2WiaupL
	CF+m95weStQNYOd5GMikzNW9A8DgyC4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error trying to fetch the bcachefs tree
Message-ID: <pmdkqd63ywjl4ktdjg24v6pjslepes7fmmu4llpqzeueeeos2b@vldhjmmcqfil>
References: <20241021073823.1a89e1fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021073823.1a89e1fa@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Mon, Oct 21, 2024 at 07:38:23AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Fetching the bcachefs tree produces this error:
> 
> fatal: unable to connect to evilpiepirate.org:
> evilpiepirate.org[0: 5.161.236.196]: errno=No route to host
> 
> This also applies to the header_cleanup tree.

It should be back up in a day or so, for now I have a github mirror:
https://github.com/koverstreet/bcachefs/ for-next

