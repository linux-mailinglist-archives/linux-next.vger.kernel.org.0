Return-Path: <linux-next+bounces-6889-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3055ABF3E2
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 14:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053773AEFAD
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 12:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF71226B097;
	Wed, 21 May 2025 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICWlmFKu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975102673B7;
	Wed, 21 May 2025 12:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747829431; cv=none; b=pl+oafGE1pDlPbTUajpta2Z75Y4jRBd7eGqBgF6jyXPpGKUd7v86JnFo7ArVpRUl0ESfDPfG8DbYOGovXHlLbF3FeQm3GFozIC6pN0mm3rTz1LC/7DvMrxQC50bgzQWwX7TuMv/L1mz++GXTFp6EJx612JVE1/lV3QcwBpb8E4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747829431; c=relaxed/simple;
	bh=Ul4S0upKxC6Psuxit4DXY3Lq9BItrraC6q/iSk8CsNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWyPmnwQQy0w9K8IhPOdu1cw7LLgqYRkLw6UNw8VDOso4u0e8aI+ksQJDa2uvTb0kFT79VHJIlihGf95bBdDl3IJ0EK2g1Bd2mVt6E57Vv6s1tiXCOAhjbPoGoPfD7IBa1xCkZQHAzitBTKarCsY3CyFqbF1BNh0PiM/E7o5OTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICWlmFKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D481BC4CEF2;
	Wed, 21 May 2025 12:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747829431;
	bh=Ul4S0upKxC6Psuxit4DXY3Lq9BItrraC6q/iSk8CsNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICWlmFKueb494KjAtMVKX72qaHmsMN3iJZeJmxG981pMNYWxJL//DLOn6m6Dejage
	 IPv+v7J0h++Xz9CjuGKVNcXhSPkRQgNa0Z8DLjk+E116Q5pxjDnGwjF6czbWP1xtBW
	 qvNZ+nomRSmA5eZVOwbxsr0gK8xoX9IYRgUlKNZHntl0MWv8WozRnURKpiHzRgzQx1
	 IiqL1GB+InXNlIOBfrUlnstrAo8/vDoFVw7CUCPvqJG+NfzD7+6kTdD5SHM+K5FF9p
	 L1Y4i3w6DQZtzi/iz+hA7gwcSSJtVUa3YrLoLElBsudkGM7KnoGEXVgBuOaDSrBs7d
	 hW1kzx5ezFMYA==
Date: Wed, 21 May 2025 21:10:29 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20250521121029.GA143406@rocinante>
References: <20250521202640.53a4fc3d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521202640.53a4fc3d@canb.auug.org.au>

Hello,

> After merging the pci tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/PCI/rcar-pcie-firmware.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commit
> 
>   2bdf6ffe9f66 ("PCI: rcar-gen4: Document how to obtain platform firmware")

Sorry about that!  This should be fixed on the branch already, per:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/rcar-gen4&id=003d15b30f3690b14315822439edc2c3f823c6cd

Hopefully, running the "make htmldocs" should not report warnings for this
new file any longer.

I will coordinate with Bjorn about pushing next, as he is working on
something that he might want to include there.

Thank you!

	Krzysztof

