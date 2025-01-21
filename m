Return-Path: <linux-next+bounces-5288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 561ADA1886D
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 00:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494CE3A5C2E
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 23:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF7C1BEF75;
	Tue, 21 Jan 2025 23:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KV5ZM9iP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D440B26ACB;
	Tue, 21 Jan 2025 23:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737502656; cv=none; b=faTmtjfJCD8V9xHKYhfE85G2oMiTOoDqLo52KiDfjJkKGPOVUHihOF7ObkgRMVIb18WUG+61Kx/boyVH/5IzwoSDLIKW8epdG1A9Z4KttXvUXur4shRy4Bv9jKWLCbz5/zsJofZWGWfbE0H0V40DYAnodbbsHFNQL3zhw/uXC4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737502656; c=relaxed/simple;
	bh=mLvrF5viK2dLv6x+hX3OaSyo1m75YodJNCm/42bRYtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VNjPseKiCPt4Lwn21DOu4U2ka/3GbDQYrE7dCdRHYUrPjc1uCL/6sGPxYZim5WV9F5fDj0hVDx8NVt1lkjfngTEbUoFBFDxLwWtQUUCR5cUpb5vUsUvaRkFgzDPjsvFtD+3h2NdksCBFv2DHovVHAo37/s7C0VNco71my3qSicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KV5ZM9iP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20465C4CEDF;
	Tue, 21 Jan 2025 23:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737502656;
	bh=mLvrF5viK2dLv6x+hX3OaSyo1m75YodJNCm/42bRYtc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KV5ZM9iPQTHNkMvNFp+IY+yuhRP3N1ryCs53rrM+L7+Jx3IHWXrxrG1kc+vwdIX7X
	 1OxTl+a6VlzjnSRfrJMMZrrf9OscsF86Z8qtKol9l3LjIPB0pOV+Mfc3CqXjrpAT8z
	 VpBg5GNOnB5+3V1N8ftCsShXzycrbqfRDXTRIPFuRZdX1YdPED/UJeJOfNCazvsaR5
	 194i/33z27Sg9ASqyJlT0DI28x/O3bnxYthtlMvs9hUqoDzZ7VaLWeceS6tbFVwh/5
	 OsNouL7kMxDSWbp0Okv60tmRQ9FJIBiuE7CUP7vhqVP5qAN6zMOdRQzBxtZyTQj3ej
	 4z/IM1JMqaSxA==
Date: Tue, 21 Jan 2025 17:37:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20250121233734.GA1002960@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122074748.00f0034f@canb.auug.org.au>

On Wed, Jan 22, 2025 at 07:47:48AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   4862e61a0fb7 ("PCI: Don't include 'pm_wakeup.h' directly")
> 
> is missing a Signed-off-by from its committer.

Fixed, thanks!

