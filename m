Return-Path: <linux-next+bounces-7720-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBAB11DAC
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 13:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7191716C362
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 11:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8940929E0F8;
	Fri, 25 Jul 2025 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdCIUE60"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1582367CD;
	Fri, 25 Jul 2025 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753443358; cv=none; b=QLRCSVcV2faNcOh4eXAGMQT1iBc081wxSQHgXjRNknK/mQRZNGU3l4JXnxfxZek1QxQRRO7FTgScn1B+Yg6otDyW0AwvfrWwfNBl1NNA0+40FNsZO0jMXEpldq/LCVx4tELWw7zayLRR2fFcHOJlifYr9a9P/YdrsPsMEz5PEK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753443358; c=relaxed/simple;
	bh=+PL5Ce46pzzEvE5wbz43WCE0ZQpyW3u8CV4e5f9V7WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dne59Jl/k3U/AKsanUwPxncXAqDg0EBEkZHJqAQYlbY0FSLAo/NHx2y0o5fzILMDIYZ5UwWPkriGSmHsU2S9Vb0cy5EmBux1ZQT+S5OkQEWyYiIN0wXT0rvksLVHuqwhkaCkebLLDvk+/D079DQnACilT9Xh/lbQyHjz09KTcWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdCIUE60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74337C4CEE7;
	Fri, 25 Jul 2025 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753443357;
	bh=+PL5Ce46pzzEvE5wbz43WCE0ZQpyW3u8CV4e5f9V7WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdCIUE603IEMZwVAMQub69g3JUAfY4Axyb5S53r0VqEjed8cHWrz77xcSZtk5Y+yE
	 Z308hsoyDDs1Lox/W68/IMJAEeGVMzJf+9owAcUM60mlWLZh7ht/5LRxJSdkyyaskw
	 KF15GAyt1hIi5XQjJRbP/DEFtY2fiEcSK2Ofj7lshn7rTbWvV6FRb6vFaMOSKMoFW+
	 2B9fQfU24fjHM7sX5Mz+Gd2e8hI9bXD7y0fuBUZ4SfM1b8Ia4M1x+9ppdgrBSkO2ge
	 YaCC4ZGUuOodeLqB2Yddm1H2RKT6A6uJxAWglP9bmO5jFK9/TsXV+zVu6BOnVeF8r+
	 49U84M63+dciQ==
Date: Fri, 25 Jul 2025 12:35:39 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Message-ID: <20250725113539.GB11056@google.com>
References: <20250725113657.039aa5ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250725113657.039aa5ce@canb.auug.org.au>

On Fri, 25 Jul 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")
> 
> This is commit
> 
>   0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")

Odd.  I don't see an applied email for this.

This was applied to MFD and a pull-request was provided for the other subsystems:

https://lore.kernel.org/all/20250724102529.GA11056@google.com/

-- 
Lee Jones [李琼斯]

