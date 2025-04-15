Return-Path: <linux-next+bounces-6248-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F45A89502
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 09:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AFAF189DE0D
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 07:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A30027A12C;
	Tue, 15 Apr 2025 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTv38l+j"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DFE275114;
	Tue, 15 Apr 2025 07:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702064; cv=none; b=qnrQQqoJwWbjjVmHZuRfjncbmONl0h1JJl00H6V84/+7eW81nqquPwZbsY2mJusmqJSMWcb26i4wHG4LsL86r6R1iyDgKpOGqUT8JDNichqVlpUE3GirSA3EspLKi/ADIlGrDtioHsV1Cth8M+Ei7q34EA055ud/YBPprq64XIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702064; c=relaxed/simple;
	bh=zxO1pHWuN/WENpIvBYAdVhYI5oqpU81YC9YqqWwA4As=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GB2Xs50k+co7/pa+zTWanz3q1TFSZ3Ccr8xemMTIB85JYqMFLyAGUhpsyKpP+iNUxhEOSk0rPHONa28WbKbfovsXJx9ZHZYQxmNiqDLm3a+CFsabhPkfU5YyRAkLaGz+To9OhJ9H59zNCPaEJ9UWsaJ5qHZjNq8iX/kk6jSxfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTv38l+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E55C4CEDD;
	Tue, 15 Apr 2025 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744702063;
	bh=zxO1pHWuN/WENpIvBYAdVhYI5oqpU81YC9YqqWwA4As=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sTv38l+jI/c+hC+0bFpOR8Zr0XM8qs9VAjzLoR3F5c2QqnxQWp03Cvoq+3IlNF6md
	 OLQ6hNR7Bxx4siMp4K1EiCyA8LIfbCn3hvTimUtvrwGRBoLhTJUxsO0p5BhbzVek6F
	 PuMGzweTpOfAkvunfLRdSaQykf8KXtBOFUM28K4eGG5HwaXyJ3rx39+0QMZecwVDiN
	 SUFWDr/PttI7UTycEY9IPh4d+PrpAonmHGWPxoMWLKNF56DOB5u0U1J4OyG+XkPNyI
	 oJM1IZdHUYNOCyQtdxIfLnaxk9vakd8/gB8Lrjozm+CNFasu6cOE6+g93ei0umRs17
	 KctI7/t0jHhGA==
Message-ID: <7f27c33d-e473-4179-8c1e-a4b1d58fd051@kernel.org>
Date: Tue, 15 Apr 2025 09:27:40 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mediatek tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250415163029.4714116b@canb.auug.org.au>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <20250415163029.4714116b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/04/25 08:30, Stephen Rothwell ha scritto:
> Hi all,
> 
> After merging the mediatek tree, today's linux-next build (arm64
> defconfig) failed like this:
> 
> arch/arm64/boot/dts/mediatek/mt8188.dtsi:465.15-468.4: ERROR (phandle_references): /sound: Reference to non-existent node or label "accdet"
> 
>    also defined at arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1063.8-1094.3
> ERROR: Input tree has errors, aborting (use -f to force output)
> 
> Caused by commit
> 
>    691712b065d3 ("arm64: dts: mediatek: mt8390-genio-common: Add jack detection with accdet")
> 
> I have reverted that commit for today.
> 

Sorry about that. I have dropped that commit from the tree.

Thanks,
Angelo

