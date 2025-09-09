Return-Path: <linux-next+bounces-8244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE82CB5049C
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 19:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CFE9541315
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 17:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1652E2851;
	Tue,  9 Sep 2025 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ShgWL90Q"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D4031D37B;
	Tue,  9 Sep 2025 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757439736; cv=pass; b=bPGcxFIw/l6mqqNZ7bYJbeGkJLNfY8mLKR1x0JftUkfCc9hC33xtT8SBtvHOtpNzTZameQSoxNyBVRcs7bCtjAs0quzIPRhFUgCgVIyHK2rj4IRxBkPNuCOiaYpj9f3W9l8MmdzpJ/l5Hcd/8des3QFUm9O/dxnS5RXoFdYR3Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757439736; c=relaxed/simple;
	bh=Gr7EEZ3Sk695/T28pHFdA+Ew3IycOoauui1RSkIH1Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2yKZw4+vFmegns6V97NXKHoVIrh0CQjw4s6S+GTJzT7lfo4P5R0uMZ9gHy5+wYvbslK4LpFKA/6CNFOe5cbV+xGGeeLj07+IlUHb9LRgPf1/8WPnQ8ipuksWdMQaWvyxeOJTHCFSA9sad0PUPF37REp1a26J/JRlVQ5Xv5cVpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=ShgWL90Q; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757439726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L6Qah1XIaN8q5LzcaNct0+9d9zo/F18R/rqJ2TxPjVJQqT599NTi6iuYYxj5ljQW/xNPNtFlNZR8zSPEwDJumZrdkPVdReGzA9lBUmwAPxkrN1v/rx/BAA0tzTvL+YtyukoUz5fFqkfKLYntLG2ZwZUOAd2xu7SHwcXpuIXNBLE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757439726; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SgTGcpiExSOpfQIBIcNZ9Q4szCVANM0Q0ZiPZeWmdLs=; 
	b=dljT/D0FhEGaAkhVVxx0u9EEBGsB1BtTHeluqJ8pgs8MY8WN7odRUupFDeSrKa7S4bHSq7hCqsk2G/26H6mos5L0K3jtU2WB6m5MtgSmAWCQCIk/dgauxlZC04CxhDItAmYDDZWKwI1aH6fRJwEy5Ur06prei9eamtVRN/so8Kw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757439726;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=SgTGcpiExSOpfQIBIcNZ9Q4szCVANM0Q0ZiPZeWmdLs=;
	b=ShgWL90Qbc+vij4TJpWKlIOmBdqwy3aKkjvSPXke6Ra03O4zipnowhvpdkeU6lTb
	a5a1NYHTW4XwLP5nAOMeTpiiBarUTZfnB2GEtGFIUjHxxVL5Zbgx8w+D/JG6KCP5NUZ
	9SqBf7P1b+7fkBM7K6EvcQzL2JrcWgafAmCFuyOw=
Received: by mx.zohomail.com with SMTPS id 1757439724706366.0328417495475;
	Tue, 9 Sep 2025 10:42:04 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chanwoo Choi <chanwoo@kernel.org>, Yury Norov <yury.norov@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the bitmap tree with the devfreq tree
Date: Tue, 09 Sep 2025 19:42:01 +0200
Message-ID: <14358105.O9o76ZdvQC@workhorse>
In-Reply-To: <aMBZ4zTyMZLdQWJx@yury>
References:
 <20250908175135.4215c780@canb.auug.org.au>
 <CAGTfZH3JyMGvjWni1Ge+a1=4nRPL30a84DCamj1AtXRLRMgzeQ@mail.gmail.com>
 <aMBZ4zTyMZLdQWJx@yury>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 9 September 2025 18:46:27 Central European Summer Time Yury Norov wrote:
> > > Dropping the bitmap tree changes of this driver is fine by me. I can
> > > send a rebased patch of that for the next merge window to do the move
> > > from the driver's own macro to the shared macro. The functional
> > > change in the devfreq tree is more important to get in.
> > 
> > I think that you need to ask to drop your patch[1] on bitmap tree.
> > [1] 414054a0bc1f ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro")
> 
> So I did.

Thanks! Chanwoo Choi, could you pick the DFI LPDDR5 change again
on your side?

> 
> Nicolas, please make sure resending the dropped patch
> rebased shortly after merge window closing. I'd like to schedule it
> for -rc2.

Will do. Thank you!

Kind regards,
Nicolas Frattaroli

> 
> Thanks,
> Yury
> 
> > Before fixing this merge conflict, I'll drop the patches related to patch[2].
> > [2] 7d9e29ed3f8e ("PM / devfreq: rockchip-dfi: add support for LPDDR5")
> > 
> > After resolving the merge conflict, I'll apply them again.
> > 
> 





