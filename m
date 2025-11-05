Return-Path: <linux-next+bounces-8840-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3AC34F1B
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 10:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 122DF422C54
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 09:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B832FB0BC;
	Wed,  5 Nov 2025 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qa5GOtGl"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5352DE1FE;
	Wed,  5 Nov 2025 09:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336075; cv=none; b=np4UHmV8/MwZUYQs7Oyxo3K/4BtSdoJl1h8s0PGCSI8kyIVB9bEX3vao0YQJq65oCzWkuQ0L88/bXrGcLzdUzhW/7Wr4WRENX4ATRN5zg3nZGl/7iKwKLKLYNU4FYUIqHl8at+FsIzoopCQKdXCI/VEC8nLzGIgAU5gCtog9Gjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336075; c=relaxed/simple;
	bh=ySGhnOUMYFqMwlZyV5LmPNhzt0pa0RzBTyYNhheS5JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NC2UBHyEYrqLgH1fskoTi0w5jCbY9UpH99HUC6otxtkO7Sf9fFK2F7n706KbHDdoIBVlRrikHSacoXwNjT7IiOntikW0mdQagTXD32oKRnVwgMnjhThbSIeU9QJ0AmHTlr3R+222Iq9MBzTYmNl2xb5d9/n9Ri44XLMA3mVuAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qa5GOtGl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24309C4CEFB;
	Wed,  5 Nov 2025 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762336075;
	bh=ySGhnOUMYFqMwlZyV5LmPNhzt0pa0RzBTyYNhheS5JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qa5GOtGlexoSohDB2aktLNqqIbUBxG/ArmlFM/ysoV3bD3qS6SAB0hLmMHDboD8ze
	 0bU6eCZTPruNxM/oyc7CNG1JGe/8yRnkx3cOFGBOhPNiywMHl/XYuAimTYETTN/d7+
	 mj+mR+WPmQc1poBBzpcbHt2cAddQi/sMMnjY6hKNfL8YRzutTGju+IyWSCnQeVsCUc
	 h2n32MH7CxWioYoNZ17zdxohNUFcRluaYfejlz/aJ62/mjgu2hiKhdcBme8EDJl5g2
	 Bxvhk+hu3rOJDCzPXbtsVjGHIO/dRlaxDmUm4GCMKB9K2JRR1HCmDBZu5LkpocOYKg
	 ei4BA83foEQ/w==
Date: Wed, 5 Nov 2025 09:47:50 +0000
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Corey Minyard <corey@minyard.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the mfd-fixes tree
Message-ID: <20251105094750.GF8064@google.com>
References: <20251027080835.04e0a4c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027080835.04e0a4c2@canb.auug.org.au>

On Mon, 27 Oct 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   91a3e1f5453a ("mfd: ls2kbmc: Check for devm_mfd_add_devices() failure")
>   fdff3cadeea9 ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")
> 
> These are commits
> 
>   4af66c2bcab0 ("mfd: ls2kbmc: check for devm_mfd_add_devices() failure")
>   0892507f4a0b ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")
> 
> in Linus' tree.

This is because Corey applied patches that they shouldn't have done,
despite being expressively requested not to!

https://lore.kernel.org/all/20251009095611.GC8757@google.com/

-- 
Lee Jones [李琼斯]

