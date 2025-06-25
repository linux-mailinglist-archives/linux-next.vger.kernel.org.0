Return-Path: <linux-next+bounces-7247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B4AE7BA8
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 11:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C708F3A311B
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51EF29AB03;
	Wed, 25 Jun 2025 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVHE+tab"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A36129827B;
	Wed, 25 Jun 2025 09:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842624; cv=none; b=bUmhoSceIOpFT7oHT2sZ8+L0xunRYEwAzUliv9vyLJfmjb7R1JwpJQ9WkkpmfrvRhEiRH7+Yez5GgbFe+WLpUe64Kppml4iU7qQ4xnGvCkGK7EG/B/IYub4VN0WOyiHVo0g/mQAesjJvDIgVozMuU6TJA1D2Zr20P5g2gUhp0uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842624; c=relaxed/simple;
	bh=TwT/5Vz8Ma7wzxLrrCHG2vsifHompVEwcDYXvMtMbqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kClSYxb9P6AeNvRfzBTRYvyCRNlir6bVz/ZKEkfcI6c3nYt8FTZE4sEJZzmpATRijDWENjhxFHy7BW8sEEikiLB564tgB5j4wa1AKs/uHWnYpJYaTBTSLczRcsytN1EGdLM3dYavkEU6GvtSZL4WgQsNvNYgGzw66yPyAgJrz7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVHE+tab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFA3C4CEEA;
	Wed, 25 Jun 2025 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750842624;
	bh=TwT/5Vz8Ma7wzxLrrCHG2vsifHompVEwcDYXvMtMbqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVHE+tabPYjCqC9CRXPdH59I/hn7aoJ965K6683K1f8OVMEIzCkyUf/ReIBMKb/08
	 +1vhb9G0uUwR1zNnPUW+/RX+w4odXjrA6Gnil38rKsk5/2YVs7Te1aiVt0AJw+djzl
	 2QZ3Z8hVJ1eFpEEcfZDef8TOgLy2LsHNcpGnrEFkdOOo3Vc2iNZhDCxhPUJCAZyA+9
	 aBMV0Tvu7yTt584Bh9Kutq69mStSppWCW6zLVeHEFYUn/qno2T0aYoATsnuWdzhPE1
	 dUPM06KPdTK0sdNMVe2lSEBsi2QF+VSWnWuFdLwTK2Cj9ZmHkDQMUtxA3tN+yn1sPY
	 yjZNZM3S3wa/w==
Date: Wed, 25 Jun 2025 10:10:20 +0100
From: Lee Jones <lee@kernel.org>
To: Abinash <abinashlalotra@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Abinash Singh <abinashsinghlalotra@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mfd tree with the mfd-fixes tree
Message-ID: <20250625091020.GR795775@google.com>
References: <20250620160345.48fd2d50@canb.auug.org.au>
 <CAJZ91LDiQM2kSpmDM6TvnY5m8MEqK03fXJBWa=itxx5mdX1ifw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ91LDiQM2kSpmDM6TvnY5m8MEqK03fXJBWa=itxx5mdX1ifw@mail.gmail.com>

On Fri, 20 Jun 2025, Abinash wrote:

> Hi Stephen, Lee,
> 
> Thanks for the heads-up. I'm the author of the patch:
> 
>   "mfd: twl4030-irq: Remove redundant 'node' variable"
> 
> It looks like Arnd’s patch in `for-mfd-fixes` already removes the same
> variable and improves compatibility by switching to `dev_fwnode()`.
> 
> Given the overlap, my patch can be safely dropped from `for-mfd-next`
> during rebase if it's now redundant.

Done.

-- 
Lee Jones [李琼斯]

