Return-Path: <linux-next+bounces-4016-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FA98A66C
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 15:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DF45284734
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 13:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA4519006A;
	Mon, 30 Sep 2024 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="M1Sz+kXp"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FCE195805;
	Mon, 30 Sep 2024 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727704544; cv=none; b=O/XkhNp9m1qUGPxOu9+x23ZcKyhdFvLmSEWMvmItffdQZlrXUVD3OfajvJm07puiJH5YQtUs7lSxK1NaaOhQWL5z3oLFnqF+zQbWy+bSaH8aLG5KEwrBgeUVoVz6ZvNoMO9GPBUCKsjtDqUJac+hYLsjvTHHKVF5KBAwIUGGkys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727704544; c=relaxed/simple;
	bh=YhP6iNTuVRGYLzi98uhfhDen0PNqjC9D1VfBB7c4GcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIwpREQzaOIabXghrFS5AE3gHZP/TD+WOS0aSLtdEtwdgIJCXqzeA7CaG5nWnZMLU9M5QmUw5lCS/CVsRRzaMQdPHFwDTEiucZEu6/Q1ebCClKZDxhFsOVa1Ey5LUMU5zJCg7ZhyQDQ/fi16N9wPjYyCxDI82tmFCYc5sAg1LeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=M1Sz+kXp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g5zo04ZhO85Ay0/uGL42irX7IzsCwCHZIkee1jQLa4E=; b=M1Sz+kXpzCohGd4f0A0G0zGB0X
	s+npQR3tZLM1gj1bfFxpHSW/D1wLrdR+OtkykD92G7/8+k/WbnSgCJyljY27szVkZZ2lt8nPAoxcd
	v1o9ezA2Inf6NrKihONjXwa/wRAalD7PyHNef7wGCw0pBdmXuRdGUs4ErjdvR4rXyKJyIqjlhmM73
	EZXVXoJhDFBOFFfOZ50Kqi2w36PoGDCI1VguBJm4N7750pkXLoVZI1j1WfAewcmo6KgyjKCRP576c
	CGBBK7r36hchC9tOayAkLBywhC8OQOIbVUW9OIfwdSA4AKssyNAdvCFAvlmqnhMlsB1tg8zazOlcB
	dp7L6B6Q==;
Received: from i5e861925.versanet.de ([94.134.25.37] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1svGsA-0005pX-LE; Mon, 30 Sep 2024 15:55:34 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sam Edwards <cfsworks@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rockchip tree
Date: Mon, 30 Sep 2024 15:55:33 +0200
Message-ID: <2979372.e9J7NaK4W3@diego>
In-Reply-To: <20240930233634.3af1daa9@canb.auug.org.au>
References: <20240930233634.3af1daa9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 30. September 2024, 15:36:34 CEST schrieb Stephen Rothwell:
> Hi all,
> 
> In commits
> 
>   ab3cf1ab3fdb ("arm64: dts: rockchip: Designate Turing RK1's system power controller")
>   ed1b30c33bb9 ("arm64: dts: rockchip: Fix Turing RK1 PCIe3 hang")
> 
> Fixes tag
> 
>   Fixes: 2806a69f3f ("arm64: dts: rockchip: Add Turing RK1 SoM support")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
> 
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

I've fixed up the commits with more appropriate commit hashes



