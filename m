Return-Path: <linux-next+bounces-2581-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4BB90C8E9
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 13:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1FA21F22C37
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 11:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4706721187A;
	Tue, 18 Jun 2024 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gydRF0FB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF8211874;
	Tue, 18 Jun 2024 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705028; cv=none; b=EWWQe6CKckRCSQynIPjLjBeKHP8w/Z8rd7YZl+p0Eed4ijrf9twGn8J9+0Bhp5gxDS1qySmtJoAkuepkyml9D7+kpD4k+RDSC8oF4esGNm51/TdoS34JqHyGvx0c2/TPVmjB8iBkUfZ/k8ezmeQa33ekmCUn2R9E5Icd/0B8BsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705028; c=relaxed/simple;
	bh=XNI5UW/H8ojapQI37LizqDlbAY3jZHZ3W5Wzjn8pDKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRDPr+594ujs7ZK9HkKdmaJk7pk+p1HCjYtKhBhwq7z2KsciXqPFpm0aCn3wj7GRi0BP2ZLlRM39tMJweABLKjp4uR8kLmDnCjYE/NiZ5JvtJY5TanN+CoUQmaH7DOoS2W/DQw0GhJ69NSU1tO/WSlKucg9Nvq7WaZ9vp7jaHJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gydRF0FB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF2DC4AF1D;
	Tue, 18 Jun 2024 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718705027;
	bh=XNI5UW/H8ojapQI37LizqDlbAY3jZHZ3W5Wzjn8pDKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gydRF0FBr+jZJhnHPf41XSrcnNkV1LBmkUXwOEZXYB2yEoyAq5QXvMc2g/UCRIOil
	 wVwHw8R7IjI9J04pmZSokBCNiOLvIUxeornVhffX3KO9Fw/KChbeJ8oxvurf/EQwA5
	 rXzYVzkjctnnpqgms9We8lEPQ0U/TBgVpgvsIwzPtNpihXKKqeTs+vwJhaWzomdki6
	 pXi2zfVtgggzufr0a+aWNpPAz3tvPD1kHMcQMkXViGhDBy7U5/kZZ6WEuWKKZB/CVX
	 kE5vT9JYcqmXg6RBxnM7wobJuPb/CJBJe2Eryvj0v3EClh5VKkhqNaqo1XtN1LEBYF
	 4MQHdnPKpRm1w==
Message-ID: <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
Date: Tue, 18 Jun 2024 12:03:44 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mediatek tree
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Julien Panis <jpanis@baylibre.com>, Nicolas Pitre <npitre@baylibre.com>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 18/06/24 09:49, Julien Panis ha scritto:
> On 6/17/24 18:44, Mark Brown wrote:
>> Hi all,
>>
>> After merging the mediatek tree, today's linux-next build (arm64
>> defconfig) failed like this:
>>
>> /tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3: Warning (graph_port): /fragment@4/__overlay__: graph port node name should be 'port'
>> Error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 syntax 
>> error
>> FATAL ERROR: Unable to parse input tree
>> make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431: 
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] Error 1
>>
>> Caused by commit
>>
>>    d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add default thermal zones")
>>
>> I have used the last version of the mediatek tree from 20240613 instead.
> 
> Hello Mark,
> 
> Here is the explanation:
> https://lore.kernel.org/all/71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylibre.com/
> https://lore.kernel.org/all/6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylibre.com/
> 
> For some reason, the 2 first commits of the series were not applied
> with the dts. These commits are needed because they contain some
> definitions used by the dts.
> 
> Julien

I'm not sure how should I proceed here.

Only the mediatek tree is broken, linux-next is ok... should I pick the
commits from next or should I remove the dts commits from the mediatek trees?

First time happening.... :-)

Regards,
Angelo

