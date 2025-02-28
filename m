Return-Path: <linux-next+bounces-5618-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDFBA4A53F
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 22:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37DDE189BE1A
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 21:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F101DCB0E;
	Fri, 28 Feb 2025 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPS43UTM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C3F1DC04A;
	Fri, 28 Feb 2025 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779145; cv=none; b=g3vDnPuA2MovE3wv7McsYcJTYX0P9enByqMb872A/6fbMCEl/kPJxoWDf692HuN5hKEi/X5um4SWbtLUsMxi54XNx345XJxpqmdZe8w6iATMdhIdG6MrRPMxQ399YYIjZdB/gAJt9uvpg8U2vSGF2LMZrAB51RRGTc3gQqTqP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779145; c=relaxed/simple;
	bh=GEzQ/suR0TnjBNgf5EY9r9UcrgYA5HbobWyfMYoXfOs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcXtGw16RpzvpO9YY1zXc88ZbYdYiupckNuVyN4rjI6l/r7rtiLQAkhMAJ6vTlVmMH/sAv+0wkulx6YqkySFspHZv2jrT2kX+8rqulb0s/mARg8t6hxiD8up5a51biLVZh7PVe+z2L4UOEOm/73DJEItixkOT/BchhCXtQP/xTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPS43UTM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB307C4CED6;
	Fri, 28 Feb 2025 21:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740779145;
	bh=GEzQ/suR0TnjBNgf5EY9r9UcrgYA5HbobWyfMYoXfOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PPS43UTMtbDCp9WvNdSECKOU28szFXzSux0Cn+7f9VP+TWYi1HGOMZ2HSXMiKxiNW
	 3rxYfPy9HgdfnvTtX+n+DHFgh4FlucPshL5dBVs2mwIHATDenpDaJKCOeK/fs/Z57o
	 1V4NEDvtXXnM4kod8KD+g5S9V+TKFuvPRzxTHCLvTpHp9I1uHKLkN7Wp3O3oK7WaVR
	 TTO1hus/Azd1DHVa0JPO8fSvzClz9moVolahqB53fPVI1U+Etuk0f08wVyUAOoJdn8
	 yy7b4am/56WRa7jMlCiXc6G32/YO5cf6za5Lc9U7t71dhyMxEBxgpjM1bfdYBpOVtH
	 eT2A5gQUiB7aQ==
Date: Fri, 28 Feb 2025 13:45:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, David Miller <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, Alexander
 Lobakin <aleksander.lobakin@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250228134544.2fceaf83@kernel.org>
In-Reply-To: <20250228154312.06484c0d@canb.auug.org.au>
References: <20250228154312.06484c0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Feb 2025 15:43:12 +1100 Stephen Rothwell wrote:
> from the net-next tree and commit:
> 
>   fe0b776543e9 ("netdev: Switch to use hrtimer_setup()")
> 
> from the tip tree.

Unclear to me why this patch couldn't have been posted to netdev.

