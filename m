Return-Path: <linux-next+bounces-4670-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 441AC9C06FF
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FD6A1C21C2E
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED961EF08E;
	Thu,  7 Nov 2024 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBZeZxvX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DCB1DBB37;
	Thu,  7 Nov 2024 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730985207; cv=none; b=r3k+fvDgtZiFAs2hjLiHErXDJD6u5/YUGPtX/H0D7cwZF4tNH4ND/Gariw0XizL8iXkoWbeebJ5ilGNiF8oa21SY4g+SJRzXNxeQd1GqZR2QCE98srOWQQAUhn5GI+fq1dHPHhwVkDDwZBTDRvJLSHkCzoVvht8un6ePbbWCa6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730985207; c=relaxed/simple;
	bh=MFt+M4rjh+5OaIZFVxuxfqcABZPm4DVZor5oXblzbw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FAk1ptcbO8/DyAprQja60CAov5mmeuTzY4QDA2E4svx34Trw5xmV66ShGFI5vsQohybNz01Z/2nVNV+vy3m/a1XxLmvErQL5FfU2ZGxF1J/1iyLLI/W+jUXh0Ju1ZvL0d/53IennDo2agV96nt/PZSFZWVNi23HJODPnnzuI+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBZeZxvX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE91C4CECC;
	Thu,  7 Nov 2024 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730985206;
	bh=MFt+M4rjh+5OaIZFVxuxfqcABZPm4DVZor5oXblzbw8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RBZeZxvXMvpSS6MbFdJ9kvcL0IgLJdkRVX6ccUje6ikcakykUAoIOS9p+l2NlIhvB
	 1zEyXYVeIVeMig9Zo21N4/bNUpdXH6qVo3YZT/RYpOtk242k7YOERDwoo2yBoLrJCm
	 CC82wNiRkyFlDzvtL681LIP8w1MsnR2OEUfhwgY/VW3o4mYhARrt/o2EINrjN87Fei
	 ZBkST5sdhTOGKiRlhiYdVP1Fhw4u60666AkMywOCzy6P5RUKENkVgc8/4ziAZURGY4
	 A+kLlFWsFJ7x85SSK/g6NPekT8Iob8v1493Gelj0mtJ6BtGSLYSNaXZM3yw5/yOtMY
	 Fjn7Ji5NOpmAw==
Date: Thu, 7 Nov 2024 07:13:25 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <20241107131325.GA1603844@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107120716.rkymr4sedc5co2nx@thinkpad>

On Thu, Nov 07, 2024 at 12:07:16PM +0000, Manivannan Sadhasivam wrote:
> On Thu, Nov 07, 2024 at 11:02:31PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the pci tree, today's linux-next build (i386 defconfig)
> > failed like this:
> > 
> > In file included from drivers/pci/msi/pcidev_msi.c:5:
> > drivers/pci/msi/../pci.h:862:1: error: expected identifier or '(' before '{' token
> >   862 | {
> >       | ^
> > drivers/pci/msi/../pci.h:861:20: error: 'of_pci_is_supply_present' declared 'static' but never defined [-Werror=unused-function]
> >   861 | static inline bool of_pci_is_supply_present(struct device_node *np);
> >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> That's silly on me. Krzysztof, could you please fix it in the branch?

I fixed it, thanks for the report.

