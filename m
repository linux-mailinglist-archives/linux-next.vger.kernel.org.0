Return-Path: <linux-next+bounces-6267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB4A8B44C
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 10:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 784413B3F4C
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 08:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD5018C03F;
	Wed, 16 Apr 2025 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="NUyhGKjw"
X-Original-To: linux-next@vger.kernel.org
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09255227;
	Wed, 16 Apr 2025 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793308; cv=none; b=eRZ4Z6UIIKj/dEAGmQolpHiD3CM1aw15YZXNugADJaCRQQSY/sU0ZJrCEAfLxveccc674bmvr0FycO74MbUqqJeSbun4Xn7DVlJg61U0qZEdRiHDNnSoNzVQE3PedI7puzMIRO56Trxn64Hz4U82xHweTgfq1fO+Wl2UX3awSCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793308; c=relaxed/simple;
	bh=QNSYPQKYd+MZbZQhJUjsWY3BwDZ8kDvI2V91MdzyNpM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gThmhkxOHqE4UVyDYKz1fvyiqAtAsYEvoNoV7OrA5HyIJfcFfG5rrzCuPLG7EF0Y4tPFM8AtzV/2shS5kyoiAmqhGbaxQbynbjbUfTXRnOu936zINIw17OBBfiOc1MSd0fFX8LNIdHvLOwqkuadre+g4yWZrKEVrqhZoQfOxRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=NUyhGKjw; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 7BD0B20841;
	Wed, 16 Apr 2025 10:48:17 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3hSWH1wcYLZ; Wed, 16 Apr 2025 10:48:17 +0200 (CEST)
Received: from cas-essen-01.secunet.de (rl1.secunet.de [10.53.40.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id EC63A2050A;
	Wed, 16 Apr 2025 10:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com EC63A2050A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1744793297;
	bh=URhAYjk+VAY9ncWLxYP9ffdf4G8Zs2w5UCI4LAbJGnM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=NUyhGKjwroFdgH6m9WdYg0Y+SwPAqmiiS2J7wFziBnE+NgH2oIjIEeuUryG5k8Rn2
	 kc6aZIPtjPgXTkwo0FMdD2SVhZ8YsDYTg/1/zFVOBgz0UM3p5D1gUFkKFYQDeD/T9w
	 wCkdLijvJcgjKg3qWEG3WcyU0n9qLG1kLD8cQkSfokFo/AaA55UygXMAu9B7TETErT
	 n5esH7BeKhjEsZ8Oiebet2WU7lFa967byWKGnYd8B+CBWopGwXcLAe7klZEzldKi7f
	 TtCz2KIEYNNJ4nT79l9/RbmuaZ1vyfBBKy5+Qlqp1modAOd7UPJmAkSkKxGeoEUyTH
	 cknDaiqmnYRgg==
Received: from mbx-essen-02.secunet.de (10.53.40.198) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Apr 2025 10:48:16 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-02.secunet.de
 (10.53.40.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 10:48:16 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
	id 0B7103182D28; Wed, 16 Apr 2025 10:48:16 +0200 (CEST)
Date: Wed, 16 Apr 2025 10:48:15 +0200
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ipsec-next tree
Message-ID: <Z/9uzypVKdsHwTCF@gauss3.secunet.de>
References: <20250415115000.08d2d16a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250415115000.08d2d16a@canb.auug.org.au>
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-02.secunet.de (10.53.40.198)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

On Tue, Apr 15, 2025 at 11:50:00AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the ipsec tree as different commits
> (but the same patches):
> 
>   ee2fc517feba ("espintcp: remove encap socket caching to avoid reference leak")
>   4f1d804e288e ("espintcp: fix skb leaks")
> 
> These are commits
> 
>   028363685bd0 ("espintcp: remove encap socket caching to avoid reference leak")
>   63c1f19a3be3 ("espintcp: fix skb leaks")
> 
> in the ipsec tree.

They should have been just in the ipsec tree. I removed them from
ipsec-next. Sorry for this!

