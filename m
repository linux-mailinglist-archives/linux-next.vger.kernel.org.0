Return-Path: <linux-next+bounces-9286-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F090C95BC6
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 06:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 389853421E3
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 05:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEEE1EFF9B;
	Mon,  1 Dec 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXO4U63z"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48721DB122;
	Mon,  1 Dec 2025 05:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764568659; cv=none; b=l+5zy/motIMc0hNLLO6rQzJtPoYAvR9PAWCk6woc8iJyJ2szTOkqpKkMmG/7mcZnWR4379/zzJozERQDPvL2HmQV/brT3sHiHXDx1AN7+AD6JTMJfVJVLHFw7U10sBZj34Nbf09Fey1wJc1R9Go0m+F3FsaDbkd9IBlTz3J6AAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764568659; c=relaxed/simple;
	bh=pfg/mmf1mnG5ocEkGQqr7uB+mBIYup2D8ga7YwXFpm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlxMkuvirvGkPSet4RJsdMHPPHljq5VdV5cfssCRyaeIFi1O6Fv1nT0j+qdiBZOw2zwxzTC3KSA0gCf9uaVKq1joUrDj/bx4G/Wq2Hc9j+CsJS+3/sjiZtGuHWzwD2i1iCEVsWVszmR8TW+r6pUd4mgxMHyNVz8sjcLTXKz36O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXO4U63z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34E5C4CEF1;
	Mon,  1 Dec 2025 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764568659;
	bh=pfg/mmf1mnG5ocEkGQqr7uB+mBIYup2D8ga7YwXFpm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXO4U63z3roMzDGR696SZODz84edaXlEp+eNqJ3fsv0qoW8WqXJmMk7JzQ6pSX3E7
	 OcVceDnzYmZMypzrVrx/mUuR5q0F+Ke5lkrxHbz8q9U6ImwCp8ZhGVkxJuDzMpdVMu
	 UWc+ezgacvt78wMQQKQVqBSVhUft4Px/qn8eZ5BsE5FcvlLP9W+a02d0+SlhuMcL09
	 hf1NXYgheL+baaCsbxXxr/irjIcKmzlGngXxJyfeHD++kVP2q+F+k5j899inyT/D3M
	 S5gBypNJVF0vsdOyXLg4vIEG/FDOVnDlAogDAuaAWu8luNuMJSP4c36+XCxUx0uLvb
	 fZpbulaDYYfnA==
Date: Mon, 1 Dec 2025 06:57:35 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <aS0uTss94Mxn7waZ@gmail.com>
References: <20251201062717.09db0560@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201062717.09db0560@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commit
> 
>   01f38611a451 ("locking/mutex: Redo __mutex_init()")
> 
> is missing a Signed-off-by from its committer.

This should be fixed in:

    51d7a054521d ("locking/mutex: Redo __mutex_init() to reduce generated code size")

Thanks,

	Ingo

