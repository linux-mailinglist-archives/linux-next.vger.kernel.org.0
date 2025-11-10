Return-Path: <linux-next+bounces-8911-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478AC4634E
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 12:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A1DBE34169D
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 11:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE2E306B11;
	Mon, 10 Nov 2025 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERdsz9v5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B02E173B;
	Mon, 10 Nov 2025 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773733; cv=none; b=EYwCbIpJhaqtaTiyL0CODZchL69ly7ooM695kDpaBH8NWCJt9YxNodzpTvga6HBMkZbJeWq8U/U5C7Mw1RpJKJrmWEhyo3f4LTKUYTqkWJYvYaO67G0DaCTk1j4GX+BcB6etibDhhIN+e9IAzEaR3bUP5vm7l23W6gT3tqAt8kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773733; c=relaxed/simple;
	bh=S/6Rr5vew5ydQvjFw7Rv9F5E1IYomQauBG1EVTvft9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCmLHC81Hb9x0NqvobrfqQsdPjmFooCeoANnHYA8wW3Oznp+6KdTz0AVPR6b9uNDpP1WvS2bIcL4Iy4paNhHcZ5wgfI16phDE8Jzj/Obm6mKhw15sbfi/ej5gnR6JrluFPXIJTHWemY+WbXw0+cxnOFTNZtH9+zrLL+dGze1vaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERdsz9v5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7800CC113D0;
	Mon, 10 Nov 2025 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762773730;
	bh=S/6Rr5vew5ydQvjFw7Rv9F5E1IYomQauBG1EVTvft9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERdsz9v5AaHjd0vq+7PXumuP2I04xsTwwjLJX/tXHq6Ttima7t0QpsY9chu2IGQiW
	 peFMpzB/Zw8Or+Gyosw7jubrETZZMVD2UJnKwbKZBQ0EXrXKr2apcxq3cR30b5gt/n
	 k4VAJPKBtjwIkC24+4U1dTzbSH+VCzLpSrHZj4NJ1u+75nzzIsWVYVFhwNwXMiFCuf
	 KEiPiT7we6o1Kc3qdQlbipsUv1HouHkkxOPV9ZxDMgkGoY0xWVISCe+Gx3oQHBEkfA
	 rIGVTQ5cUtp+UMtkG71m7xisHoXrL4itx9A948jAF3LRF4Ilh14SdijXNoHCUBoBsn
	 1LTRjosrgIlNA==
Date: Mon, 10 Nov 2025 11:22:05 +0000
From: Will Deacon <will@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-perf-users@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>, regressions@lists.linux.dev,
	gus@collabora.com, linux-next@vger.kernel.org
Subject: Re: [REGRESSION] =?utf-8?Q?next=2Fmaster?=
 =?utf-8?Q?=3A_=28build=29_implicit_declaration_of_function_=E2=80=98topol?=
 =?utf-8?B?b2d5X2NvcmVfaGFzX3NtdOKAmTs=?= did you ...
Message-ID: <aRHK3RPjNq8nbltp@willie-the-truck>
References: <176225394342.3644.6412596085150396269@efdf33580483>
 <c13574f7-b13c-42e0-9b35-a2acb594af33@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c13574f7-b13c-42e0-9b35-a2acb594af33@infradead.org>

On Fri, Nov 07, 2025 at 07:11:49PM -0800, Randy Dunlap wrote:
> [verified still present in linux-next 20251107]
> [adding CCs]

Should be fixed by 7ab06ea41af5 ("arch_topology: Provide a stub
topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY") in the Arm
perf tree (which is merged into -next).

Will

