Return-Path: <linux-next+bounces-6650-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7ECAB1A9D
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 18:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 628F318934B5
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 16:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8182367DF;
	Fri,  9 May 2025 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkLoRhLI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D1622DA19;
	Fri,  9 May 2025 16:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808377; cv=none; b=GJ95Wg196HH4iyCZWvwqhWyPNnUfdBWlJmDaGpx9NPK8lMCYwMmpq2lFiCf8qL1WnD3Q9BD6Mf9wnlRkFRn1b3pd2aM8buUF+/sgWVwtyvFUYi4LlRc96qv94F7P0YLXmMiXDOVxliAStmga/FNwn3/jlkxcRr48TjM2LHQ1dCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808377; c=relaxed/simple;
	bh=HHlkw74BJF3d3qzJqvVN2pO94Yuwvc3nPtgsfjgVEWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SXn6auJM2Uyp4K8lnEX3PPHMc4GqP49IhgPOoh8etXhrQrnDfiO6HVJYRcnDLqgQTY6PVPzt5R4xOMjHRj7pKE0/ixFGrEahWKJei76++UPrCFGUEPjZTpSBnsKnoM1lxhMv5DJrmvDSHjHKhi3pwMfytbEmp0yDhaXKGGjJMqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkLoRhLI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCABC4CEE4;
	Fri,  9 May 2025 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746808377;
	bh=HHlkw74BJF3d3qzJqvVN2pO94Yuwvc3nPtgsfjgVEWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkLoRhLI3H6axm3vkx+4z/kmCjubbxokXFC2qEG1GY6wc0z6sXCghYCXsqfUw0eBR
	 H4aRooo1pJh17UhUuXoM564kiACczzl0vKxC/vTC5OIV3okd4/cHtg9INCSJfK7Jxw
	 7aEBZupniqwOBDd2F8bMeDUr6y7XV/OCw6Ypj9VrI2FAcahCJQ9jAC9hf2Y+9jlyxb
	 9Yf63iVpW0vGCbzlvRyjcgUclwYOQuJgZo7ses/3JxkMu+1ud59H2VeyTl7DTyeHJJ
	 yiTWJbXaPuHqjS5A8Elf08Fmd0fbPfudE9d3z0+V0RVKhI+ZO1PVdVXNoQfRh39naN
	 b3yo34J1r3YKA==
Date: Fri, 9 May 2025 09:32:54 -0700
From: Kees Cook <kees@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kspp tree
Message-ID: <202505090931.3467A425@keescook>
References: <20250509184846.3c7e359a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509184846.3c7e359a@canb.auug.org.au>

On Fri, May 09, 2025 at 06:48:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the scsi-mkp tree as a different commit
> (but the same patch):
> 
>   d8720235d5b5 ("scsi: qedf: Use designated initializer for struct qed_fcoe_cb_ops")
> 
> This is commit
> 
>   d897dae472f2 ("scsi: qedf: Use designated initializer for struct qed_fcoe_cb_ops")
> 
> in the scsi-mkp tree.

Yeah, I am carrying this and the qede patch since I need them for a
clean build in my tree. I might need to split my merge window into two
halves if I need to drop the duplicates.

-- 
Kees Cook

