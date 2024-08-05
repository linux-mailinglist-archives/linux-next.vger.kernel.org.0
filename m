Return-Path: <linux-next+bounces-3228-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 424659473BE
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 05:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 522501C20BB5
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 03:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7679B2D058;
	Mon,  5 Aug 2024 03:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jOC5yzfX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EBA182B9;
	Mon,  5 Aug 2024 03:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722827602; cv=none; b=QSuJgCZQsrZN/JP6FYAuB5PuP6ijWqQQuNpsJchyM+ggUaMu6lQGcDdJ5/GIrkZEE4OELOpkGwrfPGbQhii+Z2SX2aQM+9cB7alG4aG4yPXnNiY4DeacL9PN617B3WnjNlLPGy2iWBiZJISdvIHsomU/eZNMWNZt8SZn4j7bDww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722827602; c=relaxed/simple;
	bh=WCnuq75dnX3xKEIjHjlm+WqXZOwJq4KaW75D9RTZTKg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hTq0XYM4OdV7/VWbVXnoYMeFcoVEIPsRn1cL0XooSprrSs8Z8sTIwjoiFqs4WGfhByi9Pr9U/joLg+sauv32dyMK2baq2svEnOS/U8qg3+gyBmn/m817aDYIwjtYN8bMHM1PFON9OuSc0mXr2d2wFDWOZlh41l2QME/+k0aMkiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jOC5yzfX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB2BC32782;
	Mon,  5 Aug 2024 03:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1722827602;
	bh=WCnuq75dnX3xKEIjHjlm+WqXZOwJq4KaW75D9RTZTKg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jOC5yzfXQC+ajM4w5w9K9+Zr6tm15ugGENomT2QHTJ1JUVEbxvAcQWnz15qwbFz1i
	 b8cZy2EYNMH1qvzIchj3tpvL2HC4mimuBtJ5HoawZ7bSyqCCGB2V6JLLE6LRQoxTUx
	 mXUzXYFGYgifmGbmgAwWlY9Y9z3K6jUqST7DdVxo=
Date: Sun, 4 Aug 2024 20:13:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the pm tree
Message-Id: <20240804201321.090ccd0c7b738e7d388cc68a@linux-foundation.org>
In-Reply-To: <20240805115822.037798df@canb.auug.org.au>
References: <20240805115822.037798df@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Aug 2024 11:58:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> The following commit is also in the mm tree as a different commit (but
> the same patch):
> 
>   0f127178892e ("cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros")
> 
> This is commit
> 
>   93bc6ba3e8c7 ("cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros")
> 
> from the mm-nonmm-unstable branch of the mm tree.

Thanks, I dropped the mm.git copy.

