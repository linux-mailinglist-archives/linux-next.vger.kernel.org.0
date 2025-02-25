Return-Path: <linux-next+bounces-5563-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C604A43883
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 10:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A96C7188C228
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 08:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DB0261372;
	Tue, 25 Feb 2025 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ed5LiIBv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8F1260A29;
	Tue, 25 Feb 2025 08:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473838; cv=none; b=rwqI+GOdz8sFWWwv/yvAZ5ne9fhR33rDEyXMrmujTyPhy8HCJzWDl9qm8C1Nns6kW+07xoVNx5JRR13+fv1ENVLWWH8tLILydSaEMdgsA5guB23Z01xhkjNQclVoMduzJCoZTmGXpaFmJVkB8mROd/tPdAKpuOSxyB8DzbbdjIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473838; c=relaxed/simple;
	bh=JqA3q3h0Ad01xQpRoXs3SnpBGiKZ1kxkBtJr7aIKyn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPYGD5jz2c9UQkiuJJgV7aetSrzfDIzfs046pqufbgwck9YoXeQdQLLbUM/AWPtM1pPp1IpAsUYreLfu6REQ5Y4XqmGyJ0LY4KIRI9ex7c0CYXT49wUyNNVgs3n/oTKZAnKQu93miJwaH/JVaUWh4ZfGq8H0ezOZYssXVIlJps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ed5LiIBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8C7C4CEDD;
	Tue, 25 Feb 2025 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740473837;
	bh=JqA3q3h0Ad01xQpRoXs3SnpBGiKZ1kxkBtJr7aIKyn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ed5LiIBvkhOaNGpxO+3D9oqUaWTAamP0arpTDsQJJAVI9iFO3fozSvqMvsJX9MTF7
	 QWAABKM788SkouxrwRAFZ0l9YPyDqyJL2+lJVEIB4sFn+KEcZAaMtHR89kkDsYYGY8
	 ITVvif5tdrmsFgXrNbaEKRamjeYlvhrMJ0UEUFymg8F4pP7OtiVZ2RIzXq91sMpKW9
	 9wXWQQhZNfMtRwmIrtnO+uo6SufKmFLAo+Wol59tOYS51Hynu/t57KdJXEUXUSx0sB
	 iGYygRoCILKFvemA7WdeiQyCsT4M7ZLXJAkONHtvjNerngtdBc/W3J0k5XiJooaIzR
	 QvKl785thuDiQ==
Message-ID: <99959b20-2736-48f8-924c-ff42bbe657c6@kernel.org>
Date: Tue, 25 Feb 2025 09:57:14 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the mediatek tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250225091705.3171e392@canb.auug.org.au>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <20250225091705.3171e392@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/02/25 23:17, Stephen Rothwell ha scritto:
> Hi all,
> 
> Commit
> 
>    fd042310df40 ("arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver")
> 
> is missing a Signed-off-by from its committer.
> 
> 

Yeah, thanks, fixing immediately.

Cheers,
Angelo

