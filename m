Return-Path: <linux-next+bounces-8218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5610AB483FA
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 124E217CED3
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 06:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C933019ADBA;
	Mon,  8 Sep 2025 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KQ1cuv7b"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F6C747F;
	Mon,  8 Sep 2025 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757312151; cv=none; b=KhrkPO4EAYua1diQR8YXOKKFUUJ7wT77oHTwAwAFe8wTIxJXDarg2SxISHCVOnprek/NcG5vuzhE7TEPhnMuea8FNZXEOzHGksENjhks1l2SfYTJd5Uog7ySwhB0Sj0UsA0HNeBHLkKM13fdhp04ePnF+cErdD2TxX/dUnrRp7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757312151; c=relaxed/simple;
	bh=q+pF2r98PVaWz0Rpo9i7qSOxK61zc6QWVSA1CNvPHvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDA7XGBbP3ouoZAZ96D5hFIdbqS9+szvBQtWSVOC4p8/6U1Xfp+X40x8ohDdKhGTqGo6w2+B8+dxEOvWyVLvQzEcW0dK7uVDbcHcfIPAh1PIuz+pTZkaFwejxH9oXt+q1dKr7tjFkNtgPujqxrVlyKTyiAZ7bqQ0stM5xV9GwCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KQ1cuv7b; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tsIHptCbn522EI9uJ2D4+/aKPFwiQLgO/Szt5FfREIM=; b=KQ1cuv7by+26BeOIdIijZ3dlay
	RnCDCXR1qQpmDFnNMlrjPcbemhUzuS4mjjEUfhM7Fo+fzRblWAUwk74vD24zh1VI0/QABrDok5M1E
	eXgyJ6G6QxiPqjc8EDFddxCXqfua76z6Qoteb+bMNsr28RI2mgJM2HHWlV1Kn+9YT8aYHaoduuW7p
	RczxpGOS2CVa7e8ZvRasFnohRViWiDxWxLV+ygcs1nt01cAcNtNLctBo7WSKMHBtTGq+dsbAnVsiU
	IzPYCnEfACGapIUXs8N7hG63xcMwaOMeXwallqxIbSpjbvFQjIhCryYYLBid7kp+DrUjyEXBDprNU
	dIAk/7lQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvVAK-0000000Ev4z-3cM7;
	Mon, 08 Sep 2025 06:15:48 +0000
Message-ID: <ddf0bd24-4e03-4346-84b7-c5caad8d885f@infradead.org>
Date: Sun, 7 Sep 2025 23:15:48 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the extcon tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250908160311.2184ebbb@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250908160311.2184ebbb@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/7/25 11:03 PM, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   9f65e74d9185 ("extcon: max14526: avoid defined but not used warning")
> 
> Fixes tag
> 
>   Fixes: 45af3ddd1cd ("extcon: Add basic support for Maxim MAX14526 MUIC")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 145af3ddd1cd ("extcon: Add basic support for Maxim MAX14526 MUIC")


Is that a real commit ID? I don't find it.

My email said this:

Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")

(see https://lore.kernel.org/lkml/20250513210252.1139749-1-rdunlap@infradead.org/)

Maybe some commit IDs are not stable?


-- 
~Randy


