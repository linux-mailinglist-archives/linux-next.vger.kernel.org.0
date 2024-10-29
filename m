Return-Path: <linux-next+bounces-4509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1E9B41A6
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 05:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3F911F237B3
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 04:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B006E1DE2C4;
	Tue, 29 Oct 2024 04:53:33 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A0C2FB2
	for <linux-next@vger.kernel.org>; Tue, 29 Oct 2024 04:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730177613; cv=none; b=u2XLYFaRKp9sl957ClPqng15MmGihzwResS6vo3ZiIHfd/urjHJU7WKE/9O7DGQzjmJAwnqgpkQ/HD9QbUd7xAmR5fPUJ6rcyOMDATHLXLlvJoDO01dDEg+BY4BcbbnZTGmwgF+Vv+Q1u2WUAYPsEFAr8ivwl3G2PvQed5WJ6NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730177613; c=relaxed/simple;
	bh=xGj/H86fHC9hw4R1XO7QBjGnIBzxHbuHLjbSP/enpmU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzN1elWPONgq9UgZI5oq9NbfO/JcZ5/OxyO7ssqTWjN4Euf2jr4GucTAOw4s0amSK3iBAivkZIfzKJ9Wkn4QmhHUDsLGM/sCyAS41eRngfOfsUBmIhyEs6Pf4vlhCr3DfRnNVNRuV7tCgxGR3XEojGKtS7fm2QAqFxFAwflNeL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Tue, 29 Oct 2024 12:53:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	Jesse Taube <mr.bossman075@gmail.com>, soc@kernel.org
Subject: Include in next: spacemit/linux
Message-ID: <20241029045326-GYA331364@gentoo>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Please kindly include spacemit/linux tree into the linux-next:

https://github.com/spacemit-com/linux


branch for master: for-next

branch for pending-fixes: fixes

Repo will be use for collecting patches for SpacemiT's SoC
which recently I took over:

https://lore.kernel.org/r/20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org

The patches in the tree will be sent to Arnd Bergmann and soc@kernel.org.

Best regards,

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

