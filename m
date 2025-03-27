Return-Path: <linux-next+bounces-6036-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A904A72A00
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 06:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63D407A52BF
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 05:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F36D4D8CE;
	Thu, 27 Mar 2025 05:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBQQCuPp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ECB7E9;
	Thu, 27 Mar 2025 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743054320; cv=none; b=fkxsr4pTph4Y9nTAnodtu7hDvieul2Kubutt7HDMjUleXxmWjt78/zOjjO32XqlAxzh0wl4WsXE8G1Pv2aVj7RkfImbBgSmGkDDD+8nza0gfU09xbCnGOAg5EeWvBX2hEYOXkEuDqFaELd9sNE8n7NKFDh0vJaIQTyIevkD/bdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743054320; c=relaxed/simple;
	bh=Eralt2kPdkT8RDr34eJ9HWiYrBE81JnXBEQ1qrIw09g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJuIL/7aZKeRAGqrofKleteaH6LD49ttdPAm12etrY3Mt+t/UDVF4C4KEZkWiFqVSs6Z+lkcnlnIjsDJdmiKiNUGmYZm34er6iD5kbyP8nnC72L8Dd/2mzJFxx24YwbPOVs3n2PNp6PVuiALE1W+ehjnhzehTpWxOUg5cyfCvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBQQCuPp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B378EC4CEDD;
	Thu, 27 Mar 2025 05:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743054316;
	bh=Eralt2kPdkT8RDr34eJ9HWiYrBE81JnXBEQ1qrIw09g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JBQQCuPp+JgVwy+sre9xQTKTIKxXKhK9zySWpfdJzSAG7Suz/7yKjbYCz2J+Qw/wf
	 VnX6FhyqI0LXzd/DYi6HQ+c2lsR1Wp6SFFYmV4NEEyG7fCWYcurWVkMb/s3waWtI/q
	 KojiFgNlcVL1lyoEF181nvCY97jxNT3n7HAl4Ra9P7AXfpQt23r0Q/K+9v/XSsLSF4
	 QuPB9eXvA/5ZDgKkt77JZQTv+CazPEk+DYkCPNCyuhqni52GgFx1msoxQjg9m6dYMO
	 YuvD3yy3YwmIKKCWk+X0lmyhSZgUIaERXSkfiulbzLZ6ffDXltxj8tuqF6STpyEKXM
	 CAIg3QzF12Cbw==
Date: Wed, 26 Mar 2025 22:45:14 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Mar 26 (objtool: iommu)
Message-ID: <gqymzzgdndlwm3lr32hboy3drvwapls2w26rdeo7d3d3a4syqp@3gnadxjboye3>
References: <20250326165619.58d443f8@canb.auug.org.au>
 <314f8809-cd59-479b-97d7-49356bf1c8d1@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <314f8809-cd59-479b-97d7-49356bf1c8d1@infradead.org>

On Wed, Mar 26, 2025 at 03:43:02PM -0700, Randy Dunlap wrote:
> 
> 
> On 3/25/25 10:56 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20250325:
> > 
> 
> on x86_64:
> 
> drivers/iommu/dma-iommu.o: warning: objtool: iommu_dma_sw_msi+0x92: can't find jump dest instruction at .text+0x54d5
> 
> Full randconfig file is attached.
> 
> gcc is:
> gcc (SUSE Linux) 14.2.1 20250220 [revision 9ffecde121af883b60bbe60d00425036bc873048]

Thanks, I posted a fix here:

  https://lore.kernel.org/0c801ae017ec078cacd39f8f0898fc7780535f85.1743053325.git.jpoimboe@kernel.org

-- 
Josh

